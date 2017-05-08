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
		System.out.println("GET방식으로 TeacherAdd로 포워드");
		return "Teacher/TeacherAdd";
	}
	
	//교원
	@RequestMapping(value="kyo", method=RequestMethod.GET)
	public String kyowon() {
		System.out.println("교원폼 호출_TeacherController.java");
		return "Teacher/TeacherModify";
	}
	
	//아이디 중복체크 메서드
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
	
	//입력 
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Teacher teacher) {//매개변수는 전역변수이다
		TDao.insertTeacher(teacher);
		System.out.println(teacher+" <--입력확인");
		System.out.println(TDao +" <--Dao 확인");
		System.out.println("home로 리다이렉트\n\n");
		
		return "redirect:/home";
	}
	
	//로그인폼 호출 메서드 ★★★모달형식은 사용할 필요가 없음
		
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login(HttpSession session) {
		System.out.println("로그인화면");
		if(session.getAttribute("teacherId") == null){
			return "Teacher/TeacherLogin";
			
		}else{
			return "redirect:/home";
		}
	}
	
	//로그인 처리
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(Model model,Teacher teacher,HttpSession session,String joongbok) throws SQLException {
		System.out.println("Teacher 컨트롤러 로그인 메서드 확인");
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(TDao+" <--TDao 동작 확인");
		
		if(saveSession == null) {
			System.out.println("teacher.getTeacher_id()");
		} else if(teacher.getTeacher_id().equals(saveSession.getTeacher_id())) {
			System.out.println("다름");
		}
		
		
		if(session.getAttribute("teacherId") == null){
			
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
				
				session.setMaxInactiveInterval(600);
				System.out.println("재정의된 세션의 유지 시간 : "+session.getMaxInactiveInterval()+"초");
				
				//시간설정을 모델객체안에 담음
				model.addAttribute("teacherTime", session.getMaxInactiveInterval());
				System.out.println("생성된 세션의 아이디 : "+session.getId());
				System.out.println("세션의 유지 시간 : "+session.getMaxInactiveInterval()+"초");
				
				System.out.println(session.isNew()+" <-- 처음 생성 되었을 시 true 아닐 시 false");
				
		}	
		return "redirect:/home";
	}
	
	//로그아웃 메서드
	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String logOut(@ModelAttribute Teacher teacher ,SessionStatus sessionstatus){

		sessionstatus.setComplete();

		
		System.out.println(sessionstatus +"\n SessionAttributes만 초기화");
		System.out.println(" redirect:/home");
		return "redirect:/home";
	}
	
	//라이센스 라이선스
	@RequestMapping(value="/li", method=RequestMethod.GET)
	public String chara() {
		System.out.println("라이선스 발급 페이지 호출");
		return "Teacher/TeacherLicense";
	}
	//라이센스 라이선스 처리
	@RequestMapping(value="/li", method=RequestMethod.POST)
	public UUID uuid(String folderPath, String original) throws Exception {
		
		System.out.println("라이선스 발급 처리 호출");
		
		UUID uid = UUID.randomUUID();
		System.out.println(uid +"<--UUID");
		int uid0 = UUID.randomUUID().hashCode();
		System.out.println(uid0+" <--UUID hashCode");
		int uid1 = UUID.randomUUID().version();
		System.out.println(uid1 +" <--관련 버젼");
		return uid;
		}
}