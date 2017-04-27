package com.cafe24.dmsthch;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommuteController {

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
		boolean commuteCheck = true;
		
		if(teacherNo != 0){ //�α����� �Ǿ��ִ��� üũ �α��� �� ���
			
			if(!commuteCheck){ //��ٵ���� ���ѻ���
				System.out.println("��ٵ���� ���ѻ���");
				model.addAttribute("teacherNo", teacherNo);	//�ӽ�.. (teacher��ü�� ����)
				String teacherName = "�Ѽ�";
				model.addAttribute("teacherName", teacherName);
				model.addAttribute("commuteCheck", commuteCheck);
			}else{ //�̹� ��ٵ���� �ѻ���
				System.out.println("�̹� ��ٵ���� �ѻ���");
				model.addAttribute("teacherNo", teacherNo);	//�ӽ�.. (teacher��ü�� ����)
				String teacherName = "�Ѽ�";
				model.addAttribute("teacherName", teacherName);
				
				String commuteTime = "08:50:52"; //��ٽð�
				model.addAttribute("commuteTime", commuteTime);
				model.addAttribute("commuteCheck", commuteCheck);
				
			}
			
		}else{ // �α��� �ȵȰ��
			model.addAttribute("teacherNo", teacherNo);//�⺻���� 0�� ���
		}
		
		System.out.println(teacherNo);
		
		return "Commute/Commute";
	}
	
	
	
}
