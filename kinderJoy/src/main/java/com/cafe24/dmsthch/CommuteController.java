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
	public String clock(@RequestParam(name="teacherNo", required=false, defaultValue="0") int teacherNo
						,Model model){
		
		//teacherNo 가 0이 아니면
		//출근한지 확인한 뒤 출근하지 않았을 경우
		//teacher 객체에 셋팅 후 이동
		//teacherNo가 0이면 비로그인 상태
		
		//출근체크 메서드
		//출근하지 않았을경우
		
		Map<String, String> map = cDao.commuteCheck(teacherNo);
		System.out.println(map);
		
		if(teacherNo != 0){ //로그인이 되어있는지 체크 로그인 된 경우
			
			if(map == null){ //출근등록을 안한상태
				System.out.println("출근등록을 안한상태");
				model.addAttribute("teacherNo", teacherNo);
				Teacher teacher = tDao.OneSelectTeacher(teacherNo); //해당 교원 검색
				model.addAttribute("teacherName", teacher.getTeacher_name()); //이름 등록
				model.addAttribute("commuteCheck", false); //출근 등록을 안한 상태
			}else{ //이미 출근등록을 한상태
				System.out.println("이미 출근등록을 한상태");
				model.addAttribute("teacherNo", teacherNo); //번호 셋팅
				model.addAttribute("teacherName", map.get("teacherName")); //이름 셋팅
				model.addAttribute("commuteTime", map.get("attendanceStart")); //출근시간 셋팅
				model.addAttribute("commuteCheck", true); //출근 등록한 상태
				
			}
			
		}else{ // 로그인 안된경우
			model.addAttribute("teacherNo", teacherNo);//기본값인 0을 등록
		}
		
		System.out.println(teacherNo);
		
		return "Commute/Commute";
	}
	
	
	
}
