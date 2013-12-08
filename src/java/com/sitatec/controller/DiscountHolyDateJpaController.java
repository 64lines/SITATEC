/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.controller;

import com.sitatec.controller.exceptions.NonexistentEntityException;
import com.sitatec.controller.exceptions.PreexistingEntityException;
import com.sitatec.model.DiscountHolyDate;
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
public class DiscountHolyDateJpaController {

    public DiscountHolyDateJpaController() {
        emf = Persistence.createEntityManagerFactory("Sitatec_ProjectPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(DiscountHolyDate discountHolyDate) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(discountHolyDate);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findDiscountHolyDate(discountHolyDate.getId()) != null) {
                throw new PreexistingEntityException("DiscountHolyDate " + discountHolyDate + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(DiscountHolyDate discountHolyDate) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            discountHolyDate = em.merge(discountHolyDate);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = discountHolyDate.getId();
                if (findDiscountHolyDate(id) == null) {
                    throw new NonexistentEntityException("The discountHolyDate with id " + id + " no longer exists.");
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
            DiscountHolyDate discountHolyDate;
            try {
                discountHolyDate = em.getReference(DiscountHolyDate.class, id);
                discountHolyDate.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The discountHolyDate with id " + id + " no longer exists.", enfe);
            }
            em.remove(discountHolyDate);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<DiscountHolyDate> findDiscountHolyDateEntities() {
        return findDiscountHolyDateEntities(true, -1, -1);
    }

    public List<DiscountHolyDate> findDiscountHolyDateEntities(int maxResults, int firstResult) {
        return findDiscountHolyDateEntities(false, maxResults, firstResult);
    }

    private List<DiscountHolyDate> findDiscountHolyDateEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(DiscountHolyDate.class));
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

    public DiscountHolyDate findDiscountHolyDate(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(DiscountHolyDate.class, id);
        } finally {
            em.close();
        }
    }

    public int getDiscountHolyDateCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<DiscountHolyDate> rt = cq.from(DiscountHolyDate.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
