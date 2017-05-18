package com.cafe24.dmsthch.Teacher;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TeacherInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//interceptor�� preHandle�޼���� ��Ʈ�ѷ� ���� ���� ����Ǵ� �޼����̴�.
		System.out.println("preHandle�޼���_TeacherInterceptor.java ȣ�� Ȯ��");
		if(request.getSession().getAttribute("teacherId") == null) {
			System.out.println("���� teacherId�� �� : "+request.getSession().getAttribute("teacherId"));
			
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('������ �����ϴ�!'); location.href = '���Ѿ��� ����� ���� ������'; </script>");
			out.flush();
			
			//response.sendRedirect("home");
			//return false;
			//teacherId���� null�� ��� home���� �̵�
		}else{
			System.out.println("���� teacherId�� �� : " + request.getSession().getAttribute("teacherId"));
			return true;
		}
		return false;
	}
}