package com.java.project.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService svc;
	@Autowired
	private HttpSession session;
	
	@GetMapping("/list")
	public String getSubjectList(@RequestParam(name = "page", defaultValue = "1") String page, Model m) 
	{
		int pg = Integer.parseInt(page); //페이지값 설정(pagination) : 목록
	    
		List<Map<String, Object>> list = svc.getReportList(pg);
		
		m.addAttribute("list", list);
		log.info(list.toString());
		m.addAttribute("page",pg);
		log.info(Integer.toString(pg) );
		return "lms/reportList";
	}
	
	@GetMapping("/detail")
	public String reportDetail(@RequestParam int num, Model m) 
	{
		Map<String,Object> map = svc.reportDetail(num);
		m.addAttribute("report",map.get("report"));
		m.addAttribute("slevel",map.get("slevel"));
		m.addAttribute("quiz",map.get("quiz"));
		return "lms/reportDetail";
	}
	
	@PostMapping("/pass")
	@ResponseBody
	public Map<String,Object> reportPass(int num)
	{
		Map<String,Object> map = new HashMap<>();
		boolean pass = svc.reportPass(num);
		map.put("pass", pass);
		return map;
	}
	
	@PostMapping("/reply")
	@ResponseBody
	public Map<String,Object> reportReply(int num, String reply)
	{
		boolean saved = svc.reportReply(num, reply);
		Map<String,Object> map = new HashMap<>();
		map.put("saved", saved);
		return map;
	}
}
