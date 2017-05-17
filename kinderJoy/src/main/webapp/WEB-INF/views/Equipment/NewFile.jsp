<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>

<style>
@font-face{
	font-family: 'koverwatch';
	src: url(fonts/koverwatch.ttf) format('truetype');
}
body {
	font-family: koverwatch
}
</style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<div>
					비품 건의서
					<div>
					비품카테고리
					<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					</div>
					<div>
					품명
					</div>
					<div>
					<input type="text"/>
					</div>
					<div>
					수량
					</div>
					<div>
					<input type="text"/>
					</div>
					<div>
					교원번호
					</div>
					<div>
					<input type="text"/>
					</div>
					<div>
					신청일자
					</div>
					<div>
					<input type="date"/>
					</div>
					<div>
					</div>
					<div>
					<textarea>신청사유</textarea>
					</div>
					<div>
					예상금액
					</div>
					<div>
					<input type="text"/>원
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br><br><br><br><br>


</body>
<c:import url="../module/importJS.jsp"></c:import>
</html>