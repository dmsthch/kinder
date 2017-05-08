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
	
	//�Խñ� ��� ���
	public List<Board> getBoardList(String license, int categoryNo, int nowPage, int getCount){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("license", license);
		map.put("categoryNo", categoryNo);
		map.put("nowPage", nowPage);
		map.put("getCount", getCount);
		return sqlSessionTemplate.selectList(sql+"getBoardList", map);
	}
	
}
