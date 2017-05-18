package com.cafe24.dmsthch;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
	
	//권한 없을 때 보여줄 페이지
		@RequestMapping(value="/권한없는 사람이 보는 페이지", method = RequestMethod.GET)
		public String kwonhan() {
		System.out.println("! 권한없는 사람이 접근 ! 게임페이지 호출!");
		return "Teacher/TheAviator/index";
		}
	
	//takeForm save메서드 호출
	@RequestMapping(value="/save2", method = RequestMethod.POST)
	public String save() {
		System.out.println("호출확인");
		return "";
	}
	
	//계정삭제
	@RequestMapping(value="/deleteAccount", method = RequestMethod.POST)
	public String delete(HttpSession httpsession ,SessionStatus sessionstatus) {
		//현재 세션에 있는 아이디값을 가져와서 TDao에서 부른 메서드 안에 대입 후 쿼리 실행하면
		//아이디가 삭제되고 그 후 처리는 삭제는 처리할 것이 없음
		//하지만 삭제 후 인서트하기 위해선 TDao를 한번 더 거쳐야한다
		
		TDao.delete((String) httpsession.getAttribute("teacherId"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("teacherId", httpsession.getAttribute("teacherId"));
		map.put("teacherName", httpsession.getAttribute("teacherName"));
		map.put("teacherLevel", httpsession.getAttribute("teacherLevel"));

		TDao.deleteANDinsert(map);
		
		sessionstatus.setComplete();
		return "redirect:/home";
	}
	
	//계정삭제폼 호출
	@RequestMapping(value="/delete", method = RequestMethod.GET)
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
		
		//List<> takeT는 result이다   
							//TDao.takeT((String) httpsession.getAttribute("licenseKindergarten"));는 메서드에 입력한 값이므로 즉, 라이선스 이므로 String이다
		List<Object> takeT = TDao.takeT((String)httpsession.getAttribute("licenseKindergarten"));
		List<Object> takeC = TDao.takeC((String) httpsession.getAttribute("licenseKindergarten"));
		
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
	
	//교원의 정보 조회 admin전용 TableList ★현재 교원 ,이직한 교원★
	@RequestMapping(value="/kyotable", method=RequestMethod.GET)
	public String kyowon1(Model model, HttpSession httpsession ,Teacher teacher) {
		
		List<Object> teacher2 = TDao.tableList((String)httpsession.getAttribute("licenseKindergarten"));
		
		Map<String ,Object> map = new HashMap<String ,Object>();
		map.put("teacherId", teacher.getTeacherId());
		System.out.println(teacher.getTeacherId());
		map.put("teacherName", teacher.getTeacherName());
		map.put("teacherLevel", teacher.getTeacherLevel());
		map.put("teacherRemoveDay", teacher.getTeacherRemoveDay());
		System.out.println(teacher.getTeacherRemoveDay());
		
		List<Object> teacherRemove = TDao.removeList(map);
		
		
		//폼에 뿌려주려고 모델객체에 담음
		model.addAttribute("tableList",teacher2);
		model.addAttribute("removeList",teacherRemove);
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
	
	
	//로그인 아이디 체크 메서드 로그인 할 때! 아이디 조회 메서드
	@RequestMapping(value="/login_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int loginIdCheck(HttpServletResponse response, @RequestParam("teacherId") String userid) {
		System.out.println("로그인체크메서드 호출_Controller");
		System.out.println("사용자가 입력한 아이디는? : " + userid);
		int check = TDao.loginIdcheck(userid);
		if(check == 1) {
			System.out.println("아이디 있음_loginIdCheck_TeacherController");
		} else {
			System.out.println("아이디 없음");
		}
		return check;
	}
	
	
	//@RequestParam("클라이언트가 입력한 값") String 매개변수
	//리퀘스트 파람을 쓰면 값을 알아서 넣어준다
	//로그인 처리
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(
			Model model 
			,Teacher teacher 
			,HttpSession session ) throws Exception {
		
		System.out.println("Teacher 컨트롤러 로그인 메서드 확인");
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(teacher.getTeacherId() +"<-- 사용자가 입력한 아이디");
		System.out.println(TDao+" <--TDao 동작 확인");

		if(saveSession != null) {
			if(session.getAttribute("teacherId") == null){
				
				model.addAttribute("teacherNo",saveSession.getTeacherNo());
				System.out.println(saveSession.getTeacherNo() +" <-- 세션에 저장될 넘버 값 세션");
				
				model.addAttribute("licenseKindergarten",saveSession.getLicenseKindergarten());
				System.out.println(saveSession.getLicenseKindergarten() +" <-- 세션에 저장될 라이센스값");
				
				model.addAttribute("teacherId", saveSession.getTeacherId());
				System.out.println(saveSession.getTeacherId() +"<-- 세션에 저장될 아이디 값");
				
				model.addAttribute("teacherName", saveSession.getTeacherName());
				System.out.println(saveSession.getTeacherName() + "<-- 세션에 저장될 네임값");
				
				model.addAttribute("teacherLevel" ,saveSession.getTeacherLevel());
				System.out.println(saveSession.getTeacherLevel() + " <--세션에 저장될 레벨값");
				
				session.setMaxInactiveInterval(7200);

				//시간설정을 모델객체안에 담음
				model.addAttribute("teacherTime", session.getMaxInactiveInterval());
				System.out.println("세션의 유지 시간 : "+session.getMaxInactiveInterval()+"초");

				}
			} else {
				model.addAttribute("nogin","로그인실패");
				System.out.println("아이디나 비밀번호를 확인해주세요");
				return "/home";
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