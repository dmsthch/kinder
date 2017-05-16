package com.cafe24.dmsthch.EducationProject;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.dmsthch.Child.ChildClass;

@Repository
public class EducationProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//폼 추가할때
	public void formAdd(String formVal,String formMerge,String formBorders, int formCountRow, int formCountCol, String licenseKindergarten){		
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormVal(formVal);
		eduForm.setFormMerge(formMerge);
		eduForm.setFormBorders(formBorders);
		eduForm.setFormCountRow(formCountRow);
		eduForm.setFormCountCol(formCountCol);
		sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formAdd", eduForm);
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
	
	//계획안 추가하기
	public void educationProjectAdd(String val,String merge,String borders, int countRow, int countCol, String licenseKindergarten){
		Education edu = new Education();
		edu.setVal(val);
		edu.setMerge(merge);
		edu.setBorders(borders);
		edu.setCountRow(countRow);
		edu.setCountCol(countCol);
		edu.setLicenseKindergarten(licenseKindergarten);
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		edu.setAddDate(sdf.format(date));*/
		sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectAdd",edu);
	}
	
	//계획안 불러오기
	public Education educationProjectLoad(String categoryNo,String addDate,String licenseKindergarten,int age, String classNo){
		Education edu = new Education();
		System.out.println(addDate +"<<addDate");
		System.out.println(categoryNo +"<<categoryNo");
		System.out.println(licenseKindergarten +"<<licenseKindergarten");
		edu.setAddDate(addDate);
		edu.setCategoryNo(categoryNo);
		edu.setLicenseKindergarten(licenseKindergarten);
		edu.setAge(age);
		edu.setClassNo(classNo);
		edu = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectLoad",edu);
		//System.out.println(edu.getVal()+"<<getVal 쳇쳇");
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
	public List<Education> EducationProjectList(String licenseKindergarten,String categoryNo,String classNo){
		
		return null;
	}
	
	//테스트용
	public String selectTest(){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectTest");
	}
}
