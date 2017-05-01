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
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<title>Child Modify Form(spring mvc 방식)</title>
</head>
<body>
<div class="container">
    <h1>Child Modify Form(spring mvc 방식)</h1> 
    <form id="modifyForm" action="${pageContext.request.contextPath}/ChildModify" method="post">
        <div class="form-group">kid_no :
            <input class="form-control" name="kid_no" value="${child.kid_no}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="license_kindergarten">유치원 :</label>
            <input class="form-control" value="${child.license_kindergarten}" name="license_kindergarten" id="license_kindergarten" type="text"/>
        </div>
         <div class="form-group">
            <label for="kid_name">이름 :</label>
            <input class="form-control" value="${child.kid_name}" name="kid_name" id="kid_name" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_birth">생년월일 :</label>
            <input class="form-control" value="${child.kid_birth}" name="kid_birth" id="kid_birth" type="text"/>
        </div>    
        <div class="form-group">
            <label for="kid_address">주소 :</label>
            <input class="form-control" value="${child.kid_address}" name="kid_address" id="kid_address" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_protector_phone">보호자 번호 :</label>
            <input class="form-control" value="${child.kid_protector_phone}" name="kid_protector_phone" id="kid_protector_phone" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_protector_phone_reserve">보호자 예비번호 :</label>
            <input class="form-control" value="${child.kid_protector_phone_reserve}" name="kid_protector_phone_reserve" id="kid_protector_phone_reserve" type="text"/>
        </div>
        <div class="form-group">주의사항 :
            <textarea class="form-control" id="kid_precautions" name="kid_precautions" rows="5" cols="50">${child.kid_precautions}</textarea>
        </div>
        <div class="form-group">
            <label for="kid_gender">성별 :</label>
            <input class="form-control" value="${child.kid_gender}" name="kid_gender" id="kid_gender" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_commuting">통학방법 :</label>
            <input class="form-control" value="${child.kid_commuting}" name="kid_commuting" id="kid_commuting" type="text"/>
        </div>
         <div class="form-group">
            <label for="kid_commuting">입학일 :</label>
            <input class="form-control" value="${child.kid_entrance_day}" name="kid_entrance_day" id="kid_entrance_day" type="text" readonly="readonly"/>
        </div>
        <div>
        
            <input class="btn btn-default" id="modifyButton" type="submit" value="글수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildList">글목록</a>
        </div>
    </form>
</div>
</body>
</html>
