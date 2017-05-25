package com.cafe24.dmsthch.Management;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagementDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//���� ����ǰ�� �÷����� ����, ���̳ʽ��� ���� ��  ��������
	public List<ManagementPlusMinus> selectManagementPlusMinusList() {
		System.out.println("selectManagementPlusMinusList ���� ����");
		
		System.out.println("123123123");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectMangementPlusMinsList");
	}
	//��ǰ���� ���Ӱ� �ϳ��ĸ� ������ ����Ʈ ī��Ʈ �޼���
	public int selectCountEquipmentList() {
		System.out.println("selectCountEquipmentList ���� ����");	
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Management.ManagementMapper.selectCountEquipmentList");
	}
	//��ǰ���� ���Ӱ� ����Ʈ�� ���� �ֽŰ��� �������� �޼���
	public List<ManagementEquipment> selectManagementList(int countNo) {
		System.out.println("selectManagementList ���� ����");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementList", countNo);
	}
	//��ǰ���� ���԰� ����Ʈ �� �Ϸ��������� ���� �ֽŰ� �������� �޼���
	public List<ManagementYesterDayEquipment> selectManagementYesterDayList(int countNo) {
		System.out.println("selectManagementYesterDayList ���� ����");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementYesterDayList", countNo);
	}
}

                           