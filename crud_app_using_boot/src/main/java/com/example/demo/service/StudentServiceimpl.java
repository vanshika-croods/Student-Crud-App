package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.StudentRepo;
import com.example.demo.model.Student;

@Service
@Transactional
public class StudentServiceimpl implements StudentService{

	@Autowired
	private StudentRepo studentRepo;
	
	@Override
	public void insertStudent(Student Student) {
		this.studentRepo.save(Student);
	}

	@Override
	public List<Student> searchStudent() {
		// TODO Auto-generated method stub
		return this.studentRepo.findAll();
		//that will take all the data of the student here
	}

	@Override
	public void deleteStudent(Long id) {
		// TODO Auto-generated method stub
		this.studentRepo.deleteById(id);
	}

	@Override
	public Student editStudent(Long id) {
		// TODO Auto-generated method stub
		return studentRepo.findById(id).orElse(null);
	}

}
