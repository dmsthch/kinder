package com.cafe24.dmsthch.Commute;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommuteDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	String sql = "com.cafe24.dmsthch.Commute.CommuteMapper.";
	
	
	//오늘날짜 출근부 체크
	public Map commuteCheck(int teacherNo){
		System.out.println("commuteCheck() run");
		return sqlSessionTemplate.selectOne(sql+"attendanceCheck", teacherNo);
	}
	
	//출석체크 메서드
	public int commute(int teacherNo){
		System.out.println("commute() run");
		return sqlSessionTemplate.insert(sql+"commute", teacherNo);
	}
	

}
