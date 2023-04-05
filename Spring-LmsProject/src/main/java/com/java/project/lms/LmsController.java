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


import com.java.project.vo.ReportVO;
import com.java.project.entity.Student;
import com.java.project.repo.StudentRepository;

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
	
	@Autowired
	private StudentRepository srepo;
	
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
	public String myinfo(Model m) {
		String sid = (String)session.getAttribute("sid");
		Student stu = srepo.findBySid(sid);
		
		m.addAttribute("stu", stu);
		return "lms/MyInfo";
	}
	
	@GetMapping("/study")
	public String getStudy(Model m,@RequestParam int lvl_code) {
		String sid = (String)session.getAttribute("sid");
		svc.setHistory(sid, lvl_code);
		Map<String,Object> map = svc.getStudy(sid,lvl_code);
		m.addAttribute("quiz",map.get("quiz"));
		m.addAttribute("video",map.get("video"));
		m.addAttribute("rv",map.get("rv"));
		return "lms/study";
	}
	
	@PostMapping("/post")
	@ResponseBody
	public Map<String,Object> getWriter(ReportVO report){
		Map<String,Object> map = new HashMap<>();
		boolean suc = svc.postQuiz(report);
		map.put("suc",suc);
		return map;
	}
	
	@PostMapping("/end_study")
	@ResponseBody
	public Map<String,Object> getWriterEnd(String sid,int lvl_code){
		boolean suc = svc.endStudy(sid, lvl_code);
		Map<String,Object> map = new HashMap<>();
		map.put("suc", suc);
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
