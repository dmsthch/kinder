package com.cafe24.dmsthch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EquipmentController {
	@RequestMapping(value = "test01", method = RequestMethod.GET)
	public String test01(){
		
		return "Equipment/test01";
	}
	@RequestMapping(value = "test02", method = RequestMethod.GET)
	public String test02(){
		
		return "Equipment/Hansol";
	}
}
