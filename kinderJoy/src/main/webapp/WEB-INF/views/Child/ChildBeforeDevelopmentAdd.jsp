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
						<div class="card-header" data-background-color="blue">
							<h4 class="title">발달평가 대상 선택</h4>
							
							
								
						</div>
						
						<div class="card-content table-responsive ">
							<div class="input-group row">
								<span class="input-group-addon" style="padding-top: 20px;">
									<i class="material-icons">search</i>
								</span>
								<div class="col-md-2">
									<select class="form-control " name="searchType">
										<option selected value="">선택</option>
										<option>유아 이름</option>
										<option>반 이름</option>
									</select>
								</div>
								<div class="col-md-3">
									<input type="text" class="form-control" name="searchVal" placeholder="검색어를 입력하세요">
								</div>
								<div class="col-md-5">
									<div class="radio" style="padding-top:25px;">
										<label><input type="radio" name="searchAge" value="" >전체</label>
										<label><input type="radio" name="searchAge" value="3" >3세</label>
										<label><input type="radio" name="searchAge" value="4">4세</label>
										<label><input type="radio" name="searchAge" value="5">5세</label>
									</div>
								</div>
							</div>
							<hr/>
							<table class="table table-hover table-striped">
								<thead>
									<tr>
						                <th>이름</th>
						                <th>성별</th>
						                <th>나이</th>
						                <th>반 이름</th>
						            </tr>
									
								</thead>
			                    <tbody>	
			                    	<c:forEach items="${result}" var="result">
			                    		<tr style="cursor:pointer;" onclick="location.href='#'">
									 		<td>${result.kidName}</td>
									 		<td>${result.kidGender}</td>
									 		<td>${result.classAge}</td>
									 		<td>${result.className}</td>
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

</body>
</html>