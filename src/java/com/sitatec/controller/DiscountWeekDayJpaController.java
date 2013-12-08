/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.controller;

import com.sitatec.controller.exceptions.NonexistentEntityException;
import com.sitatec.controller.exceptions.PreexistingEntityException;
import com.sitatec.model.DiscountWeekDay;
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
public class DiscountWeekDayJpaController {

    public DiscountWeekDayJpaController() {
        emf = Persistence.createEntityManagerFactory("Sitatec_ProjectPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(DiscountWeekDay discountWeekDay) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(discountWeekDay);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findDiscountWeekDay(discountWeekDay.getId()) != null) {
                throw new PreexistingEntityException("DiscountWeekDay " + discountWeekDay + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(DiscountWeekDay discountWeekDay) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            discountWeekDay = em.merge(discountWeekDay);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = discountWeekDay.getId();
                if (findDiscountWeekDay(id) == null) {
                    throw new NonexistentEntityException("The discountWeekDay with id " + id + " no longer exists.");
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
            DiscountWeekDay discountWeekDay;
            try {
                discountWeekDay = em.getReference(DiscountWeekDay.class, id);
                discountWeekDay.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The discountWeekDay with id " + id + " no longer exists.", enfe);
            }
            em.remove(discountWeekDay);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<DiscountWeekDay> findDiscountWeekDayEntities() {
        return findDiscountWeekDayEntities(true, -1, -1);
    }

    public List<DiscountWeekDay> findDiscountWeekDayEntities(int maxResults, int firstResult) {
        return findDiscountWeekDayEntities(false, maxResults, firstResult);
    }

    private List<DiscountWeekDay> findDiscountWeekDayEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(DiscountWeekDay.class));
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

    public DiscountWeekDay findDiscountWeekDay(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(DiscountWeekDay.class, id);
        } finally {
            em.close();
        }
    }

    public int getDiscountWeekDayCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<DiscountWeekDay> rt = cq.from(DiscountWeekDay.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
