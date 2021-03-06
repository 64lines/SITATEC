/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.bean;

import com.sitatec.bean.util.PagingInfo;
import com.sitatec.controller.DiscountWeekDayJpaController;
import com.sitatec.model.DiscountWeekDay;
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
public class DiscountWeekDayController {

    public DiscountWeekDayController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (DiscountWeekDayJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "discountWeekDayJpa");
        pagingInfo = new PagingInfo();
        converter = new DiscountWeekDayConverter();
    }
    private DiscountWeekDay discountWeekDay = null;
    private List<DiscountWeekDay> discountWeekDayItems = null;
    private DiscountWeekDayJpaController jpaController = null;
    private DiscountWeekDayConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getDiscountWeekDayCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getDiscountWeekDayItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findDiscountWeekDayEntities(), false);
    }

    public SelectItem[] getDiscountWeekDayItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findDiscountWeekDayEntities(), true);
    }

    public DiscountWeekDay getDiscountWeekDay() {
        if (discountWeekDay == null) {
            discountWeekDay = (DiscountWeekDay) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentDiscountWeekDay", converter, null);
        }
        if (discountWeekDay == null) {
            discountWeekDay = new DiscountWeekDay();
        }
        return discountWeekDay;
    }

    public String listSetup() {
        reset(true);
        return "discountWeekDay_list";
    }

    public String createSetup() {
        reset(false);
        discountWeekDay = new DiscountWeekDay();
        return "discountWeekDay_create";
    }

    public String create() {
        try {
            jpaController.create(discountWeekDay);
            JsfUtil.addSuccessMessage("DiscountWeekDay was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("discountWeekDay_detail");
    }

    public String editSetup() {
        return scalarSetup("discountWeekDay_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        discountWeekDay = (DiscountWeekDay) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentDiscountWeekDay", converter, null);
        if (discountWeekDay == null) {
            String requestDiscountWeekDayString = JsfUtil.getRequestParameter("jsfcrud.currentDiscountWeekDay");
            JsfUtil.addErrorMessage("The discountWeekDay with id " + requestDiscountWeekDayString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String discountWeekDayString = converter.getAsString(FacesContext.getCurrentInstance(), null, discountWeekDay);
        String currentDiscountWeekDayString = JsfUtil.getRequestParameter("jsfcrud.currentDiscountWeekDay");
        if (discountWeekDayString == null || discountWeekDayString.length() == 0 || !discountWeekDayString.equals(currentDiscountWeekDayString)) {
            String outcome = editSetup();
            if ("discountWeekDay_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit discountWeekDay. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(discountWeekDay);
            JsfUtil.addSuccessMessage("DiscountWeekDay was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentDiscountWeekDay");
        Integer id = new Integer(idAsString);
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("DiscountWeekDay was successfully deleted.");
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

    public List<DiscountWeekDay> getDiscountWeekDayItems() {
        if (discountWeekDayItems == null) {
            getPagingInfo();
            discountWeekDayItems = jpaController.findDiscountWeekDayEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return discountWeekDayItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "discountWeekDay_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "discountWeekDay_list";
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
        discountWeekDay = null;
        discountWeekDayItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        DiscountWeekDay newDiscountWeekDay = new DiscountWeekDay();
        String newDiscountWeekDayString = converter.getAsString(FacesContext.getCurrentInstance(), null, newDiscountWeekDay);
        String discountWeekDayString = converter.getAsString(FacesContext.getCurrentInstance(), null, discountWeekDay);
        if (!newDiscountWeekDayString.equals(discountWeekDayString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
