package com.cafe24.dmsthch.Home;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.dmsthch.Home.License;

@Repository
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
    
	// 유치원 라이센스로 유치원명,라이센스 시작과 종료 일자 가져오기
	public License getLicense(String licenseKindergarten){
		System.out.println("getLicense() run");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Home.HomeMapper.getLicense", licenseKindergarten);
	}
	
    

}
