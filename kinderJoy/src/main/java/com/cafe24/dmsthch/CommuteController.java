package com.cafe24.dmsthch;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.dmsthch.Commute.CommuteDao;
import com.cafe24.dmsthch.Teacher.Teacher;
import com.cafe24.dmsthch.Teacher.TeacherDao;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteDao cDao;
	@Autowired
	private TeacherDao tDao;
	
	
	private Map commuteMap = null;
	
//	@Autowired
//	public CommuteController(HttpSession session) {
//		
//		if(session.getAttribute("teacherNo") != null){
//			int teacherNo = (Integer) session.getAttribute("teacherNo");
//			commuteMap = cDao.commuteCheck(teacherNo);
//		}
//		
//	}
//	
//	@Autowired
//	public CommuteController() {
//	}
	

	//���� �⼮üũ ������
	@RequestMapping(value="/Commute", method=RequestMethod.GET)
	public String commuteCheck(
			Model model
			,HttpSession session
			,@RequestParam(value="teacherNo",required=false, defaultValue="0") int teacherNo)
	{
		System.out.println("/Commute Controller");
		
		if(session.getAttribute("teacherNo") != null){
			teacherNo = (Integer) session.getAttribute("teacherNo");
		}
		System.out.println("teacherNo : " + teacherNo);
		
		//teacherNo �� 0�� �ƴϸ� (�α��λ���)
		//������� Ȯ���� �� ������� �ʾ��� ��� teacherNo , name ������ �̵�
		//teacherNo�� 0�̸� ��α��� ����
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //���ó�¥ ��ٺ� üũ
		System.out.println(map);
		
		if(teacherNo != 0){ //�α����� �Ǿ��ִ��� üũ �α��� �� ���
			
			if(map == null){ //��ٵ���� ���ѻ���
				System.out.println("��ٵ���� ���ѻ���");
				Teacher teacher = tDao.OneSelectTeacher(teacherNo); //�ش� ���� �˻� (�̸� ��� ����)
				model.addAttribute("teacherNo", teacherNo);
				model.addAttribute("teacherName", teacher.getTeacher_name()); //�̸� ���
				model.addAttribute("commuteCheck", "�����"); //��� ����� ���� ����
			}else{ //��ٵ���� �ѻ���
				System.out.println("��ٵ���� �ѻ���");
				model.addAttribute("teacherNo", teacherNo); //��ȣ ����
				model.addAttribute("teacherName", (String)map.get("teacherName")); //�̸� ����

				String commuteOutTime = map.get("attendanceEnd")+""; //��ٽð� ��������
				
				if(commuteOutTime.equals("null")){ //����� ���� ����
					System.out.println("����� ���� ����");
					List<Map<String,Object>> absenceList = cDao.absenceCheck((Integer) map.get("attendanceNo")); //�������� �˻�
					Map<String, Object> absence = null;
					if(absenceList.size() != 0){
						absence = absenceList.get(absenceList.size()-1); //���� �ֱ� ����						
					}
										
					if(absence == null){ //������ ���ѻ���
						model.addAttribute("commuteCheck", "���"); //��� ����� ���� ����
						model.addAttribute("commuteTime", map.get("attendanceStart")); //��ٽð� ����
					}else{ //������ ����
						if(absence.get("absenceEnd") == null){ // ���� ����
							model.addAttribute("commuteCheck", "����"); //���� ����� ���� ����
							model.addAttribute("commuteTime", absence.get("absenceStart")); //����ð� ����
						}else{// ������
							model.addAttribute("commuteCheck", "����"); //���� ����� ���� ����
							model.addAttribute("commuteTime", absence.get("absenceEnd")); //���ͽð� ����
						}
					}
				}else{ //����� ����
					model.addAttribute("commuteCheck", "���"); //��� ����� ����
					model.addAttribute("commuteTime", commuteOutTime); //��ٽð� ����
				}
			}
		}else{ // �α��� �ȵȰ��
			model.addAttribute("teacherNo", teacherNo);//�⺻���� 0�� ���
		}
		
		return "Commute/Commute";
	}
	
	
	//�α��� �Ǿ��ִ� ���¿��� �⼮üũ
	@RequestMapping(value="/CommuteIn", method=RequestMethod.GET)
	public String commute(HttpSession session){
		System.out.println("/CommuteIn(login) Controller");
		
		int teacherNo = 0;
		Teacher teacher = null;
		if(session.getAttribute("teacherNo") != null){
			teacherNo = (Integer) session.getAttribute("teacherNo");
			teacher = tDao.OneSelectTeacher(teacherNo);
			teacher.setTeacher_no(teacherNo);
		}
		
		System.out.println(teacherNo);
		
		cDao.commuteIn(teacher); //��� ��� �޼��� ����
		return "redirect:/Commute";
	}
	
	//�α����� �ȵǾ� �ִ� ���¿��� ���
	@RequestMapping(value="/CommuteIn", method=RequestMethod.POST)
	public String commute(Teacher teacher, Model model){
		System.out.println("/CommuteIn(unlogin) Controller");
		
		Teacher noTeacher = tDao.LoginTeacher(teacher); // id pw Ȯ�� �޼��� ������ȣ return
		int teacherNo = noTeacher.getTeacher_no();
		System.out.println("teacherNo : " + teacherNo);
		
		Teacher getTeacher = tDao.OneSelectTeacher(teacherNo);
		getTeacher.setTeacher_no(teacherNo);
		
		if(teacherNo > 0){ //�α��� ����
			if(cDao.commuteCheck(teacherNo) == null){ //��ٵ���� �ȵǾ� �ִ� ���
				cDao.commuteIn(getTeacher); //��� ��� �޼��� ����
			}else{
				System.out.println("��� ����� �Ǿ�����");
			}
		}
		
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //���ó�¥ ��ٺ� üũ
		
		System.out.println(map);
		
		String teacherName = map.get("teacherName")+"";
		String attendanceStart = map.get("attendanceStart")+"";
		
		System.out.println(teacherName + "treacher naeaweffe");
		System.out.println(attendanceStart);
		
		String notice = teacherName+"�� "+attendanceStart+" ��ٵ�� �Ǽ˽��ϴ�";
		model.addAttribute("notice", notice);
		
		return "redirect:/Commute"; 
	}
	
	//�α��� �Ǿ��ִ� ���¿��� ����ϱ�
	@RequestMapping(value="/CommuteOut", method=RequestMethod.GET)
	public String commuteOut(HttpSession session){
		System.out.println("/commuteOut(login) Controller");
		
		int teacherNo = 0;
		if(session.getAttribute("teacherNo") != null){
			teacherNo = (Integer) session.getAttribute("teacherNo");			
		}
		System.out.println(teacherNo);
		
		cDao.commuteOut(teacherNo);
		
		return "redirect:/Commute";
	}
	
	//�α����� �ȵǾ� �ִ� ���¿��� ���
	@RequestMapping(value="/CommuteOut", method=RequestMethod.POST)
	public String commuteOut(Teacher teacher, Model model){
		System.out.println("/commuteOut(login) Controller");
		
		Teacher noTeacher = tDao.LoginTeacher(teacher); // id pw Ȯ�� �޼��� ������ȣ return
		int teacherNo = noTeacher.getTeacher_no();
		System.out.println(teacherNo);
		
		if(teacherNo > 0){ //�α��� ����
			teacher = tDao.OneSelectTeacher(teacherNo);
			cDao.commuteOut(teacherNo); //��� ��� �޼��� ����
		}
		
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //���ó�¥ ��ٺ� üũ
		Teacher nameTeacher = tDao.OneSelectTeacher(teacherNo); //�ش� ���� �˻� (�̸� ��� ����)
						
		String teacherName = nameTeacher.getTeacher_name();
		String attendanceEnd = map.get("attendanceEnd")+"";
		
		String notice = teacherName+"�� "+attendanceEnd+" ��ٵ�� �Ǽ˽��ϴ�";
		model.addAttribute("notice", notice);
		
		return "redirect:/Commute"; 
	}
	
	//������
	@RequestMapping(value="/absence", method=RequestMethod.GET)
	public String absence(HttpSession session){
		System.out.println("/absence Controller");
		
		Map<Object, Object> map = cDao.commuteCheck((Integer) session.getAttribute("teacherNo")); //���ó�¥ ��ٺ� üũ
		
		cDao.absence(map);
		
		return "redirect:/Commute";
	}
	
	//���͵��
	@RequestMapping(value="/absenceReturn", method=RequestMethod.GET)
	public String absenceReturn(HttpSession session){
		System.out.println("/absenceReturn Controller");
		
		Map<Object, Object> map = cDao.commuteCheck((Integer) session.getAttribute("teacherNo")); //���ó�¥ ��ٺ� üũ
		List<Map<String,Object>> absenceList = cDao.absenceCheck((Integer) map.get("attendanceNo")); //�������� �˻�
		Map<String, Object> absence = null;
		if(absenceList.size() != 0){
			absence = absenceList.get(absenceList.size()-1); //���� �ֱ� ����						
		}
		
		System.out.println(absence);
		
		System.out.println(absence.get("absenceNo"));
		
		cDao.absenceReturn(absence.get("absenceNo")+""); //���� ���
				
		return "redirect:/Commute";
	}
	
	
	//�ӽ� �α׾ƿ�
	@RequestMapping(value="/hsLogout", method=RequestMethod.GET)
	public String hsLogout(HttpSession session){
		session.removeAttribute("teacherNo");
		session.removeAttribute("teacherLicense");
		session.removeAttribute("teacherId");
		session.removeAttribute("teacherName");
		session.removeAttribute("teacherLevel");
		return "redirect:/Commute";
	}
	
	
	
	/*  ����ó�� �κ�  */
	
	//NullPointerException �߻��� Commute�� redirect id, pw ����ġ
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(Model model){
		System.out.println("ERROR : NullPointerException �߻�");
		String notice = "ID, PW�� Ȯ���� �ּ���";
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "redirect:/Commute";
	}
	
	//tooManyResultsException
	@ExceptionHandler(org.apache.ibatis.exceptions.TooManyResultsException.class)
	public String tooManyResultsException(Model model){
		System.out.println("ERROR : tooManyResultsException �߻�");
		String notice = "tooManyResultsException";
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "redirect:/Commute";
	}
	
	
}
