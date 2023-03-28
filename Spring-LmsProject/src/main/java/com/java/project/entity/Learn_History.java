package com.java.project.entity;

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
@SequenceGenerator(
        name = "SEQ_GENERATOR",
        sequenceName = "LEARN_SEQ",
        allocationSize = 1
)
@Table(name = "learn_history")
public class Learn_History {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_GENERATOR")
    @Column(name = "NUM")
    private Integer num;

    @Column(name = "SID")
    private String sid;

    @Column(name = "LVL_CODE")
    private Integer lvl_code;

    @Column(name = "BEGIN")
    private Timestamp begin;
    
    @Column(name = "END")
    private Timestamp end;
}
