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

<div class="col-md-1">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="<c:url value="/home" />">Home</a></li>
        <li><a href="<c:url value="/ChildClass" />">전체 반</a></li>
        <li><a href="<c:url value="/" />">반 1</a></li>
        <li><a href="<c:url value="/" />">반 2</a></li>
      </ul>
</div>
<div class="col-md-11">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>이름</th>
                <th>생년월일</th>
                <th>주소</th>
                <th>보호자번호</th>
                <th>보호자예비번호</th>
                <th>주의사항</th>
                <th>성별</th>
                <th>통학방법</th>
                <th>입학일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${list}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/ChildModify?kid_no=${c.kidNo}">${c.kidName}</a></td>
                    <td>${c.kidBirth}</td>
                    <td>${c.kidAddress}</td>
                    <td>${c.kidProtectorPhone}</td>
                    <td>${c.kidProtectorPhoneReserve}</td>
                    <td>${c.kidPrecautions}</td>
                    <td>${c.kidGender}</td>
                    <td>${c.kidCommuting}</td>
                    <td>${c.kidEntranceDay}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/ChildList?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/ChildList?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildAdd">게시글 입력</a>
    </div>
</div>

<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

</body>
</html>
