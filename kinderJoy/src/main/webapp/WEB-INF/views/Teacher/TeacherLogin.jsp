<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
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
</div>

</body>
</html>