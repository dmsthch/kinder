package com.cafe24.dmsthch.EducationProject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EducationProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//�� �߰��Ҷ�
	public void formAdd(String formVal,String formMerge, String licenseKindergarten){		
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormVal(formVal);
		eduForm.setFormMerge(formMerge);
		sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formAdd", eduForm);
	}
	
	//�� �ҷ��ö�
	public EducationForm formLoad(String licenseKindergarten, int formOrder){
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormOrder(formOrder);
		EducationForm resultForm = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formLoad", eduForm);
		System.out.println(resultForm+"<<<<üũ");
		return resultForm;
	}
	
	
	//�׽�Ʈ��
	public String selectTest(){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectTest");
	}
}
