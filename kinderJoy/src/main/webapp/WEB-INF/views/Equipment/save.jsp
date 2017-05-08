<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sung_gong = 1}">
		<%
			System.out.println("입력성공");
		%>
	</c:if>
	<c:if test="${sung_gong != 1}">
		<%
			System.out.println("입력실패");
		%>
	</c:if>
</body>
</html>