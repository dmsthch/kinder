<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<title>ChildAdd(spring mvc 방식)</title>
</head>
<body>
<div class="container">
    <h1>ChileAdd(spring mvc 방식)</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/ChildAdd" method="post">
        <div class="form-group">
            <label for="licenseKindergarten">유치원 :</label>
            <input class="form-control" name="licenseKindergarten" id="licenseKindergarten" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidName">이름 :</label>
            <input class="form-control" name="kidName" id="kidName" type="text"/>
        </div>
         <div class="form-group">
            <label for="kidBirth">생년월일 :</label>
            <input class="form-control" name="boardPw" id="boardPw" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidAddress">주소 :</label>
            <input class="form-control" name="kidAddress" id="kidAddress" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidProtectorPhone">보호자번호 :</label>
            <input class="form-control" name="kidProtectorPhone" id="kidProtectorPhone" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidProtectorPhoneReserve">보호자예비번호 :</label>
            <input class="form-control" name="kidProtectorPhoneReserve" id="kidProtectorPhoneReserve" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidPrecautions">주의사항 :</label>
            <textarea class="form-control" name="kidPrecautions" id="kidPrecautions" rows="5" cols="50"></textarea>
        </div>
        <div class="form-group">
            <label for="kidGender">성별 :</label>
            <input class="form-control" name="kidGender" id="kidGender" type="text"/>
        </div>
         <div class="form-group">
            <label for="kidCommuting">통학방법 :</label>
            <input class="form-control" name="kidCommuting" id="kidCommuting" type="text"/>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="button" value="글입력"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildList">글목록</a>
        </div>
    </form>
</div>
</body>
</html>



