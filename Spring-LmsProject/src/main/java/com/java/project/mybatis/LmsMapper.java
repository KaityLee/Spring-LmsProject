package com.java.project.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.java.project.vo.ReportVO;

@Mapper
public interface LmsMapper {

	public List<Map<String,Object>> getList();
	
	public Integer getStudentLv(String sid);
	
	public Integer getPass(String sid);

	public Map<String, Object> getVideoByLvl_code(int lvl_code);
	
	public int postReport(ReportVO report);
}
