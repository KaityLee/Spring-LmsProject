package com.java.project.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String getSubjectList(Model m) {
		Map<String, Object> map = svc.getReportList();
		m.addAttribute("list",map.get("list"));
		m.addAttribute("slevel", map.get("slevel"));
		m.addAttribute("ttlpage", map.get("ttlpage"));
		
		return "lms/reportList";
	}
	
	@GetMapping("/detail")
	public String reportDetail(int num, Model m) 
	{
		Map<String,Object> map = svc.reportDetail(num);
		m.addAttribute("report",map.get("report"));
		m.addAttribute("slevel",map.get("slevel"));
		m.addAttribute("quiz",map.get("quiz"));
		return "lms/reportDetail";
	}
}
