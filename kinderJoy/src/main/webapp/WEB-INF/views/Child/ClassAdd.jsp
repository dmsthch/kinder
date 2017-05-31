<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
 	$(document).ready(function(){
 		
 		$('#addButton').click(function(){
 			
 			$('#addForm').submit();
 		});
 		
 		
 	});
 
 </script>

<title>ClassAdd</title>
<!-- CSS Link -->
<c:import url="../module/importCSS.jsp"></c:import>
<!-- JS Link -->
<c:import url="../module/importCSS.jsp"></c:import>

	<style>
		#body{
			margin-top:5%;
		}
	</style>
</head>
<body id="body">
<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>
<c:import url="../Child/nav/SideNav.jsp"></c:import>


<form id="addForm" action="${pageContext.request.contextPath}/ClassAdd" method="post">
<div class="col-md-10">
<div class="form-inline">
	<div align="center" class="container">
  		<form class="form-inline" action="/action_page.php">
    	<div class="form-group">
      	<label for="class_name">반 이름:</label>
      	<input type="text" class="form-control" id="className" name="className" style="width:300px;">
    </div>
    <div class="form-group">
      <label for="class_age">반 연령:</label>
      <input type="text" class="form-control" id="classAge" name="classAge" style="width:300px;">
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
 </form>


<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>
</body>
</html>
