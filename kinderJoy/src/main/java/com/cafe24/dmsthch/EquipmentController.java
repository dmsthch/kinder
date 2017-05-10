package com.cafe24.dmsthch;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Equipment.EquipmentDao;
import com.cafe24.dmsthch.Equipment.Sheet;

@Controller
public class EquipmentController {
	
	@Autowired
	EquipmentDao dao;
	
	@RequestMapping(value = "Equipment", method = RequestMethod.GET)
	public String test01(){
		
		return "Equipment/Equipment";
	}
	@RequestMapping(value = "test01", method = RequestMethod.GET)
	public String test02(){
		
		return "Equipment/NewFile";
	}
	@RequestMapping(value = "save", method = RequestMethod.GET)
	public String save(Model model
						,@RequestParam(value="jsonStr") String jsonStr
						,HttpSession session){
		
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		String teacherLicense = (String) session.getAttribute("teacherLicense");
		
		System.out.println("save method ����");
		
		int sung_gong = dao.addEquement(jsonStr, teacherNo, teacherLicense);
		
		System.out.println("save method ����");
		
		if(sung_gong == 1){
			System.out.println("���� �Է� ����");
		} else {
			System.out.println("���� �Է� ����");
		}
		return "Equipment/Equipment";
	}
	@RequestMapping(value = "reroad", method = RequestMethod.POST)
	public String road(HttpSession session, Model model){
		
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		
		Sheet sheet = dao.selectEquipment(teacherNo);
		
		model.addAttribute("sheet", sheet);
		
		return "Equipment/Equipment";
	}
}
