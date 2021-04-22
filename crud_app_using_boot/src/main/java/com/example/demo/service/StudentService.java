package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Student;

public interface StudentService {
	
	public void insertStudent(Student Student);
	
	public List<Student> searchStudent();
	
	public void deleteStudent(Long id);
	
	public Student editStudent(Long id);
}
