<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	
	<!-- CSS Link -->
	<c:import url="./module/importCSS.jsp"></c:import>
	
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">


<!-- navbar -->
<c:import url="./module/navbar.jsp"></c:import>

<!-- home section -->
<section id="home">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<h3>���ʷ� / ��Ż� / ���Ѽ� / ������ / ����ö</h3>
				<h1>Team. �޺��Ƹ�</h1>
				<hr>
				<a href="#" class="smoothScroll btn btn-danger">�α���</a>
				<a href="${pageContext.request.contextPath}/Commute" class="smoothScroll btn btn-default">�⼮��</a>
			</div>
		</div>
	</div>		
</section>

<!-- footer -->
<c:import url="./module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="./module/importJS.jsp"></c:import>

</body>
</html>