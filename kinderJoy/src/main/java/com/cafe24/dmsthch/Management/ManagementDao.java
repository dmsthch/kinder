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
	//기본 예산 이동시 오늘날짜 셀렉트
	public List<ManagementList> selectManagementDayList(String testDay) {
		System.out.println("selectManagementDayList 내용 실행");
		System.out.println(testDay);
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.ManagementList", testDay);
	}
	
	//같은 네임품명 플러스값 총합, 마이너스값 총합 값  가져오기
	public List<ManagementPlusMinus> selectManagementPlusMinusList() {
		System.out.println("selectManagementPlusMinusList 내용 실행");
		
		System.out.println("123123123");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectMangementPlusMinsList");
	}
	//비품예산 네임값 하나식만 가져온 리스트 카운트 메서드
	public int selectCountEquipmentList() {
		System.out.println("selectCountEquipmentList 내용 실행");	
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Management.ManagementMapper.selectCountEquipmentList");
	}
	//비품예산 네임값 리스트중 가장 최신값만 가져오기 메서드
	public List<ManagementEquipment> selectManagementList(int countNo) {
		System.out.println("selectManagementList 내용 실행");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementList", countNo);
	}
	//비품예싼 네입값 리스트 중 하루전꺼에서 가장 최신값 가져오기 메서드
	public List<ManagementYesterDayEquipment> selectManagementYesterDayList(int countNo) {
		System.out.println("selectManagementYesterDayList 내용 실행");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Management.ManagementMapper.selectManagementYesterDayList", countNo);
	}
}

                           