package com.cafe24.dmsthch;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Child.Child;
import com.cafe24.dmsthch.Child.ChildAttendance;
import com.cafe24.dmsthch.Child.ChildClass;
import com.cafe24.dmsthch.Child.ChildDao;
import com.cafe24.dmsthch.Child.ChildService;

@Controller
public class ChildController {
	@Autowired
	private ChildDao childDao;
	@Autowired
	private ChildService childService;
	
	//네비에서 반 눌렀을때, 해당 반의 유아 리스트 보여주기
	@RequestMapping(value="/ChildClassSelect" , method=RequestMethod.GET)
	public String ChildClassSelect(@RequestParam(value="classNo")int classNo
								  ,@RequestParam(value="kidNo")int kidNo, Model model){
		ChildClass childClass = childDao.getClass(classNo);
		
		model.addAttribute("childClass", childClass);
		
		List<Child> childList = new ArrayList<Child>();
		
		Child child = childDao.getChild(kidNo);
		
		childList.add(child);
		
		model.addAttribute("childList", childList);
		
		model.addAttribute("classNo", classNo);
		
		
		return "Child/ChildSelectClass";
	}
	
	//발달 폼 요청
	@RequestMapping(value="/ChildDevelopment" , method=RequestMethod.GET)
	public String ChildDevelopment() {
		System.out.println("ChildDevelopment 폼 요청");
		return "Child/ChildDevelopment";
	}
	
	
	//수정 폼 요청
		@RequestMapping(value="/ChildModify", method=RequestMethod.GET)
		public String ChildModify(Model model 
								 , @RequestParam(value="kidNo" ,required=true)int kidNo) {
			Child child = childDao.getChild(kidNo);
			child.setKidNo(kidNo);
			model.addAttribute("child", child);
			
			return "Child/ChildModify";
		}
		//수정 요청
		@RequestMapping(value="/ChildModify", method=RequestMethod.POST)
		public String ChildModify(Child child) {
			childDao.updateChild(child);
			return "redirect:/ChildList?kid_no="+child.getKidNo();
		}
		//리스트 요청
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
			
			if(level.equals("원장")){
				list = childDao.getChildList(license, currentPage, pagePerRow);			
			}else{
				list = childDao.getSeveralList(license, teacherNo, currentPage, pagePerRow);
			}

			
			for(Child c : list){
				System.out.println(c.getKidName()+" : 유아" );
			}
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("ChildCount", ChildCount);
			model.addAttribute("pagePerRow", pagePerRow);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list", list);
			
