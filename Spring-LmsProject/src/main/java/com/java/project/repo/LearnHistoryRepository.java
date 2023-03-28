package com.java.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.java.project.entity.Learn_History;
import com.java.project.entity.Report;
import com.java.project.vo.ReportVO;

public interface LearnHistoryRepository extends JpaRepository<Learn_History, Integer>{

	@Query(value = "SELECT MAX(lvl_code) as lvl_code FROM Learn_History WHERE sid = :sid")
    Report findMaxLevelBySid(@Param("sid") String sid);
	
	@Modifying
	@Transactional
    @Query(value = "INSERT INTO Learn_History(sid, lvl_code, begin) VALUES (:sid, :lvl_code, current_timestamp)")
    int saveLearnHistory(@Param("sid") String sid, @Param("lvl_code") int lvl_code);

	@Modifying
	@Transactional
	@Query(value="UPDATE Learn_History SET end = current_timestamp "
			+ "WHERE sid= :sid AND lvl_code= :lvl_code AND begin= "
			+ "(SELECT MAX(begin) FROM Learn_History WHERE sid= :sid AND lvl_code= :lvl_code)")
	int updateLearnHistoryEnd(@Param("sid") String sid, @Param("lvl_code") int lvl_code);

	
	@Query(value="SELECT reply,pass FROM Report WHERE sid= :sid AND lvl_code= :lvl_code AND studydate="
					+ "(SELECT MAX(studydate) FROM Report WHERE sid= :sid AND lvl_code= :lvl_code)")
	Report getReport(@Param("sid") String sid, @Param("lvl_code") int lvl_code);
}
