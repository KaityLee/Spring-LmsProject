package com.java.project.entity;

import java.sql.Date;
import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="quiz_report")
public class Quiz_Report 
{
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="NUM")
    private Integer num;
	
    @Column(name="SID")
    private String sid;
    
    @Column(name="LVL_CODE")
    private Integer lvl_code;
    
    @Column(name="STUDYDATE")
    private Timestamp studydate;
    
    @Column(name="PASS")
    private Integer pass;
    
    @Column(name="ANSWER")
    private String answer;
    
    @Column(name="REPLY")
    private String reply;

}
