package com.cafe24.dmsthch;

import java.sql.SQLException;
import java.util.UUID;
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
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;

@Controller
@SessionAttributes( { "teacherId", "teacherName", "teacherLevel", "teacherLicense", "teacherNo", "teacherTime" })
public class TeacherController extends HandlerInterceptorAdapter {
	
	@Autowired
	private TeacherDao TDao;
	
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		System.out.println("GET������� TeacherAdd�� ������");
		return "Teacher/TeacherAdd";
	}
	
	//����
	@RequestMapping(value="kyo", method=RequestMethod.GET)
	public String kyowon() {
		System.out.println("������ ȣ��_TeacherController.java");
		return "Teacher/TeacherModify";
	}
	
	//���̵� �ߺ�üũ �޼���
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
	
	//�Է� 
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Teacher teacher) {//�Ű������� ���������̴�
		TDao.insertTeacher(teacher);
		System.out.println(teacher+" <--�Է�Ȯ��");
		System.out.println(TDao +" <--Dao Ȯ��");
		System.out.println("home�� �����̷�Ʈ\n\n");
		
		return "redirect:/home";
	}
	
	//�α����� ȣ�� �޼��� �ڡڡڸ�������� ����� �ʿ䰡 ����
		
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login(HttpSession session) {
		System.out.println("�α���ȭ��");
		if(session.getAttribute("teacherId") == null){
			return "Teacher/TeacherLogin";
			
		}else{
			return "redirect:/home";
		}
	}
	
	//�α��� ó��
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(Model model,Teacher teacher,HttpSession session,String joongbok) throws SQLException {
		System.out.println("Teacher ��Ʈ�ѷ� �α��� �޼��� Ȯ��");
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao ���� Ȯ��");
		
		if(saveSession == null) {
			System.out.println("teacher.getTeacher_id()");
		} else if(teacher.getTeacher_id().equals(saveSession.getTeacher_id())) {
			System.out.println("�ٸ�");
		}
		
		
		if(session.getAttribute("teacherId") == null){
			
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
				
				session.setMaxInactiveInterval(600);
				System.out.println("�����ǵ� ������ ���� �ð� : "+session.getMaxInactiveInterval()+"��");
				
				//�ð������� �𵨰�ü�ȿ� ����
				model.addAttribute("teacherTime", session.getMaxInactiveInterval());
				System.out.println("������ ������ ���̵� : "+session.getId());
				System.out.println("������ ���� �ð� : "+session.getMaxInactiveInterval()+"��");
				
				System.out.println(session.isNew()+" <-- ó�� ���� �Ǿ��� �� true �ƴ� �� false");
				
		}	
		return "redirect:/home";
	}
	
	//�α׾ƿ� �޼���
	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String logOut(@ModelAttribute Teacher teacher ,SessionStatus sessionstatus){

		sessionstatus.setComplete();

		
		System.out.println(sessionstatus +"\n SessionAttributes�� �ʱ�ȭ");
		System.out.println(" redirect:/home");
		return "redirect:/home";
	}
	
	//���̼��� ���̼���
	@RequestMapping(value="/li", method=RequestMethod.GET)
	public String chara() {
		System.out.println("���̼��� �߱� ������ ȣ��");
		return "Teacher/TeacherLicense";
	}
	//���̼��� ���̼��� ó��
	@RequestMapping(value="/li", method=RequestMethod.POST)
	public UUID uuid(String folderPath, String original) throws Exception {
		
		System.out.println("���̼��� �߱� ó�� ȣ��");
		
		UUID uid = UUID.randomUUID();
		System.out.println(uid +"<--UUID");
		int uid0 = UUID.randomUUID().hashCode();
		System.out.println(uid0+" <--UUID hashCode");
		int uid1 = UUID.randomUUID().version();
		System.out.println(uid1 +" <--���� ����");
		return uid;
		}
}