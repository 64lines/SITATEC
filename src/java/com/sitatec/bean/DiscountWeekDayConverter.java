/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.bean;

import com.sitatec.controller.DiscountWeekDayJpaController;
import com.sitatec.model.DiscountWeekDay;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

/**
 *
 * @author Julian
 */
public class DiscountWeekDayConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        DiscountWeekDayJpaController controller = (DiscountWeekDayJpaController) facesContext.getApplication().getVariableResolver().resolveVariable(facesContext, "discountWeekDayJpa");
        return controller.findDiscountWeekDay(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof DiscountWeekDay) {
            DiscountWeekDay o = (DiscountWeekDay) object;
            return o.getId() == null ? "" : o.getId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: com.sitatec.model.DiscountWeekDay");
        }
    }

}
