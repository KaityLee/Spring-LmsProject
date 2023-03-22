package com.java.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.project.entity.Video;

public interface VideoRepository extends JpaRepository<Video, Integer> {    

}