package com.cafe24.dmsthch;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.dmsthch.Material.Board;
import com.cafe24.dmsthch.Material.BoardData;
import com.cafe24.dmsthch.Material.MaterialDao;
import com.cafe24.dmsthch.Material.MaterialService;

@Controller //�ڷ��!
public class MaterialController {
	
	@Autowired
	MaterialDao materialDao;
	@Autowired
	MaterialService materialService;
	
	
	//�ڷ�� ����
	@RequestMapping(value="/Material", method=RequestMethod.GET)
	public String materialMain(){
		System.out.println("materialMain() Controller run");
		
		
		return "Material/DocumentEducation";
	}
	
	//�Է���
	@RequestMapping(value="/MaterialAdd", method=RequestMethod.GET)
	public String materialAdd(HttpSession session, Model model){
		System.out.println("MaterialAdd(get) Controller run");
		
		String returnUri = "redirect:/";
		
		//�α��λ������� Ȯ��
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		
		if(isLogin){
			returnUri  = "Material/materialAdd";
			List<Map<String, Object>> boardCategoryList = materialDao.getBoardCategory();
			
			model.addAttribute("boardCategoryList", boardCategoryList);
			
		}
		
		return returnUri;
	}
	
	//�Է� ó��
	@RequestMapping(value="/MaterialAdd", method=RequestMethod.POST)
	public String materialAddd(Board board, HttpSession session) throws IllegalStateException, IOException{
		System.out.println("MaterialAdd(post) Controller run");
		
		if(session.getAttribute("teacherNo") != null){			
			board.setTeacherNo( (Integer) session.getAttribute("teacherNo"));
			board.setLicenseKindergarten( (String) session.getAttribute("teacherLicense"));
		}
		
		//���� ������ ��ο� ���� , ���̺� data �Է�
		List<MultipartFile> files = board.getFiles();
		if(files != null && files.size() > 0) {
			List<Integer> dataNo = materialService.saveBoardData(board, session);
			board.setDataNo(dataNo.get(0));
	    }
		
		System.out.println(board.getDataNo()+":dataNo");
		
		materialDao.insertBoard(board);
		
		
		return "Material/materialSelect";
	}

}
