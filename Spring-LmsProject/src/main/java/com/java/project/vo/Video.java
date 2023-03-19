package com.java.project.vo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "video")
public class Video {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "lvl_code")
    private Integer lvlCode;

    @Column(name = "title")
    private String title;

    @Column(name = "fname")
    private String fname;

    @Column(name = "duration")
    private String duration;

    @Column(name = "description")
    private String description;
}
