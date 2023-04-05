package com.java.project.admin;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.project.entity.Report;
import com.java.project.mybatis.AdminMapper;
import com.java.project.repo.QuizReportRepository;
import com.java.project.vo.QuizVO;
import com.java.project.vo.ReportVO;
import com.java.project.vo.SlevelVO;

@Service
public class AdminService {
	
	private QuizReportRepository reportRepository;
	
	@Autowired
	private AdminMapper dao;

	/** 학생이 제출한 report 목록을 불러오는 메소드 - 소영*/
	public List<Map<String,Object>> getReportList(int page)
	{
		List<Map<String,Object>> map_list =  dao.getReportList(page);
		List<Map<String,Object>> list = new ArrayList<>();
		
		for(int i=0;i<map_list.size();i++) 
		{
			Map<String,Object> map = new HashMap<>();
			Map<String,Object> m = map_list.get(i);
			
			ReportVO report = new ReportVO();
			
			BigDecimal big = (BigDecimal)m.get("NUM");
			report.setNum(big.intValue());
			report.setSid((String)m.get("SID"));
			report.setStudydate((Timestamp)m.get("STUDYDATE"));
			
			big = (BigDecimal)m.get("PASS");
			report.setPass(big.intValue());
			report.setReply((String)m.get("REPLY"));
			
			big = (BigDecimal)m.get("LVL_CODE");
			report.setLvl_code(big.intValue());
			
			SlevelVO slevel = new SlevelVO();
			slevel.setLvl_code(big.intValue());
			slevel.setSubject_name((String)m.get("SUBJECT_NAME"));
			
			big = (BigDecimal)m.get("TTLPAGES");
			int ttlpage = big.intValue();
			
			map.put("report", report);
			map.put("slevel", slevel);
			map.put("ttlpage", ttlpage);
			list.add(map);
		}
		
	    return list; 
	}
	
	/** 특정 report를 선택했을때 detail을 불러오는 메소드 - 소영*/
	public Map<String,Object> reportDetail(int num)
	{
		Map<String, Object> m = dao.reportDetail(num);
		Map<String,Object> map = new HashMap<>();
		
		ReportVO report = new ReportVO();
		SlevelVO slevel = new SlevelVO();
		QuizVO quiz = new QuizVO();
		
		report.setNum(num);
		report.setSid((String)m.get("SID"));
		report.setStudydate((Timestamp)m.get("STUDYDATE"));
		
		BigDecimal big = (BigDecimal)m.get("PASS");
		report.setPass(big.intValue());
		report.setAnswer((String)m.get("ANSWER"));
		report.setReply((String)m.get("REPLY"));
		
		big = (BigDecimal)m.get("LVL_CODE");
		report.setLvl_code(big.intValue());
		
		slevel.setLvl_code(big.intValue());
		slevel.setSubject_name((String)m.get("SUBJECT_NAME"));
		
		quiz.setLvl_code(big.intValue());
		quiz.setLeveltest((String)m.get("LEVELTEST"));
		
		map.put("report", report);
		map.put("slevel", slevel);
		map.put("quiz", quiz);
		
		return map;
	}
	
	/** 관리자가 통과시켰을때 pass를 1로 바꿔주는 메소드 - 소영*/
	@Transactional
	public boolean reportPass(int num)
	{
		try {
	        int rows = reportRepository.reportPass(num);
	        return rows>0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	/** 관리자의 답변을 저장시키는 메소드 - 소영*/
	@Transactional
	public boolean reportReply(int num, String reply) {
	    try {
	        int rows = reportRepository.reportReply(reply, num);
	        return rows>0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
}
