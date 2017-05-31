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
	
	//유아발달평가 상세 저장하기
	public void addChildDevelopmentDetails(ChildDevelopmentDetails details , Child child){
		//필요한것 -> 평가번호(완), 라이센스, 수준, 문항번호, 제목, 관찰사례, 관찰일
		//제목은 '나이'+'아이이름'+'opserve의 content'+'날짜' 형식으로 넣어줄 예정.
		String title = null;
		String childBirth = child.getKidBirth();
		childBirth = childBirth.substring(0,4);
		System.out.println(childBirth+"<<childBirth");
		Calendar c = Calendar.getInstance(); //현재년도
		int year = c.get(Calendar.YEAR); //현재년도
		int age = year-(Integer.parseInt(childBirth));
		String mon = (c.get(Calendar.MONTH)+1) +"";
		if(mon.length()==1){
			mon = "0"+mon;
		}
        int day = c.get(Calendar.DAY_OF_MONTH);
        String today = (year + mon +day);
		title = age+"세 "+child.getKidName()+" "
				+sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getOpserveContent",details.getOpserveNo())
				+" "+today;
		details.setDevelopmentTitle(title);
		details.setDevelopmentDay(today);
		sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.addDevelopmentDetails",details);
	}

	//유아발달평가(development)에 해당유아 (반편성번호)가 있는지 확인하고 없으면 생성후, 평가번호를 셀렉트
	public String getChildDevelopmentNo(ChildDevelopment development, int teacherNo){
		String developmentNo = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChildDevelopment",development.getKidFormationNo());
		if(developmentNo==null){
			System.out.println("if문 developmentNo null일때");
			//없으면, 만들어서 가져와야한다. 이때, 선생님의 넘버가 아니라 선생님의 편성번호가 필요함. 먼저 편성번호를 가져온다.
			//편성번호를 가져올때 필요한것 -->선생님 넘버, 년도
			Calendar c = Calendar.getInstance(); //현재년도
			int year = c.get(Calendar.YEAR); //현재년도
			Integer integerYear = year;
			String classYear = integerYear.toString(); //String형
			Map<String,Object> map = new  HashMap<String,Object>();
			map.put("classYear", year);
			map.put("teacherNo", teacherNo);
			String teacherFormationNo = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getTeacherFormationNo", map);
			development.setTeacherFormationNo(teacherFormationNo);
			development.setDavelopmentYear(classYear);
			sqlSessionTemplate.insert("com.cafe24.dmsthch.Child.ChildMapper.addChildDevelopment",development);
			developmentNo = sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChildDevelopment",development.getKidFormationNo());
		}
		return developmentNo;
	}
	
	//반편성번호 받아서 해당 유아 1명 정보 받아오기
	public Map<String,Object> getChildInfoForDevelopment(ChildFormation childFormation){
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChildInfoForDevelopment",childFormation);
	}
	
	//연령 받아서 연령에 맞는 opserve가져오기
	public List<ChildDevelopmentOpserve> ChildDevelopmentAddPage(ChildClass Childclass){
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getOpserve",Childclass);
	}
	
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
