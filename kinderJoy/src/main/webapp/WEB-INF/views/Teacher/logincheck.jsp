<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>타이틀 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	//사용자가 입력한 값과 DB에 저장된 값을 비교하여 중복하는지 체크한다
	
	$(document).ready(function(){
		$("#idcheckbutton").click(function(){
			var gogo="userid="+$("#userid").val();
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/logincheck",
				data : gogo,
				success : function(data){
					$("#result").html(data);
				}
			})
		});
	});
</script>


</head>
<body>
<form>
	<input type="hidden" id="idChk" value="N" /><!-- ID체크 했는지, 안했는지. -->
	
	아이디 : <input type="text" id="userid" maxlength="30" />
		 <input type="button" id="idcheckbutton" value="아이디체크" />
	<div id="result">결과를 출력할 영역</div>
	
	////////////////////////////////////////////////////
	<input type="text" name="id" id="id" />
	<input type="button" value="요청" id="logincheck"/>
	<div id="loadtext">준비중</div>
</form>
</body>
</html>