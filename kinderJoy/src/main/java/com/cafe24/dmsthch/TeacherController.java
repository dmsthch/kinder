package com.cafe24.dmsthch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;


//teacher_id = id teacher_name = name teacher_level = level;
@Controller
@SessionAttributes( { "teacherId", "teacherName", "teacherLevel", "teacherLicense", "teacherNo" })
public class TeacherController {
	
	@Autowired
	private TeacherDao TDao;
	
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		System.out.println("GET������� TeacherAdd�� ������");
		return "Teacher/TeacherAdd";
	}
	
	//�̿ϼ� ���̵� �ߺ�üũ �޼���
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
	
	//session�� ���� 
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login(HttpSession session) {
		System.out.println("�α���ȭ��");
		if(session.getAttribute("teacherId") == null){
			return "Teacher/TeacherLogin";
		}else{
			return "home";
		}
	}
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(HttpServletRequest request, Model model,Teacher teacher) {
		System.out.println("Teacher ��Ʈ�ѷ� �α��� �޼��� Ȯ��");
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao ���� Ȯ��");
		
		if(model == null){
			return "Teacher/TeacherLogin";
		}
		else
		{
		model.addAttribute("teacherNo",saveSession.getTeacher_no());
		System.out.println(saveSession.getTeacher_no() +" <-- ���ǿ� ����� �ѹ� �� ����");
		
		model.addAttribute("teacherLicense",saveSession.getLicense_kindergarten());
		System.out.println(saveSession.getLicense_kindergarten() +" <-- ���ǿ� ����� ���̼�����");
		
		model.addAttribute("teacherId", saveSession.getTeacher_id());
		System.out.println(saveSession.getTeacher_id() +"<-- ���ǿ� ����� ���̵� ��");
		
		model.addAttribute("teacherName", saveSession.getTeacher_name());
		System.out.println(saveSession.getTeacher_name() + "<-- ���ǿ� ����� ���Ӱ�");
		
		model.addAttribute("teacherLevel" ,saveSession.getTeacher_level());
		System.out.println(saveSession.getTeacher_level() + " <--���ǿ� ����� ������");
		
		//session.setMaxInactiveInterval(1);
		request.getSession().setAttribute("logOuting",model);
		//�Ű����� : HttpSessionEvent se
		//HttpSession getsession = se.getSession();
		//System.out.println("������ ���ǰ� "+getsession.getId());
		}
		return "home";
	}
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String loginnavbar(){
		return "Teacher/test";
	}
	
	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String logOut(@ModelAttribute Teacher teacher ,SessionStatus sessionstatus){
		

		sessionstatus.setComplete();

		
		System.out.println(sessionstatus);
		return "redirect:/home";
	}
	
}