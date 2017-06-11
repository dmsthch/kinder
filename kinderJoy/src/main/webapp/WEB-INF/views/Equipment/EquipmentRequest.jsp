<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today" />
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>

<style>
/* @font-face{
	font-family: 'koverwatch';
	src: url(fonts/koverwatch.ttf) format('truetype');
} */
/* body {
	font-family: koverwatch
} */
/* .form-control{
	width:400px;
} */
</style>
<script>
$(document).ready(function(){
	$('#equipmentRequestNav').attr('class','active');
	$('#requestAmount').focusout(function(){
		if(isNaN($('#requestAmount').val())) {
			alert('숫자만 입력해주세요');
			$('#requestAmount').val('');
			$('#requestAmount').focus();
		}
	});
	$('#requestPrice').focusout(function(){
		if(isNaN($('#requestPrice').val())) {
			alert('숫자만 입력해주세요');
			$('#requestPrice').val('');
			$('#requestPrice').focus();
		}
	});
	 $('#request').click(function(){
		var categoryNo = $('[name=categoryNo]:checked').val();
		var requestAmount = $('#requestAmount').val();
		var requestName = $('#requestName').val();
		var requestPrice = $('#requestPrice').val();
		var requestStant = $('#requestStant').val();
		var requestReason = $('#requestReason').val();
		if(categoryNo==undefined) {
			alert('카테고리를 선택해주세요');
		} else if(requestAmount=='') {
			alert('수량을 입력해 주세요');
		} else if(requestName=='') {
			alert('품명을 입력해 주세요');
		} else if(requestPrice=='') {
			alert('금액을 입력해 주세요');
		} else if(requestStant=='') {
			alert('구입처를 입력해 주세요');
		} else if(requestReason=='') {
			alert('신청사유를 입력해 주세요');
		} else if(categoryNo!=undefined&&requestAmount!=''&&requestName!=''&&requestPrice!=''&&requestStant!=''&&requestReason!='') {
			$('#equipmnetRequestForm').submit();
		}
		
	 });

})
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="red">
	                                <h4 class="title">비품 신청</h4>
									<p class="category">EQUIPMENT REQUEST</p>
	                            </div>
	                            <div class="card-content">
	                                <form id="equipmnetRequestForm" action="${pageContext.request.contextPath}/RequestSave" method="POST">
	                                    <div class="row">
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">신청자</label>
													<input type="text" class="form-control" value="${teacherName}" readonly>
													<input type="hidden" name="teacherNo" value="${teacherNo}"/>
												</div>
	                                        </div>
	                                        <div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label">비품 카테고리</label>
													<div id="categoryNo" class="radio" style="margin:0 auto" align="center">
														<label>
															<input type="radio" name="categoryNo" value="1">
															교재,교구
														</label>
														<label>
															<input type="radio" name="categoryNo" value="2">
															사무용품
														</label>
														<label>
															<input type="radio" name="categoryNo" value="3">
															체육용품
														</label>
														<label>
															<input type="radio" name="categoryNo" value="4">
															도서목록
														</label>
														<label>
															<input type="radio" name="categoryNo" value="5">
															기타
														</label>
													</div>
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">수량</label>
													<input type="text" id="requestAmount" name="requestAmount" class="form-control" >
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">비품 신청 명</label>
													<input type="text" id="requestName" name="requestName" class="form-control" >
												</div>
	                                        </div>
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">신청일</label>
													<input type="text" name="requestDate" class="form-control" value="${today}" readonly/>
												</div>
	                                        </div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">예상 금액</label>
													<input type="text" id="requestPrice" name="requestPrice" class="form-control" />
												</div>
	                                        </div>
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">예상 구입처</label>
													<input type="text" id="requestStant" name="requestStant" class="form-control" />
												</div>
	                                        </div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-md-12">
	                                            <div class="form-group">
													<div class="form-group label-floating">
									    				<label class="control-label">신청사유</label>
								    					<textarea class="form-control" id="requestReason" name="requestReason" rows="5"></textarea>
		                        					</div>
	                                            </div>
	                                        </div>
	                                    </div>

	                                    <button id="request" type="button" class="btn btn-default pull-right">신청하기</button>
	                                    <div class="clearfix"></div>
	                                </form>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
			</div>
		</div>
	</div>
</div>
<br><br><br><br><br>


</body>
<c:import url="../module/importJS.jsp"></c:import>
</html>