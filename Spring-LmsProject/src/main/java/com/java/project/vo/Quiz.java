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
@Table(name = "QUIZ")
public class Quiz {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "NUM")
    private Integer num;
	
	@Column(name = "LVL_CODE")
    private Integer lvl_code;
	
	@Column(name = "LEVELTEST")
    private String leveltest;
}
