<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>
	<form action="${pageContext.request.contextPath}/license" method="post">
	<div class="form-group">
	<label class="control-label col-sm-2">라이센스 발급받기</label>
      <div class="col-sm-10">              
        <input type="submit" id="licensecheckbutton" value="라이선스"/>
      </div>
      
      <c:if test="${null != licenseKey}">
      <c:out value="발급된 라이선스 : ${licenseKey}"></c:out>
      </c:if>      		

    </div>
	</form>
</body>
</html>