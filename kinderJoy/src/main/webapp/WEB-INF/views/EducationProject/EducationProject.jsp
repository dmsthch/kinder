<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<script>
/* console.log(${year}+"<,,,");
console.log(${childclass}+"<<childclass") */
</script>



<style>
.ageFont {
	font-size: 30px;
}

.textRiht {
	text-align: right;
	margin-right: 20px;
}

.myBtn.myBtn {
	background: transparent;
	border: 2px solid white;
	border-radius: 0;
	color: white;
	font-size: 15px;
	font-weight: bold;
	letter-spacing: 2px;
	padding: 5px 35px;
	margin-top: 5px;
	transition: all 0.4s ease-in-out;
}
.card-header.card-header{
	padding: 5px;
	padding-left: 20px;
	padding-right: 20px;
}


</style>
<c:import url="../module/navbar.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>

</head>
<body class="components-page" >
<div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">				
				<!-- 일일계획안 -->
				<div class="row">
					<c:forEach var ="age" begin="3" end ="5">
						<div class="col-lg-4 col-md-6 col-sm-6 ">
							<div class="card card-stats">
								<div class="card-header" data-background-color="blue">
									<!-- <i class="material-icons">content_copy</i> -->
									<h3 class="ageFont title">${age}세</h3>
								</div>
								<div class="card-content">									
									<p class="category"></p>
									<h3 class="title" style="font-weight: bold;">일일계획안</h3>
								</div>
								<div class="card-footer textRiht">
									<div class="stats ">
										<c:if test="${childclass == '[]'}">
											생성된 반이 없습니다.
										</c:if>
										<c:forEach var="childclass" items="${childclass}">
											<c:if test="${childclass.classAge == age }">
												<i class="material-icons" style="margin-left: 5px;">library_books</i>
												<a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=4&classNo=${childclass.classNo}"> ${childclass.className}반 </a><br/>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>	
				</div>
				<!-- 일일계획안 끝 -->
				
				<!-- 주간계획안 -->
				<div class="row">
					<c:forEach var ="age" begin="3" end ="5">
						<div class="col-lg-4 col-md-6 col-sm-6 ">
							<div class="card card-stats">
								<div class="card-header" data-background-color="red">
									<!-- <i class="material-icons">content_copy</i> -->
									<h3 class="ageFont title">${age}세</h3>
								</div>
								<div class="card-content">									
									<p class="category"></p>
									<h3 class="title" style="font-weight: bold;">주간계획안</h3>
								</div>
								<div class="card-footer textRiht">
									<div class="stats ">
										<c:if test="${childclass == '[]'}">
											생성된 반이 없습니다.
										</c:if>
										<c:forEach var="childclass" items="${childclass}">
											<c:if test="${childclass.classAge == age }">
												<i class="material-icons" style="margin-left: 5px;">library_books</i>
												<a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=3&classNo=${childclass.classNo}"> ${childclass.className}반 </a><br/>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>	
				</div>
				<!-- 주간계획안 끝 -->

				
				<!-- 월간계획안 -->
				<div class="row">
					<c:forEach var ="age" begin="3" end ="5">
						<div class="col-lg-4 col-md-6 col-sm-6 ">
							<div class="card card-stats">
								<div class="card-header" data-background-color="green">
									<!-- <i class="material-icons">content_copy</i> -->
									<h3 class="ageFont title">${age}세</h3>
								</div>
								<div class="card-content">									
									<p class="category"></p>
									<h3 class="title" style="font-weight: bold;">월간계획안</h3>
								</div>
								<div class="card-footer textRiht">
									<div class="stats ">
										<c:if test="${childclass == '[]'}">
											생성된 반이 없습니다.
										</c:if>
										<c:forEach var="childclass" items="${childclass}">
											<c:if test="${childclass.classAge == age }">
												<i class="material-icons" style="margin-left: 5px;">library_books</i>
												<a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=2&classNo=${childclass.classNo}"> ${childclass.className}반 </a><br/>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>	
				</div>
				<!-- 월간계획안  끝 -->

				<!-- 연간계획안 -->
				<div class="row">
					<c:forEach var ="age" begin="3" end ="5">
						<div class="col-lg-4 col-md-6 col-sm-6 ">
							<div class="card card-stats">
								<div class="card-header" data-background-color="orange">
									<!-- <i class="material-icons">content_copy</i> -->
									<h3 class="ageFont title">${age}세</h3>
								</div>
								<div class="card-content">									
									<p class="category"></p>
									<h3 class="title" style="font-weight: bold;">연간계획안</h3>
								</div>
								<div class="card-footer textRiht">
									<div class="stats ">
										<c:forEach var="forYear" begin="${year-2}" end="${year}">
											<i class="material-icons" style="margin-left: 5px;">date_range</i>
											<a href="${pageContext.request.contextPath}/EducationProjectLoad?categoryNo=1&date=${forYear}&age=${age}">${forYear}년</a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>	
				</div>
				<!-- 연간계획안  끝 -->
			</div>
		</div>
	</div>
</div>

<%-- 
<a href="${pageContext.request.contextPath}/educationProjectAddPage">계획안 양식추가</a>
<a href="${pageContext.request.contextPath}/educationProjectFormLoad?formOrder=1">1번 양식 불러오기</a>
<a href="${pageContext.request.contextPath}/educationProjectFormLoad?formOrder=2">2번 양식 불러오기</a>
<a href="${pageContext.request.contextPath}/EducationProjectLoad?categoryNo=1&date=20170511">저장된 계획안 불러오기 테스트 // 날짜 : 20170511</a> --%>
<%-- <c:import url="../module/importJS.jsp"></c:import> --%>
</body>
</html>