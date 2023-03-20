package com.java.project.vo;

import java.security.Timestamp;

import lombok.Data;

@Data
public class Learn_HistoryVO {

	private int num;
	private String sid;
	private int lvl_code;
	private Timestamp begin;
	private Timestamp end;
	
	
}
