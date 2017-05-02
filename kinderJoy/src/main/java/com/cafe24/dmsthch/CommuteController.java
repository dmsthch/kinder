package com.cafe24.dmsthch;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Commute.CommuteDao;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteDao cDao;
	@Autowired
	private TeacherDao tDao;
	
	
	private Map commuteMap = null;
	
//	@Autowired
//	public CommuteController(HttpSession session) {
//		
//		if(session.getAttribute("teacherNo") != null){
//			int teacherNo = (Integer) session.getAttribute("teacherNo");
//			commuteMap = cDao.commuteCheck(teacherNo);
//		}
//		
//	}
//	
//	@Autowired
//	public CommuteController() {
//	}
	

	//교원 출석체크 페이지
	@RequestMapping(value="/Commute", method=RequestMethod.GET)
	public String commuteCheck(
			Model model
			,HttpSession session
			,@RequestParam(value="teacherNo",required=false, defaultValue="0") int teacherNo)
	{
		System.out.println("/Commute Controller");
		
		if(session.getAttribute("teacherNo") != null){
			teacherNo = (Integer) session.getAttribute("teacherNo");
		}
		System.out.println("teacherNo : " + teacherNo);
		
		//teacherNo 가 0이 아니면 (로그인상태)
		//출근한지 확인한 뒤 출근하지 않았을 경우 teacherNo , name 셋팅후 이동
		//teacherNo가 0이면 비로그인 상태
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //오늘날짜 출근부 체크
		System.out.println(map);
		
		if(teacherNo != 0){ //로그인이 되어있는지 체크 로그인 된 경우
			
			if(map == null){ //출근등록을 안한상태
				System.out.println("출근등록을 안한상태");
				Teacher teacher = tDao.OneSelectTeacher(teacherNo); //해당 교원 검색 (이름 사용 위해)
				model.addAttribute("teacherNo", teacherNo);
				model.addAttribute("teacherName", teacher.getTeacher_name()); //이름 등록
				model.addAttribute("commuteCheck", "미출근"); //출근 등록을 안한 상태
			}else{ //출근등록을 한상태
				System.out.println("출근등록을 한상태");
				model.addAttribute("teacherNo", teacherNo); //번호 셋팅
				model.addAttribute("teacherName", (String)map.get("teacherName")); //이름 셋팅

				String commuteOutTime = map.get("attendanceEnd")+""; //퇴근시간 가져오기
				
				if(commuteOutTime.equals("null")){ //퇴근을 안한 상태
					System.out.println("퇴근을 안한 상태");
					List<Map<String,Object>> absenceList = cDao.absenceCheck((Integer) map.get("attendanceNo")); //외출정보 검색
					Map<String, Object> absence = null;
					if(absenceList.size() != 0){
						absence = absenceList.get(absenceList.size()-1); //가장 최근 정보						
					}
										
					if(absence == null){ //외출을 안한상태
						model.addAttribute("commuteCheck", "출근"); //출근 등록한 상태 셋팅
						model.addAttribute("commuteTime", map.get("attendanceStart")); //출근시간 셋팅
					}else{ //외출한 상태
						if(absence.get("absenceEnd") == null){ // 복귀 안함
							model.addAttribute("commuteCheck", "외출"); //외출 등록한 상태 셋팅
							model.addAttribute("commuteTime", absence.get("absenceStart")); //외출시간 셋팅
						}else{// 복귀함
							model.addAttribute("commuteCheck", "복귀"); //복귀 등록한 상태 셋팅
							model.addAttribute("commuteTime", absence.get("absenceEnd")); //복귀시간 셋팅
						}
					}
				}else{ //퇴근한 상태
					model.addAttribute("commuteCheck", "퇴근"); //출근 등록한 상태
					model.addAttribute("commuteTime", commuteOutTime); //출근시간 셋팅
				}
			}
		}else{ // 로그인 안된경우
			model.addAttribute("teacherNo", teacherNo);//기본값인 0을 등록
		}
		
		return "Commute/Commute";
	}
	
	
	//로그인 되어있는 상태에서 출석체크
	@RequestMapping(value="/CommuteIn", method=RequestMethod.GET)
	public String commute(HttpSession session){
		System.out.println("/CommuteIn(login) Controller");
		
		int teacherNo = 0;
		Teacher teacher = null;
		if(session.getAttribute("teacherNo") != null){
			teacherNo = (Integer) session.getAttribute("teacherNo");
			teacher = tDao.OneSelectTeacher(teacherNo);
			teacher.setTeacher_no(teacherNo);
		}
		
		System.out.println(teacherNo);
		
		cDao.commuteIn(teacher); //출근 등록 메서드 실행
		return "redirect:/Commute";
	}
	
	//로그인이 안되어 있는 상태에서 출근
	@RequestMapping(value="/CommuteIn", method=RequestMethod.POST)
	public String commute(Teacher teacher, Model model){
		System.out.println("/CommuteIn(unlogin) Controller");
		
		Teacher noTeacher = tDao.LoginTeacher(teacher); // id pw 확인 메서드 교원번호 return
		int teacherNo = noTeacher.getTeacher_no();
		System.out.println("teacherNo : " + teacherNo);
		
		Teacher getTeacher = tDao.OneSelectTeacher(teacherNo);
		getTeacher.setTeacher_no(teacherNo);
		
		if(teacherNo > 0){ //로그인 성공
			if(cDao.commuteCheck(teacherNo) == null){ //출근등록이 안되어 있는 경우
				cDao.commuteIn(getTeacher); //출근 등록 메서드 실행
			}else{
				System.out.println("출근 등록이 되어있음");
			}
		}
		
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //오늘날짜 출근부 체크
		
		System.out.println(map);
		
		String teacherName = map.get("teacherName")+"";
		String attendanceStart = map.get("attendanceStart")+"";
		
		System.out.println(teacherName + "treacher naeaweffe");
		System.out.println(attendanceStart);
		
		String notice = teacherName+"님 "+attendanceStart+" 출근등록 되셧습니다";
		model.addAttribute("notice", notice);
		
		return "redirect:/Commute"; 
	}
	
	//로그인 되어있는 상태에서 퇴근하기
	@RequestMapping(value="/CommuteOut", method=RequestMethod.GET)
	public String commuteOut(HttpSession session){
		System.out.println("/commuteOut(login) Controller");
		
		int teacherNo = 0;
		if(session.getAttribute("teacherNo") != null){
			teacherNo = (Integer) session.getAttribute("teacherNo");			
		}
		System.out.println(teacherNo);
		
		cDao.commuteOut(teacherNo);
		
		return "redirect:/Commute";
	}
	
	//로그인이 안되어 있는 상태에서 퇴근
	@RequestMapping(value="/CommuteOut", method=RequestMethod.POST)
	public String commuteOut(Teacher teacher, Model model){
		System.out.println("/commuteOut(login) Controller");
		
		Teacher noTeacher = tDao.LoginTeacher(teacher); // id pw 확인 메서드 교원번호 return
		int teacherNo = noTeacher.getTeacher_no();
		System.out.println(teacherNo);
		
		if(teacherNo > 0){ //로그인 성공
			teacher = tDao.OneSelectTeacher(teacherNo);
			cDao.commuteOut(teacherNo); //퇴근 등록 메서드 실행
		}
		
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //오늘날짜 출근부 체크
		Teacher nameTeacher = tDao.OneSelectTeacher(teacherNo); //해당 교원 검색 (이름 사용 위해)
						
		String teacherName = nameTeacher.getTeacher_name();
		String attendanceEnd = map.get("attendanceEnd")+"";
		
		String notice = teacherName+"님 "+attendanceEnd+" 퇴근등록 되셧습니다";
		model.addAttribute("notice", notice);
		
		return "redirect:/Commute"; 
	}
	
	//외출등록
	@RequestMapping(value="/absence", method=RequestMethod.GET)
	public String absence(HttpSession session){
		System.out.println("/absence Controller");
		
		Map<Object, Object> map = cDao.commuteCheck((Integer) session.getAttribute("teacherNo")); //오늘날짜 출근부 체크
		
		cDao.absence(map);
		
		return "redirect:/Commute";
	}
	
	//복귀등록
	@RequestMapping(value="/absenceReturn", method=RequestMethod.GET)
	public String absenceReturn(HttpSession session){
		System.out.println("/absenceReturn Controller");
		
		Map<Object, Object> map = cDao.commuteCheck((Integer) session.getAttribute("teacherNo")); //오늘날짜 출근부 체크
		List<Map<String,Object>> absenceList = cDao.absenceCheck((Integer) map.get("attendanceNo")); //외출정보 검색
		Map<String, Object> absence = null;
		if(absenceList.size() != 0){
			absence = absenceList.get(absenceList.size()-1); //가장 최근 정보						
		}
		
		System.out.println(absence);
		
		System.out.println(absence.get("absenceNo"));
		
		cDao.absenceReturn(absence.get("absenceNo")+""); //복귀 등록
				
		return "redirect:/Commute";
	}
	
	
	//임시 로그아웃
	@RequestMapping(value="/hsLogout", method=RequestMethod.GET)
	public String hsLogout(HttpSession session){
		session.removeAttribute("teacherNo");
		session.removeAttribute("teacherLicense");
		session.removeAttribute("teacherId");
		session.removeAttribute("teacherName");
		session.removeAttribute("teacherLevel");
		return "redirect:/Commute";
	}
	
	
	
	/*  예외처리 부분  */
	
	//NullPointerException 발생시 Commute로 redirect id, pw 불일치
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(Model model){
		System.out.println("ERROR : NullPointerException 발생");
		String notice = "ID, PW를 확인해 주세요";
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "redirect:/Commute";
	}
	
	//tooManyResultsException
	@ExceptionHandler(org.apache.ibatis.exceptions.TooManyResultsException.class)
	public String tooManyResultsException(Model model){
		System.out.println("ERROR : tooManyResultsException 발생");
		String notice = "tooManyResultsException";
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "redirect:/Commute";
	}
	
	
}
