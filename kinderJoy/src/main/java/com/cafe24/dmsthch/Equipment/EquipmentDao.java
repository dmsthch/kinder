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
	// ��ǰ ���� �����ϱ�
	public int addEquipment(Equipment equipment) {
		System.out.println("addEquipment �޼��� ���� ����");
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", equipment);
	}
	//�������� ��Ʈ�� �����ϱ�
	public int addEquementSheet(String jsonStr, int teacherNo, String teacherLicense ) {	
		System.out.println("save method ���� ����");
		
		Sheet sheet = new Sheet();
		
		sheet.setTeacherNo(teacherNo);
		sheet.setLicenseKindergarten(teacherLicense);
		sheet.setSheetContent(jsonStr);
		
		System.out.println(sheet);
		System.out.println("save method ���� ����");
		System.out.println(sqlSessionTemplate);
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipmentSheet", sheet);
    }
	
/*	// �������� ��Ʈ�� �ε��ϱ�
	public Sheet selectEquipment(int teacherNo) {

		Sheet sheet = (Sheet)sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipment", teacherNo);
		return sheet;
	}*/
	
	// ��ǰ ī�װ� �ε��ϱ�
	public List<Map<String, Object>> selectCategory() {
				
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentCategory");
	}
}
