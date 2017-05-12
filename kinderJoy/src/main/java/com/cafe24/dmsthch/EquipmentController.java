package com.cafe24.dmsthch;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Equipment.Equipment;
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
	public String test02(Model model){
		List<Map<String, Object>> getCategory = dao.selectCategory();
		System.out.println(getCategory + "getCategory 확인");
		model.addAttribute("getCategory", getCategory);
		return "Equipment/NewFile";
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
		
		if(sung_gong == 1){
			System.out.println("쿼리 입력 성공");
		} else {
			System.out.println("쿼리 입력 실패");
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
	@RequestMapping(value = "testSave", method = RequestMethod.POST)
	public String test03(@RequestParam(value="equipmentCategorySelect") String equipmentCategorySelect
						,@RequestParam(value="test1") String test1
						,@RequestParam(value="testTotalPrice") String testTotalPrice
						,@RequestParam(value="testValue") String testValue
						,@RequestParam(value="testCustomer") String testCustomer
						,@RequestParam(value="testState") String testState){
		System.out.println("넘어왔당");
		System.out.println(equipmentCategorySelect);
		System.out.println(test1);
		System.out.println(testTotalPrice);
		System.out.println(testValue);
		System.out.println(testCustomer);
		System.out.println(testState);
		

		return "Equipment/NewFile";
	}
}	
