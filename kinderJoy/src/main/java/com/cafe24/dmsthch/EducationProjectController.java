package com.cafe24.dmsthch;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.dmsthch.EducationProject.EducationProjectDao;

@Controller
public class EducationProjectController {
	
	@Autowired
	EducationProjectDao dao;
	
	@RequestMapping(value = "/educationProject", method = RequestMethod.GET)
	public String educationMain() {
		return "EducationProject/EducationProject";
	}
	
	@RequestMapping(value = "/educationProjectAddPage", method = RequestMethod.GET)
	public String educationAddPage() {
		return "EducationProject/FormAdd";
	}
	
	@ResponseBody
	@RequestMapping(value = "/educationProjectAdd", method = RequestMethod.POST)
	public String educationAdd(HttpSession session
								, @RequestParam(value="dataArray") String dataArray) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		String formVal = dataArray;
		System.out.println(formVal+"<<<formval");
		dao.formAdd(formVal, licenseKindergarten);
		return "";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/romiSaveTest", method = RequestMethod.POST)
	public String scheduleSave(HttpSession session ,
								@RequestParam(value="dataArray") String dataArray) {
		System.out.println("확인용");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println(licenseKindergarten+"<<licenseKindergarten");
		String val = dataArray;
		System.out.println(val);
		dao.formAdd(val, licenseKindergarten);
		return "";
	}
	
	@RequestMapping(value = "/romiLoadTest", method = RequestMethod.GET)
	public String selectTest(Model model){
		System.out.println("로드 테스트");
		String re = dao.selectTest();
		System.out.println(re+"<<<re");
		model.addAttribute("dataTest",re);
		return "EducationProject/Hansol";
	}

}
