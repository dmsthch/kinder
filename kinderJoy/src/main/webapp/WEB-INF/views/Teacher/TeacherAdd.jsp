<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>타이틀 변경</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>회원가입</h2>
  <form class="form-horizontal">
    <div class="form-group">
      <label class="control-label col-sm-2">라이센스:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="AddLicense" placeholder="발급된 라이센스를 입력하세요">
      </div>
    </div>
    
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">권한:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="AddLevel" placeholder="권한을 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">이름:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="AddName" placeholder="이름을 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">아이디:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="AddId" placeholder="아이디를 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">Password:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="AddPw" placeholder="비밀번호를 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">등록일자:</label>
      <div class="col-sm-10">          
        <input type="date" class="form-control" name="AddDay">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">연락처:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="AddPhone" placeholder="연락처를 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">계좌번호:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="AddAccount" placeholder="계좌번호를 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">은행:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="AddBank" placeholder="은행을 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">호봉:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="AddPaystep" placeholder="호봉을 입력하세요">
      </div>
    </div>
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>
