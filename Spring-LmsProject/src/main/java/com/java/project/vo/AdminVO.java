package com.java.project.vo;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AdminVO {
	
	private String aid;
	private String pwd;
	private String email;
	private String phone;
}
