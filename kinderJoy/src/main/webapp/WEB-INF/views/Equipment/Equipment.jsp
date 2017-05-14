<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>


</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- navbar -->


<!-- home section -->
	<br><br><br><br><br><br><br>
 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<jsp:include page="../Equipment/NewFile.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
<br><br><br><br><br>


</body>
<%-- <c:import url="../module/importJS.jsp"></c:import> --%>
</html>
