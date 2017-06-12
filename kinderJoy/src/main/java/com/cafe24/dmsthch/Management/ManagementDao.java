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
/*	//전체 예산 날짜 정보를 받은 셀렉트
	public List<ManagementList> selectManagementDaySelectList(String testDay
															,String testDay2) {
		System.out.println("selectManagementDayList 내용 실행");
		System.out.println(testDay);
		System.out.println(testDay2);
		Map<String,String> map = new HashMap<String,String>();
		map.put("testDay", testDay);
		map.put("testDay2", testDay2);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementDayList", testDay);
	}*/
	//카테고리 정보를 받은 오늘 날짜 셀렉트
	public List<ManagementList> selectManagementCategoryDayList(String testDay
																,String testDay2
																,String test) {
		System.out.println("selectManagementCategoryDayList 내용 실행");
		System.out.println(testDay);
		System.out.println(testDay2);
		System.out.println(test);
		Map<String,String> map = new HashMap<String,String>();
		map.put("testDay", testDay);
		map.put("testDay2", testDay2);
		map.put("categoryNo", test);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementCategoryDayList", map);
	}
	//기본 예산 이동시 오늘날짜 셀렉트
	public List<ManagementList> selectManagementDayList(String testDay
														,String testDay2) {
		System.out.println("selectManagementDayList 내용 실행");
		System.out.println(testDay);
		System.out.println(testDay2);
		Map<String,String> map = new HashMap<String,String>();
		map.put("testDay", testDay);
		map.put("testDay2", testDay2);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementDayList", map);
	}
	
	//같은 네임품명 플러스값 총합, 마이너스값 총합 값  가져오기
	public List<ManagementPlusMinus> selectManagementPlusMinusList() {
		System.out.println("selectManagementPlusMinusList 내용 실행");
		
		System.out.println("123123123");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectMangementPlusMinsList");
	}
}

                           