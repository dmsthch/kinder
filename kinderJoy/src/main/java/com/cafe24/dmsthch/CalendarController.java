package com.cafe24.dmsthch;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cafe24.dmsthch.Calendar.CalendarDao;
import com.cafe24.dmsthch.Calendar.ForJson;
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
		System.out.println("체크");
		String licenseKindergarten=(String)session.getAttribute("licenseKindergarten");
		List<Schedule> allSchedule = calDao.selectAllSchedule(licenseKindergarten);
		System.out.println(allSchedule);
		model.addAttribute("allSchedule",allSchedule);
		
		return "Calendar/Calendar";
	}
	
	@RequestMapping(value = "/getScheduleContent",  produces = "application/text; charset=utf8",  method = RequestMethod.GET)
	@ResponseBody
	public String getScheduleContent(@RequestParam(value="scheduleNo") int scheduleNo){
		
		System.out.println(scheduleNo);
		Schedule schedule = calDao.selectOneSchedule(scheduleNo);
		System.out.println(schedule.getScheduleNo()+"<<<schedule.getScheduleNo()");
		System.out.println(schedule.getScheduleTitle()+"<<<schedule.getScheduleTitle()");
		ForJson fj = new ForJson();
		String jsonSchedule = fj.toJsonSchedule(schedule);
		System.out.println(jsonSchedule+"<<<<jsonSchedule");
		return jsonSchedule;
	}
	
	@RequestMapping(value = "/deleteSchedule", method = RequestMethod.GET)
	public String deleteSchedule(@RequestParam(value="scheduleNo", required=true)int scheduleNo){
		calDao.deleteSchedule(scheduleNo);
		return "redirect:/calendarTest";
		
	}
}
