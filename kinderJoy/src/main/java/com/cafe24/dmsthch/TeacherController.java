package com.cafe24.dmsthch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherDao TDao;
	
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		System.out.println("GET방식으로 TeacherAdd로 포워드");
		return "Teacher/TeacherAdd";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Teacher teacher) {//매개변수는 전역변수이다
		TDao.insertTeacher(teacher);
		System.out.println(teacher+" <--입력확인");
		System.out.println(TDao +" <--Dao 확인");
		System.out.println("POST방식으로 TeacherLogin으로 포워드\n\n");
		
		return "Teacher/TeacherLogin";
	}
	
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(Teacher teacher) {
		System.out.println("Teacher 컨트롤러 로그인 메서드 확인");
		TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao 동작 확인");
		return "Teacher/state";
	}
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login() {
		System.out.println("로그인화면");
		return "Teacher/TeacherLogin";
	}	
	
	@RequestMapping(value="/logincheck", method=RequestMethod.GET)
	public String logincheck() {
		System.out.println("로그인 체크 폼 호출");
		return "Teacher/logincheck";
	}
	
}