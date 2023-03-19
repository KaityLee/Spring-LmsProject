package com.java.project.repo;

import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.project.vo.Learn_History;
import com.java.project.vo.Report;

@Repository
public interface LearnHistoryRepository extends JpaRepository<Learn_History, Integer>{

	@Query(value = "SELECT MAX(lvlCode) as lvl_code FROM LearnHistory WHERE sid = :sid")
    Report findMaxLevelBySid(@Param("sid") String sid);
	
	@Modifying
    @Transactional
    @Query(value = "INSERT INTO learn_history(sid, lvl_code) VALUES (:sid, :lvl_code)", nativeQuery = true)
    void saveLearnHistory(@Param("sid") String sid, @Param("lvl_code") int lvl_code);

	@Modifying
    @Transactional
    @Query(value = "UPDATE LearnHistory SET end=LOCALTIMESTAMP "
            + "WHERE sid=:sid AND lvl_code=:lvl_code AND begin= "
            + "(SELECT MAX(begin) FROM LearnHistory WHERE sid=:sid AND lvl_code=:lvl_code)")
    int updateLearnHistoryEnd(@Param("sid") String sid, @Param("lvl_code") int lvl_code);
	
	@Query("SELECT * FROM subject_list")
    public Map<String, Object> getList();
}
