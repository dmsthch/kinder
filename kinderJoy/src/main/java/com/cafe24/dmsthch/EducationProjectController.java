package com.cafe24.dmsthch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EducationProjectController {
	
	@RequestMapping(value = "/romiEduTest", method = RequestMethod.GET)
	public String scheduleAllSelect() {
	
		
		return "EducationProject/EducationPfoject2";
	}

}
