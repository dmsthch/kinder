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
		System.out.println("web.xml에 404에러 설정 \n404error페이지 호출_TeacherController");
		return "Teacher/ErrorPage";
	}
	
	//권한 없을 때 보여줄 페이지
	@RequestMapping(value="/권한없는 사람이 보는 페이지", method = RequestMethod.GET)
	public String kwonhan() {
	System.out.println("! 권한없는 사람이 접근 ! 게임페이지 호출! _TeacherController");
	return "Teacher/TheAviator/index";
	}
	
	//takeForm save메서드 호출
	@RequestMapping(value="/save2", method = RequestMethod.POST)
	public String save() {
		System.out.println("호출확인 _TeacherController");
		return "";
	}
	
	//계정삭제 탈퇴
	@RequestMapping(value="/deleteAccount", method = RequestMethod.POST)
	public String delete(HttpSession httpsession ,SessionStatus sessionstatus) {
		//현재 세션에 있는 아이디값을 가져와서 TDao에서 부른 메서드 안에 대입 후 쿼리 실행하면
		//아이디가 삭제되고 그 후 처리는 삭제는 처리할 것이 없음
		//하지만 삭제 후 인서트하기 위해선 TDao를 한번 더 거쳐야한다
		
		TDao.delete((String) httpsession.getAttribute("teacherId"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("teacherId", httpsession.getAttribute("teacherId"));
		map.put("teacherName", httpsession.getAttribute("teacherName"));
		map.put("teacherLevel", httpsession.getAttribute("teacherLevel"));
		System.out.println("삭제완료_TeacherController");

		TDao.deleteANDinsert(map);
		
		httpsession.invalidate();
		return "redirect:/home";
	}
	
	//계정삭제폼 호출
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete() {
		return "Teacher/TeacherModify/delete";
	}
	
	
	//회원가입폼 호출
	@RequestMapping(value="/Add", method=RequestMethod.GET)
	public String Add() {
		System.out.println("GET방식으로 TeacherAdd로 포워드\n");
		return "Teacher/TeacherAdd";
	}
	
	//편성표 리스트 호출
	@RequestMapping(value="/takeFormList", method=RequestMethod.GET)
	public String takeFormList(HttpSession httpsession, Model model) {
		System.out.println("호출확인");
		
		List<Teacher> takeT = TDao.takeT((String)httpsession.getAttribute("licenseKindergarten"));
		List<ChildClass> takeC = TDao.takeC((String) httpsession.getAttribute("licenseKindergarten"));

		//classNo classAge teacherNo teacherName
		
		model.addAttribute("takeTeacher" ,takeT);
		model.addAttribute("takeClass"   ,takeC);
		
		return "Teacher/TeacherModify/takeFormList";
	}
	
	//편성표폼 호출
	@RequestMapping(value="/takeForm", method=RequestMethod.GET)
	public String takeForm(HttpSession httpsession ,Model model) {
		System.out.println("편성폼 호출__Teacher/TeacherModify/takeForm으로 포워드\n");
		
		//자신의 유치원 정보만 가져오기위하여 세션에 저장되어있는 값인 licenseKindergarten을 가져와서
		//TDao에 있는 takeClass 메서드에 
		//((String) httpsession.getAttribute("licenseKindergarten")) 값을 넣어주었다
		//takeTeacher도 마찬가지
		
		//List<> takeT는 result이다   
							//TDao.takeT((String) httpsession.getAttribute("licenseKindergarten"));는 메서드에 입력한 값이므로 즉, 라이선스 이므로 String이다
		List<Teacher> takeT = TDao.takeT((String)httpsession.getAttribute("licenseKindergarten"));
		List<ChildClass> takeC = TDao.takeC((String) httpsession.getAttribute("licenseKindergarten"));

		//classNo classAge teacherNo teacherName
		
		model.addAttribute("takeTeacher" ,takeT);
		model.addAttribute("takeClass"   ,takeC);

		//return "Teacher/TeacherModify/takeForm";

		//return "Teacher/TeacherModify/takeForm";
		return "Teacher/TeacherModify/takeTab";
	}
	
	//편성표 입력폼
	@RequestMapping(value="/pyeonseong", method=RequestMethod.POST)
	public String kyowon(HttpServletRequest request ,TeacherFormation TF ,HttpSession httpsession ) {
		
/*		//원래는 이렇게 폼에서 보낸 값을 받아야 하는데
		TF.setClassNo(TF.getClassNo());
		TF.setTeacherNo(TF.getTeacherNo());
		//스프링에서는 알아서 값을 가져와서 세팅해주기 때문에 생략가능하다
*/		
		TF.setLicenseKindergarten((String) httpsession.getAttribute("licenseKindergarten"));
		
		int pyeonSeong = TDao.pyeonseong(TF);
		
		if(pyeonSeong == 0) {
			System.out.println("패");
		}else{
			System.out.println("성");
		}
		return "redirect:/takeForm";
	}
	
	//교원 수정폼 호출 메서드 //User Profile
	@RequestMapping(value="/kyo", method=RequestMethod.GET)
	public String kyowon(HttpSession httpsession,Model model) {
		Teacher teacher =TDao.OneSelectTeacher((Integer)httpsession.getAttribute("teacherNo"));
		model.addAttribute("kyoteacher",teacher);
		System.out.println("user Profile호출___Teacher/TeacherModify/user로 포워드\n");
		return "Teacher/TeacherModify/user";
	}
	
	
	//교원 수정하기 자기 정보 수정하기 
	@RequestMapping(value="/teacherUpdate", method = RequestMethod.POST)
	public String updateTeacher(Teacher teacher
			, HttpSession httpsession) {
		
/*		
 		//기존 형식
		
		teacher.setTeacherId((String) httpsession.getAttribute("teacherId"));
		//WHERE절도 똑같이 teacher에 세팅하면 조건이 성립된다.
		teacher.setTeacherName(request.getParameter("teacherName"));
		teacher.setTeacherPhone(request.getParameter("teacherPhone"));
		teacher.setTeacherLevel(request.getParameter("teacherLevel"));
		teacher.setTeacherBank(request.getParameter("teacherBank"));
		teacher.setTeacherAccount(request.getParameter("teacherAccount"));
		teacher.setTeacherPaystep(request.getParameter("teacherPaystep"));
*/
		
		
		//조건절에 들어갈 아이디값을 가져와야 하는데 현재 세션에서 가져왔다
		teacher.setTeacherId((String) httpsession.getAttribute("teacherId"));
		

		int a = TDao.updateTeacher(teacher);
		
		if(a == 0) {
			System.out.println("업데이트 안댐");
			return "redirect:/home";
		}else{
			System.out.println("업데이트 성공");
			return "redirect:/kyo";
		}
	}
	
	//교원의 정보 조회 admin전용 TableList ★현재 교원 ,이직한 교원★
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
		
		
		//폼에 뿌려주려고 모델객체에 담음
		model.addAttribute("tableList",teacher2);
		model.addAttribute("removeList",teacherRemove);
		/*Teacher teacher =TDao.OneSelectTeacher((Integer)httpsession.getAttribute("teacherNo"));
		model.addAttribute("kyoteacher",teacher);*/
		System.out.println("Table List폼 호출___/Teacher/TeacherModify/table로 포워드\n");
		return "Teacher/TeacherModify/table";
		//리턴을 원하는 폼을 적으면 teacher의 주소값이 저기로 간다 or 저기를 가리킨다
	}
	
	//아이디 중복체크 메서드
	@RequestMapping(value="/sign_up_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int logincheck(HttpServletResponse response, @RequestParam("teacher_ajax_id") String userid) {
		System.out.println("로그인체크메서드 호출_Controller");
		System.out.println("사용자가 입력한 아이디는? : " + userid);
		int check = TDao.logincheck(userid);
		
		if(check == 0){
			System.out.println("DB에 중복되는 값이 없습니다_TeacherController");
		}else{
			System.out.println("DB에 중복되는 값이 있습니다_TeacherController");
		}
		return check;
	}
	
	//입력 회원가입
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(Teacher teacher) {//매개변수는 전역변수이다
		TDao.insertTeacher(teacher);
		System.out.println(teacher+" <--입력확인");
		System.out.println(TDao +" <--Dao 확인");
		System.out.println("home로 리다이렉트\n\n");
		
		return "redirect:/home";
	}
	
	
	//로그인 아이디 체크 메서드 로그인 할 때! 아이디 조회 메서드
	@RequestMapping(value="/login_id_check",method =RequestMethod.POST)
	@ResponseBody
	public int loginIdCheck(HttpServletResponse response, @RequestParam("teacherId") String userid) {
		System.out.println("로그인체크메서드 호출_Controller");
		System.out.println("사용자가 입력한 아이디는? : " + userid);
		int check = TDao.loginIdcheck(userid);
		if(check == 1) {
			System.out.println("아이디 있음_loginIdCheck_TeacherController");
		} else {
			System.out.println("아이디 없음");
		}
		return check;
	}
	
	//로그인 폼 호출
	@RequestMapping(value="/testLogin", method=RequestMethod.GET)
	public void Login(HttpServletRequest request ,HttpServletResponse response) throws Exception {
		
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		HttpSession session = request.getSession();
		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("publicKeyModulus", publicKeyModulus);
		request.setAttribute("publicKeyExponent", publicKeyExponent);
		
		request.getRequestDispatcher("/WEB-INF/views/Login/testLogin.jsp").forward(request, response);
		
	}
	
	
	//로그인 암호화된 아이디 비밀번호를 복호화한다.
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
        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.

        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
            String username = decryptRsa(privateKey, securedUsername);
            String password = decryptRsa(privateKey, securedPassword);
           
            
  
            session2.setAttribute("teacherId", username);
            System.out.println(username);
            if(session2.getAttribute("teacherId") != null) {
            	/*Teacher saveSession = TDao.LoginTeacher(teacher);
            	System.out.println("나오냐");
                session2.setAttribute("teacherNo", saveSession.getTeacherNo());
                System.out.println("나오냐2");
                session2.setAttribute("licenseKindergarten", saveSession.getLicenseKindergarten());
                session2.setAttribute("teacherLevel", saveSession.getTeacherLevel());
                session2.setAttribute("teacherName", saveSession.getTeacherName());
                System.out.println(saveSession.getTeacherName()+"<<<<<<<<<<<<<네임");*/
            }

            
            
            //넘버 라이 네임 레벨 아디
            
            System.out.println(username +"<--복호화한 아이디");
            System.out.println(password +"<--복호화한 패스");

            request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }
    }

    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        System.out.println("해독할 정보 : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }

    /**
     * 16진 문자열을 byte 배열로 변환한다.
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
	
	
	
	
	//@RequestParam("클라이언트가 입력한 값") String 매개변수
	//리퀘스트 파람을 쓰면 값을 알아서 넣어준다
	//로그인 처리
	@RequestMapping(value="/Login" , method = RequestMethod.POST)
	public String Login(
			Model model 
			,Teacher teacher 
			,HttpSession session ) throws Exception {
		
		System.out.println("Teacher 컨트롤러 로그인 메서드 확인");
		Teacher saveSession = TDao.LoginTeacher(teacher);
		System.out.println(teacher.getTeacherId() +"<-- 사용자가 입력한 아이디");
		System.out.println(TDao+" <--TDao 동작 확인");

		if(saveSession != null) {
			if(session.getAttribute("teacherId") == null){
				
				session.setAttribute("teacherNo",saveSession.getTeacherNo());
				session.setAttribute("licenseKindergarten",saveSession.getLicenseKindergarten());
				session.setAttribute("teacherId", saveSession.getTeacherId());
				session.setAttribute("teacherName", saveSession.getTeacherName());
				session.setAttribute("teacherLevel" ,saveSession.getTeacherLevel());
				
				//왜 인지는 모르겠으나 모델객체에 값을 저장하면 주소창에 값이 모두 노출되었다
				//그런데 세션에 저장하니 주소창에 값이 없어졌다 왜???
				/*model.addAttribute("teacherNo",saveSession.getTeacherNo());
				System.out.println(saveSession.getTeacherNo() +" <-- 세션에 저장될 넘버 값 세션");
				
				model.addAttribute("licenseKindergarten",saveSession.getLicenseKindergarten());
				System.out.println(saveSession.getLicenseKindergarten() +" <-- 세션에 저장될 라이센스값");
				
				model.addAttribute("teacherId", saveSession.getTeacherId());
				System.out.println(saveSession.getTeacherId() +"<-- 세션에 저장될 아이디 값");
				
				model.addAttribute("teacherName", saveSession.getTeacherName());
				System.out.println(saveSession.getTeacherName() + "<-- 세션에 저장될 네임값");
				
				model.addAttribute("teacherLevel" ,saveSession.getTeacherLevel());
				System.out.println(saveSession.getTeacherLevel() + " <--세션에 저장될 레벨값");*/
				
				session.setMaxInactiveInterval(7200);
				session.setAttribute("teacherTime", session.getMaxInactiveInterval());
				System.out.println("세션의 유지 시간 : "+session.getMaxInactiveInterval()+"초");
				}
			
			} else {				
				model.addAttribute("nogin","로그인실패");
				System.out.println("아이디나 비밀번호를 확인해주세요");
				
				return "/home";
		}
		return "/home";
	}
	
	//로그아웃 메서드
	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String logOut(@ModelAttribute Teacher teacher ,HttpSession session){

		//sessionstatus.setComplete();
		session.invalidate();
		System.out.println("세션 삭제");


		
		//System.out.println(sessionstatus +"\n 로그아웃 SessionAttributes만 초기화");
		System.out.println(" redirect:/home");
		return "redirect:/home";
	}
	
	//라이센스 라이선스
	@RequestMapping(value="/license", method=RequestMethod.GET)
	public String chara() {
		System.out.println("라이선스 발급 페이지 호출");
		return "Teacher/TeacherModify/license";
	}
	
	//라이센스 라이선스 처리
	@RequestMapping(value="/license", method=RequestMethod.POST)
	public String uuid(Model model) throws Exception {
		
		//UUID에 대해 자세한 사항은 http://hyeonjae.github.io/uuid/2015/03/17/uuid.html 참고
		
		System.out.println("\n 라이선스 발급 처리 호출");
		String licenseKey = UUID.randomUUID().toString();

		model.addAttribute("licenseKey",licenseKey);
		System.out.println(licenseKey +"<--생성된 UUID\n");
		
		return "Teacher/TeacherModify/license";
	}
}