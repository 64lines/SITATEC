/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.bean;

import com.sitatec.bean.util.PagingInfo;
import com.sitatec.controller.PhoneCallJpaController;
import com.sitatec.model.PhoneCall;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import com.sitatec.bean.util.JsfUtil;
import com.sitatec.controller.exceptions.NonexistentEntityException;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;

/**
 *
 * @author Julian
 */
public class PhoneCallController {

    public PhoneCallController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (PhoneCallJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "phoneCallJpa");
        pagingInfo = new PagingInfo();
        converter = new PhoneCallConverter();
    }
    private PhoneCall phoneCall = null;
    private List<PhoneCall> phoneCallItems = null;
    private PhoneCallJpaController jpaController = null;
    private PhoneCallConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getPhoneCallCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getPhoneCallItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findPhoneCallEntities(), false);
    }

    public SelectItem[] getPhoneCallItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findPhoneCallEntities(), true);
    }

    public PhoneCall getPhoneCall() {
        if (phoneCall == null) {
            phoneCall = (PhoneCall) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPhoneCall", converter, null);
        }
        if (phoneCall == null) {
            phoneCall = new PhoneCall();
        }
        return phoneCall;
    }

    public String listSetup() {
        reset(true);
        return "phoneCall_list";
    }

    public String createSetup() {
        reset(false);
        phoneCall = new PhoneCall();
        return "phoneCall_create";
    }

    public String create() {
        try {
            jpaController.create(phoneCall);
            JsfUtil.addSuccessMessage("PhoneCall was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("phoneCall_detail");
    }

    public String editSetup() {
        return scalarSetup("phoneCall_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        phoneCall = (PhoneCall) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPhoneCall", converter, null);
        if (phoneCall == null) {
            String requestPhoneCallString = JsfUtil.getRequestParameter("jsfcrud.currentPhoneCall");
            JsfUtil.addErrorMessage("The phoneCall with id " + requestPhoneCallString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String phoneCallString = converter.getAsString(FacesContext.getCurrentInstance(), null, phoneCall);
        String currentPhoneCallString = JsfUtil.getRequestParameter("jsfcrud.currentPhoneCall");
        if (phoneCallString == null || phoneCallString.length() == 0 || !phoneCallString.equals(currentPhoneCallString)) {
            String outcome = editSetup();
            if ("phoneCall_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit phoneCall. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(phoneCall);
            JsfUtil.addSuccessMessage("PhoneCall was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPhoneCall");
        Integer id = new Integer(idAsString);
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("PhoneCall was successfully deleted.");
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

    public List<PhoneCall> getPhoneCallItems() {
        if (phoneCallItems == null) {
            getPagingInfo();
            phoneCallItems = jpaController.findPhoneCallEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return phoneCallItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "phoneCall_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "phoneCall_list";
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
        phoneCall = null;
        phoneCallItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        PhoneCall newPhoneCall = new PhoneCall();
        String newPhoneCallString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPhoneCall);
        String phoneCallString = converter.getAsString(FacesContext.getCurrentInstance(), null, phoneCall);
        if (!newPhoneCallString.equals(phoneCallString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
