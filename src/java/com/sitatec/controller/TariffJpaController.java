/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.controller;

import com.sitatec.controller.exceptions.NonexistentEntityException;
import com.sitatec.controller.exceptions.PreexistingEntityException;
import com.sitatec.model.Tariff;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author Julian
 */
public class TariffJpaController {

    public TariffJpaController() {
        emf = Persistence.createEntityManagerFactory("Sitatec_ProjectPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Tariff tariff) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(tariff);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findTariff(tariff.getId()) != null) {
                throw new PreexistingEntityException("Tariff " + tariff + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Tariff tariff) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            tariff = em.merge(tariff);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = tariff.getId();
                if (findTariff(id) == null) {
                    throw new NonexistentEntityException("The tariff with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Tariff tariff;
            try {
                tariff = em.getReference(Tariff.class, id);
                tariff.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The tariff with id " + id + " no longer exists.", enfe);
            }
            em.remove(tariff);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Tariff> findTariffEntities() {
        return findTariffEntities(true, -1, -1);
    }

    public List<Tariff> findTariffEntities(int maxResults, int firstResult) {
        return findTariffEntities(false, maxResults, firstResult);
    }

    private List<Tariff> findTariffEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Tariff.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Tariff findTariff(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Tariff.class, id);
        } finally {
            em.close();
        }
    }

    public int getTariffCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Tariff> rt = cq.from(Tariff.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
