/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.controller;

import com.sitatec.controller.exceptions.NonexistentEntityException;
import com.sitatec.controller.exceptions.PreexistingEntityException;
import com.sitatec.model.PhoneCall;
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
public class PhoneCallJpaController {

    public PhoneCallJpaController() {
        emf = Persistence.createEntityManagerFactory("Sitatec_ProjectPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(PhoneCall phoneCall) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(phoneCall);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findPhoneCall(phoneCall.getId()) != null) {
                throw new PreexistingEntityException("PhoneCall " + phoneCall + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(PhoneCall phoneCall) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            phoneCall = em.merge(phoneCall);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = phoneCall.getId();
                if (findPhoneCall(id) == null) {
                    throw new NonexistentEntityException("The phoneCall with id " + id + " no longer exists.");
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
            PhoneCall phoneCall;
            try {
                phoneCall = em.getReference(PhoneCall.class, id);
                phoneCall.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The phoneCall with id " + id + " no longer exists.", enfe);
            }
            em.remove(phoneCall);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<PhoneCall> findPhoneCallEntities() {
        return findPhoneCallEntities(true, -1, -1);
    }

    public List<PhoneCall> findPhoneCallEntities(int maxResults, int firstResult) {
        return findPhoneCallEntities(false, maxResults, firstResult);
    }

    private List<PhoneCall> findPhoneCallEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(PhoneCall.class));
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

    public PhoneCall findPhoneCall(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(PhoneCall.class, id);
        } finally {
            em.close();
        }
    }

    public int getPhoneCallCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<PhoneCall> rt = cq.from(PhoneCall.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
