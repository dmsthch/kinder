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
<!--  -->
     <link href='https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic|Roboto+Slab:400,700|Inconsolata:400,700&subset=latin,cyrillic'
          rel='stylesheet' type='text/css'>
     <link rel="stylesheet" href="https://swisnl.github.io/jQuery-contextMenu/css/screen.css" type="text/css"/>
<!--     <link rel="stylesheet" href="https://swisnl.github.io/jQuery-contextMenu/css/theme.css" type="text/css"/> -->
    <link rel="stylesheet" href="https://swisnl.github.io/jQuery-contextMenu/css/theme-fixes.css" type="text/css"/>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/styles/github.min.css">
    <link href="js/KSS/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/KSS/jquery.contextMenu.js" type="text/javascript"></script>
    <script src="js/KSS/jquery.ui.position.min.js" type="text/javascript"></script>
    <script src="https://swisnl.github.io/jQuery-contextMenu/js/main.js" type="text/javascript"></script>

<style>
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
		$('#managementEquipemntListNav').attr('class','active');
	});
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
			
				<form action="${pageContext.request.contextPath}/Management">
					<input type="hidden" name="managementEquipmentPageValue" value="${managementEquipmentPageValue}"/>
					<input type="date" name="startDay" value="${startDay}"/>
					<input type="date" name="fanalDay" value="${fanalDay}"/>
					<input type="submit" value="검색"/>
				</form>
				<div>
				<div class="row">
	                    <div class="col-md-12">
	                        <div class="card card-plain">
	                            <div class="card-header" data-background-color="green">
	                                <h4 class="title">비품 예산 관리 리스트</h4>
	                                <p class="category">MANAGEMENT EQUIPMENT LIST</p>
	                            </div>
	                            <div class="card-content table-responsive">
					<table class="table table-hover">
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
					<div>총 구매금액1</div>
					<div id="totalValue">
							  </div>
	                        </div>
	                    </div>
	                </div>
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
