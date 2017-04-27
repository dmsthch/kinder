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
		System.out.println("GET������� TeacherAdd�� ������");
		return "Teacher/TeacherAdd";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Teacher teacher) {//�Ű������� ���������̴�
		TDao.insertTeacher(teacher);
		System.out.println(teacher+" <--�Է�Ȯ��");
		System.out.println(TDao +" <--Dao Ȯ��");
		System.out.println("POST������� TeacherLogin���� ������\n\n");
		
		return "Teacher/TeacherLogin";
	}
	
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(Teacher teacher) {
		System.out.println("Teacher ��Ʈ�ѷ� �α��� �޼��� Ȯ��");
		TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao ���� Ȯ��");
		return "Teacher/state";
	}
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login() {
		System.out.println("�α���ȭ��");
		return "Teacher/TeacherLogin";
	}	
	
	@RequestMapping(value="/logincheck", method=RequestMethod.GET)
	public String logincheck() {
		System.out.println("�α��� üũ �� ȣ��");
		return "Teacher/logincheck";
	}
	
}