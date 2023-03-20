package com.java.project.vo;

import lombok.Data;

@Data
public class AdminVO {


	private String aid;
	private String pwd;
	private String phone;
	private String email;
	
	public AdminVO() {}

	public AdminVO(String aid, String pwd, String phone, String email) {
		
		this.aid = aid;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
