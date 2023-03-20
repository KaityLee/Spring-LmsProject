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
@Table(name = "SLEVEL")
public class Slevel {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "LVL_CODE")
    private Integer lvl_code;
	
	@Column(name = "SUBJECT_NAME")
    private String subject_name;
	
	@Column(name = "DESCRIPTION")
    private String description;
}
