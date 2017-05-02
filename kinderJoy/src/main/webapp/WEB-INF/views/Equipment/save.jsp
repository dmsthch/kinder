<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%

List<String> a = (List<String>)request.getAttribute("jsonStr");
System.out.println("조장 바보");
System.out.println(a);
%>