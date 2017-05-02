package com.cafe24.dmsthch;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping(value = "save", method = RequestMethod.GET)
	public String save(Model model
						,@RequestParam(value="jsonStr") List<String> jsonStr){
		
		System.out.println(jsonStr);
		model.addAttribute("jsonStr", jsonStr);
		
		return "Equipment/save";
	}
}
