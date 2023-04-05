package com.java.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoVO {
	private int num;
	private int lvl_code;
	private String title;
	private String fname;
	private String duration;
	private String description;
	
	public VideoVO(int lvl_code, String title, String fname, String duration, String description) {
		super();
		this.lvl_code = lvl_code;
		this.title = title;
		this.fname = fname;
		this.duration = duration;
		this.description = description;
	}
	
	
}
