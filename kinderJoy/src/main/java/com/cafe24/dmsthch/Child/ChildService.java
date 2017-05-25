package com.cafe24.dmsthch.Child;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChildService {
	
	@Autowired
	ChildDao childDao;
	
	//로그인된 선생 정보로 자기의반 검색
	public ChildClass getChildClassToTeacherNo(HttpSession session){
		
		int teacherNo = (Integer) session.getAttribute("teacherNo");
		ChildClass childClass = childDao.getClassNoToTeacherNo(teacherNo);
		
		return childClass;
	}

}
