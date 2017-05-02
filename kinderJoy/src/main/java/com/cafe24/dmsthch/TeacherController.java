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
		System.out.println("GET방식으로 TeacherAdd로 포워드");
		return "Teacher/TeacherAdd";
	}
	
	//미완성 아이디 중복체크 메서드
	@RequestMapping(value="/sign_up_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int logincheck(@RequestParam("teacher_ajax_id") String userid) {
		System.out.println("로그인체크메서드 호출_Controller");
		System.out.println("사용자가 입력한 아이디는? : " + userid);
		int check = TDao.logincheck(userid);
		
		if(check == 0){
			System.out.println("DB에 중복되는 값이 없습니다_TeacherController");
		}else{
			System.out.println("DB에 중복되는 값이 있습니다_TeacherController");
		}
		return check;
	}
	
	
	
	
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Teacher teacher) {//매개변수는 전역변수이다
		TDao.insertTeacher(teacher);
		System.out.println(teacher+" <--입력확인");
		System.out.println(TDao +" <--Dao 확인");
		System.out.println("POST방식으로 TeacherLogin으로 포워드\n\n");
		
		return "Teacher/TeacherLogin";
	}
	
	//session만 쓰면 
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login(HttpSession session) {
		System.out.println("로그인화면");
		if(session.getAttribute("teacherId") == null){
			return "Teacher/TeacherLogin";
		}else{
			return "home";
		}
	}
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(HttpServletRequest request, Model model,Teacher teacher) {
		System.out.println("Teacher 컨트롤러 로그인 메서드 확인");
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao 동작 확인");
		
		if(model == null){
			return "Teacher/TeacherLogin";
		}
		else
		{
		model.addAttribute("teacherNo",saveSession.getTeacher_no());
		System.out.println(saveSession.getTeacher_no() +" <-- 세션에 저장될 넘버 값 세션");
		
		model.addAttribute("teacherLicense",saveSession.getLicense_kindergarten());
		System.out.println(saveSession.getLicense_kindergarten() +" <-- 세션에 저장될 라이센스값");
		
		model.addAttribute("teacherId", saveSession.getTeacher_id());
		System.out.println(saveSession.getTeacher_id() +"<-- 세션에 저장될 아이디 값");
		
		model.addAttribute("teacherName", saveSession.getTeacher_name());
		System.out.println(saveSession.getTeacher_name() + "<-- 세션에 저장될 네임값");
		
		model.addAttribute("teacherLevel" ,saveSession.getTeacher_level());
		System.out.println(saveSession.getTeacher_level() + " <--세션에 저장될 레벨값");
		
		//session.setMaxInactiveInterval(1);
		request.getSession().setAttribute("logOuting",model);
		//매개변수 : HttpSessionEvent se
		//HttpSession getsession = se.getSession();
		//System.out.println("생성된 세션값 "+getsession.getId());
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