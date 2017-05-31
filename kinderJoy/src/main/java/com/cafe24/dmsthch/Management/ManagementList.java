package com.cafe24.dmsthch.Management;

public class ManagementList {
	private String PM;
	private String teacherName;
	private String equipmentName;
	private int equipmentCost;
	private int equipmentAmount;
	private String equipmentDay;
	public String getPM() {
		return PM;
	}
	public void setPM(String pM) {
		PM = pM;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	public int getEquipmentCost() {
		return equipmentCost;
	}
	public void setEquipmentCost(int equipmentCost) {
		this.equipmentCost = equipmentCost;
	}
	public int getEquipmentAmount() {
		return equipmentAmount;
	}
	public void setEquipmentAmount(int equipmentAmount) {
		this.equipmentAmount = equipmentAmount;
	}
	public String getEquipmentDay() {
		return equipmentDay;
	}
	public void setEquipmentDay(String equipmentDay) {
		this.equipmentDay = equipmentDay;
	}
}
