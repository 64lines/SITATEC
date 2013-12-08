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
@Table(name = "discount_holy_date")
@NamedQueries({
    @NamedQuery(name = "DiscountHolyDate.findAll", query = "SELECT d FROM DiscountHolyDate d"),
    @NamedQuery(name = "DiscountHolyDate.findById", query = "SELECT d FROM DiscountHolyDate d WHERE d.id = :id"),
    @NamedQuery(name = "DiscountHolyDate.findByDescription", query = "SELECT d FROM DiscountHolyDate d WHERE d.description = :description"),
    @NamedQuery(name = "DiscountHolyDate.findByDiscountCost", query = "SELECT d FROM DiscountHolyDate d WHERE d.discountCost = :discountCost"),
    @NamedQuery(name = "DiscountHolyDate.findByDiscountDate", query = "SELECT d FROM DiscountHolyDate d WHERE d.discountDate = :discountDate")})
public class DiscountHolyDate implements Serializable {
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
    @Column(name = "discount_date")
    private String discountDate;

    public DiscountHolyDate() {
    }

    public DiscountHolyDate(Integer id) {
        this.id = id;
    }

    public DiscountHolyDate(Integer id, String description, BigInteger discountCost, String discountDate) {
        this.id = id;
        this.description = description;
        this.discountCost = discountCost;
        this.discountDate = discountDate;
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

    public String getDiscountDate() {
        return discountDate;
    }

    public void setDiscountDate(String discountDate) {
        this.discountDate = discountDate;
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
        if (!(object instanceof DiscountHolyDate)) {
            return false;
        }
        DiscountHolyDate other = (DiscountHolyDate) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sitatec.model.DiscountHolyDate[id=" + id + "]";
    }

}
