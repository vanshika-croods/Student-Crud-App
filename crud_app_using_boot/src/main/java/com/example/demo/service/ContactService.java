package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Student;

public interface ContactService {
	
	public List<Student> searchstudentList(String searchvalue);
}
