package com.cafe24.dmsthch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.dmsthch.Teacher.Teacher;

@Controller
public class TeacherController {
	
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		
		return "Teacher/TeacherAdd";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Teacher teacher) {//�Ű������� ���������̴�
		System.out.println(teacher +"<--��������");
		
		return "home";
	}
}