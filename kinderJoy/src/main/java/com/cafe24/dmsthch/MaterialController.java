package com.cafe24.dmsthch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller //ÀÚ·á½Ç!
public class MaterialController {
	
	
	@RequestMapping(value="/Material", method=RequestMethod.GET)
	public String materialMain(){
		System.out.println("materialMain() Controller run");
		
		
		
		return "Material/DocumentEducation";
	}

}
