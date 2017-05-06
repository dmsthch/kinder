package com.cafe24.dmsthch.Material;

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
	
}
