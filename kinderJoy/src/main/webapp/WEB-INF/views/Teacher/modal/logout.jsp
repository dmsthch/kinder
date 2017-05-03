<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<!-- ★★★★★권한확인 및 로그아웃 모달 시작★★★★★ -->

<div class="container">
  <!-- Trigger the modal with a button -->

  <!-- Modal -->
  <div class="modal fade" id="signOut" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그 아웃</h4>
        </div>
        <div class="modal-body">
        
<!-- 바디시작 -->
<form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post">
		<div class="text-center">로그아웃 하시겠습니까?</div>
  </form>  
<!-- 바디엔드 -->

        </div>
        <div class="modal-footer">
        <a href="${pageContext.request.contextPath}/logOut"><button type="button" class="btn btn-default">로그아웃</button></a>
        </div>
      </div>
      
    </div>
  </div>
</div>
	
</body>
</html>