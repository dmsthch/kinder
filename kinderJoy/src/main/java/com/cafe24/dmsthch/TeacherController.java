package com.cafe24.dmsthch;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

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
	
	@RequestMapping(value="/li", method=RequestMethod.GET)
	public String chara() {
		System.out.println("���̼��� �߱� ������ ȣ��");
		return "Teacher/TeacherLicense";
	}
	
	
	
	@RequestMapping(value="/li", method=RequestMethod.POST)
	public char chara(HttpServletRequest request, Teacher teacher) throws Exception {
		
		System.out.println("���̼��� �߱� ó�� ȣ��");
		
		

		// ���� IP���
				InetAddress ip = InetAddress.getLocalHost();
				System.out.println("IP : " + ip.getHostAddress());
				
				// ��Ʈ��ũ �������̽� ���
				NetworkInterface netif = NetworkInterface.getByInetAddress(ip);

				// ��Ʈ��ũ �������̽��� NULL�� �ƴϸ�
				if (netif != null) {
					// ��Ʈ��ũ �������̽� ǥ�ø� ���
					System.out.print(netif.getDisplayName() + " : ");
					
					// �ƾ�巹�� ���
					byte[] mac = netif.getHardwareAddress();
					
					// �ƾ�巹�� ���
					for (byte b : mac) {
						System.out.printf("[%02X]\n", b);
					}
					
					for (byte c : mac) {
						System.out.println(c);
					}
					
					System.out.println();
					
				}
		
		Character[] alphabet = {
			   	  'a','b','c','d'
				 ,'e','f','g','h','i'
				 ,'j','k','l','m','n'
				 ,'o','p','q','r','s'
				 ,'t','u','v','w','x'
				 ,'y','z'
		};
		
		Character[] ALPHABET = {
				 'A','B','C','D'
				,'E','F','G','H'
				,'I','J','K','L'
				,'M','N','O','P'
				,'Q','R','S','T'
				,'U','V','W','X'
				,'Y','Z'
		};
		
		List<Character> alpharrays = Arrays.asList(alphabet);
		Collections.shuffle(alpharrays);
		System.out.println(alpharrays.subList(0,2) + "<-- �ҹ��� ĳ����");
		
		List<Character> ALPHARRAYS = Arrays.asList(ALPHABET);
		Collections.shuffle(ALPHARRAYS);
		System.out.println(ALPHARRAYS.subList(0,2) + "<-- �빮�� ĳ����");
		
		Integer[] in = {1,2,3,4,5,6,7,8,9,0};
		List<Integer> inte = Arrays.asList(in);
		Collections.shuffle(inte);
		System.out.println(inte);
		
		
		if(TDao.LoginTeacher(teacher) == ALPHARRAYS.subList(0, 1) || 
		   TDao.LoginTeacher(teacher) == alpharrays.subList(0, 1)) {
			System.out.println("������");
		}
		return 0;
	}
        
}