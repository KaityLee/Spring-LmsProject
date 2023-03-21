package com.java.project.vo;

import lombok.Data;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class StudentVO {
	
	private String sid;
	private String pwd;
	private String email;
	private String phone;
}
