<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Child Modify Form</title>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>

<script>
	 $(document).ready(function(){
			$('#ChildManagement').attr('class','active');
	
			
		})
</script>
</head>
<body class="components-page">
<div class="wrapper">
<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" data-background-color="green">
							<h4 class="title">유아 정보 수정</h4>
						</div>
						
						<div class="card-content table-responsive">
    							<form id="modifyForm" action="${pageContext.request.contextPath}/ChildModify" method="post">
							        <div class="form-group">kid_no :
							            <input class="form-control" name="kidNo" value="${child.kidNo}" type="text" readonly="readonly"/>
							        </div>
							        <div class="form-group">
							            <label for="license_kindergarten">유치원 :</label>
							            <input class="form-control" value="${child.licenseKindergarten}" name="licenseKindergarten" id="licenseKindergarten" type="text"/>
							        </div>
							         <div class="form-group">
							            <label for="kid_name">이름 :</label>
							            <input class="form-control" value="${child.kidName}" name="kidName" id="kidName" type="text"/>
							        </div>
							        <div class="form-group">
							            <label for="kid_birth">생년월일 :</label>
							            <input class="form-control" value="${child.kidBirth}" name="kidBirth" id="kidBirth" type="text"/>
							        </div>    
							        <div class="form-group">
							            <label for="kid_address">주소 :</label>
							            <input class="form-control" value="${child.kidAddress}" name="kidAddress" id="kidAddress" type="text"/>
							        </div>
							        <div class="form-group">
							            <label for="kid_protector_phone">보호자 번호 :</label>
							            <input class="form-control" value="${child.kidProtectorPhone}" name="kidProtectorPhone" id="kidProtectorPhone" type="text"/>
							        </div>
							        <div class="form-group">
							            <label for="kid_protector_phone_reserve">보호자 예비번호 :</label>
							            <input class="form-control" value="${child.kidProtectorPhoneReserve}" name="kidProtectorPhoneReserve" id="kidProtectorPhoneReserve" type="text"/>
							        </div>
							        <div class="form-group">주의사항 :
							            <textarea class="form-control" id="kidPrecautions" name="kidPrecautions" rows="5" cols="50">${child.kidPrecautions}</textarea>
							        </div>
							        <div class="form-group">
							            <label for="kid_gender">성별 :</label>
							            <input class="form-control" value="${child.kidGender}" name="kidGender" id="kidGender" type="text"/>
							        </div>
							        <div class="form-group">
							            <label for="kid_commuting">통학방법 :</label>
							            <input class="form-control" value="${child.kidCommuting}" name="kidCommuting" id="kidCommuting" type="text"/>
							        </div>
							         <div class="form-group">
							            <label for="kid_commuting">입학일 :</label>
							            <input class="form-control" value="${child.kidEntranceDay}" name="kidEntranceDay" id="kidEntranceDay" type="text" readonly="readonly"/>
							        </div>
							        <div class="text-center">
							            <input class="btn btn-default" id="modifyButton" type="submit" value="수정"/>
							            <input class="btn btn-default" type="reset" value="초기화"/>
							            <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildList">목록</a>
							        </div>
    							</form>
   							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
