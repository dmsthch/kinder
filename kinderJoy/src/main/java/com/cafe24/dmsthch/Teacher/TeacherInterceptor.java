package com.cafe24.dmsthch.Teacher;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TeacherInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//interceptor의 preHandle메서드는 컨트롤러 들어가기 전에 실행되는 메서드이다.
		System.out.println("preHandle메서드_TeacherInterceptor.java 호출 확인");
		if(request.getSession().getAttribute("teacherId") == null) {
			System.out.println("현재 teacherId의 값 : "+request.getSession().getAttribute("teacherId"));
			
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다!'); location.href = '권한없는 사람이 보는 페이지'; </script>");
			out.flush();
			
			//response.sendRedirect("home");
			//return false;
			//teacherId값이 null일 경우 home으로 이동
		}else{
			System.out.println("현재 teacherId의 값 : " + request.getSession().getAttribute("teacherId"));
			return true;
		}
		return false;
	}
}