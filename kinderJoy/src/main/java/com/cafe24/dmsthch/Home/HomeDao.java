package com.cafe24.dmsthch.Home;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.dmsthch.Home.License;

@Repository
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
    
	// ��ġ�� ���̼����� ��ġ����,���̼��� ���۰� ���� ���� ��������
	public License getLicense(String licenseKindergarten){
		System.out.println("getLicense() run");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Home.HomeMapper.getLicense", licenseKindergarten);
	}
	
    

}
