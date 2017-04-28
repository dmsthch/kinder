package com.cafe24.dmsthch;

import java.util.Map;

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

	//���� �⼮üũ ������
	@RequestMapping(value="/Commute", method=RequestMethod.GET)
	public String commuteCheck(@RequestParam(name="teacherNo", required=false, defaultValue="0") int teacherNo
						,Model model){
		System.out.println("/Commute Controller");
		
		//teacherNo �� 0�� �ƴϸ� (�α��λ���)
		//������� Ȯ���� �� ������� �ʾ��� ��� teacherNo , name ������ �̵�
		//teacherNo�� 0�̸� ��α��� ����
		Map<Object, Object> map = cDao.commuteCheck(teacherNo); //���ó�¥ ��ٺ� üũ
		
		if(teacherNo != 0){ //�α����� �Ǿ��ִ��� üũ �α��� �� ���
			
			Teacher teacher = tDao.OneSelectTeacher(teacherNo); //�ش� ���� �˻� (�̸� ��� ����)
			
			if(map == null){ //��ٵ���� ���ѻ���
				System.out.println("��ٵ���� ���ѻ���");
				model.addAttribute("teacherNo", teacherNo);
				model.addAttribute("teacherName", teacher.getTeacher_name()); //�̸� ���
				model.addAttribute("commuteCheck", "�����"); //��� ����� ���� ����
			}else{ //��ٵ���� �ѻ���
				System.out.println("��ٵ���� �ѻ���");
				model.addAttribute("teacherNo", teacherNo); //��ȣ ����
				model.addAttribute("teacherName", teacher.getTeacher_name()); //�̸� ����

				String commuteOutTime = map.get("attendanceEnd")+""; //��ٽð� ��������
				
				if(commuteOutTime.equals("null")){ //����� ���� ����
					model.addAttribute("commuteCheck", "���"); //��� ����� ����
					model.addAttribute("commuteTime", map.get("attendanceStart")); //��ٽð� ����
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
	public String commute(@RequestParam(name="teacherNo", required=true) int teacherNo){
		System.out.println("/CommuteIn(login) Controller");
		
		cDao.commuteIn(teacherNo); //��� ��� �޼��� ����
		return "redirect:/Commute?teacherNo="+teacherNo;
	}
	
	//�α����� �ȵǾ� �ִ� ���¿��� �⼮üũ
	@RequestMapping(value="/CommuteIn", method=RequestMethod.POST)
	public String commute(Teacher teacher){
		System.out.println("/CommuteIn(unlogin) Controller");
		
		int teacherNo = tDao.LoginTeacher(teacher); // id pw Ȯ�� �޼��� ������ȣ return
		System.out.println(teacherNo);
			
		if(teacherNo > 0){ //�α��� ����
			teacher = tDao.OneSelectTeacher(teacherNo);
			cDao.commuteIn(teacherNo); //��� ��� �޼��� ����
		}
		return "redirect:/Commute?teacherNo="+teacherNo; //��ý ������ ����ֱ� ���� teacherNo�� ��� ��ý ȭ������ �̵�
	}
	
	//�α��� �Ǿ��ִ� ���¿��� ����ϱ�
	@RequestMapping(value="/CommuteOut", method=RequestMethod.GET)
	public String CommuteOut(@RequestParam(name="teacherNo", required=true) int teacherNo){
		System.out.println("/CommuteOut(login) Controller");
		
		cDao.commuteOut(teacherNo);
		
		return "redirect:/Commute?teacherNo="+teacherNo;
	}
	
	//�α����� �ȵǾ� �ִ� ���¿��� �⼮üũ
	@RequestMapping(value="/CommuteOut", method=RequestMethod.POST)
	public String CommuteOut(Teacher teacher){
		System.out.println("/CommuteOut(login) Controller");
		
		int teacherNo = tDao.LoginTeacher(teacher); // id pw Ȯ�� �޼��� ������ȣ return
		System.out.println(teacherNo);
		
		if(teacherNo > 0){ //�α��� ����
			teacher = tDao.OneSelectTeacher(teacherNo);
			cDao.commuteOut(teacherNo); //��� ��� �޼��� ����
		}
		
		return "redirect:/Commute?teacherNo="+teacherNo;
	}
	
	
	
	//NullPointerException �߻��� Commute�� redirect id, pw ����ġ
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(Model model){
		System.out.println("ERROR : NullPointerException �߻�");
		String notice = "ID, PW�� Ȯ���� �ּ���";
		model.addAttribute("notice", notice);
		System.out.println(notice);
		return "redirect:/Commute";
	}
	
	
}
