package com.cafe24.dmsthch;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cafe24.dmsthch.Management.ManagementDao;
import com.cafe24.dmsthch.Management.ManagementEquipment;
import com.cafe24.dmsthch.Management.ManagementList;
import com.cafe24.dmsthch.Management.ManagementPlusMinus;
import com.cafe24.dmsthch.Management.ManagementYesterDayEquipment;

@Controller
public class ManagementController {
	@Autowired
	ManagementDao dao;
	@RequestMapping(value = "test11", method = RequestMethod.GET)
	public String test10(Model model
						,@RequestParam(value="test", required=false, defaultValue="1") String test
						,@RequestParam(value="testDay", required=false, defaultValue="") String testDay
						,@RequestParam(value="testDay2", required=false, defaultValue="") String testDay2){
		System.out.println("ManagementController test11 메서드 실행");
		System.out.println(test);
		if(test.equals("1")) {
			if(testDay.equals("")) {
			    Calendar calendar = new GregorianCalendar(Locale.KOREA);
			    int nYear = calendar.get(Calendar.YEAR);
			    int nMonth = calendar.get(Calendar.MONTH) + 1;
			    int nDay = calendar.get(Calendar.DAY_OF_MONTH);
			    testDay = nYear + "-" + nMonth + "-" + nDay;
			    List<ManagementList> managementList= dao.selectManagementDayList(testDay);
			    model.addAttribute("managementList",managementList);
			}
		}
		return "Management/NewFile";
	}
}
