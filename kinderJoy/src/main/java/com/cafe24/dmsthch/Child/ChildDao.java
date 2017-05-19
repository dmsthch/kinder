package com.cafe24.dmsthch.Child;

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
	
	public int updateChild(Child child) {
        return sqlSessionTemplate.update("com.cafe24.dmsthch.Child.ChildMapper.updateChild", child);
    }
	
	public Child getChild(int kid_no) {
	    return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Child.ChildMapper.getChild",kid_no);
	}
	 
	public List<Object> getClass(int currentPage, int pagePerRow) {
		Map<String,Integer> map = new  HashMap<String,Integer>();
	  	map.put("beginRow", (currentPage-1)*pagePerRow);
	   	map.put("pagePerRow", pagePerRow);
	    return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Child.ChildMapper.getClass", map);
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
	public void classOrganization(String licenseKindergarten,int[] kidNo, String classNo){
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


}
