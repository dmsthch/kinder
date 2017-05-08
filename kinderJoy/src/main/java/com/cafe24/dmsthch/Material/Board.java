package com.cafe24.dmsthch.Material;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	
	private String boardNo;
	private String licenseKindergarten;
	private String boardTitle;
	private int boardCategoryNo;
	private int dataNo;
	private String boardDay;
	private int teacherNo;
	private String boardContent;
	
	private List<MultipartFile> files;

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getLicenseKindergarten() {
		return licenseKindergarten;
	}

	public void setLicenseKindergarten(String licenseKindergarten) {
		this.licenseKindergarten = licenseKindergarten;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getBoardCategoryNo() {
		return boardCategoryNo;
	}

	public void setBoardCategoryNo(int boardCategoryNo) {
		this.boardCategoryNo = boardCategoryNo;
	}

	public int getDataNo() {
		return dataNo;
	}

	public void setDataNo(int dataNo) {
		this.dataNo = dataNo;
	}

	public String getBoardDay() {
		return boardDay;
	}

	public void setBoardDay(String boardDay) {
		this.boardDay = boardDay;
	}

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	
}