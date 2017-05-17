package com.cafe24.dmsthch.Equipment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EquipmentDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// ��ǰ ǰ�Ǽ� ����Ʈ ���� ����ϱ�
	public List<Sheet> selectEquipmentName(HttpSession session) {
		System.out.println("selectEquipmentName �޼��� ���� ����");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectSheetName", licenseKindergarten);
	}
	// ��ǰ ����Ʈ ī��Ʈ ���ϱ�
	public int selectEquipmentCount(HttpSession session) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println("selectEquipmentCount �޼��� ���� ����");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectCountEquipmentList", licenseKindergarten);
	}
	// ��ǰ ����Ʈ ����ϱ�
	public List<Equipment> selectEquipment(int equipmnetCount) {
		System.out.println("selectEquipment �޼��� ���� ����");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentList", equipmnetCount);
	}
	// ��ǰ ���� �����ϱ�
	public int addEquipment(Equipment equipment) {
		System.out.println("addEquipment �޼��� ���� ����");
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", equipment);
	}
	//�������� ��Ʈ�� �����ϱ�
	public int addEquementSheet(String dataArray
								, String mergeArray
								, String borderArray
								, String countRow
								, String countCol
								, String equipmentCategoryNo
								, String sheetName
								, HttpSession session) {
		
		System.out.println("save method ���� ����");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		Sheet sheet = new Sheet();
		sheet.setLicenseKindergarten(licenseKindergarten);
		sheet.setTeacherNo(teacherNo);
		sheet.setEquipmentCategoryNo(equipmentCategoryNo);
		sheet.setValueName(sheetName);
		sheet.setValueMerge(mergeArray);
		sheet.setValueVal(dataArray);
		sheet.setValueBorders(borderArray);
		sheet.setValueRow(countRow);
		sheet.setValueCols(countCol);
		
        return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipmentSheet", sheet);
    }
	
	// �������� ��Ʈ�� �ε��ϱ�
	public Sheet selectEquipmentSheet(HttpSession session
								,String reroad
								,String sheetCategoryNo) {
		
		System.out.println("selectEquipment �޼��� ���� ����");
		
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Sheet sheet = new Sheet();
		
		sheet.setLicenseKindergarten(licenseKindergarten);
		sheet.setValueName(reroad);
		sheet.setEquipmentCategoryNo(sheetCategoryNo);
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectLoadEquipmentSheet", sheet);
	}
	
	// ��ǰ ����Ʈ ī�װ� �ε��ϱ�
	public List<Map<String, Object>> selectSheetCategory() {
				
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentCategory");
	}

}
