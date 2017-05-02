package com.cafe24.dmsthch.Equipment;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EquipmentDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int addEquement(String jsonStr, int teacherNo, String teacherLicense ) {	
		System.out.println("save method ���� ����");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("jsonStr", jsonStr);
		map.put("teacherNo", teacherNo);
		map.put("teacherLicense", teacherLicense);
		
		System.out.println("save method ���� ����");
		System.out.println(sqlSessionTemplate);
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", map);
    }
}
