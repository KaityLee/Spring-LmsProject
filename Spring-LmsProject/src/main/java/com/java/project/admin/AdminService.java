package com.java.project.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.mybatis.AdminMapper;
import com.java.project.repo.ReportRepository;

@Service
public class AdminService {
	
	private ReportRepository reportRepository;
	
	@Autowired
	private AdminMapper dao;

	public List<Map<String,Object>> getReportList(String pg)
	{
		if(pg==null) pg="1";  //페이지값 설정(pagination) : 목록
	    int page = Integer.parseInt(pg); 
	      
		List<Map<String,Object>> map_list =  dao.getReportList(page);
		List<Map<String,Object>> list = new ArrayList<>();
		
		for(int i=0;i<map_list.size();i++) 
		{
			Map<String,Object> map = new HashMap<>();
			Map<String,Object> m = map_list.get(i);
		}
		
	    return list; 
	}
	
	public Map<String,Object> reportDetail(int num)
	{
		Map<String, Object> map = dao.reportDetail(num);
		return map;
	}
}
