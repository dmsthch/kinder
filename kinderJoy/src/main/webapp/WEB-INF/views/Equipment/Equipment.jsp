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

<style>
button {
	background-color: white;
 }
 	#staticMenu { 
		margin: 30pt; 
		padding: 0pt;  
		position: absolute; 
		right: 0px; 
		top: 0px;
		position:absolute;
		z-index:9999;
		overflow:hidden;
		border-radius: 13px;
	}
</style>
<script src="js/KHS/RefreshStaticMenu.js"></script>
<script src="js/KHS/hsCustom.js"></script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50" onload="InitializeStaticMenu();">
<div id="staticMenu" class="text-center">
	<div>
		<br/>
		<input class="btn btn-default dropdown-toggle" id="button" type="button" value="비품추가"/>
	</div>
</div>
 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<jsp:include page="../Equipment/EquipmentLIst.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>



</body>
<c:import url="../module/importJS.jsp"></c:import>
</html>
