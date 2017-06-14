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
					if (data == 1){
						$("jeon").html("DB에 값이 있습니다.")
						}else{
						$("jeon").html("DB에 값이 없습니다.")
						
					}
				}
			})
		});
	});
</script>

<!-- 여기부터 새로운 css★★★★★★★★★★★ -->
<style type="text/css">

/*start .contact-form*/
@import url('https://fonts.googleapis.com/css?family=Raleway');

body{
	font-family: 'Raleway', sans-serif;
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

.teacher-alert{
	 padding: 7px;
	 display: none;
}
</style>

<script>
$(document).ready(function(){
	
	$(function check() {
		
		var name = $("#teacherName");
		var id = $("#teacher_ajax_id");
		var pw = $("#teacherPw");
		var hp = $("#teacherPhone");
		///^[a-z]+[0-9]{3,15}$/g;//
		var regId = /^[a-z0-9_]{4,20}$/;	// 아이디 유효성 검사식 시작
		var regPw = /^[a-z0-9]{7,15}$/;	// 비밀번호 유효성 검사식
		var regNm = /^[가-힣]{2,15}$/;	// 이름 유효성 검사식
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;  // 이메일 유효성 검사식
		var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;	// 핸드폰번호 유효성 검사식
		///^\d{3}-\d{3,4}-\d{4}$//
		'use strict';
				// error variables
				var UserError  = true,
					NameError = true,
					SubError   = true,
					MsgError   = true;			


		$("#teacherName").blur(function() {
			
			if(name.val() === "" || name.val() === null){
				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				NameError = true;
			}else{
				if(regNm.test(name.val()) === false || name.val().length < 2){
					$(this).css('border','1px solid #F00');
					$(this).parent().find('.teacher-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
					
					NameError = true;
					name.focus();
				}else{
					$(this).css('border','1px solid #080');
					$(this).parent().find('.teacher-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);

					NameError = false;
				}
				
				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);

				NameError = false;
			}
			
		});

		
		
		$("#teacher_ajax_id").blur(function() {
			
			if(id.val() === "" || id.val() === null){
				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				UserError = true;
			}else{
					if(regId.test(id.val()) === false){
						$(this).css('border','1px solid #F00');
						$(this).parent().find('.teacher-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
						UserError = true;
						id.focus();
					}else{
						$(this).css('border','1px solid #080');
						$(this).parent().find('.teacher-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
						UserError = false;
					}
			$(this).css('border','1px solid #080');
			$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
				UserError = false;
			}
		});
		
		

		$("#teacherPw").blur(function() {
			
			if(pw.val() === "" || pw.val() === null){

				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				SubError = true;
			}else{
				
				if(regPw.test(pw.val()) === false) {
					$(this).css('border','1px solid #F00');
					$(this).parent().find('.teacher-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
					SubError = true;
					pw.focus();
				}else{
					$(this).css('border','1px solid #080');
					$(this).parent().find('.teacher-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);

					SubError = false;
				}

				
				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);

				SubError = false;
			}
		});


		$("#teacherPhone").blur(function() {
			
			if(hp.val() === "" || hp.val() === null){
				
				$(this).css('border','1px solid #F00');
				$(this).parent().find('.custom-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
				MsgError = true;
			}else{
				if(regPhone.test(hp.val()) === false){
					$(this).css('border','1px solid #F00');
					$(this).parent().find('.teacher-alert').fadeIn(300).end().find('.asterix').fadeOut(300).end().find('span.cross').fadeIn(300).end().find('span.verify').fadeOut(300);
					MsgError = true;
					hp.focus();
				}else{
					$(this).css('border','1px solid #080');
					$(this).parent().find('.teacher-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
					MsgError = false;
				}

				$(this).css('border','1px solid #080');
				$(this).parent().find('.custom-alert').fadeOut(300).end().find('.asterix').fadeOut(300).end().find('span.verify').fadeIn(300).end().find('span.cross').fadeOut(300);
				MsgError = false;
			}
		});


		// submit form

		$('.contact-form').submit(function(event) {
			 
			 if(UserError === true || NameError === true || SubError === true || MsgError === true){

			 	event.preventDefault(); // prevent sending 
			 	$('#teacher_ajax_id,#teacherName,#teacherPw,#teacherPhone').blur();
			 }


		});

		});
	
});


</script>






<script type="text/javascript">
    /**
    *
    *  Secure Hash Algorithm (SHA256)
    *  http://www.webtoolkit.info/
    *
    *  Original code by Angel Marin, Paul Johnston.
    *
    **/
$(document).ready(function(){
    function SHA256(s){
      
        var chrsz   = 8;
        var hexcase = 0;
      
        function safe_add (x, y) {
            var lsw = (x & 0xFFFF) + (y & 0xFFFF);
            var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
            return (msw << 16) | (lsw & 0xFFFF);
        }
      
        function S (X, n) { return ( X >>> n ) | (X << (32 - n)); }
        function R (X, n) { return ( X >>> n ); }
        function Ch(x, y, z) { return ((x & y) ^ ((~x) & z)); }
        function Maj(x, y, z) { return ((x & y) ^ (x & z) ^ (y & z)); }
        function Sigma0256(x) { return (S(x, 2) ^ S(x, 13) ^ S(x, 22)); }
        function Sigma1256(x) { return (S(x, 6) ^ S(x, 11) ^ S(x, 25)); }
        function Gamma0256(x) { return (S(x, 7) ^ S(x, 18) ^ R(x, 3)); }
        function Gamma1256(x) { return (S(x, 17) ^ S(x, 19) ^ R(x, 10)); }
      
        function core_sha256 (m, l) {
             
            var K = new Array(0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1,
                0x923F82A4, 0xAB1C5ED5, 0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3,
                0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174, 0xE49B69C1, 0xEFBE4786,
                0xFC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA,
                0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147,
                0x6CA6351, 0x14292967, 0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13,
                0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85, 0xA2BFE8A1, 0xA81A664B,
                0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070,
                0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A,
                0x5B9CCA4F, 0x682E6FF3, 0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208,
                0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2);
 
            var HASH = new Array(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
 
            var W = new Array(64);
            var a, b, c, d, e, f, g, h, i, j;
            var T1, T2;
      
            m[l >> 5] |= 0x80 << (24 - l % 32);
            m[((l + 64 >> 9) << 4) + 15] = l;
      
            for ( var i = 0; i<m.length; i+=16 ) {
                a = HASH[0];
                b = HASH[1];
                c = HASH[2];
                d = HASH[3];
                e = HASH[4];
                f = HASH[5];
                g = HASH[6];
                h = HASH[7];
      
                for ( var j = 0; j<64; j++) {
                    if (j < 16) W[j] = m[j + i];
                    else W[j] = safe_add(safe_add(safe_add(Gamma1256(W[j - 2]), W[j - 7]), Gamma0256(W[j - 15])), W[j - 16]);
      
                    T1 = safe_add(safe_add(safe_add(safe_add(h, Sigma1256(e)), Ch(e, f, g)), K[j]), W[j]);
                    T2 = safe_add(Sigma0256(a), Maj(a, b, c));
      
                    h = g;
                    g = f;
                    f = e;
                    e = safe_add(d, T1);
                    d = c;
                    c = b;
                    b = a;
                    a = safe_add(T1, T2);
                }
      
                HASH[0] = safe_add(a, HASH[0]);
                HASH[1] = safe_add(b, HASH[1]);
                HASH[2] = safe_add(c, HASH[2]);
                HASH[3] = safe_add(d, HASH[3]);
                HASH[4] = safe_add(e, HASH[4]);
                HASH[5] = safe_add(f, HASH[5]);
                HASH[6] = safe_add(g, HASH[6]);
                HASH[7] = safe_add(h, HASH[7]);
            }
            return HASH;
        }
      
        function str2binb (str) {
            var bin = Array();
            var mask = (1 << chrsz) - 1;
            for(var i = 0; i < str.length * chrsz; i += chrsz) {
                bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (24 - i%32);
            }
            return bin;
        }
      
        function Utf8Encode(string) {
            string = string.replace(/\r\n/g,"\n");
            var utftext = "";
      
            for (var n = 0; n < string.length; n++) {
      
                var c = string.charCodeAt(n);
      
                if (c < 128) {
                    utftext += String.fromCharCode(c);
                }
                else if((c > 127) && (c < 2048)) {
                    utftext += String.fromCharCode((c >> 6) | 192);
                    utftext += String.fromCharCode((c & 63) | 128);
                }
                else {
                    utftext += String.fromCharCode((c >> 12) | 224);
                    utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                    utftext += String.fromCharCode((c & 63) | 128);
                }
      
            }
      
            return utftext;
        }
      
        function binb2hex (binarray) {
            var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
            var str = "";
            for(var i = 0; i < binarray.length * 4; i++) {
                str += hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8+4)) & 0xF) +
                hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8  )) & 0xF);
            }
            return str;
        }
      
        s = Utf8Encode(s);
        return binb2hex(core_sha256(str2binb(s), s.length * chrsz));
      
    }
    
    
    $('#SHA256button').click(function(){
    	
    	var pw = $('#teacherPw').val();
    	
    	console.log(pw+'<--사용자가 입력한 비밀번호');
    	
    	var SHA256PW = SHA256(pw);
    	
    	console.log(SHA256PW+"<-- 암호화된 비밀번호");
    	
    	$('.contact-form').submit();
        

	});

});

    

 
</script>






</head>
<body>


<div class="container">
<h2 class="text-center">회원가입</h2>
		
	<form action="${pageContext.request.contextPath}/insert" class="contact-form" method="post"> 
	
		
		<div class="form-group">
		<input type="text" class="teacherName form-control" name="teacherName" id="teacherName" placeholder="이름을 입력하세요">
		<span class="asterix">*</span>
		<span class="cross">x</span>
		<div class="alert alert-danger teacher-alert">
			완성된 한글로 2자 이상 15자 내로 입력하세요.
		</div>
		<div class="alert alert-danger custom-alert">
			이름을 입력하세요.
		</div>
		</div>
	
	
		<div class="form-group">
		<input type="text" class="form-control" id="teacher_ajax_id" name="teacherId" placeholder="아이디를 입력하세요"  maxlength="15">
	     		
		<span class="asterix">*</span>
		<span class="cross">x</span>
		<div class="alert alert-danger teacher-alert">
			영어 소문자 3자이상으로 시작하여 숫자 3자 이상으로 끝나야합니다.  : abc123 
		</div>
		<div class="alert alert-danger custom-alert">
			아이디를 입력하세요.
		</div>
		중복여부 : <jeon />
		</div>	
		
		
		<div class="form-group">
		<input type="text" class="form-control" id="teacherPw" name="teacherPw" placeholder="비밀번호를 입력하세요">
		<input type="hidden" name="teacherHiddenPw" value=''/>
		<!-- teacherPw의 text value를 javascript로 넘기기 위해 히든에 value값을 넣지 않고 틀만 만들어 둔다. -->
		
		<span class="asterix">*</span>
		<span class="cross">x</span>
		<div class="alert alert-danger teacher-alert">
			영문 숫자 조합으로 입력해주세요. 7자 이상 15자 내로 적어주세요.
		</div>
		<div class="alert alert-danger custom-alert">
			비밀번호를 입력하세요
		</div>
		</div>
	
		
		<div class="form-group">
		<input type="text" class="form-control" id="teacherPhone" name="teacherPhone" placeholder="연락처를 입력하세요">
		<span class="asterix">*</span>
		<span class="cross">x</span>
		<div class="alert alert-danger teacher-alert">
			핸드폰 번호를 정확히 입력하세요.
		</div>
		<div class="alert alert-danger custom-alert">
			연락처를 입력하세요.
		</div>
		</div>
	 
	
		<div class="form-group">
		<button type="button" id="SHA256button" value="send" class="btn btn-success btn-block" id="submit">Submit</button>
		<i class="fa fa-paper-plane send-icon"></i>
		</div>
		
		
	</form>
</div>

 	<!-- 아이디는 # 클래스는 . 태그는 태그명만 적으면 사용가능 -->		

</body>
</html>
