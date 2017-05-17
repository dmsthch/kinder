<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>

	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	
	<script src="js/jquery.js"></script>
	
	<script>
	$(document).ready(function(){
		$('#kyotable').attr('class','active');
		$('#sidekyotable').attr('style','background-color:orange');
		
	});
	</script>
	
</head>

<body>

	<div class="wrapper">
	
	<!-- 사이드메뉴바 BEGIN -->
	<c:import url="./side.jsp"></c:import>
	<!-- 사이드메뉴바 END -->


	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">교원 명단</h4>
	                                <p class="category">현재 활동중인 교직원 명단입니다.</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>아이디</th>
	                                    	<th>권한</th>
	                                    	<th>이름</th>
											<th>가입일자</th>
											<th>번호</th>
											<th>은행</th>
											<th>계좌</th>
											<th>호봉</th>
	                                    </thead>
	                                    
	                                    <c:forEach var="t" items="${tableList}">
	                                    <tbody>
	                                        <tr>
	                                        	<td>${t.teacherId}</td>
	                                        	<td>${t.teacherLevel}</td>
	                                        	<td>${t.teacherName}</td>
	                                        	<td>${t.teacherAddDay}</td>
	                                        	<td>${t.teacherPhone}</td>
	                                        	<td>${t.teacherBank}</td>
	                                        	<td>${t.teacherAccount}</td>
	                                        	<td>${t.teacherPaystep}</td>
	                                        <tr>
	                                    </tbody>
	                                   </c:forEach>
	                                </table>

	                            </div>
	                        </div>
	                    </div>

	                    <div class="col-md-12">
	                        <div class="card card-plain">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">이직한 명단</h4>
	                                <p class="category">이전에 있었던 교직원 명단입니다.</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead>
	                                        <th>ID</th>
	                                    	<th>Name</th>
	                                    	<th>Salary</th>
	                                    	<th>Country</th>
	                                    	<th>City</th>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                        	<td>1</td>
	                                        	<td>Dakota Rice</td>
	                                        	<td>$36,738</td>
	                                        	<td>Niger</td>
	                                        	<td>Oud-Turnhout</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>2</td>
	                                        	<td>Minerva Hooper</td>
	                                        	<td>$23,789</td>
	                                        	<td>Curaçao</td>
	                                        	<td>Sinaai-Waas</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>3</td>
	                                        	<td>Sage Rodriguez</td>
	                                        	<td>$56,142</td>
	                                        	<td>Netherlands</td>
	                                        	<td>Baileux</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>4</td>
	                                        	<td>Philip Chaney</td>
	                                        	<td>$38,735</td>
	                                        	<td>Korea, South</td>
	                                        	<td>Overland Park</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>5</td>
	                                        	<td>Doris Greene</td>
	                                        	<td>$63,542</td>
	                                        	<td>Malawi</td>
	                                        	<td>Feldkirchen in Kärnten</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>6</td>
	                                        	<td>Mason Porter</td>
	                                        	<td>$78,615</td>
	                                        	<td>Chile</td>
	                                        	<td>Gloucester</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
		
		<c:import url="./footer.jsp"></c:import>

	    </div>
	</div>

</body>


</html>
