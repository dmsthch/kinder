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
	
	//��ȹ�ȸ���ȭ��
	@RequestMapping(value = "/educationProject", method = RequestMethod.GET)
	public String educationMain(Model model) {
		Calendar c = Calendar.getInstance(); //��ü ���� �� ���� �Ͻú���...����
		int year = c.get(Calendar.YEAR);
/*		System.out.println(c.get(Calendar.LONG_FORMAT));*/
		/*ntime += String.valueOf(c.get(Calendar.MONTH)) + "�� ";
		ntime += String.valueOf(c.get(Calendar.DATE)) + "��";*/
		System.out.println(year);/*
		System.out.println(c+"<<<c");*/
		model.addAttribute("year",year);
		return "EducationProject/EducationProject";
	}
	
	//��ȹ�� ����߰�ȭ��
	@RequestMapping(value = "/educationProjectAddPage", method = RequestMethod.GET)
	public String educationAddPage() {
		return "EducationProject/FormAdd";
	}
	
	//��ȹ�� ��� �߰��ϱ�
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
	
	//��� �ҷ�����
	@RequestMapping(value = "/educationProjectFormLoad", method = RequestMethod.GET)
	public String educationProjectFormLoad(HttpSession session
										,Model model
										,@RequestParam(value="formOrder") int formOrder){
		System.out.println("�ε� �׽�Ʈ");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		EducationForm result = dao.formLoad(licenseKindergarten, formOrder);
		//System.out.println(isMerge+"<<isMerge   ,"+ isBorders+"<<isBorders");
		//System.out.println(result.getFormMerge()+"<<<<üũüũ ����");
		//System.out.println(result.getFormCountCol()+"<<üũüũ ī��Ʈ");
		if(result==null){
			return "EducationProject/EducationProject";
		}
		model.addAttribute("resultData",result);
		return "EducationProject/LoadForm";
	}
	
	//��ȹ�� �����ϱ�
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
	
	//��ȹ�� �ҷ�����
	@RequestMapping(value = "/EducationProjectLoad", method = RequestMethod.GET)
	public String EducationProjectLoad(HttpSession session
										,Model model
										,@RequestParam(value="categoryNo") String categoryNo
										,@RequestParam(value="age", required=false, defaultValue="") int age
										,@RequestParam(value="classNo", required=false, defaultValue="") String classNo
										,@RequestParam(value="date") String date){
		System.out.println("��ȹ�� �ҷ����°� �׽�Ʈ");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Education result =dao.educationProjectLoad(categoryNo, date, licenseKindergarten,age,classNo);
		model.addAttribute("resultData",result);
		return "EducationProject/EducationProjectLoad";
	}
	
	
	//�׽�Ʈ��
	/*@ResponseBody
	@RequestMapping(value = "/romiSaveTest", method = RequestMethod.POST)
	public String scheduleSave(HttpSession session ,
								@RequestParam(value="dataArray") String dataArray) {
		System.out.println("Ȯ�ο�");
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
		System.out.println("�ε� �׽�Ʈ");
		String re = dao.selectTest();
		System.out.println(re+"<<<re");
		model.addAttribute("dataTest",re);
		return "EducationProject/Hansol";
	}
	//�׽�Ʈ�볡
}
