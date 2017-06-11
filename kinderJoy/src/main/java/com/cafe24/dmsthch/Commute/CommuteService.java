package com.cafe24.dmsthch.Commute;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.dmsthch.Child.ChildAttendance;
import com.cafe24.dmsthch.Child.ChildClass;
import com.cafe24.dmsthch.Child.ChildDao;

@Repository
public class CommuteService {
	
	@Autowired
	CommuteDao commuteDao;
	@Autowired
	ChildDao childDao;
	
	//�ش� ���� �⼮���� ��������
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
	
	//����� �⼮����
	public Map<String, Object> getCommuteInfo(HttpSession session){
		System.out.println("getCommuteInfo() run CommuteService");
		
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) +1;
		
		List<Map<String, Object>> commuteList = this.getCommuteForMonth(session, month);
		int commuteCount = commuteList.size();
		int businessDay = this.getBusinessDayCount(month);
		String commutePercentage = ((double)commuteCount/(double)businessDay)*100.0 +"%";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commuteCount", commuteCount);
		map.put("businessDay", businessDay);
		map.put("commutePercentage", commutePercentage);
		
		return map;
	}
	
	//�� , �Ͽ����� ������ ��¥�� �ϼ� ���ϱ�
	public int getBusinessDayCount(int month){
		System.out.println("getBusinessDayCount() run CommuteService");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		cal.set(year, month-1, 1); //��¥ ����  ����0���� �����̱� ������ -1
		int endDate = cal.getMaximum(Calendar.DAY_OF_MONTH);
		int startDay = cal.get(Calendar.DAY_OF_WEEK);
		
		int businessDay = endDate;
		
		for(int i=1; i<=endDate; i++){
			if(startDay == 1){
				businessDay--;
			}else if(startDay == 7){
				businessDay--;
				startDay = 0;
			}
			startDay++;
		}
		return businessDay;
	}
	
	public List<ChildAttendance> getKidAttendance(HttpSession session, String month, String date){
		
		//��¥ �����~
		String getDate = "";
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		getDate += year;
		
		if(month.length() == 1){
			getDate += "0" + month;
		}else{
			getDate += month;
		}
		
		if(date.length() == 1){
			getDate += "0" + date;
		}else{
			getDate += date;
		}
		
		
		int teacherNo = (Integer) session.getAttribute("teacherNo");
		ChildClass childClass = childDao.getClassNoToTeacherNo(teacherNo);
		List<ChildAttendance> getAttendanceList = commuteDao.getKidCommuteToDate(childClass.getClassNo(), getDate);
				
		return getAttendanceList;
	}

}
