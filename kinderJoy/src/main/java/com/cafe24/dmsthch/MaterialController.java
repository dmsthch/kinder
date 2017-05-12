package com.cafe24.dmsthch;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
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

@Controller //자료실!
public class MaterialController {
	
	@Autowired
	MaterialDao materialDao;
	@Autowired
	MaterialService materialService;
	@Autowired
	TeacherDao teacherDao;
	
	//자료실 메인
	@RequestMapping(value="/Material", method=RequestMethod.GET)
	public String materialMain(HttpSession session, Model model){
		System.out.println("materialMain() Controller run");
		
		String returnUri = "redirect:/";
		//로그인상태인지 확인
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		if(isLogin){
			returnUri = "Material/DocumentEducation";
			String license = (String) session.getAttribute("licenseKindergarten");
			
			List<Map<String, Object>> boardCategoryList = materialDao.getBoardCategory();
			List<Board> documentList = materialDao.getBoardList(license, 1, 1, 10);
			List<Board> materialList = materialDao.getBoardList(license, 2, 1, 10);
			
			model.addAttribute("boardCategoryList", boardCategoryList);
			model.addAttribute("documentList", documentList);
			model.addAttribute("educationList", materialList);
		}
		
		return returnUri;
	}
	
	//입력폼
	@RequestMapping(value="/MaterialAdd", method=RequestMethod.GET)
	public String materialAdd(HttpSession session, Model model){
		System.out.println("MaterialAdd(get) Controller run");
		
		String returnUri = "redirect:/";
		
		//로그인상태인지 확인
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		
		if(isLogin){
			returnUri  = "Material/MaterialAdd";
			List<Map<String, Object>> boardCategoryList = materialDao.getBoardCategory();
			
			model.addAttribute("boardCategoryList", boardCategoryList);
		}
		
		return returnUri;
	}
	
	//입력 처리
	@RequestMapping(value="/MaterialAdd", method=RequestMethod.POST)
	public String materialAdd(Board board, HttpSession session) throws IllegalStateException, IOException{
		System.out.println("MaterialAdd(post) Controller run");
		
		if(session.getAttribute("teacherNo") != null){			
			board.setTeacherNo( (Integer) session.getAttribute("teacherNo"));
			board.setLicenseKindergarten( (String) session.getAttribute("licenseKindergarten"));
		}
		
		//파일 물리적 경로에 저장 , 테이블 data 입력
		List<MultipartFile> files = board.getFiles();
		MultipartFile file = files.get(0);
		if(!file.getOriginalFilename().equals("")) { //파일입력이 된경우
			List<Integer> dataNo = materialService.saveBoardData(board, session);
			board.setDataNo(dataNo.get(0));
	    }
		//게시글 입력
		materialDao.insertBoard(board);
		
		return "redirect:/MaterialDocumnetList";
	}
	
	//게시판 리스트
	@RequestMapping(value="/MaterialDocumnetList", method=RequestMethod.GET)
	public String materialDocumnetList(HttpSession session,
									   Model model,
									   @RequestParam(value="categoryNo", required=false, defaultValue="0") int categoryNo,
									   @RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage ){
		System.out.println("materialDocumnetList() run MaterialController");
		
		String returnUri = "redirect:/";
		
		//로그인 확인
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
	
	//게시글 상세보기
	@RequestMapping(value="/MaterialSelect", method=RequestMethod.GET)
	public String materialSelect(@RequestParam(value="boardNo", required=true) int boardNo, HttpSession session, Model model){
		System.out.println("materialSelect() run MaterialController");
		
		//로그인 확인
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		String returnUri = "redirect:/";
		
		if(isLogin){
			returnUri = "Material/MaterialSelect";
			String license = (String) session.getAttribute("licenseKindergarten");
			
			Board board = materialDao.getBoard(license, boardNo);
			Teacher teacher = teacherDao.OneSelectTeacher(board.getTeacherNo());
			
			//카테고리명 가져오기
			List<Map<String, Object>> getCategory = materialDao.getBoardCategory();
			for (Map<String, Object> cat : getCategory){
				if(cat.get("categoryNo").equals(board.getBoardCategoryNo())){
					String category = (String) cat.get("categoryName");
					model.addAttribute("category", category); //카테고리 셋팅
				}
			}
			
			//첨부파일이 있을경우 첨부파일 가져오기
			if(board.getDataNo() != 0){
				BoardData boardData = materialDao.getBoardData(board.getDataNo());
				model.addAttribute("boardData", boardData);
			}
			
			model.addAttribute("board", board);
			model.addAttribute("teacher", teacher);
		}
		return returnUri;
	}
	
	//파일 다운로드
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
	
	//게시글 수정폼
	@RequestMapping(value="/MaterialModify", method=RequestMethod.GET)
	public String materialModify(@RequestParam(value="boardNo", required=true) int boardNo,
								 HttpSession session,Model model){
		System.out.println("MaterialModify() run MaterialController");
		
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		if(isLogin){
			String license = (String) session.getAttribute("licenseKindergarten");
			
			Board board = materialDao.getBoard(license, boardNo);
			List<Map<String, Object>> boardCategoryList = materialDao.getBoardCategory();
			
			//첨부파일
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
	
	//게시글 수정 처리
	@RequestMapping(value="/MaterialModify", method=RequestMethod.POST)
	public String materialModify(Board board){
		System.out.println("materialModify(post) run MaterialController");
		
		String returnUrl = "redirect:/MaterialModify?boardNo="+board.getBoardNo();
		if(materialDao.boardModify(board) == 1){
			returnUrl = "redirect:/MaterialSelect?boardNo="+board.getBoardNo();
		}
		return returnUrl;
	}
	
	//검색
	@RequestMapping(value="/MaterialSearch", method=RequestMethod.POST)
	public String materialSearch(Board board, HttpSession session, Model model){
		System.out.println("MaterialModify(post) run MaterialController");
		
		boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
		String returnUri = "redirect:/";
		
		if(isLogin){
			
			int categoryNo = board.getBoardCategoryNo();
			String txtSearch = board.getBoardContent();
			String license = (String) session.getAttribute("licenseKindergarten");
						
			if(txtSearch.equals("")){
				returnUri = "Material/MaterialDocumnetList";
				
				System.out.println("공백임");
			}else{
				returnUri = "Material/MaterialSearch";

				List<Map<String,Object>> getCategory = materialDao.getBoardCategory();
				ArrayList<List<Board>> allList = new ArrayList<List<Board>>();
				
				System.out.println(categoryNo + " : catNo");
				
				String[] pageName = new String[getCategory.size()];
				
				if(categoryNo == 0){ //전체검색일때
					pageName[0] = "통합 검색";
					for(int i=1; i<pageName.length; i++){
						pageName[i] = getCategory.get(i-1).get("categoryName")+"";
					}
					
					List<Board> unifiedList = materialDao.materialAllSearch(license, txtSearch, 1);
					allList.add(unifiedList);
					
					for(int i=1; i<getCategory.size(); i++){
						System.out.println("반복문!~ " + i);
						List<Board> catList = materialDao.materialCategorySearch(license, i, txtSearch, 1);
						allList.add(catList);
					}
				}else{ // 카테고리별 검색일때
					pageName[0] = getCategory.get(categoryNo-1).get("categoryName")+"";
					List<Board> catList = materialDao.materialCategorySearch(license, categoryNo, txtSearch, 1);
					allList.add(catList);
				}
								
				model.addAttribute("pageName", pageName);
				model.addAttribute("getCategory", getCategory);
				model.addAttribute("allList", allList);
			}
			
			
		}
		
		return returnUri;
		
	}
	
}
