package com.cafe24.dmsthch.Calendar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Schedule> selectAllSchedule(String licenseKindergarten){
		System.out.println(licenseKindergarten);
		System.out.println(sqlSessionTemplate + "sql zzzzz");
		return 	sqlSessionTemplate.selectList("com.cafe24.dmsthch.Calendar.CalendarMapper.selectAllSchedule",licenseKindergarten);		
	}
	
	

}
