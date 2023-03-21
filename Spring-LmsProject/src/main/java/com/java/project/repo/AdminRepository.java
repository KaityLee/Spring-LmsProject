package com.java.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.project.vo.Admin;


public interface AdminRepository extends JpaRepository<Admin, String> {
    
}
