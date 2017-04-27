<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery�� ����ϱ����� CDN�ּ� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript�ҽ��� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<title>ChildAdd(spring mvc ���)</title>
</head>
<body>
<div class="container">
    <h1>ChileAdd(spring mvc ���)</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/ChildAdd" method="post">
        <div class="form-group">
            <label for="licenseKindergarten">��ġ�� :</label>
            <input class="form-control" name="licenseKindergarten" id="licenseKindergarten" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidName">�̸� :</label>
            <input class="form-control" name="kidName" id="kidName" type="text"/>
        </div>
         <div class="form-group">
            <label for="kidBirth">������� :</label>
            <input class="form-control" name="boardPw" id="boardPw" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidAddress">�ּ� :</label>
            <input class="form-control" name="kidAddress" id="kidAddress" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidProtectorPhone">��ȣ�ڹ�ȣ :</label>
            <input class="form-control" name="kidProtectorPhone" id="kidProtectorPhone" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidProtectorPhoneReserve">��ȣ�ڿ����ȣ :</label>
            <input class="form-control" name="kidProtectorPhoneReserve" id="kidProtectorPhoneReserve" type="text"/>
        </div>
        <div class="form-group">
            <label for="kidPrecautions">���ǻ��� :</label>
            <textarea class="form-control" name="kidPrecautions" id="kidPrecautions" rows="5" cols="50"></textarea>
        </div>
        <div class="form-group">
            <label for="kidGender">���� :</label>
            <input class="form-control" name="kidGender" id="kidGender" type="text"/>
        </div>
         <div class="form-group">
            <label for="kidCommuting">���й�� :</label>
            <input class="form-control" name="kidCommuting" id="kidCommuting" type="text"/>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="button" value="���Է�"/>
            <input class="btn btn-default" type="reset" value="�ʱ�ȭ"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildList">�۸��</a>
        </div>
    </form>
</div>
</body>
</html>



