<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>

	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>

<script>
	//사용자가 입력한 값과 DB에 저장된 값을 비교하여 중복하는지 체크한다
	
//클릭방식
/* 	$(document).ready(function(){
		$("#idcheckbutton").click(function(){
			var gogo="teacher_ajax_id="+$("#teacher_ajax_id").val();
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/sign_up_id_check",
				data : gogo,
				success : function(data){
					if (data == 0){
						$("jeon").html("사용가능")
						}else{
						$("jeon").html("사용불가")
					}
				}
			})
		});
	}); */
	
//키업방식
$(document).ready(function(){
		$("#teacher_ajax_id").keyup(function(){
			var gogo="teacher_ajax_id="+$("#teacher_ajax_id").val();
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/sign_up_id_check",
				data : gogo,
				success : function(data){
					if (data == 0){
						if($("#teacher_ajax_id").val().length > 5 || $("#teacher_ajax_id").val() == ""){
						$("jeon").html("사용가능")
						}else{
						$("jeon").html("사용불가")
						}
					}
				}
			})
		});
	});
</script>

<script>

$(document).ready(function(){
	$("#submit").click(function(){
		
		var name = $("#teacherName").val();
		var id = $("#teacher_ajax_id").val();
		var pw = $("#teacherPw").val();
		var hp = $("#teacherPhone").val();
		
		var regId = /^[a-z0-9]{4,12}$/;	// 아이디 유효성 검사식
		var regPw = /^[a-z0-9]{6,10}$/;	// 비밀번호 유효성 검사식
		var regNm = /^[가-힣]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}$/;	// 이름 유효성 검사식
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;  // 이메일 유효성 검사식
		var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	// 핸드폰번호 유효성 검사식
		
		
		
		if (name == "" || name == null) {
			alert('입력하셈1');
			$("#teacherName").focus();
			return false;
		}
		
		if (id == "" || id == null) {

			alert('아이디입력');
			$("#teacher_ajax_id").focus();
			return false;
		}else{
			if(!$("#teacher_ajax_id").val().regId){
				alert('영문대,소문자 , 숫자 4 ~12 자리로 입력해 주세요.')
				$("#teacher_ajax_id").focus();
				return false;
			}
		}
		
		if (pw == "" || pw == null) {
			alert('입력하셈3');
			$("#teacherPw").focus();
			return false;
		}
		
		if (hp == "" || hp == null) {
			alert('입력하셈4');
			$("#teacherPhone").focus();
			return false;
		}
		
	});
});
</script>

</head>
<body>
<div class="container">
  <h2>회원가입</h2>
  <form action="${pageContext.request.contextPath}/insert" class="form-horizontal" method="post" name="formName">
    
    
<!--     <div class="form-group">
      <label class="control-label col-sm-2">라이센스:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="license_kindergarten" placeholder="발급된 라이센스를 입력하세요">
      </div>
    </div> -->
    
    
    
<!--     <div class="form-group">
      <label class="control-label col-sm-2">권한:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_level" placeholder="권한을 입력하세요">
      </div>
    </div> -->
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">이름:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacherName" id="teacherName" placeholder="이름을 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">아이디:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="teacher_ajax_id" name="teacherId" placeholder="아이디를 입력하세요">
        <input type="button" id="idcheckbutton" value="아이디체크"/>
        사용가능여부 : <jeon />
      </div>
    </div>
 	<!-- 아이디는 # 클래스는 . 태그는 태그명만 적으면 사용가능 -->
    
    <div class="form-group">
      <label class="control-label col-sm-2">Password:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="teacherPw" name="teacherPw" placeholder="비밀번호를 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">연락처:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="teacherPhone" name="teacherPhone" placeholder="연락처를 입력하세요">
      </div>
    </div>
    
    
    <!-- <div class="form-group">
      <label class="control-label col-sm-2">은행:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_bank" placeholder="은행을 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">계좌번호:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_account" placeholder="계좌번호를 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">호봉:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_paystep" placeholder="호봉을 입력하세요">
      </div>
    </div> -->
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" id="submit">Submit</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>
