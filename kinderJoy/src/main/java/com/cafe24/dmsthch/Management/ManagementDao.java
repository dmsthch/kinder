package com.cafe24.dmsthch.Management;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagementDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//��ǰ���� ���Ӱ� �ϳ��ĸ� ������ ����Ʈ ī��Ʈ �޼���
	public int selectCountEquipmentList() {
		System.out.println("selectCountEquipmentList ���� ����");	
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.ManagementMapper.selectCountEquipmentList");
	}
	//��ǰ���� ���Ӱ� ����Ʈ�� ���� �ֽŰ��� �������� �޼���
	public List<ManagementEquipment> selectManagementList(int countNo) {
		System.out.println("selectManagementList ���� ����");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.ManagementMapper.selectManagementList", countNo);
	}
	//��ǰ���� ���԰� ����Ʈ �� �Ϸ��������� ���� �ֽŰ� �������� �޼���
	public List<ManagementYesterDayEquipment> selectManagementYesterDayList(int countNo) {
		System.out.println("selectManagementYesterDayList ���� ����");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.ManagementMapper.selectManagementYesterDayList", countNo);
	}
}
