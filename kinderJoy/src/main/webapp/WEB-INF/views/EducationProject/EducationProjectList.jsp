<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>
<c:import url="../module/importJS.jsp"></c:import>
<script>

$(document).ready(function(){

})
</script>
</head>
<body class="components-page">
<div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" data-background-color="blue">
							<h4 class="title">${categoryName}</h4>
							<p class="category">${className}반</p>
						</div>
						
						<div class="card-content table-responsive">
							<table class="table table-hover">
			                    <tbody>	
			                    	<!-- 월간계획안일 경우 -->
			                    	<c:if test="${categoryNo == 2}">
			                    	<c:forEach items="${eduList}" var="eduList">
									 <tr>
									 	<td style="cursor:pointer;" onclick="location.href=''">${className}반 월간계획안 : ${fn :substring(eduList.projectDateInfo,0,4)}년 -  ${fn :substring(eduList.projectDateInfo,5,7)}월</td>
									 </tr>
									</c:forEach>
									</c:if>
									
									<!-- 주간계획안일 경우 -->
									<c:if test="${categoryNo == 3}">
			                    	<c:forEach items="${eduList}" var="eduList">
									 <tr>
									 	<td style="cursor:pointer;" onclick="location.href=''">${className}반 주간계획안 : ${fn :substring(eduList.projectDateInfo,0,4)}년 -  ${fn :substring(eduList.projectDateInfo,5,7)}월 - ${fn :substring(eduList.projectDateInfo,8,9)}주</td>
									 </tr>
									</c:forEach>
									</c:if>
									
									<!-- 일일계획안일 경우 -->
									<c:if test="${categoryNo == 4}">
			                    	<c:forEach items="${eduList}" var="eduList">
									 <tr>
									 	<td style="cursor:pointer;" onclick="location.href=''">${className}반 일일계획안 : ${fn :substring(eduList.projectDateInfo,0,4)}년 -  ${fn :substring(eduList.projectDateInfo,5,7)}월 - ${fn : substring(eduList.projectDateInfo,8,10)}일</td>
									 </tr>
									</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>

</html>