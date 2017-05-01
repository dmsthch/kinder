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
		System.out.println("GET방식으로 TeacherAdd로 포워드");
		return "Teacher/TeacherAdd";
	}
	
	//미완성
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
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login() {
		System.out.println("로그인화면");
		return "Teacher/TeacherLogin";
	}
	
	
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(Model model, Teacher teacher) {
		System.out.println("Teacher 컨트롤러 로그인 메서드 확인");
		Teacher teacher_save_session = TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao 동작 확인");
		
		model.addAttribute("id", teacher_save_session.getTeacher_id());
		System.out.println(teacher_save_session.getTeacher_id() +"<-- 세션에 저장될 아디 값");
		
		model.addAttribute("name", teacher_save_session.getTeacher_name());
		System.out.println(teacher_save_session.getTeacher_name() + "<-- 세션에 저장된 네임");
		
		model.addAttribute("level" ,teacher_save_session.getTeacher_level());
		System.out.println(teacher_save_session.getTeacher_level() + " <--세션에 저장된 레벨");
		
		//매개변수 : HttpSessionEvent se
		//HttpSession getsession = se.getSession();
		//System.out.println("생성된 세션값 "+getsession.getId());
		
		return "Teacher/TeacherModify";
	}
}