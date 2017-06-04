<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
     
  	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- 사이드메뉴바 BEGIN -->
	<c:import url="./side.jsp"></c:import>


	<style>
	.rounded {
	  background: black;
	  border-radius: 5px;
	}
	</style>
</head>

<body>



<div class="wrapper">

	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">편성표</h4>
	                                <p class="category">편성된 표를 확인하세요.</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
                             <c:forEach begin="3" end="5" var="age">
	                                
		                         <table class="table">
		                         
									<h1>${age}살 편성</h1>
									<c:forEach var="TC" items="${takeClass}" >
									<div class="card-header style_card" data-background-color="blue" style=" border: 3px solid black;  float: left; height: auto; width: auto; margin: 10px; padding: 10px;" >
									<c:if test="${TC.classAge == age}"> 
									<%-- <c:if test="${TC.className == List.className}"> --%>
<%-- 									<c:forEach var="List2" items="${List2}">
									${List2.className}<<<<<<<<<<<<<<
									</c:forEach> --%>
									<h5 class="card card-stats">${TC.className}반</h5>
									<%-- </c:if> --%>
									</c:if>
									<c:forEach var="List" items="${List}">
									${List.teacherName}
									</c:forEach>
									</div>
									</c:forEach>
		                         </table>
		                         
                             </c:forEach>
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