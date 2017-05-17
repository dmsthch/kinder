package com.cafe24.dmsthch.Material;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class MaterialService {
	
	@Autowired
	MaterialDao materialDao;
	
	
	//���ϵ�� , �Խñ� �ۼ�
	public List<Integer> saveBoardData(Board board, HttpSession session) throws IllegalStateException, IOException{
		System.out.println("saveBoardData() run - MaterialService");
		
		List<MultipartFile> files = board.getFiles();
		String rootPath = session.getServletContext().getRealPath("");
		
		List<Integer> dataNo = new ArrayList<Integer>();
		
		for(MultipartFile multipartFile : files) {
	        // ���� ���� ��
	        String fileName = multipartFile.getOriginalFilename();
	        // ���ϸ��� �ߺ����� �ʰ� ���ϸ� �ð� �߰� (����� ���ϸ�)
	        String newFileName = fileName + "_" + System.currentTimeMillis();
	        // ���� ���ε� ���
	        String path = rootPath +"resources\\upFiles\\"+newFileName;
	            
	        long fileSize = multipartFile.getSize(); // ���� ������
            
	        
	        // ���� �̵�
            File f = new File(path);
            multipartFile.transferTo(f);
	        
	        BoardData boardData = new BoardData();
			boardData.setLicenseKindergarten(board.getLicenseKindergarten());
			boardData.setTeacherNo(board.getTeacherNo());
			boardData.setCategoryNo(board.getBoardCategoryNo());
			boardData.setDataOriginalName(fileName);
			boardData.setDataStorageName(newFileName);
			boardData.setDataUrl(path);
			boardData.setDataSize((int) fileSize);
	        
			materialDao.insertBoardData(boardData);
			dataNo.add(materialDao.getDataNo(newFileName));
        }
		
		return dataNo;
	}
	
	// ������ ������ ���ϱ�
	public int getLastPage(int categoryNo, int pagePerRow){
		int lastPage = 1;
		int boardCount = materialDao.getBoardCount(categoryNo);
		
		if(boardCount%pagePerRow == 0){
			lastPage = boardCount/pagePerRow;
		}else{
			lastPage = (boardCount/pagePerRow)+1;
		}		
		return lastPage;
	}
	
}
