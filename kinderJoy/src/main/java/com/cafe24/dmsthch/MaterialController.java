package com.cafe24.dmsthch;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.dmsthch.Material.Board;
import com.cafe24.dmsthch.Material.BoardData;
import com.cafe24.dmsthch.Material.MaterialDao;
import com.cafe24.dmsthch.Material.MaterialService;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;

@Controller //�ڷ��!
public class MaterialController {
	
	@Autowired
	MaterialDao materialDao;
	@Autowired
	MaterialService materialService;
	@Autowired
	TeacherDao teacherDao;
	
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
			board.setLicenseKindergarten( (String) session.getAttribute("licenseKindergarten"));
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
		
		return "redirect:/MaterialDocumnetList";
	}
	
	//�Խ��� ����Ʈ
	@RequestMapping(value="/MaterialDocumnetList", method=RequestMethod.GET)
	public String materialDocumnetList(HttpSession session,
									   Model model,
									   @RequestParam(value="categoryNo", required=false, defaultValue="0") int categoryNo,
									   @RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage ){
		System.out.println("materialDocumnetList() run MaterialController");
		
		String returnUri = "redirect:/";
		
		//�α��� Ȯ��
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		if(isLogin){
			returnUri = "Material/MaterialDocumnetList";
			String license = (String) session.getAttribute("licenseKindergarten");
						
			int pagePerRow = 10;
			int lastPage = materialService.getLastPage(categoryNo, pagePerRow);
						
			List<Board> getList = materialDao.getBoardList(license, categoryNo, nowPage, pagePerRow);
			List<Map<String, Object>> category = materialDao.getBoardCategory();
						
			model.addAttribute("getList", getList);
			model.addAttribute("categoryNo", categoryNo);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("category", category);
		}
		
		return returnUri;
	}
	
	//�Խñ� �󼼺���
	@RequestMapping(value="/MaterialSelect", method=RequestMethod.GET)
	public String materialSelect(@RequestParam(value="boardNo", required=true) int boardNo, HttpSession session, Model model){
		System.out.println("materialSelect() run MaterialController");
		
		//�α��� Ȯ��
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		String returnUri = "redirect:/";
		
		if(isLogin){
			returnUri = "Material/MaterialSelect";
			String license = (String) session.getAttribute("licenseKindergarten");
			
			Board board = materialDao.getBoard(license, boardNo);
			Teacher teacher = teacherDao.OneSelectTeacher(board.getTeacherNo());
			
			//ī�װ��� ��������
			List<Map<String, Object>> getCategory = materialDao.getBoardCategory();
			for (Map<String, Object> cat : getCategory){
				if(cat.get("categoryNo").equals(board.getBoardCategoryNo())){
					String category = (String) cat.get("categoryName");
					model.addAttribute("category", category); //ī�װ� ����
				}
			}
			
			//÷�������� ������� ÷������ ��������
			if(board.getDataNo() != 0){
				BoardData boardData = materialDao.getBoardData(board.getDataNo());
				model.addAttribute("boardData", boardData);
			}
			
			model.addAttribute("board", board);
			model.addAttribute("teacher", teacher);
		}
		return returnUri;
	}
	
	//���� �ٿ�ε�
	@RequestMapping(value="/FileDownload", method=RequestMethod.GET)
	public void fileDownload(HttpServletResponse response,
							   @RequestParam(value="dataNo", required=true) int dataNo) throws IOException{
		System.out.println("fileDownload() run MaterialController");
		
		BoardData boardData = materialDao.getBoardData(dataNo);
		
		String originalName = boardData.getDataOriginalName();
		String storageName = boardData.getDataStorageName();
		String dataUrl = boardData.getDataUrl();

		byte fileByte[] = FileUtils.readFileToByteArray(new File(dataUrl));
		
		response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalName,"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	//�Խñ� ����
	@RequestMapping(value="/MaterialModify", method=RequestMethod.GET)
	public String materialModify(@RequestParam(value="boardNo", required=true) int boardNo,
								 HttpSession session,Model model){
		System.out.println("MaterialModify() run MaterialController");
		
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		if(isLogin){
			String license = (String) session.getAttribute("licenseKindergarten");
			
			Board board = materialDao.getBoard(license, boardNo);
			List<Map<String, Object>> boardCategoryList = materialDao.getBoardCategory();
			
			if(board.getDataNo() != 0){
				BoardData boardData = materialDao.getBoardData(board.getDataNo());
				String originalName = boardData.getDataOriginalName();
				model.addAttribute("originalName", originalName);				
			}
			
			model.addAttribute("board", board);
			model.addAttribute("boardCategoryList", boardCategoryList);
		}
		
		return "Material/MaterialModify";
	}
	
}
