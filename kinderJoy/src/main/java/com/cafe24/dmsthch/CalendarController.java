package com.cafe24.dmsthch;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Calendar.CalendarDao;
import com.cafe24.dmsthch.Calendar.Schedule;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarDao calDao;
	
	//한 유치원의 모든 스케쥴 셀렉트 
	//테스트중!
	@RequestMapping(value = "/calendarTest", method = RequestMethod.GET)
	public String scheduleAllSelect(HttpSession session
									,Model model) {
		String licenseKindergarten=(String)session.getAttribute("teacherLicense");
		List<Schedule> allSchedule = calDao.selectAllSchedule(licenseKindergarten);
		System.out.println(allSchedule);
		model.addAttribute("allSchedule",allSchedule);
		
		return "Calendar/Calendar";
	}
	

	@RequestMapping(value = "/romiTest2", method = RequestMethod.GET)
	public String save(Model model
			,@RequestParam(value="jsonStr") List<String> jsonStr){

		System.out.println(jsonStr);
		model.addAttribute("jsonStr", jsonStr);
		return null;
	}
	
	@RequestMapping(value = "/romiTest", method = RequestMethod.GET)
	public String romitest(@RequestParam(value="testVar", required=true)String testVar){
		System.out.println(testVar+"<<<testVar");
		return "home";
		
	}
}
