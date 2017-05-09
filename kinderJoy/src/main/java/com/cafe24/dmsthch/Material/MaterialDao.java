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
	
}
