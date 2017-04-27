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
 
<title>ChildDevelopment(spring mvc ���)</title>
</head>
<body>
<div class="container">
    <h1>ChildDevelopment(spring mvc ���)</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/ChildDevelopment" method="post">
        <div class="form-group">
            <label for="development_group">�з� :</label>
            <input class="form-control" name="development_group" id="development_group" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_content">���� :</label>
            <input class="form-control" name="development_content" id="development_content" type="text"/>
        </div>
         <div class="form-group">
            <label for="development_details">���γ��� :</label>
            <input class="form-control" name="development_details" id="development_details" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_question">�������� :</label>
            <input class="form-control" name="development_question" id="development_question" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_standart">�����ذ� :</label>
            <input class="form-control" name="development_standart" id="development_standart" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_case">������� :</label>
            <input class="form-control" name="development_case" id="development_case" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_day">������ :</label>
            <textarea class="form-control" name="kidPrecautions" id="kidPrecautions" rows="5" cols="50"></textarea>
        </div>
        <div class="form-group">
            <label for="development_title">���� :</label>
            <input class="form-control" name="development_title" id="development_title" type="text"/>
        </div>
         <div class="form-group">
            <label for="license_kindergarten">��ġ�����̼��� :</label>
            <input class="form-control" name="license_kindergarten" id="license_kindergarten" type="text"/>
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
