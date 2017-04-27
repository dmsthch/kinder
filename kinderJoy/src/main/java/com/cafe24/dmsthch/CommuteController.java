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
	public String clock(@RequestParam(name="teacherNo", required=false, defaultValue="0") int teacherNo
						,Model model){
		
		//teacherNo �� 0�� �ƴϸ�
		//������� Ȯ���� �� ������� �ʾ��� ���
		//teacher ��ü�� ���� �� �̵�
		//teacherNo�� 0�̸� ��α��� ����
		
		//���üũ �޼���
		//������� �ʾ������
		
		Map<String, String> map = cDao.commuteCheck(teacherNo);
		System.out.println(map);
		
		if(teacherNo != 0){ //�α����� �Ǿ��ִ��� üũ �α��� �� ���
			
			if(map == null){ //��ٵ���� ���ѻ���
				System.out.println("��ٵ���� ���ѻ���");
				model.addAttribute("teacherNo", teacherNo);
				Teacher teacher = tDao.OneSelectTeacher(teacherNo); //�ش� ���� �˻�
				model.addAttribute("teacherName", teacher.getTeacher_name()); //�̸� ���
				model.addAttribute("commuteCheck", false); //��� ����� ���� ����
			}else{ //�̹� ��ٵ���� �ѻ���
				System.out.println("�̹� ��ٵ���� �ѻ���");
				model.addAttribute("teacherNo", teacherNo); //��ȣ ����
				model.addAttribute("teacherName", map.get("teacherName")); //�̸� ����
				model.addAttribute("commuteTime", map.get("attendanceStart")); //��ٽð� ����
				model.addAttribute("commuteCheck", true); //��� ����� ����
				
			}
			
		}else{ // �α��� �ȵȰ��
			model.addAttribute("teacherNo", teacherNo);//�⺻���� 0�� ���
		}
		
		System.out.println(teacherNo);
		
		return "Commute/Commute";
	}
	
	
	
}
