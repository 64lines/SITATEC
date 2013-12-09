/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.bean;

import com.sitatec.bean.util.PagingInfo;
import com.sitatec.controller.OperatorJpaController;
import com.sitatec.model.Operator;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import com.sitatec.bean.util.JsfUtil;
import com.sitatec.controller.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;

/**
 *
 * @author Julian
 */
public class OperatorController {

    public OperatorController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (OperatorJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "operatorJpa");
        pagingInfo = new PagingInfo();
        converter = new OperatorConverter();
    }
    private Operator operator = null;
    private List<Operator> operatorItems = null;
    private OperatorJpaController jpaController = null;
    private OperatorConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getOperatorCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getOperatorItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findOperatorEntities(), false);
    }

    public SelectItem[] getOperatorItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findOperatorEntities(), true);
    }

    public Operator getOperator() {
        if (operator == null) {
            operator = (Operator) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentOperator", converter, null);
        }
        if (operator == null) {
            operator = new Operator();
        }
        return operator;
    }

    public String listSetup() {
        reset(true);
        return "operator_list";
    }

    public String createSetup() {
        reset(false);
        operator = new Operator();
        return "operator_create";
    }

    public String create() {
        try {
            jpaController.create(operator);
            JsfUtil.addSuccessMessage("Operator was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("operator_detail");
    }

    public String editSetup() {
        return scalarSetup("operator_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        operator = (Operator) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentOperator", converter, null);
        if (operator == null) {
            String requestOperatorString = JsfUtil.getRequestParameter("jsfcrud.currentOperator");
            JsfUtil.addErrorMessage("The operator with id " + requestOperatorString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String operatorString = converter.getAsString(FacesContext.getCurrentInstance(), null, operator);
        String currentOperatorString = JsfUtil.getRequestParameter("jsfcrud.currentOperator");
        if (operatorString == null || operatorString.length() == 0 || !operatorString.equals(currentOperatorString)) {
            String outcome = editSetup();
            if ("operator_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit operator. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(operator);
            JsfUtil.addSuccessMessage("Operator was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentOperator");
        Integer id = new Integer(idAsString);
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("Operator was successfully deleted.");
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

    public List<Operator> getOperatorItems() {
        if (operatorItems == null) {
            getPagingInfo();
            operatorItems = jpaController.findOperatorEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return operatorItems;
    }

    public List<SelectItem> getOperatorNames() {
        List<SelectItem> operatorItemNames = new ArrayList<SelectItem>();

        for(Operator oper: getOperatorItems()) {
            SelectItem item = new SelectItem();
            item.setLabel(oper.getOperatorName());
            item.setValue(oper.getId());
            operatorItemNames.add(item);
        }
        return operatorItemNames;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "operator_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "operator_list";
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
        operator = null;
        operatorItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Operator newOperator = new Operator();
        String newOperatorString = converter.getAsString(FacesContext.getCurrentInstance(), null, newOperator);
        String operatorString = converter.getAsString(FacesContext.getCurrentInstance(), null, operator);
        if (!newOperatorString.equals(operatorString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
