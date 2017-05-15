package com.cafe24.dmsthch;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller
@SessionAttributes( { "teacherId", "teacherName", "teacherLevel", "licenseKindergarten", "teacherNo", "teacherTime" })
public class TeacherController {
	
	@Autowired
	private TeacherDao TDao;
	
	//���������� ȣ��
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete() {
		return "Teacher/TeacherModify/delete";
	}
	
	
	//ȸ�������� ȣ��
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		System.out.println("GET������� TeacherAdd�� ������\n");
		return "Teacher/TeacherAdd";
	}
	
	//��ǥ�� ȣ��
	@RequestMapping(value="/takeForm", method=RequestMethod.GET)
	public String takeForm(HttpSession httpsession ,Model model) {
		System.out.println("���� ȣ��__Teacher/TeacherModify/takeForm���� ������\n");
		
		//�ڽ��� ��ġ�� ������ �����������Ͽ� ���ǿ� ����Ǿ��ִ� ���� licenseKindergarten�� �����ͼ�
		//TDao�� �ִ� takeClass �޼��忡 
		//((String) httpsession.getAttribute("licenseKindergarten")) ���� �־��־���
		//takeTeacher�� ��������
		
		List<String> takeT = TDao.takeT((String) httpsession.getAttribute("licenseKindergarten"));
		List<Integer> takeC = TDao.takeC((String) httpsession.getAttribute("licenseKindergarten"));
		System.out.println(takeC +"CCCCCCCCCCCCCCCCCCCCC");
		
		model.addAttribute("takeTeacher" ,takeT);
		model.addAttribute("takeClass"   ,takeC);
		
		return "Teacher/TeacherModify/takeForm";
	}
	
	
	//���� ������ ȣ�� �޼��� //User Profile
	@RequestMapping(value="/kyo", method=RequestMethod.GET)
	public String kyowon(HttpSession httpsession,Model model) {
		Teacher teacher =TDao.OneSelectTeacher((Integer)httpsession.getAttribute("teacherNo"));
		model.addAttribute("kyoteacher",teacher);
		System.out.println("user Profileȣ��___Teacher/TeacherModify/user�� ������\n");	
		return "Teacher/TeacherModify/user";
	}
	
	//������� ���̺��� ȣ�� �޼��� //TableList
	@RequestMapping(value="/kyotable", method=RequestMethod.GET)
	public String kyowon1(Model model, HttpSession httpsession) {
		List<Object> teacher2 = TDao.tableList((String)httpsession.getAttribute("licenseKindergarten"));
		
		//���� �ѷ��ַ��� �𵨰�ü�� ����
		model.addAttribute("tableList",teacher2);
		/*Teacher teacher =TDao.OneSelectTeacher((Integer)httpsession.getAttribute("teacherNo"));
		model.addAttribute("kyoteacher",teacher);*/
		System.out.println("Table List�� ȣ��___/Teacher/TeacherModify/table�� ������\n");
		return "Teacher/TeacherModify/table";
		//������ ���ϴ� ���� ������ teacher�� �ּҰ��� ����� ���� or ���⸦ ����Ų��
	}
	
	//���̵� �ߺ�üũ �޼���
	@RequestMapping(value="/sign_up_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int logincheck(HttpServletResponse response, @RequestParam("teacher_ajax_id") String userid) {
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
	
/*	//�α����� ȣ�� �޼��� �ڡڡڸ�������� ����� �ʿ䰡 ����
		
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login(HttpSession session) {
		System.out.println("�α���ȭ��");
		if(session.getAttribute("teacherId") == null){
			return "Teacher/TeacherLogin";
			
		}else{
			return "redirect:/home";
		}
	}*/
	
	//�α��� ó��
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(SessionStatus sessionstatus,HttpServletRequest request,Model model,Teacher teacher,HttpSession session,String joongbok) throws SQLException {
		System.out.println("Teacher ��Ʈ�ѷ� �α��� �޼��� Ȯ��");
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(teacher.getTeacher_id() +"<--Ƽ�İپ��̵�");
		System.out.println(TDao+" <--TDao ���� Ȯ��");

		if(saveSession != null) {
			if(session.getAttribute("teacherId") == null){
				
				model.addAttribute("teacherNo",saveSession.getTeacher_no());
				System.out.println(saveSession.getTeacher_no() +" <-- ���ǿ� ����� �ѹ� �� ����");
				
				model.addAttribute("licenseKindergarten",saveSession.getLicense_kindergarten());
				System.out.println(saveSession.getLicense_kindergarten() +" <-- ���ǿ� ����� ���̼�����");
				
				model.addAttribute("teacherId", saveSession.getTeacher_id());
				System.out.println(saveSession.getTeacher_id() +"<-- ���ǿ� ����� ���̵� ��");
				
				model.addAttribute("teacherName", saveSession.getTeacher_name());
				System.out.println(saveSession.getTeacher_name() + "<-- ���ǿ� ����� ���Ӱ�");
				
				model.addAttribute("teacherLevel" ,saveSession.getTeacher_level());
				System.out.println(saveSession.getTeacher_level() + " <--���ǿ� ����� ������");
				
				session.setMaxInactiveInterval(7200);

				//�ð������� �𵨰�ü�ȿ� ����
				model.addAttribute("teacherTime", session.getMaxInactiveInterval());
				System.out.println("������ ���� �ð� : "+session.getMaxInactiveInterval()+"��");

				}
			} else {
				model.addAttribute("nogin","�α��ν���");
				return "redirect:/home";
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
	@RequestMapping(value="/license", method=RequestMethod.GET)
	public String chara() {
		System.out.println("���̼��� �߱� ������ ȣ��");
		return "Teacher/TeacherModify/license";
	}
	
	//���̼��� ���̼��� ó��
	@RequestMapping(value="/license", method=RequestMethod.POST)
	public String uuid(Model model) throws Exception {
		
		//UUID�� ���� �ڼ��� ������ http://hyeonjae.github.io/uuid/2015/03/17/uuid.html ����
		
		System.out.println("\n ���̼��� �߱� ó�� ȣ��");
		String licenseKey = UUID.randomUUID().toString();

		model.addAttribute("licenseKey",licenseKey);
		System.out.println(licenseKey +"<--������ UUID\n");
		
		return "Teacher/TeacherModify/license";
	}
}