			return "Child/ChildList";
		}
	
		//리스트 요청
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

		//입력 폼 요청
		@RequestMapping(value="/ChildAdd" , method=RequestMethod.GET)
		public String ChildAdd(HttpSession session, Model model) {
			System.out.println("ChildAdd 폼 요청");
			
			String license = "";
			if(session.getAttribute("teacherNo") != null){
				license = (String) session.getAttribute("licenseKindergarten");
			}
			model.addAttribute("licenseKindergarten");
			
			return "Child/ChildAdd";
		}
		
		//입력 요청
		
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
		
		//반정보 보여주기
		@RequestMapping(value="/viewClass" , method=RequestMethod.GET)
		public String viewClass(HttpSession session , 
								ChildClass childClass,
								Model model){
			System.out.println("viewClass() run Controller");
			
			String license = (String) session.getAttribute("licenseKindergarten");
			childClass.setLicenseKindergarten(license);
			
			//반하나 검색
			ChildClass getChildClass = childDao.getClass(Integer.parseInt(childClass.getClassNo()));
			model.addAttribute("childClass",getChildClass);
			
			List<Child> childList = childDao.getChildForClass(childClass); //이부분
			
			model.addAttribute("list", childList);
			
			return "Child/ChildSelectClass";
		}
		
		//편성처리
		@RequestMapping(value="/ChildSelectClass" , method=RequestMethod.GET)
		public String dtd( @RequestParam(value="kidNo") int[] kidNo
							,@RequestParam(value="classNo")int classNo
							,HttpSession session
							,Model model)  {
			System.out.println("ChildSelectClass() run Controller");
						
			String licenseKindergarten = (String) session.getAttribute("licenseKindergarten");
			
			
			
				childDao.classOrganization(licenseKindergarten,kidNo, classNo); //반 입력하는거
			
			return "redirect:/viewClass?classNo="+classNo;
		}
		
		//편성하는 페이지 가는것
		@RequestMapping(value="/testSelect" , method=RequestMethod.GET)
		public String ChildFormation(HttpSession session, Model model
				,ChildClass childClass) {
			
			System.out.println("testSelect 폼 요청");
	
			
			String license = (String) session.getAttribute("licenseKindergarten");
			
			childClass.setLicenseKindergarten(license);
			List<Child> getRematinderFormationList = childDao.getRematinderFormationList(childClass);
			model.addAttribute("getRematinderFormationList", getRematinderFormationList);
			System.out.println(childClass.getClassNo()+"<<<<클래스넘버");
			model.addAttribute("classNo",childClass.getClassNo());
			
			
			return "Child/testSelect";
		}
		
		
				
		@RequestMapping(value="/ClassAdd" , method=RequestMethod.GET)
		public String ClassAdd() {
			System.out.println("ClassAdd 폼 요청");
			return "Child/ClassAdd";
		}
		
		@RequestMapping(value="/ChildAdd" , method=RequestMethod.POST)
		public String ChildAdd(HttpSession session
				,@RequestParam(value="licenseKindergarten") String licenseKindergarten
				,@RequestParam(value="kidName") String kidName
				,@RequestParam(value="kidBirth") String kidBirth
				,@RequestParam(value="kidAddress") String kidAddress
				,@RequestParam(value="kidProtectorPhone") int kidProtectorPhone
				,@RequestParam(value="kidProtectorPhoneReserve", required=false, defaultValue="1") int kidProtectorPhoneReserve
				,@RequestParam(value="kidPrecautions") String kidPrecautions
				,@RequestParam(value="kidGender") String kidGender
				,@RequestParam(value="kidCommuting") String kidCommuting) {
			
			Child child =new Child();
			child.setLicenseKindergarten(licenseKindergarten);
			child.setKidName(kidName);
			child.setKidBirth(kidBirth);
			child.setKidAddress(kidAddress);
			child.setKidProtectorPhone(kidProtectorPhone);
			child.setKidProtectorPhoneReserve(kidProtectorPhoneReserve);
			child.setKidPrecautions(kidPrecautions);
			child.setKidGender(kidGender);
			child.setKidCommuting(kidCommuting);
			
			
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
		
		
		
		
		
		//유아 출석 뷰
		@RequestMapping(value="/ChildCommute" , method=RequestMethod.GET)
		public String childCommute(Model model, HttpSession session){
			System.out.println("ChildCommute() run Controller");
			
			String returnUri = "/";
			
			boolean isLogin = (session.getAttribute("teacherNo") != null) ? true : false;
			
			if(isLogin){
				String level = (String) session.getAttribute("teacherLevel");
				
				if(!level.equals("원장")){
					returnUri = "Child/childCommute";
				}else{
					return "redirect:/";
				}
			}
			
			ChildClass childClass = childService.getChildClassToTeacherNo(session);
			
			String license = (String) session.getAttribute("licenseKindergarten");
			childClass.setLicenseKindergarten(license);
			
			//반하나 검색
			ChildClass getChildClass = childDao.getClass(Integer.parseInt(childClass.getClassNo()));
			List<Child> childList = childDao.getChildForClass(childClass);
			
			List<Map<String, Object>> categoryList = childDao.getAttendanceCategory();

			model.addAttribute("childList", childList);
			model.addAttribute("getChildClass", getChildClass);
			model.addAttribute("categoryList", categoryList);

			List<ChildAttendance> resultAttendanceList = new ArrayList<ChildAttendance>();
			
			//출석정보를 갖와 뿌려주기 위함
			for(Child c : childList){
				List<ChildAttendance> resultAttendance = childDao.getCommuteAll(c.getKidNo());
				
				if(resultAttendance.size() > 0){
					ChildAttendance lastAttendance = resultAttendance.get(resultAttendance.size()-1);
					
					resultAttendanceList.add(lastAttendance);
				}
				
			}
			
			model.addAttribute("resultAttendanceList", resultAttendanceList);
			
			return returnUri;
		}
		
		
		//출석 처리
		@RequestMapping(value="/ChildCommute" , method=RequestMethod.POST)
		public String childCommute(Model model, HttpSession session
								  ,@RequestParam(value="formKidNo") String formKidNo
								  ,@RequestParam(value="formKidName") String formKidName
								  ,@RequestParam(value="formCheckbox") String formCheckbox
								  ,@RequestParam(value="formCategory") String formCategory
								  ,@RequestParam(value="formInput") String formInput){

			System.out.println("childCommute(post) run Coltroller");
			String license = (String) session.getAttribute("licenseKindergarten");
			
			System.out.println(formKidNo);
			System.out.println(formKidName);
			System.out.println(formCheckbox);
			System.out.println(formCategory);
			System.out.println(formInput);
			
			String[] kidNo = formKidNo.split(",");
			String[] kidName = formKidName.split(",");
			String[] kidCheckbox = formCheckbox.split(","); //출석 체크박스
			String[] kidCategory = formCategory.split(","); //카테고리
			String[] kidInput = formInput.split(","); //특이사항 정보
			
			List<ChildAttendance> insertDataList = new ArrayList<ChildAttendance>();
			
			for(int i=0; i<kidNo.length; i++){ //insertData Setting
				ChildAttendance c = new ChildAttendance();
				
				int attendance = 0; // 0이 false - 출석유무
				int attendanceUnusual = 0; //특이사항 유무
				if(kidCheckbox[i].equals("true")) attendance = 1;
				if(!kidCategory[i].equals("null")) attendanceUnusual = 1;
								
				c.setKidNo(Integer.parseInt(kidNo[i]));
				c.setLicenseKindergarten(license);
				c.setAttendance(attendance);
				c.setAttendanceUnusual(attendanceUnusual);
				
				c.setCategoryNo(kidCategory[i]);
				c.setAttendanceMemo(kidInput[i]);
				
				insertDataList.add(c);
				
			} //forEnd
			
			int todayCommute = childDao.isTodayCommute(license);
			System.out.println(todayCommute);
			
			if(todayCommute == 0){ //금일 유아 출석체크가 처음인 경우 (insert Query)
				System.out.println("처음인 경우");
				for(ChildAttendance data : insertDataList){
					childDao.kidAttendanceInsert(data);
					if(!data.getCategoryNo().equals("null")){ //특이사항이 있는 경우
						System.out.println("특이사항이 있는 경우 " + data.getKidNo());
						childService.insertUnusual(data);
						
					}					
				}
				
			}else{ //금일 유아 출석체크가 처음이 아닌 경우 (update Query)
				System.out.println("처음이 아닌 경우");
				for(ChildAttendance data : insertDataList){
					childDao.kidAttendanceUpdate(data);
					if(!data.getCategoryNo().equals("null")){ //특이사항이 있는 경우
						System.out.println("특이사항이 있는 경우 " + data.getKidNo());
						childService.insertUnusual(data);
					}
				}
			}
			
			return "redirect:/ChildCommute";
		}
		

}
