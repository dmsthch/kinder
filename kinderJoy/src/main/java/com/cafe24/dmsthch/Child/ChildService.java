package com.cafe24.dmsthch.Child;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChildService {
	
	@Autowired
	ChildDao childDao;
	
	//�α��ε� ���� ������ �ڱ��ǹ� �˻�
	public ChildClass getChildClassToTeacherNo(HttpSession session){
		
		int teacherNo = (Integer) session.getAttribute("teacherNo");
		ChildClass childClass = childDao.getClassNoToTeacherNo(teacherNo);
		
		return childClass;
	}
	
	//�⼮�� Ư�̻����� �ִ°�� Ư�̻��� ����ϴ� �޼���
	public void insertUnusual(ChildAttendance childAttendance){
		
		ChildAttendance getTodayAttendance = childDao.getTodayAttendance(childAttendance.getKidNo());
		
		getTodayAttendance.setCategoryNo(childAttendance.getCategoryNo());
		getTodayAttendance.setAttendanceMemo(childAttendance.getAttendanceMemo());

		System.out.println(getTodayAttendance.getKidNo());
		System.out.println(getTodayAttendance.getAttendanceNo());
		System.out.println(getTodayAttendance.getCategoryNo());
		System.out.println(getTodayAttendance.getAttendanceMemo());
		
		childDao.unusualInsert(getTodayAttendance);
		
	}

}
