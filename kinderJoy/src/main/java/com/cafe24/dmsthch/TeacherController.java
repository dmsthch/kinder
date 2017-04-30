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
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login() {
		System.out.println("로그인화면");
		return "Teacher/TeacherLogin";
	}
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(HttpSession session, Teacher teacher) {
		System.out.println("Teacher 컨트롤러 로그인 메서드 확인");
		TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao 동작 확인");
		
		session.setAttribute("teacher_level", "teacher_level");
		session.setAttribute("teacher_name", "teacher_name");
		session.setAttribute("teacher_id", "teacher_id");
		
		session.getAttribute("teacher_name");
		
		return "Teacher/state";
	}
	
	
	
	
	
	@RequestMapping(value="/logincheckform", method=RequestMethod.GET)
	public String logincheckform() {
		System.out.println("로그인 체크 폼 호출");
		return "Teacher/logincheck";
	}
	
	//미완성
	@RequestMapping(value="/logincheck",method =RequestMethod.POST)
	@ResponseBody
	public int logincheck(@RequestParam("teacher_ajax_id") String userid) {
		System.out.println("로그인체크메서드 호출_Controller");
		System.out.println("사용자가 입력한 아이디는? : " + userid);
		int check = TDao.logincheck(userid);
		
		if(check == 0){
			System.out.println("사용가능합니다");
		}else{
			System.out.println("사용불가합니다");
		}
		return check;
	}
	
}