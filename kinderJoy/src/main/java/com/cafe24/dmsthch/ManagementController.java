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
						,@RequestParam(value="managementEquipmentPageValue", required=false, defaultValue="6") String managementEquipmentPageValue
						,@RequestParam(value="startDay", required=false, defaultValue="") String startDay
						,@RequestParam(value="fanalDay", required=false, defaultValue="") String fanalDay){
		System.out.println("ManagementController test11 메서드 실행");
		System.out.println(managementEquipmentPageValue);
		if(managementEquipmentPageValue.equals("6")) {
			if(startDay.equals("")||fanalDay.equals("")) {
			    Calendar calendar = new GregorianCalendar(Locale.KOREA);
			    int nYear = calendar.get(Calendar.YEAR);
			    int nMonth = calendar.get(Calendar.MONTH) + 1;
			    if(nMonth < 10) {   	
			    	int nDay = calendar.get(Calendar.DAY_OF_MONTH);				    
				    if(nDay < 10) {
				    	startDay = nYear + "-" + "0" + nMonth + "-" + "0" + nDay;
			    	} else {
			    		startDay = nYear + "-" + "0" + nMonth + "-" + nDay;
			    	}
			    } else {
				    int nDay = calendar.get(Calendar.DAY_OF_MONTH);
				    if(nDay < 10) {
				    	startDay = nYear + "-" + "0" + nMonth + "-" + "0" + nDay;
			    	} else {
			    		startDay = nYear + "-" + "0" + nMonth + "-" + nDay;
			    	}
			    }
			    List<ManagementList> managementList= dao.selectManagementDayList(startDay,startDay);
			    model.addAttribute("managementList",managementList);
			    model.addAttribute("managementEquipmentPageValue",managementEquipmentPageValue);
			    model.addAttribute("startDay",startDay);
			    model.addAttribute("fanalDay",startDay);
			} else {
			    List<ManagementList> managementList= dao.selectManagementDayList(startDay,fanalDay);
			    model.addAttribute("managementList",managementList);
			    model.addAttribute("managementEquipmentPageValue",managementEquipmentPageValue);
			    model.addAttribute("startDay",startDay);
			    model.addAttribute("fanalDay",fanalDay);
			}
		} else {
			if(startDay.equals("")||fanalDay.equals("")) {
			    Calendar calendar = new GregorianCalendar(Locale.KOREA);
			    int nYear = calendar.get(Calendar.YEAR);
			    int nMonth = calendar.get(Calendar.MONTH) + 1;
			    if(nMonth < 10) {   	
			    	int nDay = calendar.get(Calendar.DAY_OF_MONTH);				    
				    if(nDay < 10) {
				    	startDay = nYear + "-" + "0" + nMonth + "-" + "0" + nDay;
			    	} else {
			    		startDay = nYear + "-" + "0" + nMonth + "-" + nDay;
			    	}
			    } else {
				    int nDay = calendar.get(Calendar.DAY_OF_MONTH);
				    if(nDay < 10) {
				    	startDay = nYear + "-" + "0" + nMonth + "-" + "0" + nDay;
			    	} else {
			    		startDay = nYear + "-" + "0" + nMonth + "-" + nDay;
			    	}
			    }
			    List<ManagementList> managementList= dao.selectManagementCategoryDayList(startDay,startDay,managementEquipmentPageValue);
			    model.addAttribute("managementList",managementList);
			    model.addAttribute("managementEquipmentPageValue",managementEquipmentPageValue);
			    model.addAttribute("startDay",startDay);
			    model.addAttribute("fanalDay",startDay);
			} else {
			    List<ManagementList> managementList= dao.selectManagementCategoryDayList(startDay,fanalDay,managementEquipmentPageValue);
			    model.addAttribute("managementList",managementList);
			    model.addAttribute("managementEquipmentPageValue",managementEquipmentPageValue);
			    model.addAttribute("startDay",startDay);
			    model.addAttribute("fanalDay",fanalDay);
			}
		}
		return "Management/ManagementEquipmentList";
	}
}
