/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.bean;

import com.sitatec.bean.util.PagingInfo;
import com.sitatec.controller.TariffJpaController;
import com.sitatec.model.Tariff;
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
public class TariffController {

    public TariffController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (TariffJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "tariffJpa");
        pagingInfo = new PagingInfo();
        converter = new TariffConverter();
    }
    private Tariff tariff = null;
    private List<Tariff> tariffItems = null;
    private TariffJpaController jpaController = null;
    private TariffConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getTariffCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getTariffItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findTariffEntities(), false);
    }

    public SelectItem[] getTariffItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findTariffEntities(), true);
    }

    public Tariff getTariff() {
        if (tariff == null) {
            tariff = (Tariff) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTariff", converter, null);
        }
        if (tariff == null) {
            tariff = new Tariff();
        }
        return tariff;
    }

    public String listSetup() {
        reset(true);
        return "tariff_list";
    }

    public String createSetup() {
        reset(false);
        tariff = new Tariff();
        return "tariff_create";
    }

    public String create() {
        try {
            jpaController.create(tariff);
            JsfUtil.addSuccessMessage("Tariff was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("tariff_detail");
    }

    public String editSetup() {
        return scalarSetup("tariff_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        tariff = (Tariff) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTariff", converter, null);
        if (tariff == null) {
            String requestTariffString = JsfUtil.getRequestParameter("jsfcrud.currentTariff");
            JsfUtil.addErrorMessage("The tariff with id " + requestTariffString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String tariffString = converter.getAsString(FacesContext.getCurrentInstance(), null, tariff);
        String currentTariffString = JsfUtil.getRequestParameter("jsfcrud.currentTariff");
        if (tariffString == null || tariffString.length() == 0 || !tariffString.equals(currentTariffString)) {
            String outcome = editSetup();
            if ("tariff_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit tariff. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(tariff);
            JsfUtil.addSuccessMessage("Tariff was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentTariff");
        Integer id = new Integer(idAsString);
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("Tariff was successfully deleted.");
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

    public List<Tariff> getTariffItems() {
        if (tariffItems == null) {
            getPagingInfo();
            tariffItems = jpaController.findTariffEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return tariffItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "tariff_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "tariff_list";
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
        tariff = null;
        tariffItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Tariff newTariff = new Tariff();
        String newTariffString = converter.getAsString(FacesContext.getCurrentInstance(), null, newTariff);
        String tariffString = converter.getAsString(FacesContext.getCurrentInstance(), null, tariff);
        if (!newTariffString.equals(tariffString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
