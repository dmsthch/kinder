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
<!-- 세션에 담겨있는  -->

넘버		${kyoteacher.teacher_no}
아이디	${kyoteacher.teacher_id}
라이선스	${kyoteacher.license_kindergarten}
권한		${kyoteacher.teacher_level}
이름		${kyoteacher.teacher_name}
비밀번호	${kyoteacher.teacher_pw}
생성일	${kyoteacher.teacher_add_day}
번호		${kyoteacher.teacher_phone}
은행		${kyoteacher.teacher_bank}
계좌		${kyoteacher.teacher_account}
호봉		${kyoteacher.teacher_paystep}

<div class="container" id="form">

  <div class="panel panel-default showcase">
    <div class="panel-body">
      <div class="form-group -animated">
        <label for="#form-control-2">Example 2</label>
        <input class="form-control" id="form-control-2" type="text">
      </div>
      
      
      
      
          <div class="panel-body">
      <div class="form-group -animated">
        <label for="#form-control-2">Example 2</label>
        <input class="form-control" id="form-control-2" type="text">
      </div>
    </div>
    
    </div>
  </div>
</div>

</body>
</html>