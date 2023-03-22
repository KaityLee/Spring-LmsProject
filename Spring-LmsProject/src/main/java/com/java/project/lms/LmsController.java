package com.java.project.lms;

import java.util.HashMap;
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
@RequestMapping("/lms")
public class LmsController {

	@Autowired
	private LmsService svc;
	@Autowired
	private HttpSession session;
	
	@GetMapping("/home")
	public String home() {
		return "lms/lmsHome";
	}
	
	@GetMapping("/list")
	public String getSubjectList(Model m) {
		
		String sid = (String)session.getAttribute("sid"); 

		m.addAttribute("list",svc.getSubjectList());
		m.addAttribute("map",svc.getStudentLv(sid));			
		
		return "lms/lmsStudyList";
	}
	
	@GetMapping("/myinfo")
	public String myinfo() {
		return "lms/MyInfo";
	}
	
	@GetMapping("/study")
	public String getStudy(Model m,@RequestParam int lvl_code) {
		svc.getStudy(lvl_code);
		return "lms/study";
	}
	
	@PostMapping("/post")
	@ResponseBody
	public Map<String,Object> getWriter(){
		Map<String,Object> map = new HashMap<>();
		return map;
	}
	
	@PostMapping("/end_study")
	@ResponseBody
	public Map<String,Object> getWriterEnd(){
		Map<String,Object> map = new HashMap<>();
		return map;
	}
	
	@GetMapping("/report_list")
	public String reportList() {
		return "lms/reportList";
	}
	
	@GetMapping("/report_detail")
	public String reportDetail() {
		return "lms/reportDetail";
	}
	
	@PostMapping("/reportPass")
	@ResponseBody
	public Map<String,Object> reportPass(){
		Map<String,Object> map = new HashMap<>();
		return map;
	}
	
	@PostMapping("/reportReply")
	@ResponseBody
	public Map<String,Object> reportReply(){
		Map<String,Object> map = new HashMap<>();
		return map;
	}
}
