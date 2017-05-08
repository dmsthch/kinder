<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="css/JKC/css/default.css">
</head>
<body>
	
	<!-- ★★★★★ 로그인 모달 시작★★★★★ -->
<div class="container">
  <!-- Trigger the modal with a button -->

  <!-- Modal -->
  <div class="modal fade" id="signIn" role="dialog">
    <!-- <div class="modal-dialog">
    
      <!-- Modal content-->
      <!-- <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        <div class="modal-body"> -->
        
<!-- 바디시작 -->

<div id="site-container">
	<div class="siteColorBg">	
															<!-- 이미지 -->
    <div class="siteAnimationBg active" style="background-image: url(&quot;images/JKC/kid.jpg&quot;);">
    </div>
</div>
<div class="siteCover"></div>    
<div class="be-cover">
    <div class="befrozen-container befrozen-wrap">
        <form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post" class="befrozen-login">

            <h1>로그인</h1>
            <fieldset>
                <div class="form-item">
                    <input type="text" class="form-text" name="teacher_id" value="test01" placeholder="아이디를 입력하세요"></div>
                <div class="form-item">
                    <input type="password" class="form-text" name="teacher_pw" value="test01" placeholder="비밀번호를 입력하세요">
                </div>
                
                <div class="form-item"><button type="submit" class="vanellope rp-font vanellope-pascal">login</button></div>
     			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </fieldset>
        	</form>
	      </div>
	      </div>
      </div>
  
<!-- 바디엔드 -->

        </div>
      </div>
      
    </div>
  </div>
  
</div>
	
</body>
</html>