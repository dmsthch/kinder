<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%

List<String> a = (List<String>)request.getAttribute("jsonStr");
System.out.println("���� �ٺ�");
System.out.println(a);
%>