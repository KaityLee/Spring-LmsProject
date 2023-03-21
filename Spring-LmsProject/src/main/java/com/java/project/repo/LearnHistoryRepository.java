package com.java.project.repo;

import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.project.entity.Learn_History;
import com.java.project.entity.Quiz_Report;


public interface LearnHistoryRepository extends JpaRepository<Learn_History, Integer>{

	@Query(value = "SELECT MAX(lvl_code) as lvl_code FROM Learn_History WHERE sid = :sid")
    Quiz_Report findMaxLevelBySid(@Param("sid") String sid);
	
	@Modifying
    @Transactional
    @Query(value = "INSERT INTO Learn_History(sid, lvl_code) VALUES (:sid, :lvl_code)", nativeQuery = true)
    void saveLearnHistory(@Param("sid") String sid, @Param("lvl_code") int lvl_code);

}
