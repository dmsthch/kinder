<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="../module/importJS.jsp"></c:import>
	<!-- Clock CSS Link -->
	<link rel="stylesheet" href="css/KHS/Commute.css">

<script>
		
	$(document).ready(function(){
		
		//출근하기 버튼
		$('#BtcommuteIn').click(function(){
			$('#unloginForm').removeAttr('action');
			$('#unloginForm').attr('action','${pageContext.request.contextPath}/CommuteIn');
			$('#unloginForm').submit();
		});
		
		//퇴근하기 버튼
		$('#BtcommuteOut').click(function(){
			$('#unloginForm').removeAttr('action');
			$('#unloginForm').attr('action','${pageContext.request.contextPath}/CommuteOut');
			$('#unloginForm').submit();
		});
	});
	
</script>
	
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
	<c:if test="${teacherNo != 0}">
	
		<!-- 출근등록을 안한 상태 -->
		<c:if test="${commuteCheck == '미출근'}">
			<h1>${teacherName}님 출근등록 하시겠습니까?</h1><br>
			<a href="${pageContext.request.contextPath}/CommuteIn?teacherNo=${teacherNo}"><button class="btn btn-default btn-lg">출근등록</button></a>
		</c:if>
		
		<!-- 출근등록을 한 상태 -->
		<c:if test="${commuteCheck == '출근' || commuteCheck == '외출' || commuteCheck == '복귀' }">
			
			<c:if test="${commuteCheck == '출근' }">
				<h1>${teacherName}님 출근등록 되셨습니다</h1><br>
				<h1>출근시간 : ${commuteTime}</h1><br><br>
			</c:if>
			<c:if test="${commuteCheck == '외출' }">
				<h1>${teacherName}님 외출등록 되셨습니다</h1><br>
				<h1>외출시간 : ${commuteTime}</h1><br><br>
			</c:if>
			<c:if test="${commuteCheck == '복귀' }">
				<h1>${teacherName}님 복귀등록 되셨습니다</h1><br>
				<h1>복귀시간 : ${commuteTime}</h1><br><br>
			</c:if>
			
			
			<div class="row"> <!-- 외출 , 복귀 dropdown -->
				<div class="col-sm-offset-4 col-sm-2 dropup">
					<button type="button" class="btn btn-default btn-lg dropdown-toggle" type="button" data-toggle="dropdown">외출/복귀 <span class="caret"></span></button>
					<ul class="dropdown-menu">
						<li class="divider"></li>
						<c:if test="${commuteCheck == '출근' || commuteCheck == '복귀'}">
							<li class="text-center"><a href="${pageContext.request.contextPath}/absence">외출 등록</a></li>
						</c:if>
						<c:if test="${commuteCheck == '외출'}">
							<li class="text-center"><a href="${pageContext.request.contextPath}/absenceReturn">복귀 등록</a></li>
						</c:if>
						<li class="divider"></li>
					</ul>
				</div>
				<div class="col-sm-2"><a href="${pageContext.request.contextPath}/CommuteOut"><button type="button" class="btn btn-danger btn-lg">퇴근하기</button></a></div>
			</div>
		</c:if>
		
		<!-- 퇴근등록을 한 상태 -->
		<c:if test="${commuteCheck == '퇴근'}">
			<h1>${teacherName}님 퇴근등록 되셨습니다</h1><br>
			<h1>퇴근시간 : ${commuteTime}</h1><br><br>
		</c:if>
		
	</c:if>
	
	<!-- 로그인이 안되어 있는 경우 -->
	<c:if test="${teacherNo == 0}">
		<form class="form-horizontal" id="unloginForm" method="post">
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="id">ID:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="id" name="teacher_id" required placeholder="Enter id">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-offset-2 col-sm-2" for="passWord">PassWord:</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="passWord" name="teacher_pw" required placeholder="Enter passWord">
				</div>
			</div><br/>
			<div class="form-group"> 
				<div class="col-sm-offset-1 col-sm-10">
					<div class="col-sm-offset-4 col-sm-2">
						<button type="button" id="BtcommuteIn" class="btn btn-default btn-lg">출근하기</button>
					</div>
					<div class="col-sm-2">
						<button type="button" id="BtcommuteOut" class="btn btn-danger btn-lg">퇴근하기</button>
					</div>
				</div>
			</div>
		</form>
	</c:if>
		
</div>

<!-- 정보 출력 공간 -->
<div class="col-sm-offset-1 col-sm-5">
	<c:if test="${param.notice != null}">
		<p style="font-size: 25px; color: white">notice : ${param.notice}</p>
	</c:if>
</div>
 
<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>



���ǿ� ����� ���̵� : ${teacherId}
���Ӱ� : ${teacherName} 
���̼����� : ${teacherLicense}
������ : ${teacherLevel} 
�ѹ��� : ${teacherNo}

</body>
</html>
