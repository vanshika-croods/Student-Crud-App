package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Student;
import com.example.demo.service.ContactService;

@Controller
public class StudentController {
	
	@Autowired
	private ContactService contactService;
	
	@GetMapping("/")
	public ModelAndView Student() {
		return new ModelAndView("register");
	}
	
    @GetMapping("/find/select/json")
    @ResponseBody
    public List<Student> findCustomer(@RequestParam Map<String, String> allRequestParams,
                                HttpSession session) {
        
        System.out.println("------" + allRequestParams.get("contactname").toString());
      
        List<Student> dtos=contactService.searchstudentList(allRequestParams.get("contactname").toString());

       
        return dtos;
    }

}
