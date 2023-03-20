package com.java.project.vo;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "learn_history")
public class Learn_History {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;

    @Column(name = "SID")
    private String sid;

    @Column(name = "LVL_CODE")
    private Integer lvl_code;
    
    @Column(name = "BEGIN")
    private Timestamp begin;
    
    @Column(name = "END")
    private Timestamp end;
}
