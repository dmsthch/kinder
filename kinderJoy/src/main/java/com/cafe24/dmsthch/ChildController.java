package com.cafe24.dmsthch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Child.Child;
import com.cafe24.dmsthch.Child.ChildDao;


@Controller
public class ChildController {
	@Autowired
	private ChildDao childDao;
	
	//리스트 요청
		@RequestMapping(value="/ChildList" , method=RequestMethod.GET)
		public String ChildList(Model model 
								, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
			int ChildCount = childDao.getChildCount();
			int pagePerRow = 10;
			int lastPage = (int)(Math.ceil(ChildCount/currentPage));
			List<Object> list = childDao.getChildList(currentPage, pagePerRow);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("ChildCount", ChildCount);
			model.addAttribute("pagePerRow", pagePerRow);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list", list);
			
			return "Child/ChildList";
		}
	
	//입력 폼 요청
		@RequestMapping(value="/ChildAdd" , method=RequestMethod.GET)
		public String ChildAdd() {
			System.out.println("ChildAdd 폼 요청");
			return "Child/ChildAdd";
		}
		
		@RequestMapping(value="/ChildAdd" , method=RequestMethod.POST)
		public String ChildAdd(Child child) {
			

			System.out.println(child.getLicense_kindergarten());
			System.out.println(child.getKid_name());
			System.out.println(child.getKid_birth());
			System.out.println(child.getKid_address());
			System.out.println(child.getKid_protector_phone());
			System.out.println(child.getKid_precautions());
			System.out.println(child.getKid_gender());
			System.out.println(child.getKid_commuting());
			System.out.println(child.getKid_protector_phone_reserve());
			
			
			childDao.insertChild(child);
			System.out.println(child);
			return "redirect:/ChildList";
		}

}
