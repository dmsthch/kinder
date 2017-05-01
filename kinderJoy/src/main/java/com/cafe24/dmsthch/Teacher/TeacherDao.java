package com.cafe24.dmsthch.Teacher;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDao {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//ȸ������ �޼���
	public int insertTeacher(Teacher teacher) {
		System.out.println("insert ���� Ȯ�� TeacherDao_insertTeacher");
		return sql.insert("com.cafe24.dmsthch.Teacher.TeacherMapper.insert", teacher);
	}
	
	//�α��� �޼���
	public int LoginTeacher(Teacher teacher) {
		System.out.println("�α��� Ȯ��");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.login", teacher);
	}
	
	//���� �Ѹ� ��ȸ
	public Teacher OneSelectTeacher(int t_no) {
		System.out.println("���� �Ѹ� ��ȸ �޼���");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.OneSelectTeacher", t_no);
	}
	
	//���̵� �ߺ�üũ
	public int logincheck(String �ߺ�üũ) {
		//�Ű������� Ÿ���� ���� parameterType="java.lang.String"  
		//�Ű�����Ÿ���� String������ ����ڰ� ���̵� �Է� �� ����� ���� �� �� ����ϱ� ����
		
		//���ϵ�����Ÿ���� ����  resultType="int"
		//���ϵ�����Ÿ���� int�� ������ ���� ���� �� ����ڰ� �Է��� ���̵�� ������ ���� �ִٸ� ī��Ʈ�� 1 ������ 0�� �Ǳ� �����̴�
		System.out.println("�α��� üũ �޼��� ȣ�� _DAO");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.sign_up_id_check", �ߺ�üũ);
	}
	
}