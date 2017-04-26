<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	<link rel="stylesheet" href="css/KHS/Commute.css">
	
</head>	

<body class="container-fluid">

<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

<div id="clock">
	<div id="app"></div>
	<script src='js/KHS/CommuteReact.min.js'></script>
	<script src='js/KHS/CommuteReactDom.min.js'></script>
	<script src="js/KHS/CommuteIndex.js"></script>

</div>

<div class="text-center">

	<!-- 로그인이 되어있는 경우 -->
	<c:if test="${teacherNo != 0 && !commuteCheck }">
		<h1>${teacherName}님 출근등록 하시겠습니까?</h1><br>
		<button class="btn btn-default btn-lg">출근등록</button>
	</c:if>
	<c:if test="${teacherNo != 0 && commuteCheck }">
		<h1>${teacherName}님 출근등록 되셨습니다</h1><br>
		<h1>출근시간 : ${commuteTime}</h1><br>
	</c:if>

	<!-- 로그인이 안되어 있는 경우 -->
	<c:if test="${teacherNo == 0}">
		<form class="form-horizontal" action="" method="post">
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="id">ID:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="id" required placeholder="Enter id">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="passWord">PassWord:</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="passWord" required placeholder="Enter passWord">
				</div>
			</div><br/>
			<div class="form-group"> 
				<div class="col-sm-offset-1 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
	</c:if>
		
</div>

<!-- 정보 출력 공간
<div class="col-sm-offset-1 col-sm-5">
	<c:if test="${info != null}">
		<p style="font-size: 25px; color: white">info : ${info }</p>
	</c:if>
</div>
 -->
 
<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>
<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>

</body>
</html>
