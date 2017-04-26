<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="css/KHS/style.css">
</head>	

<body class="container">

<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

<div id="clock">
	<div id="app">
	</div>
	<script src='js/KHS/react.min.js'></script>
	<script src='js/KHS/react-dom.min.js'></script>
	<script src="js/KHS/index.js"></script>
</div>

<div class="text-center">
	<h1 style="color:white">±Û¾¾!!!!!!!!!</h1><br>
	<button class="btn btn-default btn-lg">Ãâ±Ù</button>	
</div>

<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>
</body>
</html>
