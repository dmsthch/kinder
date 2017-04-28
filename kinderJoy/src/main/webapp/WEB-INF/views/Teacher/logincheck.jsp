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
	
	function idDuplicationCheck (id) {
		//AJAX 통신으로 서버에 DATA를 전송하고 RETURN 받는다
		$.ajax({
			//type을 설정한다
			type : 'POST',
			//서버주소를 적는다
			url  : "/logincheck",
			//폼에 입력한 id값을 받아서 서버로 보낸다
			data : {"id" : id},
			//성공적으로 값을 서버에 보냈을 경우 success코드를 사용하여 이벤트 처리를 한다
			success : function (data) {
				//서버에서 Return된 값으로 중복 여부를 사용자에게 알린다.
				
				//리턴된 data에 값이 담겨있으면 중복되므로 사용불가하다.
				if (data) {
					alert("사용불가");
				} else {
					alert("사용가능")
				}
			}
		})
	}
</script>


</head>
<body>
<form>
	<input type="hidden" id="idChk" value="N" /><!-- ID체크 했는지, 안했는지. -->
	
	아이디 : <input type="text" name="id" id="insertId" maxlength="30" /><input type="button" value="Id체크" onclick="javascript:chkDupId();" />
	
	<input type="text" name="id" id="id" />
	<input type="button" value="요청" id="logincheck"/>
	<div id="loadtext">준비중</div>
</form>
</body>
</html>