package com.cafe24.dmsthch;

import java.util.UUID;
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
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;


//teacher_id = id teacher_name = name teacher_level = level;
@Controller
@SessionAttributes( { "teacherId", "teacherName", "teacherLevel", "teacherLicense", "teacherNo" })
public class TeacherController extends HandlerInterceptorAdapter {
	
	@Autowired
	private TeacherDao TDao;
	

/*	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	     Object session = request.getSession().getAttribute("teacherId");
	     if (session == null) {
	      //인터셉터의 preHandle은 컨트롤러가 실행되기전에 실행하는 함수이다.
	    	 //세션의 값이 null일 경우 홈페이지로 이동한다
	      }
		return true;
    }*/
	
	
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
			return "redirect:/home";
		}
	}
	
	
	//로그인 시 캐시삭제를 하여서 뒤로가기해도 로그인폼이 안뜨게 해결 했었지만
	//양식 다시 제출 확인 페이지가 떠서 문제였었는데
	//이유가 forward하여서 이다.
	//forward는 웹브라우저의 url은 그대로 놔둔 상태에서 서버단에서 페이지의 이동을 해버리기 때문에 
	//웹브라우저에서 reload하면 웹브라우저에 남아있는 url을 reload하게되어 문제가 발생한 것이었다
	//redirect를 하면 해당 url을 클라이언트 브라우저에 내려줘서 브라우저가 해당 url로 이동하게끔 시켜주기 때문에 브라우저의 url도 바뀌게 된다
	//그래서 reload를 해도 바뀐 url로 reload를 하게 된다
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(HttpServletRequest request, Model model,Teacher teacher,HttpSession session) {
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
		
		System.out.println(session.getId() +"<--생성된 세션의 아이디");
		System.out.println( session.getMaxInactiveInterval()+"<--세션의 유지 시간 / 단위 : 초");
		
		session.setMaxInactiveInterval(600);
		System.out.println(session.getMaxInactiveInterval()+"<-- 재정의된 세션의 유지 시간 / 단위 : 초");
		
		//session.setMaxInactiveInterval(1);
		request.getSession().setAttribute("logOuting",model);
		//매개변수 : HttpSessionEvent se
		//HttpSession getsession = se.getSession();
		//System.out.println("생성된 세션값 "+getsession.getId());
		}
		return "redirect:/home";
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
		System.out.println("라이선스 발급 페이지 호출");
		return "Teacher/TeacherLicense";
	}
	
	
	
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