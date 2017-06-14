package com.cafe24.dmsthch;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import com.cafe24.dmsthch.Child.ChildClass;
import com.cafe24.dmsthch.Home.HomeDao;
import com.cafe24.dmsthch.Home.License;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;
import com.cafe24.dmsthch.Teacher.TeacherFormation;

@Controller

public class TeacherController {
	
	@Autowired
	private TeacherDao TDao;
	
	@Autowired
	HomeDao dao;
	
	//ErrorPage.jsp
	@RequestMapping(value="/ErrorPage", method = RequestMethod.GET)
	public String ErrorPage() {
		System.out.println("web.xml�� 404���� ���� \n404error������ ȣ��_TeacherController");
		return "Teacher/ErrorPage";
	}
	
	//���� ���� �� ������ ������
	@RequestMapping(value="/���Ѿ��� ����� ���� ������", method = RequestMethod.GET)
	public String kwonhan() {
	System.out.println("! ���Ѿ��� ����� ���� ! ���������� ȣ��! _TeacherController");
	return "Teacher/TheAviator/index";
	}
	
	//���̵� ���ǻ���
	@ResponseBody
	@RequestMapping(value="/sideSession" , method = RequestMethod.GET)
	public JSONObject sideSession (HttpSession session) {
		JSONObject obj = new JSONObject();
		String teacherLevel = (String)session.getAttribute("teacherLevel");
		System.out.println(teacherLevel+ "<--------------");
		obj.put("teacherLevel", teacherLevel);
		return obj;
	}
	
