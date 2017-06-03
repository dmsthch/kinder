<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
 
 <script>
	 $(document).ready(function(){
			$('#ChildAdd').attr('class','active');
	
			
		})
		
 	$(document).ready(function(){
 		
 		$('#addButton').click(function(){
 			
 			if($('#kid_protector_phone_reserve').val().length == 0){
 	 			$('#kid_protector_phone_reserve').val('0');
 			}
 			$('#addForm').submit();
 		});
 		
 		
 	});
 
 </script>
 
<title>ChildAdd</title>
<!-- CSS Link -->
<c:import url="../module/importCSS.jsp"></c:import>
<!-- JS Link -->
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>

	<style>
		#body{
			margin-top:5%;
		}
	</style>
<c:import url="../module/navbar.jsp"></c:import>
<c:import url="../Child/nav/SideNav.jsp"></c:import>
</head>
<body class="components-page">
<div class="wrapper">
<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" data-background-color="green">
							<h4 class="title">유아 등록</h4>
						</div>

<div class="container">
    
    <form id="addForm" action="${pageContext.request.contextPath}/ChildAdd" method="post">
        <div class="form-group">
            <label for="license_kindergarten">유치원 :</label>
            <input class="form-control" name="licenseKindergarten" value="${licenseKindergarten}" id="licenseKindergarten" type="text" readonly/>
        </div>
        <div class="form-group">
            <label for="kid_name">이름 :</label>
            <input class="form-control" name="kidName" id="kidName" type="text"/>
        </div>
         <div class="form-group">
            <label for="kid_birth">생년월일 :</label>
            <input class="form-control" name="kidBirth" id="kidBirth" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_address">주소 :</label>
            <input class="form-control" name="kidAddress" id="kidAddress" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_protector_phone">보호자번호 :</label>
            <input class="form-control" name="kidProtectorPhone" id="kidProtectorPhone" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_protector_phone_reserve">보호자예비번호 :</label>
            <input class="form-control" name="kidProtectorPhoneReserve" id="kidProtectorPhoneReserve" type="text"/>
        </div>
        <div class="form-group">
            <label for="kid_precautions">주의사항 :</label>
            <textarea class="form-control" name="kidPrecautions" id="kidPrecautions" rows="5" cols="50"></textarea>
        </div>
        <div class="form-group">
            <label for="kid_gender">성별 :</label>
            <label class="radio-inline">
		      <input type="radio" name="kidGender" value="남">남자
		    </label>
		    <label class="radio-inline">
		      <input type="radio" name="kidGender" value="여">여자
		    </label>
        </div>
         <div class="form-group">
            <label for="kid_commuting">통학방법 :</label>
            <input class="form-control" name="kidCommuting" id="kidCommuting" type="text"/>
        </div>
        <div>
            <input class="btn btn-default" type="submit" id="addButton" type="button" value="유아등록"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildList">목록</a>
        </div>
    </form>
</div>

</body>
</html>
