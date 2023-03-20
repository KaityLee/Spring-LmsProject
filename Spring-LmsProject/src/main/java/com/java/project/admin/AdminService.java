package com.java.project.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.repo.ReportRepository;

@Service
public class AdminService {
	
	private ReportRepository reportRepository;
	

	public Map<String,Object> getReportList(String pg)
	{
	      if(pg==null) pg="1";  //페이지값 설정(pagination) : 목록
	      int page = Integer.parseInt(pg); 
	      
	      Map<String, Object> map = reportRepository.getReportList(page); // 해당하는 페이지 값을 받아서 가져온다.
	      return map; 
	}
	
	public Map<String,Object> reportDetail(int num)
	{
		Map<String, Object> map = reportRepository.reportDetail(num);
		return map;
	}
}
