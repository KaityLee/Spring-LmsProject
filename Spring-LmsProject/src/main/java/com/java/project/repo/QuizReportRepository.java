package com.java.project.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.project.entity.Quiz_Report;


public interface QuizReportRepository  extends JpaRepository<Quiz_Report, Integer> {
   /* @Query(value = "SELECT DISTINCT s.sid,email,phone,lvl_code,pass FROM QUIZ_REPORT q INNER JOIN STUDENT s ON q.sid=s.sid WHERE s.sid=:sid AND lvl_code=(SELECT DISTINCT MAX(lvl_code) as lvl_code FROM QUIZ_REPORT WHERE sid=:sid)", nativeQuery = true)
    public List<Object[]> getInfo(@Param("sid") String sid);
    
    @Modifying
    @Query("UPDATE quiz_report qr SET qr.pass = 1 WHERE qr.num = :num")
    public Integer reportPass(@Param("num") int num);
    
    @Modifying
    @Query("UPDATE quiz_report qr SET qr.reply = :reply WHERE qr.num = :num")
    public Integer reportReply(@Param("num") int num, @Param("reply") String reply);
    */
    @Query(value = "SELECT DISTINCT s.sid,q.email,q.phone,q.lvl_code,q.pass FROM QUIZ_REPORT q INNER JOIN STUDENT s ON q.sid=s.sid WHERE s.sid=:sid AND lvl_code=(SELECT DISTINCT MAX(lvl_code) FROM QUIZ_REPORT WHERE sid=:sid)", nativeQuery = true)
    List<Object[]> getInfo(@Param("sid") String sid);

    @Query(value = "UPDATE quiz_report SET pass = 1 WHERE num =:num")
    int reportPass(int num);

    @Query(value = "UPDATE quiz_report SET reply = :reply WHERE num = :num")
    int reportReply(int num, String reply);

}