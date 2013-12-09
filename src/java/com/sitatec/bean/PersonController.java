/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.bean;

import com.sitatec.bean.util.PagingInfo;
import com.sitatec.controller.PersonJpaController;
import com.sitatec.model.Person;
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
public class PersonController {

    public PersonController() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        jpaController = (PersonJpaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "personJpa");
        pagingInfo = new PagingInfo();
        converter = new PersonConverter();
    }
    private Person person = null;
    private List<Person> personItems = null;
    private PersonJpaController jpaController = null;
    private PersonConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(jpaController.getPersonCount());
        }
        return pagingInfo;
    }

    public SelectItem[] getPersonItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(jpaController.findPersonEntities(), false);
    }

    public SelectItem[] getPersonItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(jpaController.findPersonEntities(), true);
    }

    public Person getPerson() {
        if (person == null) {
            person = (Person) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPerson", converter, null);
        }
        if (person == null) {
            person = new Person();
        }
        return person;
    }

    public String login() {
        PersonJpaController controller = new PersonJpaController();
        for(Person p : controller.findPersonEntities()) {
            if (p.getUsername().equals(person.getUsername())
                    && p.getPassword().equals(person.getPassword())) {
                return "welcome";
            }
        }
        JsfUtil.addErrorMessage("El nombre de usuario o la contraseña son incorrectos.");
        return "login";
    }

    public String listSetup() {
        reset(true);
        return "person_list";
    }

    public String createSetup() {
        reset(false);
        person = new Person();
        return "person_create";
    }

    public String create() {
        try {
            jpaController.create(person);
            JsfUtil.addSuccessMessage("Person was successfully created.");
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("person_detail");
    }

    public String editSetup() {
        return scalarSetup("person_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        person = (Person) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPerson", converter, null);
        if (person == null) {
            String requestPersonString = JsfUtil.getRequestParameter("jsfcrud.currentPerson");
            JsfUtil.addErrorMessage("The person with id " + requestPersonString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String personString = converter.getAsString(FacesContext.getCurrentInstance(), null, person);
        String currentPersonString = JsfUtil.getRequestParameter("jsfcrud.currentPerson");
        if (personString == null || personString.length() == 0 || !personString.equals(currentPersonString)) {
            String outcome = editSetup();
            if ("person_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit person. Try again.");
            }
            return outcome;
        }
        try {
            jpaController.edit(person);
            JsfUtil.addSuccessMessage("Usuario fue modifcado correctamente.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPerson");
        Integer id = new Integer(idAsString);
        try {
            jpaController.destroy(id);
            JsfUtil.addSuccessMessage("Person was successfully deleted.");
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

    public List<Person> getPersonItems() {
        if (personItems == null) {
            getPagingInfo();
            personItems = jpaController.findPersonEntities(pagingInfo.getBatchSize(), pagingInfo.getFirstItem());
        }
        return personItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "person_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "person_list";
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
        person = null;
        personItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Person newPerson = new Person();
        String newPersonString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPerson);
        String personString = converter.getAsString(FacesContext.getCurrentInstance(), null, person);
        if (!newPersonString.equals(personString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
