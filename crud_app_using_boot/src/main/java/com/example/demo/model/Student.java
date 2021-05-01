package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

@Entity
@Table(name="student_tbl")
public class Student {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private long s_id;
	
	private String student_name;
	
	private String contactNumber;
}

