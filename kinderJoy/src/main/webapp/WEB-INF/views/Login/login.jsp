<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
<link rel="stylesheet" type="text/css" href="css/JKC/sign/login.css" />
<script type="text/javascript" src="js/JKC/sign/login.js"></script> 
-->

<script>
//키업방식
$(document).ready(function(){
		$("#teacherId").keyup(function(){
			var gogo="teacherId="+$("#teacherId").val();
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/login_id_check",
				data : gogo,
				success : function(data){
					if (data == 0){
						$("jeon").html("아이디가 없습니다.")
						}else{
						$("jeon").html("아이디가 확인되었습니다.")
						}
					}
			})
		});
	});
</script>

<!-- Modal content--> 
<div class="container">
<!-- Modal -->
	<div class="modal fade" id="signIn" role="dialog">
	<div class="modal-dialog">
		<form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post" accept-charset="UTF-8">
		<div class="modal-content">
		<div class="modal-header">
		값 체크 : <jeon />
		<h4 class="modal-title">로그인</h4>
		</div>
			<div class="modal-body">
			<!-- 모달 바디  -->
			<input type="text" id="teacherId" name="teacherId" value="test01">
			<input type="password" name="teacherPw" value="test01">
			<input type="submit" name="submit" value="로그인">
			<!-- 모달 바디 END -->
			</div>
		<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
		</div>
		</form>
	</div>
	</div>
</div>