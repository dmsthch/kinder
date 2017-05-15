package com.cafe24.dmsthch.Equipment;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EquipmentDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 비품 리스트 카운트 구하기
	public int selectEquipmentCount(Equipment equipmnet) {
		System.out.println("selectEquipmentCount 메서드 내용 실행");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentCount", equipmnet);
	}
	// 비품 리스트 출력하기
	public List<Equipment> selectEquipment(int equipmnetCount) {
		System.out.println("selectEquipment 메서드 내용 실행");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipment", equipmnetCount);
	}
	// 비품 한줄 저장하기
	public int addEquipment(Equipment equipment) {
		System.out.println("addEquipment 메서드 내용 실행");
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", equipment);
	}
	//스프레드 시트값 저장하기
	public int addEquementSheet(String jsonStr, int teacherNo, String teacherLicense ) {	
		System.out.println("save method 내용 실행");
		
		Sheet sheet = new Sheet();
		
		sheet.setTeacherNo(teacherNo);
		sheet.setLicenseKindergarten(teacherLicense);
		sheet.setSheetContent(jsonStr);
		
		System.out.println(sheet);
		System.out.println("save method 내용 종료");
		System.out.println(sqlSessionTemplate);
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipmentSheet", sheet);
    }
	
/*	// 스프레드 시트값 로드하기
	public Sheet selectEquipment(int teacherNo) {

		Sheet sheet = (Sheet)sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipment", teacherNo);
		return sheet;
	}*/
	
	// 비품 리스트 카테고리 로드하기
	public List<Map<String, Object>> selectSheetCategory() {
				
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentCategory");
	}

}
