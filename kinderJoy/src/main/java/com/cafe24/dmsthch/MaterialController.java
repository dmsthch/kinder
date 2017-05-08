package com.cafe24.dmsthch;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.dmsthch.Material.Board;
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
			returnUri  = "Material/MaterialAdd";
			List<Map<String, Object>> boardCategoryList = materialDao.getBoardCategory();
			
			model.addAttribute("boardCategoryList", boardCategoryList);
		}
		
		return returnUri;
	}
	
	//�Է� ó��
	@RequestMapping(value="/MaterialAdd", method=RequestMethod.POST)
	public String materialAdd(Board board, HttpSession session) throws IllegalStateException, IOException{
		System.out.println("MaterialAdd(post) Controller run");
		
		if(session.getAttribute("teacherNo") != null){			
			board.setTeacherNo( (Integer) session.getAttribute("teacherNo"));
			board.setLicenseKindergarten( (String) session.getAttribute("teacherLicense"));
		}
		
		//���� ������ ��ο� ���� , ���̺� data �Է�
		List<MultipartFile> files = board.getFiles();
		MultipartFile file = files.get(0);
		if(!file.getOriginalFilename().equals("")) { //�����Է��� �Ȱ��
			List<Integer> dataNo = materialService.saveBoardData(board, session);
			board.setDataNo(dataNo.get(0));
	    }
		//�Խñ� �Է�
		materialDao.insertBoard(board);
		
		return "redirect:/MaterialSelect";
	}
	
	
	@RequestMapping(value="/MaterialDocumnetList", method=RequestMethod.GET)
	public String materialDocumnetList(HttpSession session,
									   Model model,
									   @RequestParam(value="categoryNo", required=false, defaultValue="0") int categoryNo,
									   @RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage ){
		String returnUri = "redirect:/";
		
		//�α��� Ȯ��
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		if(isLogin){
			returnUri = "Material/MaterialDocumnetList";
			String license = (String) session.getAttribute("teacherLicense");
			
			int pagePerRow = 10;
			int lastPage = materialService.getLastPage(pagePerRow);
						
			List<Board> getList = materialDao.getBoardList(license, categoryNo, nowPage, pagePerRow);
			
			model.addAttribute("getList", getList);
			model.addAttribute("categoryNo", categoryNo);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("nowPage", nowPage);
		}
		
		return returnUri;
	}
	
	@RequestMapping(value="/MaterialSelect", method=RequestMethod.GET)
	public String materialSelect(Board board){
		
		
		return "Material/MaterialSelect";
	}
	
}
