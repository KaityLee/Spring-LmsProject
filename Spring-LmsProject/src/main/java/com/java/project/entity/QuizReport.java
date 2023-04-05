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
@Table(name="QUIZ_REPORT")
public class QuizReport 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="NUM")
    private int num;
	
    @Column(name="SID")
    private String sid;
    
    @Column(name="LVL_CODE")
    private Integer lvl_code;
    
    @Column(name="STUDYDATE")
    private Timestamp studydate;

    @Column(name="ANSWER")
    private String answer;
    
    @Column(name="PASS")
    private int pass;
    
    @Column(name="REPLY")
    private String reply;

}
