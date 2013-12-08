/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.bean;

import com.sitatec.controller.DiscountHolyDateJpaController;
import com.sitatec.model.DiscountHolyDate;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

/**
 *
 * @author Julian
 */
public class DiscountHolyDateConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        DiscountHolyDateJpaController controller = (DiscountHolyDateJpaController) facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "discountHolyDateJpa");
        return controller.findDiscountHolyDate(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof DiscountHolyDate) {
            DiscountHolyDate o = (DiscountHolyDate) object;
            return o.getId() == null ? "" : o.getId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: com.sitatec.model.DiscountHolyDate");
        }
    }

}
