package com.cafe24.dmsthch.Commute;

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
	
	//출근등록 메서드
	public int commuteIn(int teacherNo){
		System.out.println("commuteIn() run");
		return sqlSessionTemplate.insert(sql+"commuteIn", teacherNo);
	}
	
	//퇴근등록 메서드
	public int commuteOut(int teacherNo){
		System.out.println("commuteOut() run");
		return sqlSessionTemplate.update(sql+"commuteOut", teacherNo);
	}
	
	//오늘날짜 외출정보 가져오기
	public Map absenceCheck(int attendanceNo){
		System.out.println("absenceCheck() run");
		return sqlSessionTemplate.selectOne(sql+"absenceCheck", attendanceNo);
	}
	
	//외출 등록
	public int absence(int attendanceNo){
		System.out.println("absence() run");
		return sqlSessionTemplate.insert(sql+"absence", attendanceNo);
	}
	
	
	//외출 복귀
	public int absenceReturn(int attendanceNo){
		System.out.println("absenceReturn() run");
		return sqlSessionTemplate.update(sql+"absenceReturn", attendanceNo);
	}
	
	
	
	
	
	
	//퇴근 체크 메서드  (안씀!!)
	public String commuteOutCheck(int teacherNo){
		System.out.println("commuteOutCheck() run");
		return sqlSessionTemplate.selectOne(sql+"commuteOutCheck", teacherNo);
	}
	

}
