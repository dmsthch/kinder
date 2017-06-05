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
	// select 값 있을 경우 업데이트
	public int updateSheet(HttpSession session
							,String mergeArray
							,String dataArray
							,String borderArray
							,String countRow
							,String countCol
							,String sheetCategory
							,String sheetName) {
		System.out.println("updateSheet 내용 실행");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Sheet sheet = new Sheet();
		sheet.setValueMerge(mergeArray);
		sheet.setValueVal(dataArray);
		sheet.setValueBorders(borderArray);
		sheet.setValueRow(countRow);
		sheet.setValueCols(countCol);
		sheet.setLicenseKindergarten(licenseKindergarten);
		sheet.setEquipmentCategoryNo(sheetCategory);
		sheet.setValueName(sheetName);
		return sqlSessionTemplate.update("com.cafe24.dmsthch.Equipment.EquipmentMapper.updateSheet", sheet);
	}
	// select sheet_value 확인하여 업데이트인지 인서트인지 확인
	public int selectSheetValueNo(HttpSession session
									,String equipmentCategoryNo
									,String valueName) {
		System.out.println("selectSheetValueNo 내용 실행");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Sheet sheet = new Sheet();
		sheet.setLicenseKindergarten(licenseKindergarten);
		sheet.setEquipmentCategoryNo(equipmentCategoryNo);
		sheet.setValueName(valueName);
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectSheetValueNo", sheet);
	}
	
	// test_equipment_value insert
	public int addTestEquipmentValuePlus(int selectEquipemntNo
									,String equipmentCost
									,String equipmentAmount
									,String equipmentCustomer) {
		System.out.println("addTestEquipmentValuePlus 내용 실행");
		String equipmentNo = Integer.toString(selectEquipemntNo);
		EquipmentValue equipmentValue = new EquipmentValue();
		equipmentValue.setEquipmentNo(equipmentNo);
		equipmentValue.setEquipmentCost(equipmentCost);
		equipmentValue.setEquipmentAmount(equipmentAmount);
		equipmentValue.setEquipmentCustomer(equipmentCustomer);
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addTestEquipmentValuePlus",equipmentValue);
	}
	public int addTestEquipmentValueMinus(int selectEquipemntNo
			,String equipmentCost
			,String equipmentAmount
			,String equipmentCustomer) {
		System.out.println("addTestEquipmentValueMinus 내용 실행");
		String equipmentNo = Integer.toString(selectEquipemntNo);
		EquipmentValue equipmentValue = new EquipmentValue();
		equipmentValue.setEquipmentNo(equipmentNo);
		equipmentValue.setEquipmentCost(equipmentCost);
		equipmentValue.setEquipmentAmount(equipmentAmount);
		equipmentValue.setEquipmentCustomer(equipmentCustomer);
	return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addTestEquipmentValueMinus",equipmentValue);
	}
	// test_equipment select 및 중복검사
	public Equipment selectTestEquipment(String equipmentName
										,HttpSession session) {
		System.out.println("selectTestEquipment 내용 실행");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Equipment equipment = new Equipment();
		equipment.setEquipmentName(equipmentName);
		equipment.setLicenseKindergarten(licenseKindergarten);
		System.out.println("중간점검");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectTestEquipment",equipment);
	}
	// test_equipment insert
	public int addTestEquipment(HttpSession session
								,String equipmentName
								,String boardCategoryNo
								,String equipmentState) {
		System.out.println("addTestEquipment 내용 실행");
		System.out.println(boardCategoryNo);
		System.out.println(equipmentName);
		System.out.println(equipmentState);
		System.out.println("--------");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		Equipment equipment = new Equipment();
		
		equipment.setLicenseKindergarten(licenseKindergarten);
		equipment.setEquipmentName(equipmentName);
		equipment.setTeacherNo(teacherNo);
		equipment.setCategoryNo(boardCategoryNo);
		equipment.setEquipmentState(equipmentState);
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addTestEquipment",equipment);
	}
	//같은 네임품명 플러스값 총합, 마이너스값 총합 값  가져오기
	public List<EquipmentPlusMinus> selectEquipmentPlusMinusList() {
		System.out.println("selectEquipmentPlusMinusList 내용 실행");

		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmnetPlusMinusList");
	}
	// 비품 건의서 삭제
	public int removeEquipmentRequest(String requestNo
										,HttpSession session) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		EquipmentRequest equipmentRequest = new EquipmentRequest();
		equipmentRequest.setRequestNo(requestNo);
		equipmentRequest.setLicenseKindergarten(licenseKindergarten);
		return sqlSessionTemplate.delete("com.cafe24.dmsthch.Equipment.EquipmentMapper.removeEquipmentRequest",equipmentRequest);
	}
	// 비품 건의서 리스트 출력
	public List<EquipmentRequest> selectEqipmentRequest() {
		System.out.println("selectEqipmentRequest 메서드 내용 실행");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentRequest");
	}
	// 비품 건의서 입력
	public int addEquipmentRequest(String teacherNo
									,String categoryNo
									,String requestAmount
									,String requestName
									,String requestDate
									,String requestPrice
									,String requestStant
									,String requestReason
									,HttpSession session) {
		System.out.println("addEquipmentRequest 메서드 내용 실행");
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
	// 비품 품의서 리스트 네임 출력하기
	public List<Sheet> selectEquipmentName(HttpSession session) {
		System.out.println("selectEquipmentName 메서드 내용 실행");
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectSheetName", licenseKindergarten);
	}
	// 비품 리스트 카운트 구하기
/*	public int selectEquipmentCount(HttpSession session) {
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		System.out.println("selectEquipmentCount 메서드 내용 실행");
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectCountEquipmentList", licenseKindergarten);
	}*/
	// 비품 리스트 출력하기
/*	public List<Equipment> selectEquipment(int equipmnetCount) {
		System.out.println("selectEquipment 메서드 내용 실행");
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentList", equipmnetCount);
	}*/
	// 비품 한줄 저장하기
/*	public int addEquipment(Equipment equipment) {
		System.out.println("addEquipment 메서드 내용 실행");
		
		return sqlSessionTemplate.insert("com.cafe24.dmsthch.Equipment.EquipmentMapper.addEquipment", equipment);
	}*/
	//스프레드 시트값 저장하기
	public int addEquementSheet(String dataArray
								, String mergeArray
								, String borderArray
								, String countRow
								, String countCol
								, String equipmentCategoryNo
								, String sheetName
								, HttpSession session) {
		
		System.out.println("save method 내용 실행");
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
	
	// 스프레드 시트값 로드하기
	public Sheet selectEquipmentSheet(HttpSession session
								,String reroad
								,String sheetCategoryNo) {
		
		System.out.println("selectEquipment 메서드 내용 실행");
		
		String licenseKindergarten = (String)session.getAttribute("licenseKindergarten");
		Sheet sheet = new Sheet();
		
		sheet.setLicenseKindergarten(licenseKindergarten);
		sheet.setValueName(reroad);
		sheet.setEquipmentCategoryNo(sheetCategoryNo);
		return sqlSessionTemplate.selectOne("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectLoadEquipmentSheet", sheet);
	}
	
	// 비품 리스트 카테고리 로드하기
	public List<Map<String, Object>> selectSheetCategory() {
				
		return sqlSessionTemplate.selectList("com.cafe24.dmsthch.Equipment.EquipmentMapper.selectEquipmentCategory");
	}

}
