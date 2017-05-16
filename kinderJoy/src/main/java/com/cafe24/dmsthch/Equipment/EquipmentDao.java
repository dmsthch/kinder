package com.cafe24.dmsthch.Equipment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EquipmentDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 비품 품의서 리스트 네임 출력하기
	public List<Sheet> selectEquipmentName(HttpSession session) {
		System.out.println("selectEquipmentName 메서드 내용 실행");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectSheetName", licenseKindergarten);
	}
	// 비품 리스트 카운트 구하기
	public int selectEquipmentCount(HttpSession session) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println("selectEquipmentCount 메서드 내용 실행");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectCountEquipmentList", licenseKindergarten);
	}
	// 비품 리스트 출력하기
	public List<Equipment> selectEquipment(int equipmnetCount) {
		System.out.println("selectEquipment 메서드 내용 실행");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentList", equipmnetCount);
	}
	// 비품 한줄 저장하기
	public int addEquipment(Equipment equipment) {
		System.out.println("addEquipment 메서드 내용 실행");
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", equipment);
	}
	//스프레드 시트값 저장하기
	public int addEquementSheet(String dataArray
								, String mergeArray
								, String borderArray
								, String countRow
								, String countCol
								, String equipmentCategoryNo
								, String sheetName
								, HttpSession session) {
		
		System.out.println("save method 내용 실행");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		Sheet sheet = new Sheet();
		sheet.setLicenseKindergarten(licenseKindergarten);
		sheet.setTeacherNo(teacherNo);
		sheet.setEquipmentCategoryNo(equipmentCategoryNo);
		sheet.setValueName(sheetName);
		sheet.setValueMerge(mergeArray);
		sheet.setValueVal(dataArray);
		sheet.setValueBorders(borderArray);
		sheet.setValueRow(countRow);
		sheet.setValueCols(countCol);
		
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipmentSheet", sheet);
    }
	
	// 스프레드 시트값 로드하기
	public Sheet selectEquipmentSheet(HttpSession session
								,String reroad
								,String sheetCategoryNo) {
		
		System.out.println("selectEquipment 메서드 내용 실행");
		
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Sheet sheet = new Sheet();
		
		sheet.setLicenseKindergarten(licenseKindergarten);
		sheet.setValueName(reroad);
		sheet.setEquipmentCategoryNo(sheetCategoryNo);
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectLoadEquipmentSheet", sheet);
	}
	
	// 비품 리스트 카테고리 로드하기
	public List<Map<String, Object>> selectSheetCategory() {
				
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentCategory");
	}

}
