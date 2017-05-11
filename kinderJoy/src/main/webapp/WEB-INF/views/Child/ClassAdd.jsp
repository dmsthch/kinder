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

<div class="col-md-1">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="<c:url value="/home" />">Home</a></li>
        <li><a href="<c:url value="/ChildClass" />">전체 반</a></li>
        <li><a href="<c:url value="/" />">반 1</a></li>
        <li><a href="<c:url value="/" />">반 2</a></li>
      </ul>
</div>
<div class="container">
    
    <form id="addForm" action="${pageContext.request.contextPath}/ClassAdd" method="post">
        <div class="form-group">
            <label for="class_name">반 이름 :</label>
            <input class="form-control" name="class_name" id="class_name" type="text"/>
        </div>
        <div class="form-group">
            <label for="class_age">반 연령대:</label>
            <input class="form-control" name="class_age" id="class_age" type="text"/>
        </div>
        
 
    </form>
</div>
<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>
</body>
</html>
