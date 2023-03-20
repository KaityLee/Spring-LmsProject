package com.java.project.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

	public List<Map<String, Object>> getReportList(int page);
	
	public Map<String, Object> reportDetail(int num);
	
}
