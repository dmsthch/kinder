<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
		
		var name = $("#teacherName");
		var id = $("#teacher_ajax_id");
		var pw = $("#teacherPw");
		var hp = $("#teacherPhone");
		
		var regId = /^[a-z]+[0-9]{3,19}$/g;	// 아이디 유효성 검사식 시작
		var regPw = /^[a-z0-9]{7,12}$/;	// 비밀번호 유효성 검사식
		var regNm = /^[가-힣]{2,15}$/;	// 이름 유효성 검사식
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;  // 이메일 유효성 검사식
		var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	// 핸드폰번호 유효성 검사식
		
		/* test()메서드는 값을비교해주는 javascript의 메서드이다. */
		
		if (name.val() == "" || name.val() == null) {
			alert('이름을 입력해 주세요.');
			name.focus();
			return false;
		} else {
			if(regNm.test(name.val()) == false){
				alert('한글만 2자 이상 입력해주세요.');
				name.focus();
				return false;
			}
		}
		
		if (id.val() == "" || id.val() == null) {
			alert('아이디를 입력해 주세요.');
			id.focus();
			return false;
		}else{
			if(regId.test(id.val()) == false){
					alert('연속된 영문3자 이상으로 시작하며 연속된 숫자3자 이상으로 끝나야 하며 최소 6자 이상 15자 이내의 조합이어야 합니다.');
					id.focus();
					return false;
			}
		}
		
		
		
		if (pw.val() == "" || pw.val() == null) {
			alert('비밀번호를 입력해주세요.');
			pw.focus();
			return false;
		} else {
			if(regPw.test(pw.val()) == false) {
				alert('영소문자로 시작하여 숫자로 끝나도록 입력해주세요 7 ~ 14 자리 이내');
				pw.focus();
				return false;
			}
		}
		
		if (hp.val() == "" || hp.val() == null) {
			alert('입력하셈4');
			hp.focus();
			return false;
		}
		
	});
});
</script>


<!-- 여기부터 새로운 css★★★★★★★★★★★ -->
<style type="text/css">

/*start .contact-form*/
@import url('https://fonts.googleapis.com/css?family=Raleway');

body{
	font-family: 'Raleway', sans-serif;
	background: url(../img/body_bg.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}

h2{
	font-weight: bold;
	font-size: 40px;
}
.contact-form{
	max-width: 500px;
	margin: 50px auto;
}

.contact-form .form-group{
	margin-bottom: 0;
	position: relative;
}
.contact-form input,
.contact-form textarea{
	margin-bottom: 20px;
	background: #ececec;
}

.contact-form input:focus{

	border: 1px solid #999;
	outline: none !important;
}


.contact-form input{
	padding-left: 30px;
}

.contact-form textarea{
	height: 300px !important;
	padding-left: 30px;

}
.contact-form input[type="submit"]{

	background: #5cb85c;
}

.contact-form i{
	height: 0;
	float: left;
	position: relative;
	top: -44px;
	left: 10px;
	color: #fff;
}

.contact-form .message-icon{
	position: relative;
    top: -310px;
}

.contact-form .send-icon{
	color: #fff;
}


.asterix{
	position: absolute;
    color: red;
    float: right;
    font-size: 59px;
    height: 0;
    /* overflow: hidden; */
    right: 0;
    top: -11px;/
}

span.cross {
    position: absolute;
    color: red;
    float: right;
    font-size: 26px;
    height: 0;
    /* overflow: hidden; */
    right: 3px;
    top: -5px;
    display: none;
}

i.fa.fa-check {
    color: green;
}

span.verify {
    position: absolute;
    float: right;
    font-size: 22px;
    height: 0;
    right: 10px;
    top: 49px;
    display: none;
}

#alert-custom {
    padding: 7px;
    padding-right: 31px;
}

.custom-alert{

	 padding: 7px;
	 display: none;
}

</style>

<script>
$(document).ready(function(){
	
	$(function () {

		'use strict';
				// error variables
				var UserError  = true,
					EmailError = true,
					SubError   = true,
					MsgError   = true;

		$(".username").blur(function() {
			
			if($(this).val().length < 4){

				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				UserError = true;
			}else{

				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);

				UserError = false;
			}
		});



		$(".email").blur(function() {
			
			if($(this).val() === ''){

				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				EmailError = true;
			}else{

				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);

				EmailError = false;
			}
		});


		$(".subject").blur(function() {
			
			if($(this).val() === ''){

				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				SubError = true;
			}else{

				
				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);

				SubError = false;
			}
		});


		$(".message").blur(function() {
			
			if($(this).val() .length < 10){

				
				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				MsgError = true;
			}else{

				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
				MsgError = false;
			}
		});


		// submit form

		$('.contact-form').submit(function(event) {
			 
			 if(UserError === true || EmailError === true || SubError === true || MsgError === true){

			 	event.preventDefault(); // prevent sending 
			 	$('.username,.email,.subject,.message').blur();
			 }


		});

		});
	
});


</script>
</head>
<body>
<div class="container">
  <h2>회원가입</h2>
  <form action="${pageContext.request.contextPath}/insert" class="contact-form" method="post" name="formName">   
    
    <div class="form-group">
      <label class="control-label col-sm-2">이름:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacherName" id="teacherName" placeholder="이름을 입력하세요">
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
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" id="submit">Submit</button>
      </div>
    </div>
  </form>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
<div class="container">
		<h2 class="text-center">Contact Us</h2>
		<div class="errors">
		</div>
			<form action="${pageContext.request.contextPath}/insert" class="contact-form" method="post" name="formName"> 
			
				<div class="form-group">
				<input type="text" name="username" id="username" class="username form-control" placeholder="Your Username" value="">
				<span class="asterix">*</span>
				<span class="cross">x</span>
				
				<div class="alert alert-danger custom-alert">
					입력하세요!
				</div>
				</div>	
				
				<div class="form-group">
				<input type="text" name="email" class=" email form-control" placeholder="Your Email" value="">
				<span class="asterix">*</span>
				<span class="cross">x</span>
				
				<div class="alert alert-danger custom-alert">
					Email can not be empty
				</div>
				</div>

				
				<div class="form-group">
				<input type="text" name="subject" class="subject form-control" placeholder="Your subject" value="">
				<span class="asterix">*</span>
				<span class="cross">x</span>
				
				<div class="alert alert-danger custom-alert">
					Subject can not be empty
				</div>
				</div>

				
				<div class="form-group">
				<textarea class=" message form-control" name="message" placeholder="Your Message"></textarea>
				<span class="asterix">*</span>
				<span class="cross">x</span>
				<span class="verify"><i class="fa fa-check" aria-hidden="true"></i></span>
				<div class="alert alert-danger custom-alert">
					message should be more than <b>10</b> characteres
				</div>
				</div>
				
				
				
				
								
				
				
	<div class="form-group">
      <label class="control-label col-sm-2">아이디:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="teacher_ajax_id" name="teacherId" placeholder="아이디를 입력하세요"  maxlength="15">
        사용가능여부 : <jeon />
      </div>
    </div>

	    <div class="form-group">
      <label class="control-label col-sm-2">이름:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacherName" id="teacherName" placeholder="이름을 입력하세요">
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
      <label class="control-label col-sm-2">Password:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="teacherPw" name="teacherPw" placeholder="비밀번호를 입력하세요">
      </div>
    </div>
				
				
				
				
				
				

				<div class="form-group">
				<button type="submit" value="send" class="btn btn-success btn-block" id="submit">Submit</button>
				<i class="fa fa-paper-plane send-icon"></i>
				</div>
			</form>
		</div>
		
		
		
</div>

</body>
</html>
