/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.beans;

import com.sitatec.controller.RegisteredUserJpaController;
import com.sitatec.model.util.PagingInfo;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import com.sitatec.model.util.JsfUtil;
import com.sitatec.controller.exceptions.NonexistentEntityException;
import com.sitatec.model.RegisteredUser;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;

/**
 *
 * @author Julian
 */
public class RegisteredUserController {

    public RegisteredUserController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (RegisteredUserJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "registeredUserJpa");
        pagingInfo = new PagingInfo();
        converter = new RegisteredUserConverter();
    }
    private RegisteredUser registeredUser = null;
    private List<RegisteredUser> registeredUserItems = null;
    private RegisteredUserJpaController jpaController = null;
    private RegisteredUserConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getRegisteredUserCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getRegisteredUserItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findRegisteredUserEntities(), false);
    }

    public SelectItem[] getRegisteredUserItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findRegisteredUserEntities(), true);
    }

    public RegisteredUser getRegisteredUser() {
        if (registeredUser == null) {
            registeredUser = (RegisteredUser) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentRegisteredUser", converter, null);
        }
        if (registeredUser == null) {
            registeredUser = new RegisteredUser();
        }
        return registeredUser;
    }

    public String listSetup() {
        reset(true);
        return "registeredUser_list";
    }

    public String createSetup() {
        reset(false);
        registeredUser = new RegisteredUser();
        return "registeredUser_create";
    }

    public String create() {
        try {
            jpaController.create(registeredUser);
            JsfUtil.addSuccessMessage("RegisteredUser was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("registeredUser_detail");
    }

    public String editSetup() {
        return scalarSetup("registeredUser_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        registeredUser = (RegisteredUser) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentRegisteredUser", converter, null);
        if (registeredUser == null) {
            String requestRegisteredUserString = JsfUtil.getRequestParameter("jsfcrud.currentRegisteredUser");
            JsfUtil.addErrorMessage("The registeredUser with id " + requestRegisteredUserString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String registeredUserString = converter.getAsString(FacesContext.getCurrentInstance(), null, registeredUser);
        String currentRegisteredUserString = JsfUtil.getRequestParameter("jsfcrud.currentRegisteredUser");
        if (registeredUserString == null || registeredUserString.length() == 0 || !registeredUserString.equals(currentRegisteredUserString)) {
            String outcome = editSetup();
            if ("registeredUser_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit registeredUser. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(registeredUser);
            JsfUtil.addSuccessMessage("RegisteredUser was successfully updated.");
        } catch (NonexistentEntityException ne) {
            JsfUtil.addErrorMessage(ne.getLocalizedMessage());
            return listSetup();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String destroy() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentRegisteredUser");
        Integer id = new Integer(idAsString);
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("RegisteredUser was successfully deleted.");
        } catch (NonexistentEntityException ne) {
            JsfUtil.addErrorMessage(ne.getLocalizedMessage());
            return relatedOrListOutcome();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<RegisteredUser> getRegisteredUserItems() {
        if (registeredUserItems == null) {
            getPagingInfo();
            registeredUserItems = jpaController.findRegisteredUserEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return registeredUserItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "registeredUser_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "registeredUser_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        registeredUser = null;
        registeredUserItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        RegisteredUser newRegisteredUser = new RegisteredUser();
        String newRegisteredUserString = converter.getAsString(FacesContext.getCurrentInstance(), null, newRegisteredUser);
        String registeredUserString = converter.getAsString(FacesContext.getCurrentInstance(), null, registeredUser);
        if (!newRegisteredUserString.equals(registeredUserString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

    public String loginUser() {
        String strLoginUsername = registeredUser.getUsername();
        String strLoginPassword = registeredUser.getPassword();
        
        RegisteredUser loginUser = getRegisteredUserByUsername(strLoginUsername);
        
        if(loginUser.getPassword().equals(strLoginPassword)) {
            return "welcome";
        } else {
            JsfUtil.addErrorMessage("Username or password are incorrect");
            return "login";
        }
    }

    private RegisteredUser getRegisteredUserByUsername(String strUsername) {
        List<RegisteredUser> listRegisteredUsers = jpaController.findRegisteredUserEntities();

        for(RegisteredUser objUser: listRegisteredUsers) {
            if (objUser.getUsername().equalsIgnoreCase(strUsername)) {
                return objUser;
            }
        }
        return null;
    }

}
