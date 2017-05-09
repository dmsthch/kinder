package com.cafe24.dmsthch.Material;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MaterialDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String sql = "com.cafe24.dmsthch.Material.MaterialMapper.";

	//게시판 카테고리 가져오기
	public List<Map<String, Object>> getBoardCategory(){
		return sqlSessionTemplate.selectList(sql+"getBoardCategory");
	}
	
	//자료게시판에 입력
	public int insertBoardData(BoardData boardData){
		return sqlSessionTemplate.insert(sql+"insertBoardData", boardData);	
	}
	
	//물리파일명으로 자료게시판에서 dataNo 가져오기
	public int getDataNo(String dataStorageName){
		return sqlSessionTemplate.selectOne(sql+"getDataNo", dataStorageName);
	}
	
	//게시글 입력
	public int insertBoard(Board board){
		return sqlSessionTemplate.insert(sql+"insertBoard", board);
	}
	
	//게시글 갯수 출력
	public int getBoardCount(int categoryNo){
		
		String selectSql = "getCategoryBoardCount";
		if(categoryNo == 0){
			selectSql = "getAllBoardCount";
		}
		return sqlSessionTemplate.selectOne(sql+selectSql, categoryNo);
	}
	
	//게시글 목록 출력
	public List<Board> getBoardList(String license, int categoryNo, int nowPage, int pagePerRow){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("categoryNo", categoryNo);
		map.put("nowPage", (nowPage-1)*10);
		map.put("getCount", pagePerRow);
		
		String selectSql = "getCategoryBoardList";
		if(categoryNo == 0){
			selectSql = "getAllBoardList";
		}
		
		return sqlSessionTemplate.selectList(sql+selectSql, map);
	}
	
	//게시글 하나 가져오기
	public Board getBoard(String license, int boardNo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("boardNo", boardNo);
		return sqlSessionTemplate.selectOne(sql+"getBoard", map);
	}
	
}
