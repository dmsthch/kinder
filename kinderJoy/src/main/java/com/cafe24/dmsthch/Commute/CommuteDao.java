package com.cafe24.dmsthch.Commute;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.dmsthch.Child.ChildAttendance;
import com.cafe24.dmsthch.Teacher.Teacher;

@Repository
public class CommuteDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	String sql = "com.cafe24.dmsthch.Commute.CommuteMapper.";
	
	//해당 날짜의 유아 출석정보 가져오기
	public List<ChildAttendance> getKidCommuteToDate(String classNo, String selectDate){
		Map<String, String> map = new HashMap<String, String>();
		map.put("classNo", classNo);
		map.put("selectDate", selectDate);
		return sqlSessionTemplate.selectList(sql+"getKidCommuteToDate", map);
	}
	
	//오늘날짜 출근부 체크
	public Map commuteCheck(int teacherNo){
		System.out.println("commuteCheck() run");
		return sqlSessionTemplate.selectOne(sql+"attendanceCheck", teacherNo);
	}
	
	//출근등록 메서드
	public int commuteIn(Teacher teacher){
		System.out.println("commuteIn() run");
		return sqlSessionTemplate.insert(sql+"commuteIn", teacher);
	}
	
	//퇴근등록 메서드
	public int commuteOut(int teacherNo){
		System.out.println("commuteOut() run");
		return sqlSessionTemplate.update(sql+"commuteOut", teacherNo);
	}
	
	//오늘날짜 외출정보 가져오기
	public List<Map<String, Object>> absenceCheck(int attendanceNo){
		System.out.println("absenceCheck() run");
		return sqlSessionTemplate.selectList(sql+"absenceCheck", attendanceNo);
	}
	
	//외출 등록
	public int absence(Map map){
		System.out.println("absence() run");
		return sqlSessionTemplate.insert(sql+"absence", map);
	}
	
	
	//외출 복귀
	public int absenceReturn(String absenceNo){
		System.out.println("absenceReturn() run");
		return sqlSessionTemplate.update(sql+"absenceReturn", absenceNo);
	}
	
	//월별로 출석정보 가져오기
	public List<Map<String, Object>> getCommuteForMonth(String license, int teacherNo, String startDay){
		System.out.println("getCommuteForMonth() run");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("teacherNo", teacherNo);
		map.put("startDay", startDay);
		return sqlSessionTemplate.selectList(sql+"commuteCheckForMonth", map);
	}
	
	
}
