package com.cafe24.dmsthch.Teacher;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDao {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public int insertTeacher(Teacher teacher) {
		System.out.println("insert ���� Ȯ�� TeacherDao_insertTeacher");
		return sql.insert("com.cafe24.dmsthch.Teacher.TeacherMapper.insert", teacher);
	}
	
	public int LoginTeacher(Teacher teacher) {
		System.out.println("�α��� Ȯ��");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.login", teacher);
	}
	
	public int OneSelectTeacher(int t_no) {
		System.out.println("���� �Ѹ� ��ȸ �޼���");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.OneSelectTeacher", t_no);
	}
	
}