package com.java.project.vo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="ADMIN")
	public class Admin {

	    @Id
	    @Column(name="AID")
	    private String aid;
	    
	    @Column(name="APWD")
	    private String apwd;
	    
	    @Column(name="AEMAIL")
	    private String aemail;
	    
	    @Column(name="APHONE")
	    private String aphone;

		
	}
