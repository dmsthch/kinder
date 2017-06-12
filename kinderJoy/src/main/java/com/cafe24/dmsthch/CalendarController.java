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
		
	/*	for(Schedule s : allSchedule){
			
			System.out.println("endDay : " + s.getScheduleEndDay());
			
			String endDay = s.getScheduleEndDay().substring(0,8);
			int plusEndDay = Integer.parseInt(s.getScheduleEndDay().substring(8,10))+1;
			
			if(plusEndDay<10){
				endDay += "0" + plusEndDay;
			}else{
				endDay += plusEndDay;				
			}
			
			s.setScheduleEndDay(endDay);
			
			System.out.println(endDay);
		}*/
		
		
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
	
	//일정 저장하기
	@RequestMapping(value = "/addShedule", method = RequestMethod.POST)
	public String addShedule(Schedule schedule
							,HttpSession session){
		System.out.println("addShedule 호출!!!!!");
		String licenseKindergarten=(String)session.getAttribute("licenseKindergarten");
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		schedule.setTeacherNo(teacherNo);
		schedule.setLicenseKindergarten(licenseKindergarten);
		calDao.addSchedule(schedule);
		
		return "redirect:/calendarTest";
	}
	
	@RequestMapping(value = "/deleteSchedule", method = RequestMethod.GET)
	public String deleteSchedule(@RequestParam(value="scheduleNo", required=true)int scheduleNo){
		calDao.deleteSchedule(scheduleNo);
		return "redirect:/calendarTest";
		
	}
}
