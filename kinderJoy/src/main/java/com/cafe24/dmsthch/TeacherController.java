package com.cafe24.dmsthch;

import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;
import com.cafe24.dmsthch.Teacher.TeacherFormation;

@Controller

public class TeacherController {
	
	@Autowired
	private TeacherDao TDao;
	
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
	
	//takeForm save�޼��� ȣ��
	@RequestMapping(value="/save2", method = RequestMethod.POST)
	public String save() {
		System.out.println("ȣ��Ȯ�� _TeacherController");
		return "";
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
		return "redirect:/home";
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
	
	//��ǥ ����Ʈ ȣ��
	@RequestMapping(value="/takeFormList", method=RequestMethod.GET)
	public String takeFormList(HttpSession httpsession, Model model) {
		System.out.println("ȣ��Ȯ��");
		
		List<Teacher> takeT = TDao.takeT((String)httpsession.getAttribute("licenseKindergarten"));
		List<ChildClass> takeC = TDao.takeC((String) httpsession.getAttribute("licenseKindergarten"));

		//classNo classAge teacherNo teacherName
		
		model.addAttribute("takeTeacher" ,takeT);
		model.addAttribute("takeClass"   ,takeC);
		
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
	public String insert(Teacher teacher) {//�Ű������� ���������̴�
		TDao.insertTeacher(teacher);
		System.out.println(teacher+" <--�Է�Ȯ��");
		System.out.println(TDao +" <--Dao Ȯ��");
		System.out.println("home�� �����̷�Ʈ\n\n");
		
		return "redirect:/home";
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
	
	//�α��� �� ȣ��
	@RequestMapping(value="/testLogin", method=RequestMethod.GET)
	public void Login(HttpServletRequest request ,HttpServletResponse response) throws Exception {
		
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		HttpSession session = request.getSession();
		// ���ǿ� ����Ű�� ���ڿ��� Ű���Ͽ� ����Ű�� �����Ѵ�.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// ����Ű�� ���ڿ��� ��ȯ�Ͽ� JavaScript RSA ���̺귯�� �Ѱ��ش�.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);
		request.setAttribute("publicKeyExponent", publicKeyExponent);
		
		request.getRequestDispatcher("/WEB-INF/views/Login/testLogin.jsp").forward(request, response);
		
	}
	
	
	//�α��� ��ȣȭ�� ���̵� ��й�ȣ�� ��ȣȭ�Ѵ�.
	@RequestMapping(value="/loginTest", method=RequestMethod.POST)
    protected void processRequest(
    		HttpServletRequest request
    		,Teacher teacher 
    		, HttpServletResponse response
    		, HttpSession session2
    		, Model model)
            throws ServletException, IOException {
		String securedUsername = request.getParameter("securedUsername");
        String securedPassword = request.getParameter("securedPassword");
        
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // Ű�� ������ ���´�. �׻� ���ο� Ű�� �޵��� ����.

        if (privateKey == null) {
            throw new RuntimeException("��ȣȭ ���Ű ������ ã�� �� �����ϴ�.");
        }
        try {
            String username = decryptRsa(privateKey, securedUsername);
            String password = decryptRsa(privateKey, securedPassword);
           
            
  
            session2.setAttribute("teacherId", username);
            System.out.println(username);
            if(session2.getAttribute("teacherId") != null) {
            	/*Teacher saveSession = TDao.LoginTeacher(teacher);
            	System.out.println("������");
                session2.setAttribute("teacherNo", saveSession.getTeacherNo());
                System.out.println("������2");
                session2.setAttribute("licenseKindergarten", saveSession.getLicenseKindergarten());
                session2.setAttribute("teacherLevel", saveSession.getTeacherLevel());
                session2.setAttribute("teacherName", saveSession.getTeacherName());
                System.out.println(saveSession.getTeacherName()+"<<<<<<<<<<<<<����");*/
            }

            
            
            //�ѹ� ���� ���� ���� �Ƶ�
            
            System.out.println(username +"<--��ȣȭ�� ���̵�");
            System.out.println(password +"<--��ȣȭ�� �н�");

            request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }
    }

    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        System.out.println("�ص��� ���� : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // ���� ���ڵ� ����.
        return decryptedValue;
    }

    /**
     * 16�� ���ڿ��� byte �迭�� ��ȯ�Ѵ�.
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
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
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(teacher.getTeacherId() +"<-- ����ڰ� �Է��� ���̵�");
		System.out.println(TDao+" <--TDao ���� Ȯ��");

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
		return "redirect:/home";
	}
	
	//���̼��� ���̼���
	@RequestMapping(value="/license", method=RequestMethod.GET)
	public String chara() {
		System.out.println("���̼��� �߱� ������ ȣ��");
		return "Teacher/TeacherModify/license";
	}
	
	//���̼��� ���̼��� ó��
	@RequestMapping(value="/license", method=RequestMethod.POST)
	public String uuid(Model model) throws Exception {
		
		//UUID�� ���� �ڼ��� ������ http://hyeonjae.github.io/uuid/2015/03/17/uuid.html ����
		
		System.out.println("\n ���̼��� �߱� ó�� ȣ��");
		String licenseKey = UUID.randomUUID().toString();

		model.addAttribute("licenseKey",licenseKey);
		System.out.println(licenseKey +"<--������ UUID\n");
		
		return "Teacher/TeacherModify/license";
	}
}