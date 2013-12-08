/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sitatec.model;

import java.io.Serializable;
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
@Table(name = "operator")
@NamedQueries({
    @NamedQuery(name = "Operator.findAll", query = "SELECT o FROM Operator o"),
    @NamedQuery(name = "Operator.findById", query = "SELECT o FROM Operator o WHERE o.id = :id"),
    @NamedQuery(name = "Operator.findByOperatorName", query = "SELECT o FROM Operator o WHERE o.operatorName = :operatorName"),
    @NamedQuery(name = "Operator.findByInitialRange", query = "SELECT o FROM Operator o WHERE o.initialRange = :initialRange"),
    @NamedQuery(name = "Operator.findByFinalRange", query = "SELECT o FROM Operator o WHERE o.finalRange = :finalRange")})
public class Operator implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "operator_name")
    private String operatorName;
    @Basic(optional = false)
    @Column(name = "initial_range")
    private int initialRange;
    @Basic(optional = false)
    @Column(name = "final_range")
    private int finalRange;

    public Operator() {
    }

    public Operator(Integer id) {
        this.id = id;
    }

    public Operator(Integer id, String operatorName, int initialRange, int finalRange) {
        this.id = id;
        this.operatorName = operatorName;
        this.initialRange = initialRange;
        this.finalRange = finalRange;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public int getInitialRange() {
        return initialRange;
    }

    public void setInitialRange(int initialRange) {
        this.initialRange = initialRange;
    }

    public int getFinalRange() {
        return finalRange;
    }

    public void setFinalRange(int finalRange) {
        this.finalRange = finalRange;
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
        if (!(object instanceof Operator)) {
            return false;
        }
        Operator other = (Operator) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sitatec.model.Operator[id=" + id + "]";
    }

}
