package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Student;
import com.example.demo.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService stuentService;
	
	@GetMapping("/")
	public ModelAndView student() {
		List studentList = stuentService.searchStudent();
		return new ModelAndView("register").addObject("studentlist",studentList);
	}
	
	@ResponseBody
	@PostMapping("/saveStudent")
	public Student saveStudent(@RequestParam ("username") String username,@RequestParam ("pass") String pass,
			@RequestParam ("fn") String fn,@RequestParam ("ln") String ln,@RequestParam ("sid") String id) {
		Student st = new Student();
		if(id !="") {
			st= stuentService.editStudent(Long.parseLong(id));
		}
		st.setUserName(username);
		st.setPassword(pass);
		st.setFirstName(fn);
		st.setLastName(ln);
		
		stuentService.insertStudent(st);
		System.out.println("data has been inserted into the database");
		return st;
	}
	
	@ResponseBody
	@GetMapping("/searchData")
	public List<Student> searchData() {
		List<Student> listall = stuentService.searchStudent();
		return listall;
	}
	
	@ResponseBody
	@GetMapping("/delete/{id}")
	public String deleteStudent(@PathVariable long id) {
		stuentService.deleteStudent(id);
		return "redirect:/saveStudent";
	}
	
	@ResponseBody
	@GetMapping("/edit/{id}")
	public Student editStudent(@PathVariable long id) {
//		Student student = stuentService.editStudent(id);
//		return student;
		return stuentService.editStudent(id);
	}
	
}
