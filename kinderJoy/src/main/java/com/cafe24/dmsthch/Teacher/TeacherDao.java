package com.cafe24.dmsthch.Teacher;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDao {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	//회원가입 메서드
	public int insertTeacher(Teacher teacher) {
		System.out.println("insert 동작 확인 TeacherDao_insertTeacher");
		return sql.insert("com.cafe24.dmsthch.Teacher.TeacherMapper.insert", teacher);
	}
	
	//로그인 메서드
	public int LoginTeacher(Teacher teacher) {
		System.out.println("로그인 확인");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.login", teacher);
	}
	
	//선생 한명 조회
	public Teacher OneSelectTeacher(int t_no) {
		System.out.println("교원 한명 조회 메서드");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.OneSelectTeacher", t_no);
	}
	
	//아이디 중복체크
	public int logincheck(String 중복체크) {
		//매개변수의 타입을 말함 parameterType="java.lang.String"  
		//매개변수타입이 String이유는 사용자가 아이디 입력 시 영어와 숫자 둘 다 사용하기 때문
		
		//리턴데이터타입을 말함  resultType="int"
		//리턴데이터타입이 int인 이유는 쿼리 실행 시 사용자가 입력한 아이디와 동일한 값이 있다면 카운트가 1 없으면 0이 되기 때문이다
		System.out.println("로그인 체크 메서드 호출 _DAO");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.sign_up_id_check", 중복체크);
	}
	
}