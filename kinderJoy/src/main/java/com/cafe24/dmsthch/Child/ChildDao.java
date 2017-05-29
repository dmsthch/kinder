package com.cafe24.dmsthch.Child;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChildDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//해당유치원의 반편성번호와 유아정보 가져오기 (발달평가를 위한 셀렉트)
	public List<Map<String, Object>> ChildBeforeDevelopmentAdd(int pageNo,String searchVal,String searchType,String searchAge,String licenseKindergarten){
		Calendar c = Calendar.getInstance(); //객체 생성 및 현재 일시분초...셋팅
		int year = c.get(Calendar.YEAR);
		int onePageRow = 10;
		int startRow = (pageNo-1)*onePageRow;
		Map<String,Object> map = new  HashMap<String,Object>();
		map.put("year", year);
		map.put("licenseKindergarten", licenseKindergarten);
		map.put("searchVal", searchVal);
		map.put("searchAge", searchAge);
		map.put("searchType",searchType );
		map.put("startRow",startRow);
		map.put("onePageRow",onePageRow);
		System.out.println(year+"<<year");
		System.out.println(licenseKindergarten+"<<licenseKindergarten");
		System.out.println(searchVal+"<<searchVal");
		System.out.println(searchAge+"<<searchAge");
		System.out.println(searchType+"<<searchType");
		System.out.println(startRow+"<<startRow");
		System.out.println(onePageRow+"<<onePageRow");
		
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.ChildBeforeDevelopmentAdd",map);
	}
	
	
	//유아번호로 당일 출석정보 가져오기 (특이사항 포함)
	public List<ChildAttendance> getCommuteAll(int kidNo){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getCommuteAll", kidNo);
	}
	
	//당일 출석 특이사항 insert
	public int unusualInsert(ChildAttendance childAttendance){
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.unusualInsert", childAttendance);
	}
	
	//kidNo로 당일 출석정보 가져오기
	public ChildAttendance getTodayAttendance(int kidNo){
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getTodayAttendance", kidNo);
	}
	
	//당일 출석이 처음이 아닌 경우 update
	public int kidAttendanceUpdate(ChildAttendance childAttendance){
		return sqlSessionTemplate.update("com.cafe24.dmsthch.Child.ChildMapper.kidAttendanceUpdate", childAttendance);
	}
	
	//당일 출석이 처음인 경우 출석체크학 insert
	public int kidAttendanceInsert(ChildAttendance childAttendance){
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.kidAttendanceInsert", childAttendance);
	}
	
	//출석 특이사항 가져오기
	public List<Map<String, Object>> getAttendanceCategory(){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getAttendanceCategory");
	}
	
	//당일 출석부 등록유무 확인
	public int isTodayCommute(String license){
		System.out.println("isTodayCommute() run ChildDao");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.isTodayCommute", license);
	}
	
	public int updateChild(Child child) {
        return sqlSessionTemplate.update("com.cafe24.dmsthch.Child.ChildMapper.updateChild", child);
    }
	
	public Child getChild(int kid_no) {
		System.out.println("getChild()");
	    return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChild",kid_no);
	}
	 
	public List<Object> getClass(int currentPage, int pagePerRow) {
		Map<String,Integer> map = new  HashMap<String,Integer>();
	  	map.put("beginRow", (currentPage-1)*pagePerRow);
	   	map.put("pagePerRow", pagePerRow);
	    return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getClass", map);
	}
	
	//반한개 검색
	public ChildClass getClass(int classNo){
		System.out.println("getClass() run");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getClassOne", classNo);
	}
	
	    
	public int getChildCount() {
	    return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChildCount");
	    }

	public int insertChild(Child child) {
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.insertChild", child);
    }
	public int insertClass(ChildClass childclass) {
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.insertClass", childclass);
    }
	
	//전체 리스ㅌ
	public List<Child> getChildList(String license ,int currentPage, int pagePerRow) {
	  	Map<String,Object> map = new  HashMap<String,Object>();

	  	map.put("license", license);
	  	map.put("beginRow", (currentPage-1)*pagePerRow);
	   	map.put("pagePerRow", pagePerRow);
	    return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getChildList",map);
	}
	//조건 ㅣㄹ;트스
	public List<Child> getSeveralList(String license, int teacherNo, int currentPage, int pagePerRow ){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("teacherNo", teacherNo);
		map.put("beginRow", (currentPage-1)*pagePerRow);
	   	map.put("pagePerRow", pagePerRow);

	   	System.out.println(license);
	   	System.out.println(teacherNo);
	   	System.out.println((currentPage-1)*pagePerRow);
	   	System.out.println(pagePerRow);
	   	
	   	
        return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.severalSelect", map);
	}
	
	//넘버배열 받아서 반에 넣기
	public void classOrganization(String licenseKindergarten,int[] kidNo, int classNo){
		Map<String, Object> map = null;
		for(int i =0; i<kidNo.length;i++){
			map =new HashMap<String, Object>();
			map.put("licenseKindergarten", licenseKindergarten);
			map.put("kidNo", kidNo[i]);
			map.put("classNo", classNo);
			sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.classOrganization",map);
		}
	}

	public List<Child> getFormationChildList(ChildClass childClass){
		
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getFormationChildList", childClass);
		
	}
	
	public List<Child> getRematinderFormationList(ChildClass childClass){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getRemainderFormationList",childClass);
		
	}

	public List<Child> getClassMemberList(Child child){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getClassMemberList",child);
	}
	
	public List<Child> getChildForClass(ChildClass childClass){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getChildForClass",childClass);
	}
	
	public ChildClass getClassNoToTeacherNo(int teacherNo){
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getClassNoToTeacherNo",teacherNo);
	}

}
