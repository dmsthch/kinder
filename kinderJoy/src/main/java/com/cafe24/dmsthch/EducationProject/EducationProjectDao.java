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
	
	//�� �߰��Ҷ�
	public void formAdd(String formVal,String formMerge,String formBorders, int formCountRow, int formCountCol, String licenseKindergarten, String formTitle){		
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormVal(formVal);
		eduForm.setFormMerge(formMerge);
		eduForm.setFormBorders(formBorders);
		eduForm.setFormCountRow(formCountRow);
		eduForm.setFormCountCol(formCountCol);
		eduForm.setFormTitle(formTitle);
		sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formAdd", eduForm);
	}
	
	//�� �ҷ��ö�
	public EducationForm formLoad(String licenseKindergarten, int formOrder){
		EducationForm eduForm = new EducationForm();
		eduForm.setLicenseKindergarten(licenseKindergarten);
		eduForm.setFormOrder(formOrder);
		EducationForm resultForm = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formLoad", eduForm);
		//System.out.println(resultForm.getFormVal()+"<<<<üũ�ι�!!!!!!!!!");
		//System.out.println(resultForm.getFormCountCol()+"<<<���");
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
	
	//�� ���� ����Ʈ �ϱ�
	public List<EducationForm> educationProjectFormName(String licenseKindergarten){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectFormName", licenseKindergarten);
	}
	
	//��ȹ�� �߰��ϱ�
	public void educationProjectAdd(String val,String merge,String borders, int countRow, int countCol, String licenseKindergarten, int age,String classNo, String categoryNo, String projectDateInfo){
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
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		edu.setAddDate(sdf.format(date));*/
		sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectAdd",edu);
	}
	
	//��ȹ�� �ҷ�����
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
		//System.out.println(edu.getVal()+"<<getVal ����");
		return edu;
	}
	
	//��ȹ�ȸ���ȭ�� ���� ������ �� ����Ʈ�ϱ�
	public List<ChildClass> selectAllChildClass(String licenseKindergarten, String classYear){
		ChildClass childclass = new ChildClass();
		childclass.setLicenseKindergarten(licenseKindergarten);
		childclass.setClassYear(classYear);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectAllChildClass",childclass);
	}
	
	//��ȹ�� �ݺ��� ����Ʈ �ҷ�����
	public List<Education> EducationProjectList(String licenseKindergarten,String categoryNo,String classNo,int age){
		Education edu = new Education();
		edu.setLicenseKindergarten(licenseKindergarten);
		edu.setCategoryNo(categoryNo);
		edu.setClassNo(classNo);
		edu.setAge(age);
		System.out.println("üũ����Ʈ 1");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.EducationProjectList", edu);
	}
	
	//�ݹ�ȣ�� ���̸� ����Ʈ�ϱ�
	public String selectClassName(String classNo){
		System.out.println("üũ����Ʈ 2");
		System.out.println(classNo +"<<classnoüũ");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectClassName", classNo);
	}
	
	//ī�װ� ��ȣ�� ī�װ� �̸� ����Ʈ�ϱ�(����/����/�ְ�/�ϰ�)
	public String selectCategoryName(String categoryNo){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectCategoryName",categoryNo);
	}
	
	//�׽�Ʈ��
	public String selectTest(){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectTest");
	}
}
