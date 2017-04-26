package com.cafe24.dmsthch;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommuteController {

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
		boolean commuteCheck = true;
		
		if(teacherNo != 0){ //로그인이 되어있는지 체크 로그인 된 경우
			
			if(!commuteCheck){ //출근등록을 안한상태
				System.out.println("출근등록을 안한상태");
				model.addAttribute("teacherNo", teacherNo);	//임시.. (teacher객체를 셋팅)
				String teacherName = "한솔";
				model.addAttribute("teacherName", teacherName);
				model.addAttribute("commuteCheck", commuteCheck);
			}else{ //이미 출근등록을 한상태
				System.out.println("이미 출근등록을 한상태");
				model.addAttribute("teacherNo", teacherNo);	//임시.. (teacher객체를 셋팅)
				String teacherName = "한솔";
				model.addAttribute("teacherName", teacherName);
				
				String commuteTime = "08:50:52"; //출근시간
				model.addAttribute("commuteTime", commuteTime);
				model.addAttribute("commuteCheck", commuteCheck);
				
			}
			
		}else{ // 로그인 안된경우
			model.addAttribute("teacherNo", teacherNo);//기본값인 0을 등록
		}
		
		System.out.println(teacherNo);
		
		return "Commute/Commute";
	}
	
	
	
}
