package com.java.project.repo;

import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.project.vo.Video;

@Repository
public interface VideoRepository extends JpaRepository<Video, Long> {
    
    @Query("SELECT v.title, v.fname, v.duration, v.description, q.leveltest FROM Video v INNER JOIN Quiz q ON v.lvl_code=q.lvl_code WHERE v.lvl_code=:lvlCode")
    public Map<String, Object> getVideoByLvl_code(@Param("lvlCode") int lvl_code);

}