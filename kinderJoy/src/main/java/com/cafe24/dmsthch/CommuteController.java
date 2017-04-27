package com.cafe24.dmsthch;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		System.out.println(map);
		
		if(teacherNo != 0){ //�α����� �Ǿ��ִ��� üũ �α��� �� ���
			
			Teacher teacher = tDao.OneSelectTeacher(teacherNo); //�ش� ���� �˻�
			
			if(map == null){ //��ٵ���� ���ѻ���
				System.out.println("��ٵ���� ���ѻ���");
				model.addAttribute("teacherNo", teacherNo);
				model.addAttribute("teacherName", teacher.getTeacher_name()); //�̸� ���
				model.addAttribute("commuteCheck", false); //��� ����� ���� ����
			}else{ //�̹� ��ٵ���� �ѻ���
				System.out.println("�̹� ��ٵ���� �ѻ���");
				model.addAttribute("teacherNo", teacherNo); //��ȣ ����
				model.addAttribute("teacherName", teacher.getTeacher_name()); //�̸� ����
				model.addAttribute("commuteTime", map.get("attendanceStart")); //��ٽð� ����
				model.addAttribute("commuteCheck", true); //��� ����� ����
			}
			
		}else{ // �α��� �ȵȰ��
			model.addAttribute("teacherNo", teacherNo);//�⺻���� 0�� ���
		}
		
		return "Commute/Commute";
	}
	
	
	//�α��� �Ǿ��ִ� ���¿��� �⼮üũ
	@RequestMapping(value="/GoCommute", method=RequestMethod.GET)
	public String commute(@RequestParam(name="teacherNo", required=true) int teacherNo){
		System.out.println("/GoCommute(login) Controller");
		
		cDao.commute(teacherNo); //��� ��� �޼��� ����
		return "redirect:/Commute?teacherNo="+teacherNo;
	}
	
	//�α����� �ȵǾ� �ִ� ���¿��� �⼮üũ
	@RequestMapping(value="/GoCommute", method=RequestMethod.POST)
	public String commute(Teacher teacher){
		System.out.println("/GoCommute(unlogin) Controller");
		
		String returnUri = "";
		
		System.out.println(teacher.getTeacher_id());
		System.out.println(teacher.getTeacher_pw());
		System.out.println(teacher.getTeacher_no());
		
		int loginResult = tDao.LoginTeacher(teacher); // id pw Ȯ�� �޼���
			
		if(loginResult == 1){ //�α��� ����
			teacher = tDao.OneSelectTeacher(teacher.getTeacher_no()); //�ش� ���� �˻�    04 27 �̺κ� null point error
			cDao.commute(teacher.getTeacher_no()); //��� ��� �޼��� ����
			returnUri = "redirect:/Commute?teacherNo="+teacher.getTeacher_no(); //��ý ������ ����ֱ� ���� teacherNo�� ��� ��ý ȭ������ �̵�
		}else{ // �α��� ����
			returnUri = "redirect:/Commute?teacherNo=0"; // ��α��� ���·� ��ý ȭ������ �̵�
		}
		return returnUri;
	}
	
	
}
