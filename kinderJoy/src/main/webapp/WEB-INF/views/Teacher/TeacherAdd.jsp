<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
  <title>타이틀 변경</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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



</head>
<body>
<div class="container">
  <h2>회원가입</h2>
  <form action="${pageContext.request.contextPath}/insert" class="form-horizontal" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2">라이센스:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="license_kindergarten" placeholder="발급된 라이센스를 입력하세요">
      </div>
    </div>
    
    
    
<!--     <div class="form-group">
      <label class="control-label col-sm-2">권한:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_level" placeholder="권한을 입력하세요">
      </div>
    </div> -->
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">이름:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_name" placeholder="이름을 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">아이디:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="teacher_ajax_id" name="teacher_id" placeholder="아이디를 입력하세요">
        <input type="button" id="idcheckbutton" value="아이디체크"/>
        사용가능여부 : <jeon />
      </div>
    </div>
 	<!-- 아이디는 # 클래스는 . 태그는 태그명만 적으면 사용가능 -->
    
    <div class="form-group">
      <label class="control-label col-sm-2">Password:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_pw" placeholder="비밀번호를 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">등록일자:</label>
      <div class="col-sm-10">          
        <input type="date" class="form-control" name="teacher_add_day">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">연락처:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_phone" placeholder="연락처를 입력하세요">
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
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>
