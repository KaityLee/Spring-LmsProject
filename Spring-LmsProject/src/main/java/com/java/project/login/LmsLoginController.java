package com.java.project.login;


import java.util.HashMap;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.java.project.lms.LmsController;
import com.java.project.repo.StudentRepository;
import com.java.project.vo.Admin;
import com.java.project.vo.Student;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/lmslogin")
public class LmsLoginController {
	
	
    @Autowired
    private LmsLoginService svc;
    
	@GetMapping("/login")
	public String login(HttpServletRequest request)
	{
		return "lms/LmsLoginForm";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public Map<String,Object> login(Student student)
	{
		Student stu = svc.login(student.getSid(), student.getPwd());
		log.info("컨트롤러={}",stu);
		Map<String,Object> map = new HashMap<>();
		if (stu != null)
		{
			map.put("suc", stu);
			return map;
		}
		else {
			map.put("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			return map;
		}
	}
	
	@PostMapping("/adminlogin")
	@ResponseBody
	public Map<String,Object> adminlogin(Admin admin)
	{
		
		Admin atu = svc.adminlogin(admin.getAid(),admin.getApwd());
		log.info("관리자컨트롤러={}",atu);
		Map<String,Object> map = new HashMap<>();
		if (atu != null)
		{
			map.put("suc", atu);
			return map;
		}
		else {
			map.put("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			return map;
		}
		
	}
	
	@GetMapping("/register")
	public String register()
	{
		return "lms/LmsLoginJoin";
	}
	
	@PostMapping("/register")
	@ResponseBody
	public Map<String,Object> register(Student student)
	{
		Map<String,Object> map = new HashMap<>();
		
		map.put("save", svc.register(student));
		
		return map;
	}
	
	@PostMapping("/adminregister")
	@ResponseBody
	public Map<String,Object> adminregister(Admin admin)
	{
		Map<String,Object> map = new HashMap<>();
		
		map.put("save", svc.adminregister(admin));
		
		return map;
	}

	@GetMapping("/adminlogin")
	public String adminlogin()
	{
		return "lms/Admin_Login";
	}
	
	
	
	@GetMapping("/adminregister")
	public String adminregister()
	{
		return "lms/Admin_Regform";
	}
	
	
	
	
	
}
