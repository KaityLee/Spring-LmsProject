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

import com.java.project.entity.Admin;
import com.java.project.entity.Student;
import com.java.project.lms.LmsController;
import com.java.project.repo.StudentRepository;
import com.java.project.vo.AdminVO;
import com.java.project.vo.StudentVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/lmslogin")
public class LmsLoginController {

	@Autowired
	private HttpSession session;
		
    @Autowired
    private LmsLoginService svc;
    
    
	@GetMapping("/login")
	public String login(HttpServletRequest request)
	{
		return "lms/LmsLoginForm";
	}
	
	@PostMapping("/login") //현명
	@ResponseBody
	public Map<String,Object> login(StudentVO student)
	{
		Student stu = svc.login(student.getSid(), student.getPwd());
		log.info("컨트롤러={}",stu);
		Map<String,Object> map = new HashMap<>();
		if (stu != null)
		{
			session.setAttribute("sid", stu.getSid());
			map.put("suc", stu);
			session.setAttribute("sid", stu.getSid());
			return map;
		}
		else {
			map.put("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			return map;
		}
	}
	
	@PostMapping("/adminlogin") //현명
	@ResponseBody
	public Map<String,Object> adminlogin(Admin admin)
	{

		Admin atu = svc.adminlogin(admin.getAid(),admin.getPwd());
		log.info("관리자컨트롤러={}",atu);
		Map<String,Object> map = new HashMap<>();
		if (atu != null)
		{
			map.put("suc", atu);
			session.setAttribute("aid", atu.getAid());
			return map;
		}
		else {
			map.put("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			return map;
		}
		
	}
	
	@GetMapping("/register") //현명
	public String register()
	{
		return "lms/LmsLoginJoin";
	}
	
	@PostMapping("/register") //현명
	@ResponseBody
	public Map<String,Object> register(Student student)
	{
		Map<String,Object> map = new HashMap<>();
		
		map.put("save", svc.register(student));
		
		return map;
	}
	
	@PostMapping("/adminregister") //현명
	@ResponseBody
	public Map<String,Object> adminregister(Admin admin)
	{
		Map<String,Object> map = new HashMap<>();
		
		map.put("save", svc.adminregister(admin));
		
		return map;
	}

	@GetMapping("/adminlogin") // 현명
	public String adminlogin()
	{
		return "lms/Admin_Login";
	}
	
	
	@GetMapping("/adminregister") //현명
	public String adminregister()
	{
		return "lms/Admin_Regform";
	}
	
	@GetMapping("/find")
	public String userfind()
	{
		return "lms/lmsFind";
	}
	
	@PostMapping("/find")
	@ResponseBody
	public Map<String,Object> find(String sid, String email)
	{
		Map<String,Object> map = new HashMap<>();
		
		//map.put("finded",svc.find(sid, email));
		
		return map;
	}
	
	
	@GetMapping("/adminfind")
	public String adminfind()
	{
		return "lms/Admin_Find";
	}
	
}
