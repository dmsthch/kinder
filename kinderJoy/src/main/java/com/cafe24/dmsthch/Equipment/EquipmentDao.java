package com.cafe24.dmsthch.Equipment;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EquipmentDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//스프레드 시트값 저장하기
	public int addEquement(String jsonStr, int teacherNo, String teacherLicense ) {	
		System.out.println("save method 내용 실행");
		
		Sheet sheet = new Sheet();
		
		sheet.setTeacherNo(teacherNo);
		sheet.setLicenseKindergarten(teacherLicense);
		sheet.setSheetContent(jsonStr);
		
		System.out.println("save method 내용 종료");
		System.out.println(sqlSessionTemplate);
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", sheet);
    }
	
	// 스프레드 시트값 로드하기
	public Sheet selectEquipment(int teacherNo) {

		Sheet sheet = (Sheet)sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipment", teacherNo);
		return sheet;
	}
}
