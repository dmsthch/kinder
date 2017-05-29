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
	// test_equipment_value insert
	public int addTestEquipmentValuePlus(int selectEquipemntNo
									,String testPrice
									,String testValue
									,String testCustomer) {
		System.out.println("addTestEquipmentValuePlus ���� ����");
		String equipmentNo = Integer.toString(selectEquipemntNo);
		EquipmentValue equipmentValue = new EquipmentValue();
		equipmentValue.setEquipmentNo(equipmentNo);
		equipmentValue.setEquipmentCost(testPrice);
		equipmentValue.setEquipmentAmount(testValue);
		equipmentValue.setEquipmentCustomer(testCustomer);
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addTestEquipmentValuePlus",equipmentValue);
	}
	public int addTestEquipmentValueMinus(int selectEquipemntNo
			,String testPrice
			,String testValue
			,String testCustomer) {
		System.out.println("addTestEquipmentValueMinus ���� ����");
		String equipmentNo = Integer.toString(selectEquipemntNo);
		EquipmentValue equipmentValue = new EquipmentValue();
		equipmentValue.setEquipmentNo(equipmentNo);
		equipmentValue.setEquipmentCost(testPrice);
		equipmentValue.setEquipmentAmount(testValue);
		equipmentValue.setEquipmentCustomer(testCustomer);
	return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addTestEquipmentValueMinus",equipmentValue);
	}
	// test_equipment select �� �ߺ��˻�
	public Equipment selectTestEquipment(String equipmentName
										,HttpSession session) {
		System.out.println("selectTestEquipment ���� ����");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Equipment equipment = new Equipment();
		equipment.setEquipmentName(equipmentName);
		equipment.setLicenseKindergarten(licenseKindergarten);
		System.out.println("�߰�����");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectTestEquipment",equipment);
	}
	// test_equipment insert
	public int addTestEquipment(String equipmentName
								,String testCategoryNo
								,String equipmentCategorySelect
								,String testState
								,HttpSession session) {
		System.out.println("addTestEquipment ���� ����");
		System.out.println(testCategoryNo);
		System.out.println(equipmentCategorySelect);
		System.out.println("--------");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		Equipment equipment = new Equipment();
		
		equipment.setLicenseKindergarten(licenseKindergarten);
		equipment.setEquipmentName(equipmentName);
		equipment.setTeacherNo(teacherNo);
		if(testCategoryNo.equals("")) {
			System.out.println("testCategofyNo if");
			equipment.setCategoryNo(equipmentCategorySelect);
		}else if(equipmentCategorySelect.equals("")) {
			System.out.println("equipmentCategorySelect else if");
			equipment.setCategoryNo(testCategoryNo);
		}
		equipment.setEquipmentState(testState);
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addTestEquipment",equipment);
	}
	//���� ����ǰ�� �÷����� ����, ���̳ʽ��� ���� ��  ��������
	public List<EquipmentPlusMinus> selectEquipmentPlusMinusList() {
		System.out.println("selectEquipmentPlusMinusList ���� ����");

		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmnetPlusMinusList");
	}
	// ��ǰ ���Ǽ� ����
	public int removeEquipmentRequest(String requestNo
										,HttpSession session) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		EquipmentRequest equipmentRequest = new EquipmentRequest();
		equipmentRequest.setRequestNo(requestNo);
		equipmentRequest.setLicenseKindergarten(licenseKindergarten);
		return sqlSessionTemplate.delete("com.cafe24.dmsthch.Equipment.EquipmentMapper.removeEquipmentRequest",equipmentRequest);
	}
	// ��ǰ ���Ǽ� ����Ʈ ���
	public List<EquipmentRequest> selectEqipmentRequest() {
		System.out.println("selectEqipmentRequest �޼��� ���� ����");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentRequest");
	}
	// ��ǰ ���Ǽ� �Է�
	public int addEquipmentRequest(String teacherNo
									,String categoryNo
									,String requestAmount
									,String requestName
									,String requestDate
									,String requestPrice
									,String requestStant
									,String requestReason
									,HttpSession session) {
		System.out.println("addEquipmentRequest �޼��� ���� ����");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		EquipmentRequest equipmentRequest = new EquipmentRequest();
		equipmentRequest.setLicenseKindergarten(licenseKindergarten);
		equipmentRequest.setRequestName(requestName);
		equipmentRequest.setCategoryNo(categoryNo);
		equipmentRequest.setRequestAmount(requestAmount);
		equipmentRequest.setTeacherNo(teacherNo);
		equipmentRequest.setRequestDay(requestDate);
		equipmentRequest.setRequestReason(requestReason);
		equipmentRequest.setRequestPrice(requestPrice);
		equipmentRequest.setRequestStant(requestStant);
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipmentRequest",equipmentRequest);
	}
	// ��ǰ ǰ�Ǽ� ����Ʈ ���� ����ϱ�
	public List<Sheet> selectEquipmentName(HttpSession session) {
		System.out.println("selectEquipmentName �޼��� ���� ����");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectSheetName", licenseKindergarten);
	}
	// ��ǰ ����Ʈ ī��Ʈ ���ϱ�
/*	public int selectEquipmentCount(HttpSession session) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println("selectEquipmentCount �޼��� ���� ����");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectCountEquipmentList", licenseKindergarten);
	}*/
	// ��ǰ ����Ʈ ����ϱ�
/*	public List<Equipment> selectEquipment(int equipmnetCount) {
		System.out.println("selectEquipment �޼��� ���� ����");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentList", equipmnetCount);
	}*/
	// ��ǰ ���� �����ϱ�
/*	public int addEquipment(Equipment equipment) {
		System.out.println("addEquipment �޼��� ���� ����");
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", equipment);
	}*/
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
