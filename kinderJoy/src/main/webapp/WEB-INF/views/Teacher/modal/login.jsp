<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<!-- ★★★★★ 로그인 모달 시작★★★★★ -->
<div class="container">
  <!-- Trigger the modal with a button -->

  <!-- Modal -->
  <div class="modal fade" id="signIn" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        <div class="modal-body">
        
<!-- 바디시작 -->

  <form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post">
    <div class="form-group">
      <label>아이디:</label>
      <input type="text" class="form-control" name="teacher_id" placeholder="아이디를 입력하세요">
    </div>
    <div class="form-group">
      <label>비밀번호:</label>
      <input type="password" class="form-control" name="teacher_pw" placeholder="비밀번호를 입력하세요">
    </div>
    
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
  
<!-- 바디엔드 -->

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
	
</body>
</html>