<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ClassAdd</title>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>
<script>
 	$(document).ready(function(){
 		
 		$('#addButton').click(function(){
 			
 			$('#addForm').submit();
 		});
 		
 		
 	});
 	
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
							<h4 class="title">반 생성하기</h4>
						</div>

						<div class="card-content table-responsive">
							<form id="addForm" action="${pageContext.request.contextPath}/ClassAdd" method="post">
								<div align="center">
								    	<div class="form-group">
									      	<label for="class_name">반 이름:</label>
									      	<input type="text" class="form-control" id="className" name="className" style="width:200px;">
									    </div>
									    <div class="form-group">
									      <label for="class_age">반 연령:</label>
									      <input type="text" class="form-control" id="classAge" name="classAge" style="width:200px;">
									    </div>
									  <br><br>
									    <div align ="center">
									           <input class="btn btn-default" id="addButton" type="button" value="반입력"/>
									           <input class="btn btn-default" type="reset" value="초기화"/>
									           <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildClass">목록</a>
									    </div>
	  								</form>
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
