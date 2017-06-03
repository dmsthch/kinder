<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ChildList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- CSS Link -->
<c:import url="../module/importCSS.jsp"></c:import>
<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>
	
 <style>
	 #body{
	 	margin-top: 5%;
	 }
 </style>

<script>
$(document).ready(function(){
	$('#AllClass').attr('class','active');

	
})
</script>
 
</head>

<body id="body">
<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

<c:import url="../Child/nav/SideNav.jsp"></c:import>

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
</body>
</html>