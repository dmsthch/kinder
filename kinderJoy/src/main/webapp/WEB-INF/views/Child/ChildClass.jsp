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


 <style>
	 #body{
	 	margin-top: 5%;
	 }
 </style>
 
</head>

<body id="body">
<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

<c:import url="../Child/nav/SideNav.jsp"></c:import>
	
<div class="col-sm-10 col-sm-offset-2">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>반이름</th>
                <th>운영년도</th>
                <th>나이</th>
                <th>반편성</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${list}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/viewClass?classNo=${c.classNo}">${c.className}</a></td>
                    <td>${c.classYear}</td>
                    <td>${c.classAge}</td>
                    <td><a href="${pageContext.request.contextPath}/testSelect?classAge=${c.classAge}&classNo=${c.classNo}"><button>반편성</button></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/ChildClass?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/ChildClass?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/ClassAdd">반입력</a>
    </div>
</div>


</body>
</html>