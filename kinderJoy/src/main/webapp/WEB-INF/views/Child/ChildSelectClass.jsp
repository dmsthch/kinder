<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ChildList</title>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>


<script>
$(document).ready(function(){
	$('#ChildClassManagement').attr('class','active');

	
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
						<div class="card-header" data-background-color="green">
							<h4 class="title">반 이름 : ${childClass.className}</h4>
						</div>
							<h4 class="text-right">운영년도 : ${childClass.classYear}</h4>
						<div class="col-sm-5 col-sm-offset-3 text-center">
						    <table class="table table-hover ">
						        <thead>
						            <tr>
						                <th style="text-align:center; font-size:20px;">아이 이름</th>
						            </tr>
						        </thead>
						        <tbody>
						            <c:forEach var="c" items="${list}">
						                <tr>
											<td>${c.kidName}</td>
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