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
	
	//계정삭제폼 호출
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete() {
		return "Teacher/TeacherModify/delete";
	}
	
	
	//회원가입폼 호출
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		System.out.println("GET방식으로 TeacherAdd로 포워드\n");
		return "Teacher/TeacherAdd";
	}
	
	//편성표폼 호출
	@RequestMapping(value="/takeForm", method=RequestMethod.GET)
	public String takeForm(HttpSession httpsession ,Model model) {
		System.out.println("편성폼 호출__Teacher/TeacherModify/takeForm으로 포워드\n");
		
		//자신의 유치원 정보만 가져오기위하여 세션에 저장되어있는 값인 licenseKindergarten을 가져와서
		//TDao에 있는 takeClass 메서드에 
		//((String) httpsession.getAttribute("licenseKindergarten")) 값을 넣어주었다
		//takeTeacher도 마찬가지
		
		List<String> takeT = TDao.takeT((String) httpsession.getAttribute("licenseKindergarten"));
		List<Integer> takeC = TDao.takeC((String) httpsession.getAttribute("licenseKindergarten"));
		System.out.println(takeC +"CCCCCCCCCCCCCCCCCCCCC");
		
		model.addAttribute("takeTeacher" ,takeT);
		model.addAttribute("takeClass"   ,takeC);
		
		return "Teacher/TeacherModify/takeForm";
	}
	
	
	//교원 수정폼 호출 메서드 //User Profile
	@RequestMapping(value="/kyo", method=RequestMethod.GET)
	public String kyowon(HttpSession httpsession,Model model) {
		Teacher teacher =TDao.OneSelectTeacher((Integer)httpsession.getAttribute("teacherNo"));
		model.addAttribute("kyoteacher",teacher);
		System.out.println("user Profile호출___Teacher/TeacherModify/user로 포워드\n");	
		return "Teacher/TeacherModify/user";
	}
	
	//교원목록 테이블폼 호출 메서드 //TableList
	@RequestMapping(value="/kyotable", method=RequestMethod.GET)
	public String kyowon1(Model model, HttpSession httpsession) {
		List<Object> teacher2 = TDao.tableList((String)httpsession.getAttribute("licenseKindergarten"));
		
		//폼에 뿌려주려고 모델객체에 담음
		model.addAttribute("tableList",teacher2);
		/*Teacher teacher =TDao.OneSelectTeacher((Integer)httpsession.getAttribute("teacherNo"));
		model.addAttribute("kyoteacher",teacher);*/
		System.out.println("Table List폼 호출___/Teacher/TeacherModify/table로 포워드\n");
		return "Teacher/TeacherModify/table";
		//리턴을 원하는 폼을 적으면 teacher의 주소값이 저기로 간다 or 저기를 가리킨다
	}
	
	//아이디 중복체크 메서드
	@RequestMapping(value="/sign_up_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int logincheck(HttpServletResponse response, @RequestParam("teacher_ajax_id") String userid) {
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
	
/*	//로그인폼 호출 메서드 ★★★모달형식은 사용할 필요가 없음
		
	@RequestMapping(value="/Login" , method = RequestMethod.GET)
	public String Login(HttpSession session) {
		System.out.println("로그인화면");
		if(session.getAttribute("teacherId") == null){
			return "Teacher/TeacherLogin";
			
		}else{
			return "redirect:/home";
		}
	}*/
	
	//로그인 처리
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(SessionStatus sessionstatus,HttpServletRequest request,Model model,Teacher teacher,HttpSession session,String joongbok) throws SQLException {
		System.out.println("Teacher 컨트롤러 로그인 메서드 확인");
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(teacher.getTeacher_id() +"<--티쳐겟아이디");
		System.out.println(TDao+" <--TDao 동작 확인");

		if(saveSession != null) {
			if(session.getAttribute("teacherId") == null){
				
				model.addAttribute("teacherNo",saveSession.getTeacher_no());
				System.out.println(saveSession.getTeacher_no() +" <-- 세션에 저장될 넘버 값 세션");
				
				model.addAttribute("licenseKindergarten",saveSession.getLicense_kindergarten());
				System.out.println(saveSession.getLicense_kindergarten() +" <-- 세션에 저장될 라이센스값");
				
				model.addAttribute("teacherId", saveSession.getTeacher_id());
				System.out.println(saveSession.getTeacher_id() +"<-- 세션에 저장될 아이디 값");
				
				model.addAttribute("teacherName", saveSession.getTeacher_name());
				System.out.println(saveSession.getTeacher_name() + "<-- 세션에 저장될 네임값");
				
				model.addAttribute("teacherLevel" ,saveSession.getTeacher_level());
				System.out.println(saveSession.getTeacher_level() + " <--세션에 저장될 레벨값");
				
				session.setMaxInactiveInterval(7200);

				//시간설정을 모델객체안에 담음
				model.addAttribute("teacherTime", session.getMaxInactiveInterval());
				System.out.println("세션의 유지 시간 : "+session.getMaxInactiveInterval()+"초");

				}
			} else {
				model.addAttribute("nogin","로그인실패");
				return "redirect:/home";
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
	@RequestMapping(value="/license", method=RequestMethod.GET)
	public String chara() {
		System.out.println("라이선스 발급 페이지 호출");
		return "Teacher/TeacherModify/license";
	}
	
	//라이센스 라이선스 처리
	@RequestMapping(value="/license", method=RequestMethod.POST)
	public String uuid(Model model) throws Exception {
		
		//UUID에 대해 자세한 사항은 http://hyeonjae.github.io/uuid/2015/03/17/uuid.html 참고
		
		System.out.println("\n 라이선스 발급 처리 호출");
		String licenseKey = UUID.randomUUID().toString();

		model.addAttribute("licenseKey",licenseKey);
		System.out.println(licenseKey +"<--생성된 UUID\n");
		
		return "Teacher/TeacherModify/license";
	}
}