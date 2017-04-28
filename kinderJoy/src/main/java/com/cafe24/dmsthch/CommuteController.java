package com.cafe24.dmsthch;

import java.util.Map;

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

	//교원 출석체크 페이지
	@RequestMapping(value="/Commute", method=RequestMethod.GET)
	public String commuteCheck(@RequestParam(name="teacherNo", required=false, defaultValue="0") int teacherNo
						,Model model){
		System.out.println("/Commute Controller");
		
		//teacherNo 가 0이 아니면 (로그인상태)
		//출근한지 확인한 뒤 출근하지 않았을 경우 teacherNo , name 셋팅후 이동
		//teacherNo가 0이면 비로그인 상태
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //오늘날짜 출근부 체크
		
		if(teacherNo != 0){ //로그인이 되어있는지 체크 로그인 된 경우
			
			Teacher teacher = tDao.OneSelectTeacher(teacherNo); //해당 교원 검색 (이름 사용 위해)
			
			if(map == null){ //출근등록을 안한상태
				System.out.println("출근등록을 안한상태");
				model.addAttribute("teacherNo", teacherNo);
				model.addAttribute("teacherName", teacher.getTeacher_name()); //이름 등록
				model.addAttribute("commuteCheck", "미출근"); //출근 등록을 안한 상태
			}else{ //출근등록을 한상태
				System.out.println("출근등록을 한상태");
				model.addAttribute("teacherNo", teacherNo); //번호 셋팅
				model.addAttribute("teacherName", teacher.getTeacher_name()); //이름 셋팅

				String commuteOutTime = map.get("attendanceEnd")+""; //퇴근시간 가져오기
				
				if(commuteOutTime.equals("null")){ //퇴근을 안한 상태
					model.addAttribute("commuteCheck", "출근"); //출근 등록한 상태
					model.addAttribute("commuteTime", map.get("attendanceStart")); //출근시간 셋팅
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
	public String commute(@RequestParam(name="teacherNo", required=true) int teacherNo){
		System.out.println("/CommuteIn(login) Controller");
		
		cDao.commuteIn(teacherNo); //출근 등록 메서드 실행
		return "redirect:/Commute?teacherNo="+teacherNo;
	}
	
	//로그인이 안되어 있는 상태에서 출석체크
	@RequestMapping(value="/CommuteIn", method=RequestMethod.POST)
	public String commute(Teacher teacher){
		System.out.println("/CommuteIn(unlogin) Controller");
		
		int teacherNo = tDao.LoginTeacher(teacher); // id pw 확인 메서드 교원번호 return
		System.out.println(teacherNo);
			
		if(teacherNo > 0){ //로그인 성공
			teacher = tDao.OneSelectTeacher(teacherNo);
			cDao.commuteIn(teacherNo); //출근 등록 메서드 실행
		}
		return "redirect:/Commute?teacherNo="+teacherNo; //출첵 유무를 띄워주기 위해 teacherNo를 들고 출첵 화면으로 이동
	}
	
	//로그인 되어있는 상태에서 퇴근하기
	@RequestMapping(value="/CommuteOut", method=RequestMethod.GET)
	public String CommuteOut(@RequestParam(name="teacherNo", required=true) int teacherNo){
		System.out.println("/CommuteOut(login) Controller");
		
		cDao.commuteOut(teacherNo);
		
		return "redirect:/Commute?teacherNo="+teacherNo;
	}
	
	//로그인이 안되어 있는 상태에서 출석체크
	@RequestMapping(value="/CommuteOut", method=RequestMethod.POST)
	public String CommuteOut(Teacher teacher){
		System.out.println("/CommuteOut(login) Controller");
		
		int teacherNo = tDao.LoginTeacher(teacher); // id pw 확인 메서드 교원번호 return
		System.out.println(teacherNo);
		
		if(teacherNo > 0){ //로그인 성공
			teacher = tDao.OneSelectTeacher(teacherNo);
			cDao.commuteOut(teacherNo); //퇴근 등록 메서드 실행
		}
		
		return "redirect:/Commute?teacherNo="+teacherNo;
	}
	
	
	
	//NullPointerException 발생시 Commute로 redirect id, pw 불일치
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(Model model){
		System.out.println("ERROR : NullPointerException 발생");
		String notice = "ID, PW를 확인해 주세요";
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "redirect:/Commute";
	}
	
	
}
