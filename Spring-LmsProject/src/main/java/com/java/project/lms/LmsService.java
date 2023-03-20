package com.java.project.lms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.repo.LearnHistoryRepository;
import com.java.project.repo.ReportRepository;
import com.java.project.repo.StudentRepository;
import com.java.project.repo.VideoRepository;
import com.java.project.vo.Report;
import com.java.project.vo.Slevel;
import com.java.project.vo.Student;
import com.java.project.vo.Video;


@Service
public class LmsService 
{
	private LearnHistoryRepository learnHistoryRepository;
	
	private ReportRepository reportRepository;
	
	private StudentRepository studentRepository;

    private VideoRepository videoRepository;
	
	public List<Map<String,Object>> getSubjectList()   // join repo만들어야됨
	{
		Map<String,Object> map = learnHistoryRepository.getList();
		
		List<Slevel> list = (List<Slevel>)map.get("list");
		List<Video> dList = (List<Video>)map.get("dList");
		
		Map<String,Object> nMap = new HashMap<>();
		List<Map<String,Object>> fList = new ArrayList<>();		
		
		for(int i = 0 ; i<list.size(); i++)
		{
			nMap.put("llist",list);								
			fList.add(nMap);							
		}
		
		for(int i =0 ; i<dList.size(); i++)
		{
			nMap.put("dList", dList);
			fList.add(nMap);
		}	
		
		return fList;
	}

	public Map<String,Object> getStudentLv()  // join repo만들어야됨
	{
		Map<String,Object> map = new HashMap<>();
		return map;
	}
	
	public Map<String,Object> myInfo(String sid) 
	{		
		List<Object[]> resultList = reportRepository.getInfo(sid);
	    Map<String,Object> map = new HashMap<>();
	    for(Object[] result : resultList) {
	        String email = (String)result[1];
	        String phone = (String)result[2];
	        int lvlCode = (Integer)result[3];
	        int pass = (Integer)result[4];
	        Student sv = new Student();
	        sv.setSid(sid);
	        sv.setEmail(email);
	        sv.setPhone(phone);
	        map.put("sv", sv);
	        Report rv = new Report();
	        rv.setLvl_code(lvlCode);
	        rv.setPass(pass);
	        map.put("rv", rv);
	    }
	    return map;
	}	

	public Student newInfo(String sid) {
		Student student = studentRepository.findBySid(sid);
		if(student != null) {
		    String email = student.getEmail(); 
		    String phone = student.getPhone();
		    Student sv = new Student();
		    sv.setSid(sid);
		    sv.setEmail(email);
		    sv.setPhone(phone);
		    return sv;	
		}
		return null;
	}	

	public Map<String,Object> getStudy(int lvl_code)  // 주성 : 학습자료 출력.
	{
		Map<String,Object> map = videoRepository.getVideoByLvl_code(lvl_code);
		return map;	//lvl_code에 해당하는 quiz와 그에 맞는 VideoVO를 넣은 map을 출력.

	}
	
	public boolean postQuiz(String sid, String answer, int lvl_code) //주성 : 과제(퀴즈) 제출 DB에 입력 
	{
		Report report = new Report();
        report.setSid(sid);
        report.setAnswer(answer);
        report.setLvl_code(lvl_code);
        report.setPass(0);
        try {
            reportRepository.save(report); // quiz_report 테이블에 id,lvl_code,답변을 저장
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	
	public void setHistory(String sid, int lvl_code)	//주성 : learn_history에 학습정보(lvl_code) 기록 
	{
		learnHistoryRepository.saveLearnHistory(sid, lvl_code);
	}
	
	public boolean endStudy(String sid, int lvl_code) 	//주성 : 학습종료 기록
	{
        try {
            int rows = learnHistoryRepository.updateLearnHistoryEnd(sid, lvl_code);
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	
}
