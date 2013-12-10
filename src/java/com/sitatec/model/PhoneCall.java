/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.model;

import com.sitatec.bean.DiscountHolyDateController;
import com.sitatec.controller.DiscountHolyDateJpaController;
import com.sitatec.controller.OperatorJpaController;
import com.sitatec.controller.TariffJpaController;
import java.io.Serializable;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Julian
 */
@Entity
@Table(name = "phone_call")
@NamedQueries({
    @NamedQuery(name = "PhoneCall.findAll", query = "SELECT p FROM PhoneCall p"),
    @NamedQuery(name = "PhoneCall.findById", query = "SELECT p FROM PhoneCall p WHERE p.id = :id"),
    @NamedQuery(name = "PhoneCall.findByOriginNumber", query = "SELECT p FROM PhoneCall p WHERE p.originNumber = :originNumber"),
    @NamedQuery(name = "PhoneCall.findByDestinationNumber", query = "SELECT p FROM PhoneCall p WHERE p.destinationNumber = :destinationNumber"),
    @NamedQuery(name = "PhoneCall.findByStartTime", query = "SELECT p FROM PhoneCall p WHERE p.startTime = :startTime"),
    @NamedQuery(name = "PhoneCall.findByEndTime", query = "SELECT p FROM PhoneCall p WHERE p.endTime = :endTime")})
public class PhoneCall implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "origin_number")
    private String originNumber;
    @Basic(optional = false)
    @Column(name = "destination_number")
    private String destinationNumber;
    @Basic(optional = false)
    @Column(name = "start_time")
    private String startTime;
    @Basic(optional = false)
    @Column(name = "end_time")
    private String endTime;

    public PhoneCall() {
    }

    public PhoneCall(Integer id) {
        this.id = id;
    }

    public PhoneCall(Integer id, String originNumber, String destinationNumber, String startTime, String endTime) {
        this.id = id;
        this.originNumber = originNumber;
        this.destinationNumber = destinationNumber;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOriginNumber() {
        return originNumber;
    }

    public void setOriginNumber(String originNumber) {
        this.originNumber = originNumber;
    }

    public String getDestinationNumber() {
        return destinationNumber;
    }

    public void setDestinationNumber(String destinationNumber) {
        this.destinationNumber = destinationNumber;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public long getDuration() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/ddHH:mm");
        try {
            Date date1 = simpleDateFormat.parse(this.startTime);
            Date date2 = simpleDateFormat.parse(this.endTime);
            long diff = date2.getTime() - date1.getTime();
            long diffMinutes = diff / (60 * 1000);

            return diffMinutes;
        }
        catch (ParseException ex) {
            return 0L;
        }
    }

    public long getCost() {
        int originId = 0;
        int destinationId = 0;
        long totalDurationValue = 0;
        Operator originOperator = this.getOriginOperador();
        Operator destinationOperator = this.getDestinationOperador();

        if(originOperator == null || destinationOperator == null) {
            return 0L;
        }

        originId = originOperator.getId();
        destinationId = destinationOperator.getId();

        TariffJpaController controller = new TariffJpaController();
        DiscountHolyDateJpaController dateController = new DiscountHolyDateJpaController();

        for(Tariff tariff: controller.findTariffEntities()) {
            if(tariff.getOriginOperator() == originId
                    && tariff.getDestinationOperator() == destinationId) {
               String valueFee = tariff.getValueFee().toString();
               totalDurationValue = Long.parseLong(valueFee) * this.getDuration();
               break;
            }
        }

        for(DiscountHolyDate discountHolyDate: dateController.findDiscountHolyDateEntities()) {
            String discountDate = discountHolyDate.getDiscountDate();
            if(this.destinationNumber.startsWith(discountDate)
                    && this.originNumber.startsWith(discountDate)) {

               String discountCost = discountHolyDate.getDiscountCost().toString();
               totalDurationValue -= Long.parseLong(discountCost);
               
               if(totalDurationValue < 0) {
                   totalDurationValue = 0;
               }
               break;
            }
        }

        return totalDurationValue;
    }

    public String getOriginOperadorName() {
        OperatorJpaController controller = new OperatorJpaController();
        Operator operator = controller.findOperatorByPhoneNumber(this.originNumber);

        if (operator != null) {
            return operator.getOperatorName();
        }
        
        return "Desconocido";
    }

    public Operator getOriginOperador() {
        OperatorJpaController controller = new OperatorJpaController();
        Operator operator = controller.findOperatorByPhoneNumber(this.originNumber);

        if (operator != null) {
            return operator;
        }

        return null;
    }

    public String getDestinationOperadorName() {
        OperatorJpaController controller = new OperatorJpaController();
        Operator operator = controller.findOperatorByPhoneNumber(this.destinationNumber);
        
        if (operator != null) {
            return operator.getOperatorName();
        }

        return "Desconocido";
    }

    public Operator getDestinationOperador() {
        OperatorJpaController controller = new OperatorJpaController();
        Operator operator = controller.findOperatorByPhoneNumber(this.destinationNumber);

        if (operator != null) {
            return operator;
        }

        return operator;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PhoneCall)) {
            return false;
        }
        PhoneCall other = (PhoneCall) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sitatec.model.PhoneCall[id=" + id + "]";
    }

}
