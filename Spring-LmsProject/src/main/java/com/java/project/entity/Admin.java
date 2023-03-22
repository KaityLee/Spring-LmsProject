package com.java.project.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="ADMIN")
public class Admin {

    @Id
    @Column(name="AID")
    private String aid;
    
    @Column(name="PWD")
    private String pwd;
    
    @Column(name="EMAIL")
    private String email;
    
    @Column(name="PHONE")
    private String phone;

}
