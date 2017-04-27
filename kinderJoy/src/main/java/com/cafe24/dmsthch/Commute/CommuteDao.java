package com.cafe24.dmsthch.Commute;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommuteDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	String sql = "com.cafe24.dmsthch.Commute.CommuteMapper.";
	
	public Map commuteCheck(int teacherNo){
		System.out.println("commuteCheck() run");
		Map<String, Integer> parm = new HashMap<String, Integer>();
		parm.put("teacherNo", teacherNo);
		return sqlSessionTemplate.selectOne(sql+"attendanceCheck", parm);
	}

}
