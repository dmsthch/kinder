package com.cafe24.dmsthch;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.dmsthch.Material.Board;

@Controller //자료실!
public class MaterialController {
	
	//자료실 메인
	@RequestMapping(value="/Material", method=RequestMethod.GET)
	public String materialMain(){
		System.out.println("materialMain() Controller run");
		
		
		return "Material/DocumentEducation";
	}
	
	//입력폼
	@RequestMapping(value="/MaterialAdd", method=RequestMethod.GET)
	public String materialAdd(HttpSession session){
		System.out.println("MaterialAdd(get) Controller run");
		
		String returnUri = "redirect:/";
		
		if(session.getAttribute("teacherNo") != null){
			returnUri = "Material/materialAdd";
		}
		
		return returnUri;
	}
	
	//입력 처리
	@RequestMapping(value="/MaterialAdd", method=RequestMethod.POST)
	public String materialAddd(Board board, HttpSession session){
		System.out.println("MaterialAdd(post) Controller run");
		
		
		if(session.getAttribute("teacherNo") != null){			
			board.setTeacherNo( (Integer) session.getAttribute("teacherNo"));
			board.setLicenseKindergarten( (String) session.getAttribute("teacherLicense"));
			
		}
		
		System.out.println("catNo : "+board.getBoardCategoryNo());
		System.out.println("Title : "+board.getBoardTitle());
		System.out.println("content : "+board.getBoardContent());
		System.out.println("license : "+board.getLicenseKindergarten());
		System.out.println("teacherNo : "+board.getTeacherNo());
		System.out.println("file : "+board.getFile().getOriginalFilename());
		
		
		return "Material/materialSelect";
	}

}
