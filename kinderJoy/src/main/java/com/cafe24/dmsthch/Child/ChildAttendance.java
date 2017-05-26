package com.cafe24.dmsthch.Child;

public class ChildAttendance {
	
	private int attendanceNo;
	private int kidNo;
	private String licenseKindergarten;
	private int attendance;
	private int attendanceUnusual;
	private String attendanceDay;
	private String categoryNo;
	private String attendanceTime;
	private String attendanceMemo;
	
	
	public int getAttendanceNo() {
		return attendanceNo;
	}
	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}
	public int getKidNo() {
		return kidNo;
	}
	public void setKidNo(int kidNo) {
		this.kidNo = kidNo;
	}
	public String getLicenseKindergarten() {
		return licenseKindergarten;
	}
	public void setLicenseKindergarten(String licenseKindergarten) {
		this.licenseKindergarten = licenseKindergarten;
	}
	public int getAttendance() {
		return attendance;
	}
	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	public int getAttendanceUnusual() {
		return attendanceUnusual;
	}
	public void setAttendanceUnusual(int attendanceUnusual) {
		this.attendanceUnusual = attendanceUnusual;
	}
	public String getAttendanceDay() {
		return attendanceDay;
	}
	public void setAttendanceDay(String attendanceDay) {
		this.attendanceDay = attendanceDay;
	}
	public String getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(String kidCategory) {
		this.categoryNo = kidCategory;
	}
	public String getAttendanceTime() {
		return attendanceTime;
	}
	public void setAttendanceTime(String attendanceTime) {
		this.attendanceTime = attendanceTime;
	}
	public String getAttendanceMemo() {
		return attendanceMemo;
	}
	public void setAttendanceMemo(String attendanceMemo) {
		this.attendanceMemo = attendanceMemo;
	}

}
