package com.cafe24.dmsthch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TeacherController {
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		
		return "Teacher/TeacherAdd";
	}	
}