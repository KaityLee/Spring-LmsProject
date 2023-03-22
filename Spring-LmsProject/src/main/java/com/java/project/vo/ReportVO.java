package com.java.project.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReportVO {

	private int num;
	private int lvl_code;
	private String sid;
	private Timestamp studydate;
	private String answer;
	private int pass;
	private String reply;
	
	
	
}
