package com.java.project.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "admin")
public class Admin {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AID")
    private Integer aid;

    @Column(name = "PWD")
    private String pwd;

    @Column(name = "PHONE")
    private Integer phone;

    @Column(name = "EMAIL")
    private String email;
}
