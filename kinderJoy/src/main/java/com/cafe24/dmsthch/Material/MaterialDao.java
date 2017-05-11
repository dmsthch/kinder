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

	//�Խ��� ī�װ� ��������
	public List<Map<String, Object>> getBoardCategory(){
		return sqlSessionTemplate.selectList(sql+"getBoardCategory");
	}
	
	//�ڷ�Խ��ǿ� �Է�
	public int insertBoardData(BoardData boardData){
		return sqlSessionTemplate.insert(sql+"insertBoardData", boardData);	
	}
	
	//�������ϸ����� �ڷ�Խ��ǿ��� dataNo ��������
	public int getDataNo(String dataStorageName){
		return sqlSessionTemplate.selectOne(sql+"getDataNo", dataStorageName);
	}
	
	//�Խñ� �Է�
	public int insertBoard(Board board){
		return sqlSessionTemplate.insert(sql+"insertBoard", board);
	}
	
	//�Խñ� ���� ���
	public int getBoardCount(int categoryNo){
		
		String selectSql = "getCategoryBoardCount";
		if(categoryNo == 0){
			selectSql = "getAllBoardCount";
		}
		return sqlSessionTemplate.selectOne(sql+selectSql, categoryNo);
	}
	
	//�Խñ� ��� ���
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
	
	//�Խñ� �ϳ� ��������
	public Board getBoard(String license, int boardNo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("boardNo", boardNo);
		return sqlSessionTemplate.selectOne(sql+"getBoard", map);
	}
	
	//�ڷ�Խ��� ���� ��������
	public BoardData getBoardData(int dataNo){
		return sqlSessionTemplate.selectOne(sql+"getBoardData", dataNo);
	}
	
	//�Խñ� ����
	public int boardModify(Board board){
		return sqlSessionTemplate.update(sql+"boardModify", board);
	}
	
	//��ü �˻�
	public List<Board> materialAllSearch(String license, String txtSearch, int nowPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("txtSearch", txtSearch+"%");
		map.put("nowPage", (nowPage-1)*10);
		return sqlSessionTemplate.selectList(sql+"materialAllSearch", map);
	}
	//ī�װ��� �˻�
	public List<Board> materialCategorySearch(String license, int categoryNo, String txtSearch, int nowPage){
		System.out.println("cat : "+categoryNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("categoryNo", categoryNo);
		map.put("txtSearch", txtSearch+"%");
		map.put("nowPage", (nowPage-1)*10);
		return sqlSessionTemplate.selectList(sql+"materialCategorySearch", map);
	}
}
