package com.cafe24.dmsthch.EducationProject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.dmsthch.Child.ChildClass;

@Repository
public class EducationProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//폼 추가할때
	public String formAdd(String formVal,String formMerge,String formBorders, int formCountRow, int formCountCol, String licenseKindergarten, String formTitle){		
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormVal(formVal);
		eduForm.setFormMerge(formMerge);
		eduForm.setFormBorders(formBorders);
		eduForm.setFormCountRow(formCountRow);
		eduForm.setFormCountCol(formCountCol);
		eduForm.setFormTitle(formTitle);
		String re = null;
		if(sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formAdd", eduForm) == 1){
			re = "입력완료.";
		}else{
			re = "입력실패.";
		}
		
		return re;
	}
	
	//폼 수정
	public String formUpdate(String formVal,String formMerge,String formBorders, int formCountRow, int formCountCol, String licenseKindergarten, String formTitle, int formOrder){		
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormVal(formVal);
		eduForm.setFormMerge(formMerge);
		eduForm.setFormBorders(formBorders);
		eduForm.setFormCountRow(formCountRow);
		eduForm.setFormCountCol(formCountCol);
		eduForm.setFormTitle(formTitle);
		eduForm.setFormOrder(formOrder);
		String re = null;
		if(sqlSessionTemplate.update("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formUpdate", eduForm) ==1){
			re = "수정 완료.";
		}else{
			re = "수정 실패.";
		}
		return re;
	}
	
	//폼 불러올때
	public EducationForm formLoad(String licenseKindergarten, int formOrder){
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormOrder(formOrder);
		EducationForm resultForm = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formLoad", eduForm);
		//System.out.println(resultForm.getFormVal()+"<<<<체크로미!!!!!!!!!");
		//System.out.println(resultForm.getFormCountCol()+"<<<요놈");
		if(resultForm==null){
			return null;
		}
		if(resultForm.getFormBorders()==null){
			resultForm.setFormBorders("''");
		}
		if(resultForm.getFormMerge()==null){
			resultForm.setFormMerge("''");
		}
		return resultForm;
	}
	
	//폼 제목 셀렉트 하기
	public List<EducationForm> educationProjectFormName(String licenseKindergarten){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectFormName", licenseKindergarten);
	}
	
	//폼 삭제하기
	public int educationProjectFormDelete(EducationForm eduForm){
		System.out.println(eduForm.getFormNo()+"<<<formNo");
		return sqlSessionTemplate.delete("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formDelete",eduForm);
	}
	
	//계획안 추가하기
	public String educationProjectAdd(String val,String merge,String borders, int countRow, int countCol, String licenseKindergarten, int age,String classNo, String categoryNo, String projectDateInfo){
		Education edu = new Education();
		edu.setVal(val);
		edu.setMerge(merge);
		edu.setBorders(borders);
		edu.setCountRow(countRow);
		edu.setCountCol(countCol);
		edu.setLicenseKindergarten(licenseKindergarten);
		edu.setAge(age);
		edu.setClassNo(classNo);
		edu.setCategoryNo(categoryNo);
		edu.setProjectDateInfo(projectDateInfo);
		//이미 있는지 체크 한번하고
		String result = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectBeforeAdd", edu);
		System.out.println(result+"<<<계획안 추가시 있는지 확인한 후 result값 ");
		String reString =null;
		if(result==null){
			//없으면 추가
			System.out.println("계획안 추가시 이미 있는지 확인하고난 후 없을때 if");
			sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectAdd",edu);
			reString = "추가완료";
		}else{
			//있으면 업데이트
			System.out.println("계획안 추가시 이미 있는지 확인하고난 후 있을때 if");
			int re =Integer.parseInt(result);
			edu.setEducationProjectNo(re);
			sqlSessionTemplate.update("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectUpdate",edu);
			reString = "업데이트 되었습니다.";
		}
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		edu.setAddDate(sdf.format(date));*/
		return reString;
	}
	
	//계획안 불러오기
	public Education educationProjectLoad(String categoryNo,String projectDateInfo,String licenseKindergarten,int age, String classNo){
		Education edu = new Education();
		System.out.println(projectDateInfo +"<<addDate");
		System.out.println(categoryNo +"<<categoryNo");
		System.out.println(licenseKindergarten +"<<licenseKindergarten");
		edu.setProjectDateInfo(projectDateInfo);
		edu.setCategoryNo(categoryNo);
		edu.setLicenseKindergarten(licenseKindergarten);
		edu.setAge(age);
		edu.setClassNo(classNo);
		edu = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectLoad",edu);
		return edu;
	}
	
	//계획안메인화면 갈때 생성된 반 셀렉트하기
	public List<ChildClass> selectAllChildClass(String licenseKindergarten, String classYear){
		ChildClass childclass = new ChildClass();
		childclass.setLicenseKindergarten(licenseKindergarten);
		childclass.setClassYear(classYear);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectAllChildClass",childclass);
	}
	
	//계획안 반별로 리스트 불러오기
	public List<Education> EducationProjectList(String licenseKindergarten,String categoryNo,String classNo,int age){
		Education edu = new Education();
		edu.setLicenseKindergarten(licenseKindergarten);
		edu.setCategoryNo(categoryNo);
		edu.setClassNo(classNo);
		edu.setAge(age);
		System.out.println(edu.getClassNo()+"<<<classno");
		System.out.println(edu.getAge()+"<<<age");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.EducationProjectList", edu);
	}
	
	//반번호로 반이름 셀렉트하기
	public String selectClassName(String classNo){
		System.out.println("체크포인트 2");
		System.out.println(classNo +"<<classno체크");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectClassName", classNo);
	}
	
	//반 이름 셀렉트하는 리스트
	public List<HashMap<String, Object>> selectClassNameList(List<Education> eduList){
		HashMap<String, Object> map = null;
		Education edu = null;
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		for(int i =0; i < eduList.size(); i++){
			map = new HashMap<String, Object>();
			edu = eduList.get(i);
			map.put("educationProjectNo", edu.getEducationProjectNo());
			map.put("addDate", edu.getAge());
			map.put("categoryNo", edu.getCategoryNo());
			map.put("age", edu.getAge());
			map.put("classNo", edu.getClassNo());
			map.put("projectDateInfo", edu.getProjectDateInfo());
			map.put("className", selectClassName(edu.getClassNo()));
			list.add(map);
		}
		return list;
	}
	
	//카테고리 번호로 카테고리 이름 셀렉트하기(연간/월간/주간/일간)
	public String selectCategoryName(String categoryNo){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectCategoryName",categoryNo);
	}
	
	//테스트용
	public String selectTest(){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectTest");
	}
}
