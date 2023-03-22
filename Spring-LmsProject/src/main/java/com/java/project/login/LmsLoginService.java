package com.java.project.login;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.Admin;
import com.java.project.entity.Student;
import com.java.project.repo.AdminRepository;
import com.java.project.repo.StudentRepository;
import com.java.project.vo.AdminVO;
import com.java.project.vo.ReportVO;
import com.java.project.vo.StudentVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LmsLoginService {
	
	@Autowired
	private StudentRepository repo;
	
	@Autowired
	private AdminRepository arepo;
	
	public boolean register(StudentVO student)
	{
        Student std = new Student();
        log.info("등록서비스={}",std);
        
        std.setSid(student.getSid());
        std.setPwd(student.getPwd());
        std.setEmail(student.getEmail());
        std.setPhone(student.getPhone());
        
		repo.save(std);
	
		return true;
	}
	
	public Student login(String sid, String pwd)
	{
		Optional<Student> student = repo.findById(sid);
		log.info("서비스={}", student);
		if (student.isPresent() && student.get().getPwd().equals(pwd))
		{
			return student.get();
		}
		return null;
	}
	
	public Admin adminlogin(String aid, String apwd)
	{
		Optional<Admin> admin = arepo.findById(aid);
		log.info("관리자서비스={}", admin);
		
		if (admin.isPresent() && admin.get().getPwd().equals(apwd))
		{
			return admin.get();
		}
		return null;
	}
	
	
	
	public boolean adminregister(AdminVO admin)
	{
		Admin adm = new Admin();
		log.info("관리자등록서비스={}",adm);
		adm.setAid(admin.getAid());
		adm.setPwd(admin.getPwd());
		adm.setEmail(admin.getEmail());
		adm.setPhone(admin.getPhone());
		
		arepo.save(adm);
		
		return true;
	}
	
	
}
