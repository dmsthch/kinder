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
	
	//�� �߰��Ҷ�
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
			re = "�Է¿Ϸ�.";
		}else{
			re = "�Է½���.";
		}
		
		return re;
	}
	
	//�� ����
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
			re = "���� �Ϸ�.";
		}else{
			re = "���� ����.";
		}
		return re;
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
	
	//�� �����ϱ�
	public int educationProjectFormDelete(EducationForm eduForm){
		System.out.println(eduForm.getFormNo()+"<<<formNo");
		return sqlSessionTemplate.delete("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.formDelete",eduForm);
	}
	
	//��ȹ�� �߰��ϱ�
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
		//�̹� �ִ��� üũ �ѹ��ϰ�
		String result = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectBeforeAdd", edu);
		System.out.println(result+"<<<��ȹ�� �߰��� �ִ��� Ȯ���� �� result�� ");
		String reString =null;
		if(result==null){
			//������ �߰�
			System.out.println("��ȹ�� �߰��� �̹� �ִ��� Ȯ���ϰ� �� ������ if");
			sqlSessionTemplate.insert("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectAdd",edu);
			reString = "�߰��Ϸ�";
		}else{
			//������ ������Ʈ
			System.out.println("��ȹ�� �߰��� �̹� �ִ��� Ȯ���ϰ� �� ������ if");
			int re =Integer.parseInt(result);
			edu.setEducationProjectNo(re);
			sqlSessionTemplate.update("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.educationProjectUpdate",edu);
			reString = "������Ʈ �Ǿ����ϴ�.";
		}
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		edu.setAddDate(sdf.format(date));*/
		return reString;
	}
	
	//��ȹ�� �ҷ�����
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
		System.out.println(edu.getClassNo()+"<<<classno");
		System.out.println(edu.getAge()+"<<<age");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.EducationProjectList", edu);
	}
	
	//�ݹ�ȣ�� ���̸� ����Ʈ�ϱ�
	public String selectClassName(String classNo){
		System.out.println("üũ����Ʈ 2");
		System.out.println(classNo +"<<classnoüũ");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectClassName", classNo);
	}
	
	//�� �̸� ����Ʈ�ϴ� ����Ʈ
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
	
	//ī�װ� ��ȣ�� ī�װ� �̸� ����Ʈ�ϱ�(����/����/�ְ�/�ϰ�)
	public String selectCategoryName(String categoryNo){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectCategoryName",categoryNo);
	}
	
	//�׽�Ʈ��
	public String selectTest(){
		
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.EducationProject.EducationProjectMapper.selectTest");
	}
}
