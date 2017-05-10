<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/JKC/animated_overlay.js"></script>
<link href="css/JKC/animated_overlayed.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<!-- jsp로 받을 땐 값이 담겨있는 name과 name안에 있는 value값을 적어줘야 한다 .으로 구분 -->

<div class="container" id="form"> 

      <div class="form-group">
        <label for="#form-control-1">아이디</label>
        <input class="form-control" id="id" value="${kyoteacher.teacher_id}" type="text" readonly>
      </div>
		
	  <div class="form-group">
        <label for="#form-control-1">비밀번호</label>
        <input class="form-control" value="${kyoteacher.teacher_pw}" type="text" readonly>
      </div>
		
      <div class="form-group">
        <label for="#form-control-1">권한</label>
        <input class="form-control" value="${kyoteacher.teacher_level}" type="text" readonly>
      </div>

      <div class="form-group">
        <label for="#form-control-1">이름</label>
        <input class="form-control" value="${kyoteacher.teacher_name}" type="text" readonly>
      </div>

      <div class="form-group">
        <label for="#form-control-1">라이선스</label>
        <input class="form-control" value="${kyoteacher.license_kindergarten}" type="text" readonly>
      </div>

      <div class="form-group">
        <label for="#form-control-1">생성일</label>
        <input class="form-control" value="${kyoteacher.teacher_add_day}" type="text" readonly>
      </div>

      <div class="form-group">
        <label for="#form-control-1">번호</label>
        <input class="form-control" value="${kyoteacher.teacher_phone}" type="text" readonly>
      </div>

      <div class="form-group">
        <label for="#form-control-1">은행</label>
        <input class="form-control" value="${kyoteacher.teacher_bank}" type="text" readonly>
      </div>

      <div class="form-group">
        <label for="#form-control-1">계좌</label>
        <input class="form-control" value="${kyoteacher.teacher_account}" type="text" readonly>
      </div>

      <div class="form-group">
        <label for="#form-control-1">호봉</label>
        <input class="form-control" value="${kyoteacher.teacher_paystep}" type="text" readonly>
      </div>
    
    </div>
</body>
</html>