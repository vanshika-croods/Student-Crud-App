package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Student;

public interface StudentRepo extends JpaRepository<Student, Long> {

	@Query(value = "select * from student_tbl where  (lower(contact_number) like lower(concat('%', ?1,'%'))) ",nativeQuery = true)
	public List<Student> getstudentdata(String searchvalue);
}
