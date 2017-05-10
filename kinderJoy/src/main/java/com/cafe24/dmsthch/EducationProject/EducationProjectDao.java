package com.cafe24.dmsthch.EducationProject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EducationProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public void formAdd(String formVal, String licenseKindergarten){		
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormVal(formVal);
		sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formAdd", eduForm);
	}
	
	public String selectTest(){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectTest");
	}
}
