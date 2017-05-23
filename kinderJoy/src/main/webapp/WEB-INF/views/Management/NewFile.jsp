<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>핵병아리:비품예산</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="./ManagementNav/SideNav.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>

<style>
@font-face{
	font-family: 'koverwatch';
	src: url(fonts/koverwatch.ttf) format('truetype');
}
body {
	font-family: koverwatch
}
button {
	background-color: white;
 }
</style>

</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				
				<div>
					<table>
						<thead>
							<th>품명</th>
							<th>수량</th>
							<th>단가</th>
							<th>총단가</th>
						</thead>
						<tbody>
							<c:forEach var="plusMinus" items="${plusMinus}">
							<tr>
								<td>${plusMinus.equipmentName}</td>
								<td>${plusMinus.PLUS - plusMinus.MINUS}</td>
								<td>${equipmentCost]}</td>
								<td>${(plusMinus.PLUS - plusMinus.MINUS)*equipmentCost}</td>
							<tr>
							</c:forEach>
						</tbody>
					</table>
					<div>
						총액수
						<div>123</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br><br><br><br><br>


</body>
<c:import url="../module/importJS.jsp"></c:import>
</html>
