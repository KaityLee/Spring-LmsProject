package com.java.project.entity;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="QUIZ_REPORT")
public class Report 
{
	@Id
    @Column(name="ID")
    private Long id;
    @Column(name="SID")
    private String sid;
    @Column(name="LVL_CODE")
    private int lvl_code;
    @Column(name="PASS")
    private int pass;
    @Column(name="ANSWER")
    private String answer;
    @Column(name="REPLY")
    private String reply;
    @Column(name="STUDYDATE")
    private Timestamp studydate;

}