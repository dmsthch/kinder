package com.cafe24.dmsthch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cafe24.dmsthch.Management.ManagementDao;
import com.cafe24.dmsthch.Management.ManagementEquipment;
import com.cafe24.dmsthch.Management.ManagementPlusMinus;
import com.cafe24.dmsthch.Management.ManagementYesterDayEquipment;

@Controller
public class ManagementController {
	@Autowired
	ManagementDao dao;
	@RequestMapping(value = "test11", method = RequestMethod.GET)
	public String test10(Model model
						,@RequestParam(value="test", required=false, defaultValue="1") String test){
		System.out.println("ManagementController test11 메서드 실행");
		System.out.println(test);
		if(test.equals("1")) {
/*			int countNo = dao.selectCountEquipmentList();
			List<ManagementEquipment> todayEquipment = dao.selectManagementList(countNo);
			List<ManagementYesterDayEquipment> yesterdayEquipment = dao.selectManagementYesterDayList(countNo);
			model.addAttribute("todayEquipment",todayEquipment);
			model.addAttribute("yesterdayEquipment",yesterdayEquipment);*/
			List<ManagementPlusMinus> plusMinus = dao.selectManagementPlusMinusList();
			model.addAttribute("plusMinus",plusMinus);
		}
		return "Management/NewFile";
	}
}
