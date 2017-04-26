package com.cafe24.dmsthch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CalendarController {
	
	@RequestMapping(value = "/calendarTest", method = RequestMethod.GET)
	public String test() {
		return "Calendar/Calendar";
	}
}
