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
<script>
$(document).ready(function(){
		var tdArray = 0;//asd
		<c:forEach var="managementList" items="${managementList}">
		<c:if test="${managementList.PM == 'plus'}">
		tdArray += ${managementList.equipmentAmount * managementList.equipmentCost}
		</c:if>
		</c:forEach>
		console.log(tdArray);
		$('#totalValue').html(tdArray);
	});
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<form action="${pageContext.request.contextPath}/test11">
					<input type="hidden" name="test" value="${test}"/>
					<input type="date" name="testDay" value="${testDay}"/>
					<input type="date" name="testDay2" value="${testDay2}"/>
					<input type="submit" value="검색"/>
				</form>
				<div>
					<table border="1">
						<thead>
							<th>PM</th>
							<th>구매자</th>
							<th>품명</th>
							<th>단가</th>
							<th>구매,사용 수량</th>
							<th>총 구매액수,사용액수</th>
							<th>구매일,사용일</th>
						</thead>
						<tbody>
							<c:forEach var="managementList" items="${managementList}">
							<c:if test="${managementList.equipmentAmount != 0}">
							<tr>
								<td>${managementList.PM}</td>
								<td>${managementList.teacherName}</td>
								<td>${managementList.equipmentName}</td>
								<td>${managementList.equipmentCost}</td>
								<td>${managementList.equipmentAmount}</td>
								<td class="tdValue">${managementList.equipmentCost*managementList.equipmentAmount}</td>
								<td>${managementList.equipmentDay}</td>
							<tr>
							</c:if>
							</c:forEach>
						</tbody>
					</table>
					<!--  -->
					<div>총 구매금액</div>
					<div id="totalValue">
						
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
