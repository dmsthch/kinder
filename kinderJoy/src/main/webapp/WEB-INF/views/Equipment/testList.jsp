<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today" />
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
@font-face{
	font-family: 'koverwatch';
	src: url(fonts/koverwatch.ttf) format('truetype');
}
body {
	font-family: koverwatch
}
/* .form-control{
	width:400px;
} */
</style>
<script>
$(document).ready(function(){
	$('#equipmnetRequestListNav').attr('class','active');
})
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card card-plain">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">비품 건의 리스트</h4>
	                                <p class="category">EQUIPMENT REQUEST LIST</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead>
	                                        <th>건의자</th>
	                                    	<th>건의 품목</th>
	                                    	<th>건의 품명</th>
	                                    	<th>건의 사유</th>
	                                    	<th>예상 가격</th>
	                                    	<th>건의 날짜</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach var="equipmentRequest" items="${equipmentRequest}">
		                                        <tr>
		                                        	<td>${equipmentRequest.teacherNo}</td>
		                                        	<td>${equipmentRequest.categoryNo}</td>
		                                        	<td>${equipmentRequest.requestName}</td>
		                                        	<td>${equipmentRequest.requestReason}</td>
		                                        	<td>${equipmentRequest.requestPrice}</td>
		                                        	<td>${equipmentRequest.requestDay}</td>
		                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>
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