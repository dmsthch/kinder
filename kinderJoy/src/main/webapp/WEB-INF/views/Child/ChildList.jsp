<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD LIST(spring mvc ���)</title>
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
    <h1>ChildList(spring mvc ���)</h1>
    <div>��ü���� �� : ${ChildCount}</div>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>�̸�</th>
                <th>�������</th>
                <th>�ּ�</th>
                <th>��ȣ�ڹ�ȣ</th>
                <th>���ǻ���</th>
                <th>����</th>
                <th>���й��</th>
                <th>������</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${list}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/ChildView?=${c.kid_no}">${c.kid_birth}</a></td>
                    <td>${c.kid_address}</td>
                    <td>${c.kid_protector_phone}</td>
                    <td>${c.kid_precautions}</td>
                    <td>${c.kid_gender}</td>
                    <td>${c.kid_commuting}</td>
                    <td>${c.kid_entrance_day}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/ChildList?currentPage=${currentPage-1}">����</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/ChildList?currentPage=${currentPage+1}">����</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildAdd">�Խñ� �Է�</a>
    </div>
</div>
</body>
</html>
