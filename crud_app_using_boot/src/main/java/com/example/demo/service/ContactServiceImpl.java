package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.StudentRepo;
import com.example.demo.model.Student;

@Service
@Transactional
public class ContactServiceImpl implements ContactService{

	@Autowired
	StudentRepo studentRepo;
	@Override
	public List<Student> searchstudentList(String searchvalue) {
		// TODO Auto-generated method stub
		return studentRepo.getstudentdata(searchvalue);
	}
	
	
}
