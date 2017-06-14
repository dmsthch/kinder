package com.cafe24.dmsthch.Management;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagementDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
/*	//��ü ���� ��¥ ������ ���� ����Ʈ
	public List<ManagementList> selectManagementDaySelectList(String testDay
															,String testDay2) {
		System.out.println("selectManagementDayList ���� ����");
		System.out.println(testDay);
		System.out.println(testDay2);
		Map<String,String> map = new HashMap<String,String>();
		map.put("testDay", testDay);
		map.put("testDay2", testDay2);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementDayList", testDay);
	}*/
	//ī�װ� ������ ���� ���� ��¥ ����Ʈ
	public List<ManagementList> selectManagementCategoryDayList(String testDay
																,String testDay2
																,String test) {
		System.out.println("selectManagementCategoryDayList ���� ����");
		System.out.println(testDay);
		System.out.println(testDay2);
		System.out.println(test);
		Map<String,String> map = new HashMap<String,String>();
		map.put("testDay", testDay);
		map.put("testDay2", testDay2);
		map.put("categoryNo", test);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementCategoryDayList", map);
	}
	//�⺻ ���� �̵��� ���ó�¥ ����Ʈ
	public List<ManagementList> selectManagementDayList(String testDay
														,String testDay2) {
		System.out.println("selectManagementDayList ���� ����");
		System.out.println(testDay);
		System.out.println(testDay2);
		Map<String,String> map = new HashMap<String,String>();
		map.put("testDay", testDay);
		map.put("testDay2", testDay2);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementDayList", map);
	}
	
	//���� ����ǰ�� �÷����� ����, ���̳ʽ��� ���� ��  ��������
	public List<ManagementPlusMinus> selectManagementPlusMinusList() {
		System.out.println("selectManagementPlusMinusList ���� ����");
		
		System.out.println("123123123");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectMangementPlusMinsList");
	}
}

                           