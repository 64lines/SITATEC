/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.controller;

import com.sitatec.controller.exceptions.NonexistentEntityException;
import com.sitatec.controller.exceptions.PreexistingEntityException;
import com.sitatec.model.RegisteredUser;
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
public class RegisteredUserJpaController {

    public RegisteredUserJpaController() {
        emf = Persistence.createEntityManagerFactory("SITATECPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(RegisteredUser registeredUser) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(registeredUser);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findRegisteredUser(registeredUser.getId()) != null) {
                throw new PreexistingEntityException("RegisteredUser " + registeredUser + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(RegisteredUser registeredUser) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            registeredUser = em.merge(registeredUser);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = registeredUser.getId();
                if (findRegisteredUser(id) == null) {
                    throw new NonexistentEntityException("The registeredUser with id " + id + " no longer exists.");
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
            RegisteredUser registeredUser;
            try {
                registeredUser = em.getReference(RegisteredUser.class, id);
                registeredUser.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The registeredUser with id " + id + " no longer exists.", enfe);
            }
            em.remove(registeredUser);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<RegisteredUser> findRegisteredUserEntities() {
        return findRegisteredUserEntities(true, -1, -1);
    }

    public List<RegisteredUser> findRegisteredUserEntities(int maxResults, int firstResult) {
        return findRegisteredUserEntities(false, maxResults, firstResult);
    }

    private List<RegisteredUser> findRegisteredUserEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(RegisteredUser.class));
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

    public RegisteredUser findRegisteredUser(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(RegisteredUser.class, id);
        } finally {
            em.close();
        }
    }

    public int getRegisteredUserCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<RegisteredUser> rt = cq.from(RegisteredUser.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
