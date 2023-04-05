package com.java.project.lms;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.QuizReport;
import com.java.project.entity.Report;
import com.java.project.entity.Student;
import com.java.project.mybatis.LmsMapper;
import com.java.project.repo.LearnHistoryRepository;
import com.java.project.repo.QuizReportRepository;
import com.java.project.repo.StudentRepository;
import com.java.project.repo.VideoRepository;
import com.java.project.vo.ReportVO;
import com.java.project.vo.SlevelVO;
import com.java.project.vo.VideoVO;
import com.java.project.vo.StudentVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LmsService 
{
	@Autowired
	private LearnHistoryRepository learnHistoryRepository;
	
	private QuizReportRepository reportRepository;
	
	private StudentRepository studentRepository;	

    private VideoRepository videoRepository;    
    
    @Autowired
	private HttpSession session;
    
    @Autowired
    private LmsMapper dao;
	
	public List<Map<String,Object>> getSubjectList()   // 학습목록 가져오기 - 지환씨
	{
		List<Map<String,Object>> dlist = dao.getList();
		List<Map<String,Object>> list = new ArrayList<>();
		
		for(int i =0 ; i < dlist.size() ; i++)
		{
			Map<String,Object> m = dlist.get(i);
			Map<String,Object> map = new HashMap<>();
			
			BigDecimal lvl_code = (BigDecimal) m.get("LVL_CODE");
			String description = (String)m.get("DESCRIPTION");
			String subject_name = (String)m.get("SUBJECT_NAME");
			String duration = (String) m.get("DURATION");
			
			SlevelVO slv = new SlevelVO();
			slv.setDescription(description);
			slv.setLvl_code(lvl_code.intValue());
			slv.setSubject_name(subject_name);
			
			map.put("slv", slv);
			map.put("dur", duration);
			
			list.add(map);			
		}		
		return list;
	}

	public Map<String,Object> getStudentLv(String sid)  // 학생 레벨과 과제 pass여부에 따라 학습제한 및 표시.
	{
		Map<String,Object> map = new HashMap<>();				
		ReportVO rv = new ReportVO();
		
		if(sid!=null) // 로그인 有
		{
			Optional<Object> oblvl =  Optional.ofNullable(dao.getStudentLv(sid));
			Optional<Object> obpass =  Optional.ofNullable(dao.getPass(sid));
			
			if(oblvl.isPresent()) // 1) 로그인 有 2) 학습기록 有 - 기존학생
			{			
				int stuLv = dao.getStudentLv(sid);
				rv.setLvl_code(stuLv);
				map.put("lvl_code", stuLv);
				
				List<Map<String,Object>> list = getSubjectList();
				for(int i=0; i< list.size() ; i++)
				{
					Map<String,Object> sub =  list.get(i);
					if(stuLv== ((SlevelVO)sub.get("slv")).getLvl_code())
					{
						map.put("nowlevel",((SlevelVO)sub.get("slv")).getSubject_name());						
						continue;
					}					
				}				
				if(obpass.isPresent()) // 1) 로그인 有 2) 학습기록 有 3)과제제출 有
				{
					int passByLv = dao.getPass(sid);
					map.put("pass", passByLv);
					map.put("rv", rv);
					if(passByLv>0)
					{
						map.put("passinfo", "합격");
					}		
					else
					{
						map.put("passinfo", "공부중");
					}										
				}
				else // 1) 로그인 有 2) 학습기록 有 3)과제제출 無
				{
					rv.setPass(0);
					map.put("pass값", rv.getPass());
					map.put("passinfo", "공부중");
					map.put("rv", rv);					
				}						
			}
			else // 1) 로그인 有 2) 학습기록 無 - 신규학생
			{
				rv = new ReportVO();    //rv객체를 새로 만들어서 첫번째 강의를 들을 수 있게 설정해준다.
				rv.setPass(0);
				rv.setLvl_code(101);				
				map.put("nowlevel", "Java");
				map.put("passinfo", "공부중");
				map.put("rv", rv);
			}			
		}		
		else //로그인 無 - 게스트
		{
			rv = new ReportVO();
			rv.setLvl_code(0);
			map.put("rv", rv);
			map.put("nowlevel", "GUEST");
			map.put("passinfo", "로그인하세요");			
		}		
		log.info("map : "  + map);
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
	        QuizReport rv = new QuizReport();
	        rv.setLvl_code(lvlCode);
	        rv.setPass(pass);
	        map.put("rv", rv);
	    }
	    return map;
	}	

	public Student newInfo(String sid) {
		Optional<Student> student = studentRepository.findById(sid);
		if(student.isPresent()) {
			Student stu = student.get();
		    String email = stu.getEmail();
		    String phone = stu.getPhone();
		    Student sv = new Student();
		    sv.setSid(sid);
		    sv.setEmail(email);
		    sv.setPhone(phone);
		    return sv;	
		}
		return null;
	}	

	public Map<String,Object> getStudy(String sid,int lvl_code)  // 주성 : 학습자료 출력.
	{
		Map<String,Object> map = dao.getVideoByLvl_code(lvl_code);
		log.info(map.toString());
		String title = (String)map.get("TITLE");
		String fname = (String)map.get("FNAME");
		String duration = (String)map.get("DURATION");
		String description = (String)map.get("DESCRIPTION");
		Report rv = learnHistoryRepository.getReport(sid, lvl_code);
		if(rv==null)
		{
			rv = new Report();
			rv.setPass(0);
			rv.setReply("아직 답변이 존재하지 않습니다");
		}
		VideoVO video = new VideoVO(lvl_code,title,fname,duration,description);
		String quiz = (String)map.get("LEVELTEST");
		Map<String,Object> map2 = new HashMap<>();
		map2.put("quiz", quiz);	//위의 VideoVO객체와 quiz변수를 함께 내보내기 위해 map에 넣는다.
		map2.put("video", video);
		map2.put("rv", rv);
		return map2;	//lvl_code에 해당하는 quiz와 그에 맞는 VideoVO를 넣은 map을 출력.

	}
	

	public boolean postQuiz(ReportVO report) //주성 : 과제(퀴즈) 제출 DB에 입력 
	{
        int rows = dao.postReport(report);// quiz_report 테이블에 id,lvl_code,답변을 저장
        return rows>0;
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
