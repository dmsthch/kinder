package com.cafe24.dmsthch;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;

@Controller
@SessionAttributes( { "teacher_level", "teacher_name", "teacher_id" })
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
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login() {
		System.out.println("�α���ȭ��");
		return "Teacher/TeacherLogin";
	}
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(HttpSession session, Teacher teacher) {
		System.out.println("Teacher ��Ʈ�ѷ� �α��� �޼��� Ȯ��");
		TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao ���� Ȯ��");
		
		session.setAttribute("teacher_level", "teacher_level");
		session.setAttribute("teacher_name", "teacher_name");
		session.setAttribute("teacher_id", "teacher_id");
		
		session.getAttribute("teacher_name");
		
		return "Teacher/state";
	}
	
	
	
	
	
	@RequestMapping(value="/logincheckform", method=RequestMethod.GET)
	public String logincheckform() {
		System.out.println("�α��� üũ �� ȣ��");
		return "Teacher/logincheck";
	}
	
	//�̿ϼ�
	@RequestMapping(value="/logincheck",method =RequestMethod.POST)
	@ResponseBody
	public int logincheck(@RequestParam("teacher_ajax_id") String userid) {
		System.out.println("�α���üũ�޼��� ȣ��_Controller");
		System.out.println("����ڰ� �Է��� ���̵��? : " + userid);
		int check = TDao.logincheck(userid);
		
		if(check == 0){
			System.out.println("��밡���մϴ�");
		}else{
			System.out.println("���Ұ��մϴ�");
		}
		return check;
	}
	
}