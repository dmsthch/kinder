package com.cafe24.dmsthch.Calendar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//한 유치원의 모든 스케쥴 셀렉트
	public List<Schedule> selectAllSchedule(String licenseKindergarten){
		System.out.println(licenseKindergarten);
		System.out.println(sqlSessionTemplate + "sql zzzzz");
		return 	sqlSessionTemplate.selectList("com.cafe24.dmsthch.Calendar.CalendarMapper.selectAllSchedule",licenseKindergarten);		
	}
	
	//하나의 스케쥴 셀렉트(스케쥴넘버로)
	public Schedule selectOneSchedule(int scheduleNo){
		System.out.println("selectOneSchedule메서드작동 확인");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Calendar.CalendarMapper.selectOneSchedule", scheduleNo);
	}
	
	//하나의 스케쥴 삭제
	public void deleteSchedule(int scheduleNo){
		System.out.println("deleteSchedule 메서드작동 확인 CalendarDao ");
		sqlSessionTemplate.delete("com.cafe24.dmsthch.Calendar.CalendarMapper.deleteSchedule",scheduleNo);
	}

}
