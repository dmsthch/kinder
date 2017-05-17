<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>
<style>
	.ageFont {
	font-size: 35px;
	}
	
	.textRiht{
	text-align: right;
	margin-right: 20px;
	}
	@font-face{
	font-family: 'koverwatch';
	src: url(fonts/koverwatch.ttf) format('truetype');
}
body {
	font-family: koverwatch
}
</style>

<body class="components-page">
<div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
			
				<!-- 비품 품의서 리스트 -->
				<div class="row">
					<c:forEach var ="getCategory" items="${getCategory}">
						<div>
						<div>
							<div class="card card-stats">
								<div class="card-header" data-background-color="green">
									<!-- <i class="material-icons">content_copy</i> -->
									<h3 class="ageFont title">${getCategory.categoryName}</h3>
								</div>
								<div class="card-content">									
									<p class="category"></p>
									<h3 class="title"><a href="${pageContext.request.contextPath}/sheet">품의서작성하기</a></h3>
								</div>
								<div class="card-footer textRiht">
									<div class="stats ">
 										<c:forEach var="sheet" items="${sheet}">
											<c:if test="${sheet.equipmentCategoryNo == getCategory.categoryNo}">
												<i class="material-icons" style="margin-left: 5px;">date_range</i><a href="${pageContext.request.contextPath}/reroad?sheetName=${sheet.valueName}&sheetCategoryNo=${getCategory.categoryNo}">${sheet.valueName}</a>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<br>
						</div>
					</c:forEach>	
				</div>
				<!-- 비품 품의서 리스트  끝 -->

			</div>
		</div>
	</div>
</div>
<%-- 
<a href="${pageContext.request.contextPath}/educationProjectAddPage">계획안 양식추가</a>
<a href="${pageContext.request.contextPath}/educationProjectFormLoad?formOrder=1">1번 양식 불러오기</a>
<a href="${pageContext.request.contextPath}/educationProjectFormLoad?formOrder=2">2번 양식 불러오기</a>
<a href="${pageContext.request.contextPath}/EducationProjectLoad?categoryNo=1&date=20170511">저장된 계획안 불러오기 테스트 // 날짜 : 20170511</a> --%>

</body>
</html>