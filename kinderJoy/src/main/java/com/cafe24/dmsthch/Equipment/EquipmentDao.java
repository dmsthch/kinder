package com.cafe24.dmsthch.Equipment;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EquipmentDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//�������� ��Ʈ�� �����ϱ�
	public int addEquement(String jsonStr, int teacherNo, String teacherLicense ) {	
		System.out.println("save method ���� ����");
		
		Sheet sheet = new Sheet();
		
		sheet.setTeacherNo(teacherNo);
		sheet.setLicenseKindergarten(teacherLicense);
		sheet.setSheetContent(jsonStr);
		
		System.out.println("save method ���� ����");
		System.out.println(sqlSessionTemplate);
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", sheet);
    }
	
	// �������� ��Ʈ�� �ε��ϱ�
	public Sheet selectEquipment(int teacherNo) {

		Sheet sheet = (Sheet)sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipment", teacherNo);
		return sheet;
	}
}
