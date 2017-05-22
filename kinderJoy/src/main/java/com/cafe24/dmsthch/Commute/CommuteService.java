package com.cafe24.dmsthch.Commute;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommuteService {
	
	@Autowired
	CommuteDao commuteDao;
	
	public List<Map<String, Object>> getCommuteForMonth(HttpSession session, int month){
		System.out.println("getCommuteForMonth() run CommuteService");
		
		String license = (String)session.getAttribute("licenseKindergarten");
		int teacherNo = (Integer) session.getAttribute("teacherNo");
		String startDay = "";
		String insertMonth = month+"";
		
		Calendar cal = Calendar.getInstance();
		int nowYear = cal.get(Calendar.YEAR);
		startDay += nowYear;
		
		if(insertMonth.length() == 1){
			startDay += "0";
			startDay += insertMonth;
		}else{
			startDay += insertMonth;
		}
		startDay += "01";
		
		List<Map<String, Object>> returnList = commuteDao.getCommuteForMonth(license, teacherNo, startDay);
		
		return returnList;
	}

}
