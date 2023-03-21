package com.java.project.vo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="STUDENT")
public class Student {

    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="SID")
    private String sid;
    
    @Column(name="PWD")
    private String pwd;
    
    @Column(name="EMAIL")
    private String email;
    
    @Column(name="PHONE")
    private String phone;

	
}