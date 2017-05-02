package com.cafe24.dmsthch.Commute;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.dmsthch.Teacher.Teacher;

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
	
	//��ٵ�� �޼���
	public int commuteIn(Teacher teacher){
		System.out.println("commuteIn() run");
		return sqlSessionTemplate.insert(sql+"commuteIn", teacher);
	}
	
	//��ٵ�� �޼���
	public int commuteOut(int teacherNo){
		System.out.println("commuteOut() run");
		return sqlSessionTemplate.update(sql+"commuteOut", teacherNo);
	}
	
	//���ó�¥ �������� ��������
	public List<Map<String, Object>> absenceCheck(int attendanceNo){
		System.out.println("absenceCheck() run");
		return sqlSessionTemplate.selectList(sql+"absenceCheck", attendanceNo);
	}
	
	//���� ���
	public int absence(Map map){
		System.out.println("absence() run");
		return sqlSessionTemplate.insert(sql+"absence", map);
	}
	
	
	//���� ����
	public int absenceReturn(String absenceNo){
		System.out.println("absenceReturn() run");
		return sqlSessionTemplate.update(sql+"absenceReturn", absenceNo);
	}
	
	
}