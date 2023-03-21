package com.java.project.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LmsMapper {

	public List<Map<String,Object>> getList();
	
	public int getStudentLv(String sid);
	
	public int getPass(String sid);
	
	
}
