package com.cafe24.dmsthch;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Child.Child;
import com.cafe24.dmsthch.Child.ChildClass;
import com.cafe24.dmsthch.Child.ChildDao;

@Controller
public class ChildController {
	@Autowired
	private ChildDao childDao;
	
	//�׺񿡼� �� ��������, �ش� ���� ���� ����Ʈ �����ֱ�
	@RequestMapping(value="/ChildClassSelect" , method=RequestMethod.GET)
	public String ChildClassSelect(@RequestParam(value="classNo")int classNo){
		ChildClass childClass = childDao.getClass(classNo);
		
		return "Child/ChildSelectClass";
	}
	
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
			String level = "";
			if(session.getAttribute("teacherNo") != null){
				teacherNo = (Integer) session.getAttribute("teacherNo");
				license = (String) session.getAttribute("licenseKindergarten");
				level = (String) session.getAttribute("teacherLevel");
			}
			
			List<Child> list = null;

			int ChildCount = childDao.getChildCount();
			int pagePerRow = 10;
			int lastPage = (int)(Math.ceil(ChildCount/currentPage));
			
			if(level.equals("����")){
				list = childDao.getChildList(license, currentPage, pagePerRow);			
			}else{
				list = childDao.getSeveralList(license, teacherNo, currentPage, pagePerRow);
			}
			

			
			for(Child c : list){
				System.out.println(c.getKidName()+" : ����" );
			}
			
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
		
		@RequestMapping(value="/ClassAdd" , method=RequestMethod.POST)
		public String ClassAdd(ChildClass childclass, HttpSession session) {
			
			String license = (String) session.getAttribute("licenseKindergarten");
			
			childclass.setLicenseKindergarten(license);
			
			System.out.println(childclass.getLicenseKindergarten());
			System.out.println(childclass.getClassName());
			System.out.println(childclass.getClassAge());
			
			
			childDao.insertClass(childclass);
			System.out.println(childclass);
			return "redirect:/ChildClass";
		}
		
		//���Ŀ� Ȯ�δ����� kinNo�迭�� �޾Ƽ� ~~
		@RequestMapping(value="/ChildSelectClass" , method=RequestMethod.GET)
		public String dtd( @RequestParam(value="kidNo") int[] kidNo
							,@RequestParam(value="classNo")int classNo
							,HttpSession session
							,Model model)  {
			System.out.println("ChildSelectClass() run Controller");
						
			String licenseKindergarten = (String) session.getAttribute("licenseKindergarten");
			
			
			
				childDao.classOrganization(licenseKindergarten,kidNo, classNo); //�� �Է��ϴ°�
			
			
			boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
			
			System.out.println(classNo + "classno!!");
			
			//�� �ϳ� �˻�
			ChildClass childClass = childDao.getClass(classNo);
			
			model.addAttribute("childClass",childClass);
			
 
			List<Child> childList = new ArrayList<Child>();
			if(isLogin){
				String license = (String) session.getAttribute("licenseKindergarten");
				
				for(int i=0; i<kidNo.length; i++){
					System.out.println("for : " + kidNo[i]);
					Child child = childDao.getChild(kidNo[i]);
					
					childList.add(child);
					System.out.println("point 1");
					//���ư������� , ����Ʈ�� ��� , ������
				}
				
				model.addAttribute("childList", childList);
				System.out.println("point 2");
			}
			
			
			model.addAttribute("classNo", classNo);

			return "Child/ChildSelectClass";
		}
		
		//���ϴ� ������ ���°�
		@RequestMapping(value="/testSelect" , method=RequestMethod.GET)
		public String ChildFormation(HttpSession session, Model model
				,ChildClass childClass) {
			
			System.out.println("testSelect �� ��û");
	
			
			String license = (String) session.getAttribute("licenseKindergarten");
			
			childClass.setLicenseKindergarten(license);
			List<Child> getRematinderFormationList = childDao.getRematinderFormationList(childClass);
			model.addAttribute("getRematinderFormationList", getRematinderFormationList);
			System.out.println(childClass.getClassNo()+"<<<<Ŭ�����ѹ�");
			model.addAttribute("classNo",childClass.getClassNo());
			
			
			return "Child/testSelect";
		}
		
		// �� �� ����Ʈ��û
				
		@RequestMapping(value="/ClassAdd" , method=RequestMethod.GET)
		public String ClassAdd() {
			System.out.println("ClassAdd �� ��û");
			return "Child/ClassAdd";
		}
		
		@RequestMapping(value="/ChildAdd" , method=RequestMethod.POST)
		public String ChildAdd(HttpSession session ,Child child) {
			
			String license = (String) session.getAttribute("licenseKindergarten");
			
			child.setLicenseKindergarten(license);
			
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
		

}
