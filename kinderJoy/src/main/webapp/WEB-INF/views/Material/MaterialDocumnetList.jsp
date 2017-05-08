<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	
	<!-- 따라다니는 메뉴 -->
	<script src="js/KHS/RefreshStaticMenu.js"></script>
	
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	
	
	<style>
		#staticMenu { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
		.myBtn {
 		  background: transparent; 
		  border: 2px solid black;
		  border-radius: 0;
		  color: black;
		  font-size: 15px;
		  font-weight: bold;
		  letter-spacing: 2px;
		  padding: 5px 35px;
		  margin-top: 5px;
		  transition: all 0.4s ease-in-out;
		}
		body{
			margin-top: 5%;
		}
	</style>
	
</head>
<body class="container" onload="InitializeStaticMenu();">


<!-- navbar -->
<%-- <c:import url="../module/navbar.jsp"></c:import> --%>
<!-- Follow sideNav -->
<div id="staticMenu">
	<a href="#" class="smoothScroll btn btn-default myBtn">버튼</a><br/>
</div>

<div class="section-title text-center">
	<h1 class="heading bold">MaterialDocumnetList</h1>
	<hr>
</div>

<div class="row">
	
</div>

<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>

</body>
</html>