package com.cafe24.dmsthch.Calendar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//�� ��ġ���� ��� ������ ����Ʈ
	public List<Schedule> selectAllSchedule(String licenseKindergarten){
		System.out.println(licenseKindergarten);
		System.out.println(sqlSessionTemplate + "sql zzzzz");
		return 	sqlSessionTemplate.selectList("com.cafe24.dmsthch.Calendar.CalendarMapper.selectAllSchedule",licenseKindergarten);		
	}
	
	//�ϳ��� ������ ����Ʈ(������ѹ���)
	public Schedule selectOneSchedule(int scheduleNo){
		System.out.println("selectOneSchedule�޼����۵� Ȯ��");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Calendar.CalendarMapper.selectOneSchedule", scheduleNo);
	}
	
	//�ϳ��� ������ ����
	public void deleteSchedule(int scheduleNo){
		System.out.println("deleteSchedule �޼����۵� Ȯ�� CalendarDao ");
		sqlSessionTemplate.delete("com.cafe24.dmsthch.Calendar.CalendarMapper.deleteSchedule",scheduleNo);
	}

}
