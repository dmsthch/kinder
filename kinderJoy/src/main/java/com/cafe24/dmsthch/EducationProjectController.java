package com.cafe24.dmsthch;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.dmsthch.EducationProject.Education;
import com.cafe24.dmsthch.EducationProject.EducationForm;
import com.cafe24.dmsthch.EducationProject.EducationProjectDao;

@Controller
public class EducationProjectController {
	
	@Autowired
	EducationProjectDao dao;
	
	//계획안메인화면
	@RequestMapping(value = "/educationProject", method = RequestMethod.GET)
	public String educationMain(Model model) {
		Calendar c = Calendar.getInstance(); //객체 생성 및 현재 일시분초...셋팅
		int year = c.get(Calendar.YEAR);
/*		System.out.println(c.get(Calendar.LONG_FORMAT));*/
		/*ntime += String.valueOf(c.get(Calendar.MONTH)) + "월 ";
		ntime += String.valueOf(c.get(Calendar.DATE)) + "일";*/
		System.out.println(year);/*
		System.out.println(c+"<<<c");*/
		model.addAttribute("year",year);
		return "EducationProject/EducationProject";
	}
	
	//계획안 양식추가화면
	@RequestMapping(value = "/educationProjectAddPage", method = RequestMethod.GET)
	public String educationAddPage() {
		return "EducationProject/FormAdd";
	}
	
	//계획안 양식 추가하기
	@ResponseBody
	@RequestMapping(value = "/educationProjectFormAdd", method = RequestMethod.POST)
	public String educationAdd(HttpSession session
								, @RequestParam(value="dataArray") String formVal
								, @RequestParam(value="mergeArray", required=false, defaultValue="") String formMerge
								, @RequestParam(value="borderArray",required=false, defaultValue="") String formBorders
								, @RequestParam(value="countRow",required=true) int formCountRow
								, @RequestParam(value="countCol",required=true) int formCountCol) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println(formVal+"<<<formval");
		System.out.println(formBorders+"<<<<formBorders");
		dao.formAdd(formVal, formMerge, formBorders, formCountRow, formCountCol, licenseKindergarten);
		return "";
	}
	
	//양식 불러오기
	@RequestMapping(value = "/educationProjectFormLoad", method = RequestMethod.GET)
	public String educationProjectFormLoad(HttpSession session
										,Model model
										,@RequestParam(value="formOrder") int formOrder){
		System.out.println("로드 테스트");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		EducationForm result = dao.formLoad(licenseKindergarten, formOrder);
		//System.out.println(isMerge+"<<isMerge   ,"+ isBorders+"<<isBorders");
		//System.out.println(result.getFormMerge()+"<<<<체크체크 머지");
		//System.out.println(result.getFormCountCol()+"<<체크체크 카운트");
		if(result==null){
			return "EducationProject/EducationProject";
		}
		model.addAttribute("resultData",result);
		return "EducationProject/LoadForm";
	}
	
	//계획안 저장하기
	@ResponseBody
	@RequestMapping(value = "/educationProjectAdd", method = RequestMethod.POST)
	public String educationProjectAdd(HttpSession session
								, @RequestParam(value="dataArray") String val
								, @RequestParam(value="mergeArray", required=false, defaultValue="") String merge
								, @RequestParam(value="borderArray",required=false, defaultValue="") String borders
								, @RequestParam(value="countRow",required=false, defaultValue="") int countRow
								, @RequestParam(value="countCol",required=false, defaultValue="") int countCol) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println(val+"<<<formval");
		System.out.println(borders+"<<<<formBorders");
		dao.educationProjectAdd(val, merge, borders, countRow, countCol, licenseKindergarten);
		return "";
	}
	
	//계획안 불러오기
	@RequestMapping(value = "/EducationProjectLoad", method = RequestMethod.GET)
	public String EducationProjectLoad(HttpSession session
										,Model model
										,@RequestParam(value="categoryNo") String categoryNo
										,@RequestParam(value="age", required=false, defaultValue="") int age
										,@RequestParam(value="classNo", required=false, defaultValue="") String classNo
										,@RequestParam(value="date") String date){
		System.out.println("계획안 불러오는거 테스트");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Education result =dao.educationProjectLoad(categoryNo, date, licenseKindergarten,age,classNo);
		model.addAttribute("resultData",result);
		return "EducationProject/EducationProjectLoad";
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
