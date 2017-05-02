package com.cafe24.dmsthch;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Equipment.EquipmentDao;

@Controller
public class EquipmentController {
	
	@Autowired
	EquipmentDao dao;
	
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
						,@RequestParam(value="jsonStr") String jsonStr
						,HttpSession session){
		
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		String teacherLicense = (String) session.getAttribute("teacherLicense");
		
		System.out.println("save method 실행");
		
		int sung_gong = dao.addEquement(jsonStr, teacherNo, teacherLicense);
		
		System.out.println("save method 종료");
		
		model.addAttribute("sung_gong", sung_gong);
		return "Equipment/save";
	}
}
