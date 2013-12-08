/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.test;

import com.sitatec.controller.OperatorJpaController;
import com.sitatec.model.Operator;
import com.sitatec.model.Person;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Julian
 */
public class Test {

    public static void createPerson() {
        Person person = new Person();
        person.setMobilePhone("3185158220");

        try {
            Long.parseLong(person.getMobilePhone());
        } catch (Exception ex) {
            System.out.println("El telefono celular solamente debe tener numeros");
            ex.printStackTrace();
        }
    }

    public static void calculateDuration() {
        String s = "2013/12/2310:30";
        String s2 = "2013/12/2310:35";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/ddHH:mm");
        try
        {
            Date date1 = simpleDateFormat.parse(s);
            Date date2 = simpleDateFormat.parse(s2);
            long diff = date2.getTime() - date1.getTime();
            long diffMinutes = diff / (60 * 1000);

            System.out.println("Minutes - " + diffMinutes);
        }
        catch (ParseException ex)
        {
            System.out.println("Exception "+ex);
        }
    }

    public static void getOperatorByPhoneNumber() {
        OperatorJpaController controller = new OperatorJpaController();
        Operator operator = controller.findOperatorByPhoneNumber("3185158220");
        System.out.println("Operador: " + operator.getOperatorName());
    }

    public static void main(String args[]) {
        getOperatorByPhoneNumber();
    }
}
