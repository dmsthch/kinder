<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="${pageContext.request.contextPath}/educationProjectAddPage">계획안 양식추가</a>
<a href="${pageContext.request.contextPath}/educationProjectFormLoad?formOrder=1">1번 양식 불러오기</a>
<a href="${pageContext.request.contextPath}/educationProjectFormLoad?formOrder=2">2번 양식 불러오기</a>
<br>

<a href="${pageContext.request.contextPath}/EducationProjectLoad?categoryNo=1&date=20170511">저장된 계획안 불러오기 테스트 // 날짜 : 20170511</a>
</body>
</html>