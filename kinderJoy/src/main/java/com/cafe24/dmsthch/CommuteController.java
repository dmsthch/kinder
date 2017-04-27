package com.cafe24.dmsthch;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		System.out.println(map);
		
		if(teacherNo != 0){ //로그인이 되어있는지 체크 로그인 된 경우
			
			Teacher teacher = tDao.OneSelectTeacher(teacherNo); //해당 교원 검색
			
			if(map == null){ //출근등록을 안한상태
				System.out.println("출근등록을 안한상태");
				model.addAttribute("teacherNo", teacherNo);
				model.addAttribute("teacherName", teacher.getTeacher_name()); //이름 등록
				model.addAttribute("commuteCheck", false); //출근 등록을 안한 상태
			}else{ //이미 출근등록을 한상태
				System.out.println("이미 출근등록을 한상태");
				model.addAttribute("teacherNo", teacherNo); //번호 셋팅
				model.addAttribute("teacherName", teacher.getTeacher_name()); //이름 셋팅
				model.addAttribute("commuteTime", map.get("attendanceStart")); //출근시간 셋팅
				model.addAttribute("commuteCheck", true); //출근 등록한 상태
			}
			
		}else{ // 로그인 안된경우
			model.addAttribute("teacherNo", teacherNo);//기본값인 0을 등록
		}
		
		return "Commute/Commute";
	}
	
	
	//로그인 되어있는 상태에서 출석체크
	@RequestMapping(value="/GoCommute", method=RequestMethod.GET)
	public String commute(@RequestParam(name="teacherNo", required=true) int teacherNo){
		System.out.println("/GoCommute(login) Controller");
		
		cDao.commute(teacherNo); //출근 등록 메서드 실행
		return "redirect:/Commute?teacherNo="+teacherNo;
	}
	
	//로그인이 안되어 있는 상태에서 출석체크
	@RequestMapping(value="/GoCommute", method=RequestMethod.POST)
	public String commute(Teacher teacher){
		System.out.println("/GoCommute(unlogin) Controller");
		
		String returnUri = "";
		
		System.out.println(teacher.getTeacher_id());
		System.out.println(teacher.getTeacher_pw());
		System.out.println(teacher.getTeacher_no());
		
		int loginResult = tDao.LoginTeacher(teacher); // id pw 확인 메서드
			
		if(loginResult == 1){ //로그인 성공
			teacher = tDao.OneSelectTeacher(teacher.getTeacher_no()); //해당 교원 검색    04 27 이부분 null point error
			cDao.commute(teacher.getTeacher_no()); //출근 등록 메서드 실행
			returnUri = "redirect:/Commute?teacherNo="+teacher.getTeacher_no(); //출첵 유무를 띄워주기 위해 teacherNo를 들고 출첵 화면으로 이동
		}else{ // 로그인 실패
			returnUri = "redirect:/Commute?teacherNo=0"; // 비로그인 상태로 출첵 화면으로 이동
		}
		return returnUri;
	}
	
	
}