	//�������� Ż��
	@RequestMapping(value="/deleteAccount", method = RequestMethod.POST)
	public String delete(HttpSession httpsession ,SessionStatus sessionstatus) {
		//���� ���ǿ� �ִ� ���̵��� �����ͼ� TDao���� �θ� �޼��� �ȿ� ���� �� ���� �����ϸ�
		//���̵� �����ǰ� �� �� ó���� ������ ó���� ���� ����
		//������ ���� �� �μ�Ʈ�ϱ� ���ؼ� TDao�� �ѹ� �� ���ľ��Ѵ�
		
		TDao.delete((String) httpsession.getAttribute("teacherId"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("teacherId", httpsession.getAttribute("teacherId"));
		map.put("teacherName", httpsession.getAttribute("teacherName"));
		map.put("teacherLevel", httpsession.getAttribute("teacherLevel"));
		System.out.println("�����Ϸ�_TeacherController");

		TDao.deleteANDinsert(map);
		
		httpsession.invalidate();
		return "redirect:/goHome";
	}
	
	//���������� ȣ��
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete() {
		return "Teacher/TeacherModify/delete";
	}
	
	
	//ȸ�������� ȣ��
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		System.out.println("GET������� TeacherAdd�� ������\n");
		return "Teacher/TeacherAdd";
	}
	
	//��ǥ ����Ʈ ȣ�� ����ǥ ǥ 
	@RequestMapping(value="/takeFormList", method=RequestMethod.GET)
	public String takeFormList(HttpSession httpsession, Model model) {
		System.out.println("ȣ��Ȯ��");
		
		List<Teacher>List = TDao.takeFormList((String)httpsession.getAttribute("licenseKindergarten"));
	
		//classNo classAge teacherNo teacherName
		
		model.addAttribute("List",List);
		
		return "Teacher/TeacherModify/takeFormList";
	}
	
	//��ǥ�� ȣ��
	@RequestMapping(value="/takeForm", method=RequestMethod.GET)
	public String takeForm(HttpSession httpsession ,Model model) {
		System.out.println("���� ȣ��__Teacher/TeacherModify/takeForm���� ������\n");
		
		//�ڽ��� ��ġ�� ������ �����������Ͽ� ���ǿ� ����Ǿ��ִ� ���� licenseKindergarten�� �����ͼ�
		//TDao�� �ִ� takeClass �޼��忡 
		//((String) httpsession.getAttribute("licenseKindergarten")) ���� �־��־���
		//takeTeacher�� ��������
		
		//List<> takeT�� result�̴�   
							//TDao.takeT((String) httpsession.getAttribute("licenseKindergarten"));�� �޼��忡 �Է��� ���̹Ƿ� ��, ���̼��� �̹Ƿ� String�̴�
		List<Teacher> takeT = TDao.takeT((String)httpsession.getAttribute("licenseKindergarten"));
		List<ChildClass> takeC = TDao.takeC((String) httpsession.getAttribute("licenseKindergarten"));

		//classNo classAge teacherNo teacherName
		
		model.addAttribute("takeTeacher" ,takeT);
		model.addAttribute("takeClass"   ,takeC);

		//return "Teacher/TeacherModify/takeForm";

		//return "Teacher/TeacherModify/takeForm";
		return "Teacher/TeacherModify/takeTab";
	}
	
	//��ǥ �Է���
	@RequestMapping(value="/pyeonseong", method=RequestMethod.POST)
	public String kyowon(HttpServletRequest request ,TeacherFormation TF ,HttpSession httpsession ) {
		
/*		//������ �̷��� ������ ���� ���� �޾ƾ� �ϴµ�
		TF.setClassNo(TF.getClassNo());
		TF.setTeacherNo(TF.getTeacherNo());
		//������������ �˾Ƽ� ���� �����ͼ� �������ֱ� ������ ���������ϴ�
*/		
		TF.setLicenseKindergarten((String) httpsession.getAttribute("licenseKindergarten"));
		
		int pyeonSeong = TDao.pyeonseong(TF);
		
		if(pyeonSeong == 0) {
			System.out.println("��");
		}else{
			System.out.println("��");
		}
		return "redirect:/takeForm";
	}
	
	//���� ������ ȣ�� �޼��� //User Profile
	@RequestMapping(value="/kyo", method=RequestMethod.GET)
	public String kyowon(HttpSession httpsession,Model model) {
		Teacher teacher =TDao.OneSelectTeacher((Integer)httpsession.getAttribute("teacherNo"));
		model.addAttribute("kyoteacher",teacher);
		System.out.println("user Profileȣ��___Teacher/TeacherModify/user�� ������\n");
		return "Teacher/TeacherModify/user";
	}
	
	
	//���� �����ϱ� �ڱ� ���� �����ϱ� 
	@RequestMapping(value="/teacherUpdate", method = RequestMethod.POST)
	public String updateTeacher(Teacher teacher
			, HttpSession httpsession) {
		
/*		
 		//���� ����
		
		teacher.setTeacherId((String) httpsession.getAttribute("teacherId"));
		//WHERE���� �Ȱ��� teacher�� �����ϸ� ������ �����ȴ�.
		teacher.setTeacherName(request.getParameter("teacherName"));
		teacher.setTeacherPhone(request.getParameter("teacherPhone"));
		teacher.setTeacherLevel(request.getParameter("teacherLevel"));
		teacher.setTeacherBank(request.getParameter("teacherBank"));
		teacher.setTeacherAccount(request.getParameter("teacherAccount"));
		teacher.setTeacherPaystep(request.getParameter("teacherPaystep"));
*/
		
		
		//�������� �� ���̵��� �����;� �ϴµ� ���� ���ǿ��� �����Դ�
		teacher.setTeacherId((String) httpsession.getAttribute("teacherId"));
		

		int a = TDao.updateTeacher(teacher);
		
		if(a == 0) {
			System.out.println("������Ʈ �ȴ�");
			return "redirect:/home";
		}else{
			System.out.println("������Ʈ ����");
			return "redirect:/kyo";
		}
	}
	
	//������ ���� ��ȸ admin���� TableList ������ ���� ,������ ������
	@RequestMapping(value="/kyotable", method=RequestMethod.GET)
	public String kyowon1(Model model, HttpSession httpsession ,Teacher teacher) {
		
		List<Object> teacher2 = TDao.tableList((String)httpsession.getAttribute("licenseKindergarten"));
		
		Map<String ,Object> map = new HashMap<String ,Object>();
		map.put("teacherId", teacher.getTeacherId());
		System.out.println(teacher.getTeacherId());
		map.put("teacherName", teacher.getTeacherName());
		map.put("teacherLevel", teacher.getTeacherLevel());
		map.put("teacherRemoveDay", teacher.getTeacherRemoveDay());
		System.out.println(teacher.getTeacherRemoveDay());
		
		List<Object> teacherRemove = TDao.removeList(map);
		
		
		//���� �ѷ��ַ��� �𵨰�ü�� ����
		model.addAttribute("tableList",teacher2);
		model.addAttribute("removeList",teacherRemove);
		/*Teacher teacher =TDao.OneSelectTeacher((Integer)httpsession.getAttribute("teacherNo"));
		model.addAttribute("kyoteacher",teacher);*/
		System.out.println("Table List�� ȣ��___/Teacher/TeacherModify/table�� ������\n");
		return "Teacher/TeacherModify/table";
		//������ ���ϴ� ���� ������ teacher�� �ּҰ��� ����� ���� or ���⸦ ����Ų��
	}
	
	//���̵� �ߺ�üũ �޼���
	@RequestMapping(value="/sign_up_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int logincheck(HttpServletResponse response, @RequestParam("teacher_ajax_id") String userid) {
		System.out.println("�α���üũ�޼��� ȣ��_Controller");
		System.out.println("����ڰ� �Է��� ���̵��? : " + userid);
		int check = TDao.logincheck(userid);
		
		if(check == 0){
			System.out.println("DB�� �ߺ��Ǵ� ���� �����ϴ�_TeacherController");
		}else{
			System.out.println("DB�� �ߺ��Ǵ� ���� �ֽ��ϴ�_TeacherController");
		}
		return check;
	}
	
	//�Է� ȸ������
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Teacher teacher) throws Exception {//�Ű������� ���������̴�
		
		//ȸ�����Կ��� ���� ���� ������ ��´�.
		String pw = teacher.getTeacherPw();

		MessageDigest sh = MessageDigest.getInstance("SHA-256"); // �� �κ��� SHA-1���� �ٲ㵵 �ȴ�!
        
		//������ ����Ʈ�� ��ȯ���״�.
		sh.update(pw.getBytes()); 
        byte byteData[] = sh.digest();
        StringBuffer sb = new StringBuffer(); 
        for(int i = 0 ; i < byteData.length ; i++){
        sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
        }
		
        String shaPw = sb.toString();
        teacher.setTeacherPw(shaPw);
        
		TDao.insertTeacher(teacher);
		
		System.out.println("home�� �����̷�Ʈ\n\n");
		
		return "redirect:/goHome";
	}
	
	
	//�α��� ���̵� üũ �޼��� �α��� �� ��! ���̵� ��ȸ �޼���
	@RequestMapping(value="/login_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int loginIdCheck(HttpServletResponse response, @RequestParam("teacherId") String userid) {
		System.out.println("�α���üũ�޼��� ȣ��_Controller");
		System.out.println("����ڰ� �Է��� ���̵��? : " + userid);
		
		int check = TDao.loginIdcheck(userid);
		
		if(check == 1) {
			System.out.println("���̵� ����_loginIdCheck_TeacherController");
		} else {
			System.out.println("���̵� ����");
		}
		return check;
	}

	
	//@RequestParam("Ŭ���̾�Ʈ�� �Է��� ��") String �Ű�����
	//������Ʈ �Ķ��� ���� ���� �˾Ƽ� �־��ش�
	//�α��� ó��
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(
			Model model 
			,Teacher teacher 
			,HttpSession session ) throws Exception {
		
		System.out.println("Teacher ��Ʈ�ѷ� �α��� �޼��� Ȯ��");
		//SHA256
		String pw = teacher.getTeacherPw();

		MessageDigest sh = MessageDigest.getInstance("SHA-256"); // �� �κ��� SHA-1���� �ٲ㵵 �ȴ�!
        
		//������ ����Ʈ�� ��ȯ���״�.
		sh.update(pw.getBytes()); 
        byte byteData[] = sh.digest();
        StringBuffer sb = new StringBuffer(); 
        for(int i = 0 ; i < byteData.length ; i++){
        sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
        }
		
        String shaPw = sb.toString();
        teacher.setTeacherPw(shaPw);
		//SHA256
		Teacher saveSession = TDao.LoginTeacher(teacher);
		
		System.out.println(teacher.getTeacherId() +"<-- ����ڰ� �Է��� ���̵�");
		System.out.println(TDao+" <--TDao ���� Ȯ��");

		License result = dao.getLicense(saveSession.getLicenseKindergarten());
		model.addAttribute("result",result);

		if(saveSession != null) {
			if(session.getAttribute("teacherId") == null){
				
				session.setAttribute("teacherNo",saveSession.getTeacherNo());
				session.setAttribute("licenseKindergarten",saveSession.getLicenseKindergarten());
				session.setAttribute("teacherId", saveSession.getTeacherId());
				session.setAttribute("teacherName", saveSession.getTeacherName());
				session.setAttribute("teacherLevel" ,saveSession.getTeacherLevel());
				
				//�� ������ �𸣰����� �𵨰�ü�� ���� �����ϸ� �ּ�â�� ���� ��� ����Ǿ���
				//�׷��� ���ǿ� �����ϴ� �ּ�â�� ���� �������� ��???
				/*model.addAttribute("teacherNo",saveSession.getTeacherNo());
				System.out.println(saveSession.getTeacherNo() +" <-- ���ǿ� ����� �ѹ� �� ����");
				
				model.addAttribute("licenseKindergarten",saveSession.getLicenseKindergarten());
				System.out.println(saveSession.getLicenseKindergarten() +" <-- ���ǿ� ����� ���̼�����");
				
				model.addAttribute("teacherId", saveSession.getTeacherId());
				System.out.println(saveSession.getTeacherId() +"<-- ���ǿ� ����� ���̵� ��");
				
				model.addAttribute("teacherName", saveSession.getTeacherName());
				System.out.println(saveSession.getTeacherName() + "<-- ���ǿ� ����� ���Ӱ�");
				
				model.addAttribute("teacherLevel" ,saveSession.getTeacherLevel());
				System.out.println(saveSession.getTeacherLevel() + " <--���ǿ� ����� ������");*/
				
				session.setMaxInactiveInterval(7200);
				session.setAttribute("teacherTime", session.getMaxInactiveInterval());
				System.out.println("������ ���� �ð� : "+session.getMaxInactiveInterval()+"��");
				}
			
			} else {				
				model.addAttribute("nogin","�α��ν���");
				System.out.println("���̵� ��й�ȣ�� Ȯ�����ּ���");
				
				return "/home";
		}
		
		return "/home";
	}
	
