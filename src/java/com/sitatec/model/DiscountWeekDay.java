/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.model;

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
@Table(name = "discount_week_day")
@NamedQueries({
    @NamedQuery(name = "DiscountWeekDay.findAll", query = "SELECT d FROM DiscountWeekDay d"),
    @NamedQuery(name = "DiscountWeekDay.findById", query = "SELECT d FROM DiscountWeekDay d WHERE d.id = :id"),
    @NamedQuery(name = "DiscountWeekDay.findByDescription", query = "SELECT d FROM DiscountWeekDay d WHERE d.description = :description"),
    @NamedQuery(name = "DiscountWeekDay.findByDiscountCost", query = "SELECT d FROM DiscountWeekDay d WHERE d.discountCost = :discountCost"),
    @NamedQuery(name = "DiscountWeekDay.findByWeekDay", query = "SELECT d FROM DiscountWeekDay d WHERE d.weekDay = :weekDay")})
public class DiscountWeekDay implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @Column(name = "discount_cost")
    private BigInteger discountCost;
    @Basic(optional = false)
    @Column(name = "week_day")
    private int weekDay;

    public DiscountWeekDay() {
    }

    public DiscountWeekDay(Integer id) {
        this.id = id;
    }

    public DiscountWeekDay(Integer id, String description, BigInteger discountCost, int weekDay) {
        this.id = id;
        this.description = description;
        this.discountCost = discountCost;
        this.weekDay = weekDay;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigInteger getDiscountCost() {
        return discountCost;
    }

    public void setDiscountCost(BigInteger discountCost) {
        this.discountCost = discountCost;
    }

    public int getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(int weekDay) {
        this.weekDay = weekDay;
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
        if (!(object instanceof DiscountWeekDay)) {
            return false;
        }
        DiscountWeekDay other = (DiscountWeekDay) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sitatec.model.DiscountWeekDay[id=" + id + "]";
    }

}
