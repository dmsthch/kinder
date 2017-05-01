package com.cafe24.dmsthch;

import java.util.List;

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
	
	//�� ��ġ���� ��� ������ ����Ʈ 
	//�׽�Ʈ��!
	@RequestMapping(value = "/calendarTest", method = RequestMethod.GET)
	public String scheduleAllSelect(@RequestParam(name="license_kindergarten", required=true ) String license_kindergarten
									,Model model) {
		List<Schedule> allSchedule = calDao.selectAllSchedule(license_kindergarten);
		System.out.println(allSchedule);
		model.addAttribute("allSchedule",allSchedule);
		
		return "Calendar/Calendar";
	}
}
