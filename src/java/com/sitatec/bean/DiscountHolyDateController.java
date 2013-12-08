/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.bean;

import com.sitatec.bean.util.PagingInfo;
import com.sitatec.controller.DiscountHolyDateJpaController;
import com.sitatec.model.DiscountHolyDate;
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
public class DiscountHolyDateController {

    public DiscountHolyDateController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (DiscountHolyDateJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "discountHolyDateJpa");
        pagingInfo = new PagingInfo();
        converter = new DiscountHolyDateConverter();
    }
    private DiscountHolyDate discountHolyDate = null;
    private List<DiscountHolyDate> discountHolyDateItems = null;
    private DiscountHolyDateJpaController jpaController = null;
    private DiscountHolyDateConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getDiscountHolyDateCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getDiscountHolyDateItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findDiscountHolyDateEntities(), false);
    }

    public SelectItem[] getDiscountHolyDateItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findDiscountHolyDateEntities(), true);
    }

    public DiscountHolyDate getDiscountHolyDate() {
        if (discountHolyDate == null) {
            discountHolyDate = (DiscountHolyDate) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentDiscountHolyDate", converter, null);
        }
        if (discountHolyDate == null) {
            discountHolyDate = new DiscountHolyDate();
        }
        return discountHolyDate;
    }

    public String listSetup() {
        reset(true);
        return "discountHolyDate_list";
    }

    public String createSetup() {
        reset(false);
        discountHolyDate = new DiscountHolyDate();
        return "discountHolyDate_create";
    }

    public String create() {
        try {
            jpaController.create(discountHolyDate);
            JsfUtil.addSuccessMessage("DiscountHolyDate was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("discountHolyDate_detail");
    }

    public String editSetup() {
        return scalarSetup("discountHolyDate_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        discountHolyDate = (DiscountHolyDate) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentDiscountHolyDate", converter, null);
        if (discountHolyDate == null) {
            String requestDiscountHolyDateString = JsfUtil.getRequestParameter("jsfcrud.currentDiscountHolyDate");
            JsfUtil.addErrorMessage("The discountHolyDate with id " + requestDiscountHolyDateString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String discountHolyDateString = converter.getAsString(FacesContext.getCurrentInstance(), null, discountHolyDate);
        String currentDiscountHolyDateString = JsfUtil.getRequestParameter("jsfcrud.currentDiscountHolyDate");
        if (discountHolyDateString == null || discountHolyDateString.length() == 0 || !discountHolyDateString.equals(currentDiscountHolyDateString)) {
            String outcome = editSetup();
            if ("discountHolyDate_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit discountHolyDate. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(discountHolyDate);
            JsfUtil.addSuccessMessage("DiscountHolyDate was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentDiscountHolyDate");
        Integer id = new Integer(idAsString);
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("DiscountHolyDate was successfully deleted.");
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

    public List<DiscountHolyDate> getDiscountHolyDateItems() {
        if (discountHolyDateItems == null) {
            getPagingInfo();
            discountHolyDateItems = jpaController.findDiscountHolyDateEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return discountHolyDateItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "discountHolyDate_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "discountHolyDate_list";
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
        discountHolyDate = null;
        discountHolyDateItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        DiscountHolyDate newDiscountHolyDate = new DiscountHolyDate();
        String newDiscountHolyDateString = converter.getAsString(FacesContext.getCurrentInstance(), null, newDiscountHolyDate);
        String discountHolyDateString = converter.getAsString(FacesContext.getCurrentInstance(), null, discountHolyDate);
        if (!newDiscountHolyDateString.equals(discountHolyDateString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
