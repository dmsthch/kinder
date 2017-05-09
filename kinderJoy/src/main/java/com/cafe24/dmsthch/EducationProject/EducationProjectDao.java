package com.cafe24.dmsthch.EducationProject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EducationProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public void test(String val, String licenseKindergarten){		
		Education edu = new Education();
		edu.setLicenseKindergarten(licenseKindergarten);;
		edu.setVal(val);
		
		sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.test", edu);
	}
}
