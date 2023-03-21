package com.java.project.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java.project.entity.Student;

public interface StudentRepository extends JpaRepository<Student, String> {
  
   
}