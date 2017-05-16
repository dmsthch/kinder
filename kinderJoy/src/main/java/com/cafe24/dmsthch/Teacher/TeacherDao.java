package com.cafe24.dmsthch.Teacher;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public Teacher LoginTeacher(Teacher teacher) {
		System.out.println("�α��� Ȯ��");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.login", teacher);
	}
	
	//���� �Ѹ� ��ȸ
	public Teacher OneSelectTeacher(int INT) {
		System.out.println("���� �Ѹ� ���� ��ȸ �޼��� ����_TeacherDao.java");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.OneSelectTeacher", INT);
	}
	
	//���̵� �ߺ�üũ
	public int logincheck(String joongbok) {
		//�Ű������� Ÿ���� ���� parameterType="java.lang.String"  
		//�Ű�����Ÿ���� String������ ����ڰ� ���̵� �Է� �� ����� ���� �� �� ����ϱ� ����
		
		//���ϵ�����Ÿ���� ����  resultType="int"
		//���ϵ�����Ÿ���� int�� ������ ���� ���� �� ����ڰ� �Է��� ���̵�� ������ ���� �ִٸ� ī��Ʈ�� 1 ������ 0�� �Ǳ� �����̴�
		System.out.println("�α��� üũ �޼��� ȣ�� _DAO");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.sign_up_id_check", joongbok);
	}
	
	//��ü ������ ��ü ���� ��ȸ admin����
	public List<Object> tableList(String string) {
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.tableList",string);
	}
	
	//�� ����
	// �Է°��� ���̼��� �ϳ��ϱ� String�̴�. ��Ʈ�ѷ����� ���� ���� ������ ���Եȴ�.
	//���ϰ��� ������ �̰� Ÿ�Ե� �������̹Ƿ� Object�̴�
	public List<Object> takeT(String string) {
		System.out.println(string +"<-------------takeT");
		System.out.println("������ ���� �޼��� ȣ�� Ȯ��");
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.takeTeacher",string);
	}
	
	//���� Ŭ����
	//��Ʈ�ѷ����� ���� ���� ������ ���Եȴ�
	public List<Object> takeC(String string) {
		System.out.println("������ Ŭ���� �޼��� ȣ�� Ȯ��");
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.takeClass", string);
	}
}