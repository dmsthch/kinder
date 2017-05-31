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
	@RequestMapping(value = "Management", method = RequestMethod.GET)
	public String test10(Model model
						,@RequestParam(value="test", required=false, defaultValue="6") String test
						,@RequestParam(value="testDay", required=false, defaultValue="") String testDay
						,@RequestParam(value="testDay2", required=false, defaultValue="") String testDay2){
		System.out.println("ManagementController test11 메서드 실행");
		System.out.println(test);
		if(test.equals("6")) {
			if(testDay.equals("")||testDay2.equals("")) {
			    Calendar calendar = new GregorianCalendar(Locale.KOREA);
			    int nYear = calendar.get(Calendar.YEAR);
			    int nMonth = calendar.get(Calendar.MONTH) + 1;
			    if(nMonth < 10) {
			    	int nDay = calendar.get(Calendar.DAY_OF_MONTH);
				    testDay = nYear + "-" + "0" + nMonth + "-" + nDay;
			    } else {
				    int nDay = calendar.get(Calendar.DAY_OF_MONTH);
				    testDay = nYear + "-" + nMonth + "-" + nDay;
			    }
			    List<ManagementList> managementList= dao.selectManagementDayList(testDay,testDay);
			    model.addAttribute("managementList",managementList);
			    model.addAttribute("test",test);
			    model.addAttribute("testDay",testDay);
			    model.addAttribute("testDay2",testDay);
			} else {
			    List<ManagementList> managementList= dao.selectManagementDayList(testDay,testDay2);
			    model.addAttribute("managementList",managementList);
			    model.addAttribute("test",test);
			    model.addAttribute("testDay",testDay);
			    model.addAttribute("testDay2",testDay2);
			}
		} else {
			if(testDay.equals("")||testDay2.equals("")) {
			    Calendar calendar = new GregorianCalendar(Locale.KOREA);
			    int nYear = calendar.get(Calendar.YEAR);
			    int nMonth = calendar.get(Calendar.MONTH) + 1;
			    if(nMonth < 10) {
			    	int nDay = calendar.get(Calendar.DAY_OF_MONTH);
				    testDay = nYear + "-" + "0" + nMonth + "-" + nDay;
			    } else {
				    int nDay = calendar.get(Calendar.DAY_OF_MONTH);
				    testDay = nYear + "-" + nMonth + "-" + nDay;
			    }
			    List<ManagementList> managementList= dao.selectManagementCategoryDayList(testDay,testDay,test);
			    model.addAttribute("managementList",managementList);
			    model.addAttribute("test",test);
			    model.addAttribute("testDay",testDay);
			    model.addAttribute("testDay2",testDay);
			} else {
			    List<ManagementList> managementList= dao.selectManagementCategoryDayList(testDay,testDay2,test);
			    model.addAttribute("managementList",managementList);
			    model.addAttribute("test",test);
			    model.addAttribute("testDay",testDay);
			    model.addAttribute("testDay2",testDay2);
			}
		}
		return "Management/NewFile";
	}
}
