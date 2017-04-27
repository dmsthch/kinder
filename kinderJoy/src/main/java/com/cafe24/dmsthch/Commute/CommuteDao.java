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
	
	
	//���ó�¥ ��ٺ� üũ
	public Map commuteCheck(int teacherNo){
		System.out.println("commuteCheck() run");
		return sqlSessionTemplate.selectOne(sql+"attendanceCheck", teacherNo);
	}
	
	//�⼮üũ �޼���
	public int commute(int teacherNo){
		System.out.println("commute() run");
		return sqlSessionTemplate.insert(sql+"commute", teacherNo);
	}
	

}
