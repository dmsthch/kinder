package com.cafe24.dmsthch;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Child.ChildAttendance;
import com.cafe24.dmsthch.Child.ChildDao;
import com.cafe24.dmsthch.Commute.CommuteDao;
import com.cafe24.dmsthch.Commute.CommuteService;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteDao cDao;
	@Autowired
	private TeacherDao tDao;
	@Autowired
	private CommuteService commuteServise;
	@Autowired
	private ChildDao childDao;
	
	
	@RequestMapping(value="/hansol2", method=RequestMethod.GET)
	public String hansolTest(){
		return "Equipment/Hansol2";
	}
	
	@RequestMapping(value="/send" , method=RequestMethod.GET)
	public String getJson(Model model,@RequestParam(value="jsonStr") List<String> jsonStr){
		System.out.println("getJson() Controller Run");
		
		System.out.println(jsonStr);
		model.addAttribute("jsonStr", jsonStr);
		
		return "Equipment/solTest";
	}
	
	
	
	

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
				model.addAttribute("teacherName", teacher.getTeacherName()); //이름 등록
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
			teacher.setTeacherNo(teacherNo);
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
		int teacherNo = noTeacher.getTeacherNo();
		System.out.println("teacherNo : " + teacherNo);
		
		Teacher getTeacher = tDao.OneSelectTeacher(teacherNo);
		getTeacher.setTeacherNo(teacherNo);
		
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
		int teacherNo = noTeacher.getTeacherNo();
		System.out.println(teacherNo);
		
		if(teacherNo > 0){ //로그인 성공
			teacher = tDao.OneSelectTeacher(teacherNo);
			cDao.commuteOut(teacherNo); //퇴근 등록 메서드 실행
		}
		
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //오늘날짜 출근부 체크
		Teacher nameTeacher = tDao.OneSelectTeacher(teacherNo); //해당 교원 검색 (이름 사용 위해)
						
		String teacherName = nameTeacher.getTeacherName();
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
	
	//출석 현황 메인
	@RequestMapping(value="/CommuteInfo", method=RequestMethod.GET)
	public String commuteInfo(HttpSession session, Model model){
		System.out.println("CommuteInfo() Run Controller");

		Map<String, Object> getCommuteInfo = commuteServise.getCommuteInfo(session);
		
		System.out.println(getCommuteInfo);
		model.addAttribute("commutePercentage", getCommuteInfo.get("commutePercentage"));
		model.addAttribute("commuteCount", getCommuteInfo.get("commuteCount"));
		model.addAttribute("businessDay", getCommuteInfo.get("businessDay"));
		
		return "Commute/CommuteInfo";
	}
	
	//월별 출석 현황
	@RequestMapping(value="/CommuteForMonth", method=RequestMethod.GET)
	public String CommuteForMonth(HttpSession session){
		System.out.println("CommuteForMonth() Run Controller");
		
		String returnUrl = "/";
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		
		if(isLogin){
			returnUrl = "Commute/CommuteForMonth";
		}
		
		return returnUrl;
	}
	
	//월별 출석 현황 - 출석정보 가져오기
	@RequestMapping(value="/showCommuteCheck", method=RequestMethod.GET)
	public void showCommuteCheck(HttpSession session, HttpServletResponse response
								,@RequestParam(value="month",required=true) int month){
		System.out.println("showCommuteCheck() Run Controller");
		
		List<Map<String, Object>> getCommuteCheck = commuteServise.getCommuteForMonth(session, month);
		
		JSONArray jArray = new JSONArray();
		JSONObject json = null;
		
		for(int i=0; i<getCommuteCheck.size(); i++){
			json = new JSONObject();
			Map<String, Object> map = getCommuteCheck.get(i);
			
			json.put("attendanceNo", map.get("attendanceNo")+"");
			json.put("attendanceDay", map.get("attendanceDay")+"");
			json.put("teacherNo", map.get("teacherNo")+"");
			json.put("attendanceStart", map.get("attendanceStart")+"");
			json.put("attendanceEnd", map.get("attendanceEnd")+"");
			json.put("absenceNo", map.get("absenceNo")+"");
			json.put("categoryNo", map.get("categoryNo")+"");
			json.put("absenceStart", map.get("absenceStart")+"");
			json.put("absenceEnd", map.get("absenceEnd")+"");	
			
			jArray.add(json);
		}
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter print;
		try {
			print = response.getWriter();
			print.print(jArray);
			print.flush();
			print.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//유아 출석 현황
	@RequestMapping(value="KidCommuteView", method=RequestMethod.GET)
	public String kidCommuteView(){
		
		return "Commute/KidCommuteView";
	}
	
	//유아 출석정보 가져오기
	@RequestMapping(value="getKidCommute", method=RequestMethod.GET)
	public void getKidCommute(HttpSession session, HttpServletResponse response
							,@RequestParam(value="month",required=true) String month
							,@RequestParam(value="date",required=true) String date){
		System.out.println("getKidCommute() run Controller");
		
		System.out.println(month);
		System.out.println(date);
		
		List<ChildAttendance> getKidCommuteList = commuteServise.getKidAttendance(session, month, date);
		
		JSONArray jArray = new JSONArray();
		JSONObject json = null;
		
		for(ChildAttendance c : getKidCommuteList){
			json = new JSONObject();			

			json.put("KidNo", c.getKidNo()+"");
			json.put("Attendance", c.getAttendance()+"");
			json.put("AttendanceUnusual", c.getAttendanceUnusual()+"");
			json.put("kidName", childDao.getChild(c.getKidNo()).getKidName()+"");
			
			jArray.add(json);
		}
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter print;
		try {
			print = response.getWriter();
			print.print(jArray);
			print.flush();
			print.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
