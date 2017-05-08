<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
List<String> a = (List<String>)request.getAttribute("jsonStr");
System.out.println("조장 바보");
System.out.println(a);
%>