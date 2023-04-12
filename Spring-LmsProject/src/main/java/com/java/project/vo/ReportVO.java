package com.java.project.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {

	private int num;
	private int lvl_code;
	private String sid;
	private Date studydate;
	private String answer;
	private int pass;
	private String reply;

}
