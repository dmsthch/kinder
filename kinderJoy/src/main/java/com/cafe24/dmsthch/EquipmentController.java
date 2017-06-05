package com.cafe24.dmsthch;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.dmsthch.Equipment.Equipment;
import com.cafe24.dmsthch.Equipment.EquipmentDao;
import com.cafe24.dmsthch.Equipment.EquipmentPlusMinus;
import com.cafe24.dmsthch.Equipment.EquipmentRequest;
import com.cafe24.dmsthch.Equipment.Sheet;

@Controller
public class EquipmentController {
	
	@Autowired
	EquipmentDao dao;
	@RequestMapping(value = "RequestSave", method = RequestMethod.POST)
	public String test07(@RequestParam(value="teacherNo") String teacherNo
						,@RequestParam(value="categoryNo") String categoryNo
						,@RequestParam(value="requestAmount") String requestAmount
						,@RequestParam(value="requestName") String requestName
						,@RequestParam(value="requestDate") String requestDate
						,@RequestParam(value="requestPrice") String requestPrice
						,@RequestParam(value="requestStant") String requestStant
						,@RequestParam(value="requestReason") String requestReason
						,HttpSession session){
		
		System.out.println("---RequestSave---");
		System.out.println(teacherNo);
		System.out.println(categoryNo);
		System.out.println(requestAmount);
		System.out.println(requestName);
		System.out.println(requestDate);
		System.out.println(requestPrice);
		System.out.println(requestStant);
		System.out.println(requestReason);
		System.out.println("---RequestSave---");
		
		dao.addEquipmentRequest(teacherNo, categoryNo, requestAmount, requestName, requestDate, requestPrice, requestStant, requestReason, session);
		
		return "redirect:/EquipmentRequest";
	}
	
	@RequestMapping(value = "EquipmentRequestListRemove", method = RequestMethod.POST)
	@ResponseBody
	public int testListSave(@RequestParam(value="textIP") String textIP
								,HttpSession session){
		System.out.println("textIP Ȯ�� : " + textIP);
		
		int returnResult = dao.removeEquipmentRequest(textIP, session);
		System.out.println("returnResult �� Ȯ�� : " + returnResult);
		return returnResult;
	}
	
