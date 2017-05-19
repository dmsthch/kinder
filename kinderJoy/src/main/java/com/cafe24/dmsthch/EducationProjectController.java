package com.cafe24.dmsthch;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.dmsthch.Child.ChildClass;
import com.cafe24.dmsthch.EducationProject.Education;
import com.cafe24.dmsthch.EducationProject.EducationForm;
import com.cafe24.dmsthch.EducationProject.EducationProjectDao;

@Controller
public class EducationProjectController {
	
	@Autowired
	EducationProjectDao dao;
	
	//계획안메인화면
	@RequestMapping(value = "/educationProject", method = RequestMethod.GET)
	public String educationMain(Model model
								,HttpSession session) {
		Calendar c = Calendar.getInstance(); //객체 생성 및 현재 일시분초...셋팅
		int year = c.get(Calendar.YEAR);
/*		System.out.println(c.get(Calendar.LONG_FORMAT));*/
		/*ntime += String.valueOf(c.get(Calendar.MONTH)) + "월 ";
		ntime += String.valueOf(c.get(Calendar.DATE)) + "일";*/
		System.out.println(year);/*
		System.out.println(c+"<<<c");*/
		Integer integerYear = year;
		String classYear = integerYear.toString();
		model.addAttribute("year",year);
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		List<ChildClass> childclass = dao.selectAllChildClass(licenseKindergarten, classYear);
		model.addAttribute("childclass",childclass);
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
								, @RequestParam(value="countCol",required=true) int formCountCol
								, @RequestParam(value="formTitle",required=false, defaultValue="제목 없음") String formTitle) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println(formVal+"<<<formval");
		System.out.println(formBorders+"<<<<formBorders");
		dao.formAdd(formVal, formMerge, formBorders, formCountRow, formCountCol, licenseKindergarten,formTitle);
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
	
	//저장된 양식 이름 가져오기
	@ResponseBody
	@RequestMapping(value = "/educationProjectFormName", method = RequestMethod.GET)
	public String educationProjectFormName(HttpSession session
											,HttpServletResponse response){
		System.out.println("form네임 테스트");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		List<EducationForm> ledu = dao.educationProjectFormName(licenseKindergarten);
		JSONArray jArray = new JSONArray();
		JSONObject json = null;
		for(int i=0; i<ledu.size(); i++){
			json = new JSONObject();
			EducationForm edu = ledu.get(i);
			json.put("formTitle", edu.getFormTitle());
			json.put("formOrder", edu.getFormOrder());
			jArray.add(json);
		}
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter print;
		try {
			print = response.getWriter();
			print.print(jArray);
			print.flush();
			print.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	//사이드바 반 정보 가져오기
		@ResponseBody
		@RequestMapping(value = "/educationProjectGetClassInfo", method = RequestMethod.POST)
		public String educationProjectGetClassInfo(HttpSession session
													,HttpServletResponse response){
			String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			Integer integerYear = year;
			String classYear = integerYear.toString();
			List<ChildClass> lcc = dao.selectAllChildClass(licenseKindergarten, classYear);
			JSONArray jArray = new JSONArray();
			JSONObject json = null;
			for(int i=0; i<lcc.size(); i++){
				json = new JSONObject();
				ChildClass child = lcc.get(i);
				json.put("classAge", child.getClassAge());
				json.put("className", child.getClassName());
				json.put("classNo", child.getClassNo());
				jArray.add(json);
			}
			response.setContentType("text/xml;charset=utf-8");
			PrintWriter print;
			try {
				print = response.getWriter();
				print.print(jArray);
				print.flush();
				print.close();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			return null;
		}
	
	//계획안 저장하기
	@ResponseBody
	@RequestMapping(value = "/educationProjectAdd", method = RequestMethod.POST)
	public String educationProjectAdd(HttpSession session
								, @RequestParam(value="dataArray") String val
								, @RequestParam(value="mergeArray", required=false, defaultValue="") String merge
								, @RequestParam(value="borderArray",required=false, defaultValue="") String borders
								, @RequestParam(value="countRow",required=false, defaultValue="") int countRow
								, @RequestParam(value="countCol",required=false, defaultValue="") int countCol
								, @RequestParam(value="age",required=false, defaultValue="") int age
								, @RequestParam(value="classNo",required=true) String classNo
								, @RequestParam(value="categoryNo",required=true) String categoryNo
								, @RequestParam(value="projectDateInfo",required=true) String projectDateInfo) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println(val+"<<<formval");
		System.out.println(borders+"<<<<formBorders");
		dao.educationProjectAdd(val, merge, borders, countRow, countCol, licenseKindergarten, age, classNo, categoryNo, projectDateInfo);
		return "";
	}
	
	//계획안 저장 폼 가기
	@RequestMapping(value = "/EducationProjectAdd", method = RequestMethod.GET)
	public String educationProjectGoAdd(HttpSession session
										,Model model
										,@RequestParam(value="formOrder", required=false, defaultValue="0") int formOrder) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		model.addAttribute("formOrder",formOrder);
		return "EducationProject/EducationProjectAdd";
	}
	
	//계획안 불러오기
	@RequestMapping(value = "/EducationProjectLoad", method = RequestMethod.GET)
	public String EducationProjectLoad(HttpSession session
										,Model model
										,@RequestParam(value="categoryNo") String categoryNo
										,@RequestParam(value="age", required=false, defaultValue="0") int age
										,@RequestParam(value="classNo", required=false, defaultValue="") String classNo
										,@RequestParam(value="projectDateInfo") String projectDateInfo){
		System.out.println("계획안 불러오는거 테스트");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Education result =dao.educationProjectLoad(categoryNo, projectDateInfo, licenseKindergarten,age,classNo);
		model.addAttribute("resultData",result);
		return "EducationProject/EducationProjectLoad";
	}
	

	
	//계획안 리스트()
	@RequestMapping(value = "/EducationProjectList", method = RequestMethod.GET)
	public String EducationProjectList(HttpSession session
										,@RequestParam(value="categoryNo") String categoryNo
										,@RequestParam(value="classNo", required=false, defaultValue="") String classNo
										,@RequestParam(value="age", required=false, defaultValue="0") int age
										,Model model){
		System.out.println(categoryNo+"<<categoryNo");
		System.out.println(classNo+"<<classNo");		
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		List<Education> educationList = dao.EducationProjectList(licenseKindergarten, categoryNo, classNo, age);
		//리스트에 맞는 이름까지 들어가야함.
		List<HashMap<String, Object>> eduList = dao.selectClassNameList(educationList);
		String className = dao.selectClassName(classNo);
		model.addAttribute("className",className);
		String categoryName = dao.selectCategoryName(categoryNo);
		model.addAttribute("eduList",eduList);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("categoryNo",categoryNo);
		model.addAttribute("age",age);
		return "EducationProject/EducationProjectList";
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
