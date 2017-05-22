package com.cafe24.dmsthch.Management;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagementDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//비품예산 네임값 하나식만 가져온 리스트 카운트 메서드
	public int selectCountEquipmentList() {
		System.out.println("selectCountEquipmentList 내용 실행");	
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.ManagementMapper.selectCountEquipmentList");
	}
	//비품예산 네임값 리스트중 가장 최신값만 가져오기 메서드
	public List<ManagementEquipment> selectManagementList(int countNo) {
		System.out.println("selectManagementList 내용 실행");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.ManagementMapper.selectManagementList", countNo);
	}
	//비품예싼 네입값 리스트 중 하루전꺼에서 가장 최신값 가져오기 메서드
	public List<ManagementYesterDayEquipment> selectManagementYesterDayList(int countNo) {
		System.out.println("selectManagementYesterDayList 내용 실행");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.ManagementMapper.selectManagementYesterDayList", countNo);
	}
}
