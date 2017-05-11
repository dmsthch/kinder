package com.cafe24.dmsthch;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	//�ߴ� �� ��û
	@RequestMapping(value="/ChildDevelopment" , method=RequestMethod.GET)
	public String ChildDevelopment() {
		System.out.println("ChildDevelopment �� ��û");
		return "Child/ChildDevelopment";
	}
	
	
	//���� �� ��û
		@RequestMapping(value="/ChildModify", method=RequestMethod.GET)
		public String ChildModify(Model model 
								 , @RequestParam(value="kid_no" ,required=true)int kid_no) {
			Child child = childDao.getChild(kid_no);
			child.setKidNo(kid_no);
			model.addAttribute("child", child);
			
			return "Child/ChildModify";
		}
		//���� ��û
		@RequestMapping(value="/ChildModify", method=RequestMethod.POST)
		public String ChildModify(Child child) {
			childDao.updateChild(child);
			return "redirect:/ChildList?kid_no="+child.getKidNo();
		}
		//����Ʈ ��û
				@RequestMapping(value="/ChildList" , method=RequestMethod.GET)
				public String ChildList(Model model 
										, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage
										, HttpSession session) {
					
					int teacherNo = 0;
					String license = "";
					if(session.getAttribute("teacherNo") != null){
						teacherNo = (Integer) session.getAttribute("teacherNo");
						license = (String) session.getAttribute("licenseKindergarten");
					}
					
					
					int ChildCount = childDao.getChildCount();
					int pagePerRow = 10;
					int lastPage = (int)(Math.ceil(ChildCount/currentPage));
				//	List<Object> list = childDao.getChildList(currentPage, pagePerRow);

					List<Child> list = childDao.getSeveralList(license, teacherNo, currentPage, pagePerRow);
					model.addAttribute("currentPage", currentPage);
					model.addAttribute("ChildCount", ChildCount);
					model.addAttribute("pagePerRow", pagePerRow);
					model.addAttribute("lastPage", lastPage);
					model.addAttribute("list", list);
					
					return "Child/ChildList";
				}
	
				//����Ʈ ��û
				@RequestMapping(value="/ChildClass" , method=RequestMethod.GET)
				public String ChildClass(Model model 
										, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
					
					int ChildCount = childDao.getChildCount();
					int pagePerRow = 10;
					int lastPage = (int)(Math.ceil(ChildCount/currentPage));
					List<Object> list = childDao.getClass(currentPage, pagePerRow);

					model.addAttribute("currentPage", currentPage);
					model.addAttribute("ChildCount", ChildCount);
					model.addAttribute("pagePerRow", pagePerRow);
					model.addAttribute("lastPage", lastPage);
					model.addAttribute("list", list);
					
					return "Child/ChildClass";
				}
	
				//�Է� �� ��û
				@RequestMapping(value="/ChildAdd" , method=RequestMethod.GET)
				public String ChildAdd(HttpSession session, Model model) {
					System.out.println("ChildAdd �� ��û");
					
					String license = "";
					if(session.getAttribute("teacherNo") != null){
						license = (String) session.getAttribute("teacherLicense");
					}
					model.addAttribute("teacherLicense");
					
					return "Child/ChildAdd";
				}
		
		//�Է� ��û
		@RequestMapping(value="/ChildAdd" , method=RequestMethod.POST)
		public String ChildAdd(Child child) {
			

			System.out.println(child.getLicenseKindergarten());
			System.out.println(child.getKidName());
			System.out.println(child.getKidBirth());
			System.out.println(child.getKidAddress());
			System.out.println(child.getKidProtectorPhone());
			System.out.println(child.getKidPrecautions());
			System.out.println(child.getKidGender());
			System.out.println(child.getKidCommuting());
			System.out.println(child.getKidProtectorPhoneReserve());
			
			
			childDao.insertChild(child);
			System.out.println(child);
			return "redirect:/ChildList";
		}
		
		@RequestMapping(value="/ChildFormation" , method=RequestMethod.GET)
		public String ChildFormation() {
			System.out.println("ChildFormation �� ��û");
			return "Child/ChildFormation";
		}
		
		@RequestMapping(value="/ClassAdd" , method=RequestMethod.GET)
		public String ClassAdd() {
			System.out.println("ClassAdd �� ��û");
			return "Child/ClassAdd";
		}
		

}
