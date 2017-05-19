package com.cafe24.dmsthch.Teacher;

import java.util.List;
import java.util.Map;

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
	
	//교원 한명 조회 나의 정보
	public Teacher OneSelectTeacher(int INT) {
		System.out.println("교원 한명 정보 조회 메서드 실행_TeacherDao.java");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.OneSelectTeacher", INT);
	}
	
	//로그인 아이디 체크 로그인!할 때 아이디 체크!
	public int loginIdcheck(String string) {
		System.out.println("로그인 아이디 체크_DAO");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.loginIdcheck", string);
	}
	
	
	//아이디 중복체크
	public int logincheck(String joongbok) {
		//매개변수의 타입을 말함 parameterType="java.lang.String"  
		//매개변수타입이 String이유는 사용자가 아이디 입력 시 영어와 숫자 둘 다 사용하기 때문
		
		//리턴데이터타입을 말함  resultType="int"
		//리턴데이터타입이 int인 이유는 쿼리 실행 시 사용자가 입력한 아이디와 동일한 값이 있다면 카운트가 1 없으면 0이 되기 때문이다
		System.out.println("로그인 체크 메서드 호출 _DAO");
		return sql.selectOne("com.cafe24.dmsthch.Teacher.TeacherMapper.sign_up_id_check", joongbok);
		//아까 오류가 있었는데 하나의 값을 가져오려면
		//selectOne을 써야하는데 selectList를 써서 오류가 났었다 
	}
	
	//전체 교원의 전체 정보 조회 admin 전용 TableList
	public List<Object> tableList(String string) {
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.tableList",string);
	}
	
	//이직한 교원의 정보 조회 admin 전용 TableList
	public List<Object> removeList(Map<String, Object> map){
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.removeTable" ,map);
	}
	
	
	//편성 교원
	// 입력값은 라이선스 하나니까 String이다. 컨트롤러에서 받은 값이 변수에 대입된다.
	//리턴값은 여러개 이고 타입도 여러개이므로 Object이다
	public List<Object> takeT(String string) {
		System.out.println(string +"<-------------takeT");
		System.out.println("편성폼의 교원 메서드 호출 확인");
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.takeTeacher",string);
	}
	
	//편성폼 클래스
	//컨트롤러에서 받은 값이 변수에 대입된다
	public List<Object> takeC(String string) {
		System.out.println("편성폼의 클래스 메서드 호출 확인");
		return sql.selectList("com.cafe24.dmsthch.Teacher.TeacherMapper.takeClass", string);
	}
	
	//회원탈퇴
	public int delete(String string) {
		System.out.println("회원탈퇴메서드 _DAO");
		return sql.delete("com.cafe24.dmsthch.Teacher.TeacherMapper.deleteAccount", string);
	}
	
	//회원 탈퇴 후 remove테이블에 넣을 아이디
	public int deleteANDinsert(Object object) {
		System.out.println("remove테이블의 teacher_id컬럼에 삭제된 아이디 추가 메서드 호출 _DAO");
		return sql.insert("com.cafe24.dmsthch.Teacher.TeacherMapper.insertId" ,object);
	}
	
	//자기 정보 수정
	public int updateTeacher(Teacher teacher) {
		System.out.println("수정확메서드호출_Dao");
		return sql.update("com.cafe24.dmsthch.Teacher.TeacherMapper.updateTeacher", teacher);
	}
}