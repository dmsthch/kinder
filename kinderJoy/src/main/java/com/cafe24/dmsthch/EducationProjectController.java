package com.cafe24.dmsthch;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.dmsthch.EducationProject.EducationForm;
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
	@RequestMapping(value = "/educationProjectFormAdd", method = RequestMethod.POST)
	public String educationAdd(HttpSession session
								, @RequestParam(value="dataArray") String formVal
								, @RequestParam(value="mergeArray") String formMerge
								, @RequestParam(value="borderArray") String formBorders) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println(formVal+"<<<formval");
		dao.formAdd(formVal,formMerge, licenseKindergarten);
		return "";
	}
	
	@RequestMapping(value = "/educationProjectFormLoad", method = RequestMethod.GET)
	public String educationProjectFormLoad(HttpSession session
										,Model model
										,@RequestParam(value="formOrder") int formOrder){
		System.out.println("로드 테스트");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		EducationForm result = dao.formLoad(licenseKindergarten, formOrder);
		System.out.println(result.getFormMerge()+"<<<<체크체크 머지");
		model.addAttribute("resultData",result);
		return "EducationProject/LoadForm";
	}
	
	
	
	//테스트용
	/*@ResponseBody
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
	*/
	
	@RequestMapping(value = "/romiLoadTest", method = RequestMethod.GET)
	public String selectTest(Model model){
		System.out.println("로드 테스트");
		String re = dao.selectTest();
		System.out.println(re+"<<<re");
		model.addAttribute("dataTest",re);
		return "EducationProject/Hansol";
	}
	//테스트용끝
}