	@RequestMapping(value = "Equipment", method = RequestMethod.GET)
	public String test01(Model model
						,HttpSession session){
		List<Map<String, Object>> getCategory = dao.selectSheetCategory();
		System.out.println(getCategory + "getCategory Ȯ��");
		model.addAttribute("getCategory", getCategory);
	
		List<EquipmentPlusMinus> plusMinus = dao.selectEquipmentPlusMinusList();
		model.addAttribute("plusMinus",plusMinus);
		
/*		Equipment equipmnet = new Equipment();
		String licenseKindergarten = (String) session.getAttribute("licenseKindergarten");
		
		equipmnet.setLicenseKindergarten(licenseKindergarten);
		
		int equipmnetCount = dao.selectEquipmentCount(session);
		System.out.println(equipmnetCount + "equipmnetCount Ȯ��");
		List<Equipment> equipmentList = dao.selectEquipment(equipmnetCount);
		
		model.addAttribute("equipmentList",equipmentList);*/
		return "Equipment/Equipment";
	}
	@RequestMapping(value = "EquipmentRequest", method = RequestMethod.GET)
	public String test05(HttpSession session
						,Model model){
		String teacherName = (String)session.getAttribute("teacherName");
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		model.addAttribute("teacherName",teacherName);
		model.addAttribute("teacherNo",teacherNo);
		return "Equipment/EquipmentRequest";
	}
	@RequestMapping(value = "EquipmentRequestList", method = RequestMethod.GET)
	public String test06(Model model){
		List<EquipmentRequest> equipmentRequest = dao.selectEqipmentRequest();
		model.addAttribute("equipmentRequest",equipmentRequest);
		return "Equipment/EquipmentRequestList";
	}
	@RequestMapping(value = "sheet", method = RequestMethod.GET)
	public String sheet(Model model
						,@RequestParam(value="sheetNo") String sheetNo){
		model.addAttribute("sheetNo",sheetNo);
		return "Equipment/sheet";
	}
/*	@RequestMapping(value = "test01", method = RequestMethod.GET)
	public String test02(Model model){
		List<Map<String, Object>> getCategory = dao.selectSheetCategory();
		System.out.println(getCategory + "getCategory Ȯ��");
		model.addAttribute("getCategory", getCategory);
		return "Equipment/NewFile";
	}*/
/*	@RequestMapping(value = "save", method = RequestMethod.GET)
	public String save(Model model
						,@RequestParam(value="jsonStr") String jsonStr
						,HttpSession session){
		
		int teacherNo = (Integer)session.getAttribute("teacherNo");
		String licenseKindergarten = (String) session.getAttribute("licenseKindergarten");
		
		System.out.println("save method ����");
		
		int sung_gong = dao.addEquementSheet(jsonStr, teacherNo, licenseKindergarten);
		
		System.out.println("save method ����");
		
		if(sung_gong == 1){
			System.out.println("���� �Է� ����");
		} else {
			System.out.println("���� �Է� ����");
		}
		return "Equipment/Equipment";
	}*/
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String listSave(Model model
							, @RequestParam(value="dataArray") String dataArray
							, @RequestParam(value="mergeArray", required=false, defaultValue="") String mergeArray
							, @RequestParam(value="borderArray", required=false, defaultValue="") String borderArray
							, @RequestParam(value="countRow") String countRow
							, @RequestParam(value="countCol") String countCol
							, @RequestParam(value="sheetName") String sheetName
							, @RequestParam(value="sheetCategory") String sheetCategory
							, HttpSession session){
		
		int gategoryNoTest = dao.selectSheetValueNo(session, sheetCategory, sheetName);
		if(gategoryNoTest == 0) {
			dao.addEquementSheet(dataArray, mergeArray, borderArray, countRow, countCol, sheetCategory, sheetName, session);
		} else {
			dao.updateSheet(session, mergeArray, dataArray, borderArray, countRow, countCol, sheetCategory, sheetName);
		}	
		return "Equipment/sheet";
	}
	@RequestMapping(value = "reroad", method = RequestMethod.GET)
	public String road(Model model
						,HttpSession session
						,@RequestParam(value="sheetName") String reroad
						,@RequestParam(value="sheetCategoryNo") String sheetCategoryNo){
		
		Sheet sheet = dao.selectEquipmentSheet(session, reroad, sheetCategoryNo);
		model.addAttribute("sheet", sheet);
		
		return "Equipment/LoadSheet";
	}
	@RequestMapping(value = "saveLoad", method = RequestMethod.GET)
	public String test04(HttpSession session
						,Model model){
		Equipment equipmnet = new Equipment();
		String licenseKindergarten = (String) session.getAttribute("licenseKindergarten");

		return "Equipment/NewFile";
	}
	// ��ǰ ���� ����
	@RequestMapping(value = "equipmentListSave", method = RequestMethod.POST)
	@ResponseBody
	public int test03(@RequestParam(value="boardCategoryNo") String boardCategoryNo
						,@RequestParam(value="equipmentName") String equipmentName
						,@RequestParam(value="equipmentAmount", required=false, defaultValue="") String equipmentAmount
						,@RequestParam(value="updatePlusInput", required=false, defaultValue="") String updatePlusInput
						,@RequestParam(value="updateMinusInput", required=false, defaultValue="") String updateMinusInput
						,@RequestParam(value="equipmentCost", required=false, defaultValue="") String equipmentCost
						,@RequestParam(value="equipmentTotalCost", required=false, defaultValue="PLUS") String equipmentTotalCost
						,@RequestParam(value="equipmentCustomer") String equipmentCustomer
						,@RequestParam(value="equipmentState") String equipmentState
						,HttpSession session){
		
		System.out.println("��ǰ ���� �޼��� ����");
		System.out.println(boardCategoryNo);
		System.out.println(equipmentName);
		System.out.println(equipmentAmount);
		System.out.println(updatePlusInput);
		System.out.println(updateMinusInput);
		System.out.println(equipmentCost);
		System.out.println(equipmentTotalCost);
		System.out.println(equipmentCustomer);
		System.out.println(equipmentState);
		int resultInsert;
		Equipment equipment = new Equipment();;
		equipment = dao.selectTestEquipment(equipmentName, session);
		System.out.println(equipment + "equipment Ȯ��");
		if(equipment == null) {
			dao.addTestEquipment(session, equipmentName, boardCategoryNo, equipmentState);
			equipment = new Equipment();
			equipment = dao.selectTestEquipment(equipmentName, session);
			int selectEquipemntNo = equipment.getEquipmentNo();
			if(updatePlusInput.equals("")) {
				System.out.println("minus Ȯ��");
				resultInsert = dao.addTestEquipmentValueMinus(selectEquipemntNo, equipmentCost, equipmentAmount, equipmentCustomer);
			} else {
				System.out.println("plus Ȯ��");
				dao.addTestEquipmentValueMinus(selectEquipemntNo, equipmentCost, "0", equipmentCustomer);
				resultInsert = dao.addTestEquipmentValuePlus(selectEquipemntNo, updatePlusInput, equipmentCost, equipmentCustomer);
			}
		} else {
			int selectEquipemntNo = equipment.getEquipmentNo();
			if(updatePlusInput.equals("")) {
				resultInsert = dao.addTestEquipmentValueMinus(selectEquipemntNo, equipmentCost, updateMinusInput, equipmentCustomer);
			} else {
				resultInsert = dao.addTestEquipmentValuePlus(selectEquipemntNo, equipmentCost, updatePlusInput, equipmentCustomer);
			}
		}
		return resultInsert;
	}
	// �������� ��Ʈ ����
	@RequestMapping(value = "SheetList", method = RequestMethod.GET)
	public String sheetList(Model model
							,HttpSession session){
		System.out.println("��Ʈ ����Ʈ �޼��� ����");
		List<Map<String, Object>> getCategory = dao.selectSheetCategory();
		model.addAttribute("getCategory", getCategory);
		
		List<Sheet> sheet = dao.selectEquipmentName(session);
		
		model.addAttribute("sheet", sheet);
		
		System.out.println("���� �� Ȯ��");
		System.out.println(getCategory);
		System.out.println(sheet);
		return "Equipment/SheetList";
	}
}	
