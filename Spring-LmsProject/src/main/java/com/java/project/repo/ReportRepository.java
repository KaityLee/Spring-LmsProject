package com.java.project.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.project.entity.Report;

public interface ReportRepository extends JpaRepository<Report, Long> {
    
	@Query(value = "SELECT DISTINCT s.sid,email,phone,lvl_code,pass FROM QUIZ_REPORT q INNER JOIN STUDENT s ON q.sid=s.sid WHERE s.sid=:sid AND lvl_code=(SELECT DISTINCT MAX(lvl_code) as lvl_code FROM QUIZ_REPORT WHERE sid=:sid)", nativeQuery = true)
    public List<Object[]> getInfo(@Param("sid") String sid);

}