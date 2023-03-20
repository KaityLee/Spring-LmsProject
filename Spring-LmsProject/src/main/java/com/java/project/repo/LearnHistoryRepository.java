package com.java.project.repo;

import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.project.vo.Learn_History;
import com.java.project.vo.Report;


public interface LearnHistoryRepository extends JpaRepository<Learn_History, Integer>{

	@Query(value = "SELECT MAX(lvl_code) as lvl_code FROM Learn_History WHERE sid = :sid")
    Report findMaxLevelBySid(@Param("sid") String sid);
	
	@Modifying
    @Transactional
    @Query(value = "INSERT INTO Learn_History(sid, lvl_code) VALUES (:sid, :lvl_code)", nativeQuery = true)
    void saveLearnHistory(@Param("sid") String sid, @Param("lvl_code") int lvl_code);

	@Modifying
    @Transactional
    @Query(value = "UPDATE Learn_History SET end= current_timestamp "
            + "WHERE sid=:sid AND lvl_code=:lvl_code AND begin= "
            + "(SELECT MAX(begin) FROM Learn_History WHERE sid=:sid AND lvl_code=:lvl_code)")
    int updateLearnHistoryEnd(@Param("sid") String sid, @Param("lvl_code") int lvl_code);
	
	@Query(value = "SELECT s.lvl_code,s.description,s.subject_name,v.duration FROM Slevel s INNER JOIN Video v ON s.lvl_code=v.lvl_code")
    public Map<String, Object> getList();
}
