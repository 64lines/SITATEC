/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.controller;

import com.sitatec.controller.exceptions.NonexistentEntityException;
import com.sitatec.controller.exceptions.PreexistingEntityException;
import com.sitatec.model.Operator;
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
public class OperatorJpaController {

    public OperatorJpaController() {
        emf = Persistence.createEntityManagerFactory("Sitatec_ProjectPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Operator operator) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(operator);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findOperator(operator.getId()) != null) {
                throw new PreexistingEntityException("Operator " + operator + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Operator operator) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            operator = em.merge(operator);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = operator.getId();
                if (findOperator(id) == null) {
                    throw new NonexistentEntityException("The operator with id " + id + " no longer exists.");
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
            Operator operator;
            try {
                operator = em.getReference(Operator.class, id);
                operator.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The operator with id " + id + " no longer exists.", enfe);
            }
            em.remove(operator);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Operator> findOperatorEntities() {
        return findOperatorEntities(true, -1, -1);
    }

    public List<Operator> findOperatorEntities(int maxResults, int firstResult) {
        return findOperatorEntities(false, maxResults, firstResult);
    }

    private List<Operator> findOperatorEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Operator.class));
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

    public Operator findOperator(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Operator.class, id);
        } finally {
            em.close();
        }
    }

    public int getOperatorCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Operator> rt = cq.from(Operator.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
