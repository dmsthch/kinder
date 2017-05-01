package com.cafe24.dmsthch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;

//teacher_id = id teacher_name = name teacher_level = level;
@Controller
@SessionAttributes( { "id", "name", "level" })
public class TeacherController {
	
	@Autowired
	private TeacherDao TDao;
	
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		System.out.println("GET������� TeacherAdd�� ������");
		return "Teacher/TeacherAdd";
	}
	
	//�̿ϼ�
	@RequestMapping(value="/sign_up_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int logincheck(@RequestParam("teacher_ajax_id") String userid) {
		System.out.println("�α���üũ�޼��� ȣ��_Controller");
		System.out.println("����ڰ� �Է��� ���̵��? : " + userid);
		int check = TDao.logincheck(userid);
		
		if(check == 0){
			System.out.println("DB�� �ߺ��Ǵ� ���� �����ϴ�_TeacherController");
		}else{
			System.out.println("DB�� �ߺ��Ǵ� ���� �ֽ��ϴ�_TeacherController");
		}
		return check;
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
	public String Login(Model model, Teacher teacher) {
		System.out.println("Teacher ��Ʈ�ѷ� �α��� �޼��� Ȯ��");
		Teacher teacher_save_session = TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao ���� Ȯ��");
		
		model.addAttribute("id", teacher_save_session.getTeacher_id());
		System.out.println(teacher_save_session.getTeacher_id() +"<-- ���ǿ� ����� �Ƶ� ��");
		
		model.addAttribute("name", teacher_save_session.getTeacher_name());
		System.out.println(teacher_save_session.getTeacher_name() + "<-- ���ǿ� ����� ����");
		
		model.addAttribute("level" ,teacher_save_session.getTeacher_level());
		System.out.println(teacher_save_session.getTeacher_level() + " <--���ǿ� ����� ����");
		
		//�Ű����� : HttpSessionEvent se
		//HttpSession getsession = se.getSession();
		//System.out.println("������ ���ǰ� "+getsession.getId());
		
		return "Teacher/TeacherModify";
	}
}