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
	
	//회원가입 메서드
	public int insertTeacher(Teacher teacher) {
		System.out.println("insert 동작 확인 TeacherDao_insertTeacher");
		return sql.insert("com.cafe24.dmsthch.Teacher.TeacherMapper.insert", teacher);
	}
	
	//로그인 메서드
	public Teacher LoginTeacher(Teacher teacher) {
		System.out.println("로그인 확인");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.login", teacher);
	}
	
	//교원 한명 조회
	public Teacher OneSelectTeacher(int t_no) {
		System.out.println("교원 한명 정보 조회 메서드 실행_TeacherDao.java");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.OneSelectTeacher", t_no);
	}
	
	//아이디 중복체크
	public int logincheck(String joongbok) {
		//매개변수의 타입을 말함 parameterType="java.lang.String"  
		//매개변수타입이 String이유는 사용자가 아이디 입력 시 영어와 숫자 둘 다 사용하기 때문
		
		//리턴데이터타입을 말함  resultType="int"
		//리턴데이터타입이 int인 이유는 쿼리 실행 시 사용자가 입력한 아이디와 동일한 값이 있다면 카운트가 1 없으면 0이 되기 때문이다
		System.out.println("로그인 체크 메서드 호출 _DAO");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.sign_up_id_check", joongbok);
	}
	
	//전체 교원의 전체 정보 조회 admin전용
	public List<Object> tableList(String 입력값) {
		System.out.println(입력값+"나오냐");
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.tableList",입력값);
	}
	
	//편성폼 교원
	//컨트롤러에서 받은 값이 변수에 대입된다.
	public List<String> takeT(String takeTeacher) {
		System.out.println("편성폼의 교원 메서드 호출 확인");
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.takeTeacher",takeTeacher);
	}
	
	//편성폼 클래스
	//컨트롤러에서 받은 값이 변수에 대입된다
	public List<Integer> takeC(String takeClass) {
		System.out.println("편성폼의 클래스 메서드 호출 확인");
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.takeClass", takeClass);
	}
	
	
	
}