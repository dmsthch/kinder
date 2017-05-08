package com.cafe24.dmsthch.Calendar;

public class ForJson {
	
	public String toJsonSchedule(Schedule schedule){
		int scheduleNo = schedule.getScheduleNo();
		int teacherNo = schedule.getTeacherNo();
		String licenseKindergarten = schedule.getLicenseKindergarten();
		String ScheduleContent =  schedule.getScheduleContent();
		int categoryNo = schedule.getCategoryNo();
		String scheduleEndDay = schedule.getScheduleEndDay();
		String scheduleStartDay = schedule.getScheduleStartDay();
		String scheduleTime = schedule.getScheduleTime();
		String scheduleTitle = schedule.getScheduleTitle();
		
		String tojson =null;
		tojson = "{ \"scheduleNo\" : \""+ scheduleNo+"\", \"teacherNo\" : \""+teacherNo+"\", \"licenseKindergarten\" : \""+licenseKindergarten+
				"\", \"scheduleContent\" : \""+ ScheduleContent+"\", \"categoryNo\" : \""+categoryNo+"\", \"scheduleEndDay\" : \""+scheduleEndDay+
				"\", \"scheduleStartDay\" : \""+ scheduleStartDay+"\", \"scheduleTime\" : \""+scheduleTime+"\", \"scheduleTitle\" : \""+scheduleTitle+"\" }";

		//System.out.println(tojson+ "<<<<<<<<<<<<<<<<tojson");
		return tojson;
		
	}
}
