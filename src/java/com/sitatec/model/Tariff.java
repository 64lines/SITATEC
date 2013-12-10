/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.model;

import com.sitatec.controller.OperatorJpaController;
import java.io.Serializable;
import java.math.BigInteger;
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
@Table(name = "tariff")
@NamedQueries({
    @NamedQuery(name = "Tariff.findAll", query = "SELECT t FROM Tariff t"),
    @NamedQuery(name = "Tariff.findById", query = "SELECT t FROM Tariff t WHERE t.id = :id"),
    @NamedQuery(name = "Tariff.findByOriginOperator", query = "SELECT t FROM Tariff t WHERE t.originOperator = :originOperator"),
    @NamedQuery(name = "Tariff.findByDestinationOperator", query = "SELECT t FROM Tariff t WHERE t.destinationOperator = :destinationOperator"),
    @NamedQuery(name = "Tariff.findByValueFee", query = "SELECT t FROM Tariff t WHERE t.valueFee = :valueFee")})
public class Tariff implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "origin_operator")
    private int originOperator;
    @Basic(optional = false)
    @Column(name = "destination_operator")
    private int destinationOperator;
    @Basic(optional = false)
    @Column(name = "value_fee")
    private BigInteger valueFee;

    public Tariff() {
    }

    public Tariff(Integer id) {
        this.id = id;
    }

    public Tariff(Integer id, int originOperator, int destinationOperator, BigInteger valueFee) {
        this.id = id;
        this.originOperator = originOperator;
        this.destinationOperator = destinationOperator;
        this.valueFee = valueFee;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getOriginOperator() {
        return originOperator;
    }

    /**
     * Obtiene el nombre del operador de origen
     * @return
     */
    public String getOriginOperatorName() {
        OperatorJpaController controller = new OperatorJpaController();
        Operator operator = controller.findOperator(originOperator);

        if(operator != null) {
            return operator.getOperatorName();
        }
        return "Desconocido";
    }

    public void setOriginOperator(int originOperator) {
        this.originOperator = originOperator;
    }

    public int getDestinationOperator() {
        return destinationOperator;
    }

    public String getDestinationOperatorName() {
        OperatorJpaController controller = new OperatorJpaController();
        Operator operator = controller.findOperator(destinationOperator);
        
        if(operator != null) {
            return operator.getOperatorName();
        }
        return "Desconocido";
    }

    public void setDestinationOperator(int destinationOperator) {
        this.destinationOperator = destinationOperator;
    }

    public BigInteger getValueFee() {
        return valueFee;
    }

    public void setValueFee(BigInteger valueFee) {
        this.valueFee = valueFee;
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
        if (!(object instanceof Tariff)) {
            return false;
        }
        Tariff other = (Tariff) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sitatec.model.Tariff[id=" + id + "]";
    }

}
