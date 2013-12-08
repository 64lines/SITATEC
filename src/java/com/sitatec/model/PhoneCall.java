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
