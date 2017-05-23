<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<link rel="stylesheet" href="css/JKC/takeForm/css/bootstrap-select.css">
	<script src="js/JKC/takeForm/js/bootstrap-select.js"></script>
	
<!--   
	<style>
	    body {
	      padding-top: 70px;
	    }
	</style> -->

  
</head>
<body>

	<c:import url="./side.jsp"></c:import>

<div class="main-panel">
	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">반 배정</h4>
	                                <p class="category">반에 선생님을 배정시키세요.</p>
	                            </div>                            
	                            
	                            <div class="card-content table-responsive">
								  <form class="form-inline">
								    <div class="form-group">
									    <c:forEach var="TC" items="${takeClass}">
									      <label>${TC.classAge}</label>
									     </c:forEach>
								    </div>
								    <div class="form-group">
								      <select id="lunchBegins" class="selectpicker" data-live-search="true" title="선생">
								        <c:forEach var="TT" items="${takeTeacher}">
								        <option>${TT.teacherName}</option>
								        </c:forEach>
								      </select>
								    </div>
								  </form>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
		
		<c:import url="./footer.jsp"></c:import>

	    </div>

</body>
</html>
