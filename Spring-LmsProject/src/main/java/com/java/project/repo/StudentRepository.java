package com.java.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.project.entity.Student;

public interface StudentRepository extends JpaRepository<Student, String> {
    Student findBySid(String sid);
}
