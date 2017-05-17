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
 
 
</head>

<body id="body">
<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

<div class="col-md-2">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="<c:url value="/ChildList" />">Home</a></li>
        <li class="active"><a href="<c:url value="/ChildClass" />">전체 반</a></li>
        <li><a href="<c:url value="/" />">반 1</a></li>
        <li><a href="<c:url value="/" />">반 2</a></li>
        <li><a href="<c:url value="/ClassAdd"/>">반 입력</a></li>
      </ul>
</div>
<div class="col-md-10">
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
                    <td><a href="${pageContext.request.contextPath}/ChildModify2?class_no=${c.classNo}">${c.className}</a></td>
                    <td>${c.classYear}</td>
                    <td>${c.classAge}</td>
                    <td><a href="${pageContext.request.contextPath}/testSelect"><button>반편성</button></a></td>
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

<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

</body>
</html>