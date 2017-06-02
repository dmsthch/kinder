<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>
</head>
<body class="components-page">

<div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" data-background-color="green">
							<h4 class="title">발달평가 목록</h4>
						</div>
						<div class="card-content table-responsive ">
						<form action="${pageContext.request.contextPath}/ChildDevelopmentList" method="get">
							<div class="input-group row">
							
								<span class="input-group-addon" style="padding-top: 20px;">
									<i class="material-icons">search</i>
								</span>
								
								<div class="col-md-3">
									<input type="text" class="form-control" name="searchVal" placeholder="검색어를 입력하세요">
								</div>
								<div class="col-md-4">
									<div class="radio" style="padding-top:25px;">
										<label><input type="radio" name="searchAge" value="" >전체</label>
										<label><input type="radio" name="searchAge" value="3">3세</label>
										<label><input type="radio" name="searchAge" value="4">4세</label>
										<label><input type="radio" name="searchAge" value="5">5세</label>
									</div>
								</div>
								<div class="col-md-2" style="padding-top: 10px;">
									<button class="btn btn-success">검색</button>
								</div>
							</div>
						</form>
							<hr/>
							<div>
								<table class="table table-hover">
									<tbody>
										<c:forEach items="${detailsList}" var="List">
										<tr>
											<td style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/ChildDevelopmentView?detailesNo=${List.detailesNo}'"> 
												${List.developmentTitle}
											</td>
											<td>
												${List.className }
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<hr>
								<c:if test="${pageNo >1 }">
								<a href="${pageContext.request.contextPath}/ChildDevelopmentList?pageNo=${pageNo-1}&searchVal=${searchVal}&searchType=${searchType}&searchAge=${searchAge}">이전</a>
							</c:if>
								<a href="${pageContext.request.contextPath}/ChildDevelopmentList?pageNo=${pageNo+1}&searchVal=${searchVal}&searchType=${searchType}&searchAge=${searchAge}">다음</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>