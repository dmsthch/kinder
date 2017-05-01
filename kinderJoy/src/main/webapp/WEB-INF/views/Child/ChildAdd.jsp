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
 
 <script>
 	$(document).ready(function(){
 		
 		$('#addButton').click(function(){
 			
 			if($('#kid_protector_phone_reserve').val().length == 0){
 	 			$('#kid_protector_phone_reserve').val('0');
 			}
 			$('#addForm').submit();
 		});
 		
 		
 	});
 
 </script>
 
<title>ChildAdd(spring mvc ���)</title>
</head>
<body>
<div class="container">
    <h1>ChildAdd(spring mvc ���)</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/ChildAdd" method="post">
        <div class="form-group">
            <label for="license_kindergarten">��ġ�� :</label>
            <input class="form-control" name="license_kindergarten" id="license_kindergarten" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_name">�̸� :</label>
            <input class="form-control" name="kid_name" id="kid_name" type="text"/>
        </div>
         <div class="form-group">
            <label for="kid_birth">������� :</label>
            <input class="form-control" name="kid_birth" id="kid_birth" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_address">�ּ� :</label>
            <input class="form-control" name="kid_address" id="kid_address" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_protector_phone">��ȣ�ڹ�ȣ :</label>
            <input class="form-control" name="kid_protector_phone" id="kid_protector_phone" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_protector_phone_reserve">��ȣ�ڿ����ȣ :</label>
            <input class="form-control" name="kid_protector_phone_reserve" id="kid_protector_phone_reserve" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_precautions">���ǻ��� :</label>
            <textarea class="form-control" name="kid_precautions" id="kid_precautions" rows="5" cols="50"></textarea>
        </div>
        <div class="form-group">
            <label for="kid_gender">���� :</label>
            <input class="form-control" name="kid_gender" id="kid_gender" type="text"/>
        </div>
         <div class="form-group">
            <label for="kid_commuting">���й�� :</label>
            <input class="form-control" name="kid_commuting" id="kid_commuting" type="text"/>
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



