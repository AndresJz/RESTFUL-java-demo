/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iwa.model;

/**
 *
 * @author Andres
 */

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

// If not especified, the use the class name
@Entity
@Table(name = "mathematics")
public class Mathematics implements Serializable {
 
    private static final long serialVersionUID = -3465813074586302847L;
 
    @Id
    //@GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
 
    @Column
    private String location;
 
    @Column
    private String indicator_m;
 
    @Column
    private String subject;
 
    @Column
    private String measure;
    
    @Column
    private String frequency;
    
    @Column
    private int times;
    
    @Column
    private float value_m;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getIndicator_m() {
        return indicator_m;
    }

    public void setIndicator_m(String indicator_m) {
        this.indicator_m = indicator_m;
    }


    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMeasure() {
        return measure;
    }

    public void setMeasure(String measure) {
        this.measure = measure;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    public float getValue_m() {
        return value_m;
    }

    public void setValue_m(float value_m) {
        this.value_m = value_m;
    }

    
 
    
 
}