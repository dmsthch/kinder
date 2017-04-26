<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	
	<!-- CSS Link -->
<%-- 	<c:import url="${pageContext.request.contextPath}/WEB-INF/views/module/importCSS.jsp"></c:import> --%>
	<c:import url="../module/importCSS.jsp"></c:import>
	
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">


<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

	<br><br><br><br><br>
	<div>기관 일정 계획표</div>
	<div><textarea rows="30" cols="200"></textarea></div>
	<div>
		<input type="date"/>
		<input type="date"/>
	</div>
	<div><input type="button" value="작성완료"/></div>
	<div><input type="button" value="취소"/></div>
	<div>
		
	</div>

<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>

</body>

</html>