	//�α׾ƿ� �޼���
	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String logOut(@ModelAttribute Teacher teacher ,HttpSession session){

		//sessionstatus.setComplete();
		session.invalidate();
		System.out.println("���� ����");


		
		//System.out.println(sessionstatus +"\n �α׾ƿ� SessionAttributes�� �ʱ�ȭ");
		System.out.println(" redirect:/home");
		return "redirect:/goHome";
	}
	
	//���̼��� ���̼���
	@RequestMapping(value="/license", method=RequestMethod.GET)
	public String chara(HttpSession session ,License license ,Model model) {
		System.out.println("���̼��� �߱� ������ ȣ��");
		
		String aaa = TDao.selectLicense((Integer) session.getAttribute("teacherNo"));
		System.out.println(aaa);
		model.addAttribute("license", aaa);
		
		return "Teacher/TeacherModify/license";
	}
	
	//���̼������̺� insert��ų ��ġ�� ���� licenseForm ���̼��� ���̼��� 
	//������Ʈ�� �μ�Ʈ�� �� �� �ٸ� �� ���� �� ����.
	//������Ʈ�Ϸ��� ���� �ڵ��� �μ�Ʈ�� �����ؾ� �ؼ� ���ۿ��� sql�� ���ƴµ�
	//���� ��Ʈ�ѷ����� �ϳ��� �Ȱ��ĵ� �μ�Ʈ�� �Ǿ���.
	@RequestMapping(value="/licenseForm", method=RequestMethod.POST)
	public String licenseForm(HttpSession session ,License license) {
		
		license.setLicenseKindergarten((String) session.getAttribute("licenseKindergarten"));
		System.out.println(session.getAttribute("licenseKindergarten")+"<<<<<<<<<<���� ���̼���1");
		license.setTeacherNo((Integer) session.getAttribute("teacherNo"));
		System.out.println(session.getAttribute("teacherNo"));
		int x = TDao.insertLicense(license);
		
		int y = TDao.teacherLicenseUpdate(session.getAttribute("teacherNo"));
		if(x == 1) {
			System.out.println("��");
		}else{
			System.out.println("��");
		}
		
		if(y == 1) {
			System.out.println("��");
		}else{
			System.out.println("��");
		}
		System.out.println(session.getAttribute("licenseKindergarten")+"<<<<<<<<<<���� ���̼���2");
		return "redirect:/license";
		//�����̷�Ʈ �� ��û�ּҸ� ������Ѵ�
		//������ �� �����θ� ����� �Ѵ�.
	}
	
	//���̼��� �߱� �� teacher ���̼����� �Ȱ��� ������Ʈ ���̼���
	//���̼��� ���̼��� ó��
/*	@RequestMapping(value="/license", method=RequestMethod.POST)
	public String uuid(Model model) throws Exception {
		
		//UUID�� ���� �ڼ��� ������ http://hyeonjae.github.io/uuid/2015/03/17/uuid.html ����
		
		System.out.println("\n ���̼��� �߱� ó�� ȣ��");
		String licenseKey = UUID.randomUUID().toString();

		model.addAttribute("licenseKey",licenseKey);
		System.out.println(licenseKey +"<--������ UUID\n");
		
		return "Teacher/TeacherModify/license";
	}*/
}