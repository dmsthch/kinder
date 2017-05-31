<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>
<script>
$(document).ready(function(){
	//맨처음분류 1~5까지 선택(신의사예자)하면 2번째 셀렉트에서 해당하는 내용만 보여주기
	$(document).on('change','#questionSelect',function(){
		var questionSelect = $('#questionSelect').val();
		console.log(questionSelect);
		$('select[name=opserveNo] option[class!="'+questionSelect+'"]').attr('style','display:none');
		$('select[name=opserveNo] option[class="'+questionSelect+'"]').attr('style','display:""');
		$("#afterSelect option:first").prop("selected", true);
		$('#afterSelect').attr('style','display: "" ');
	});
	
	$(document).on('change','#contentSelect',function(){
		var contentSelect = $('#contentSelect option:selected').attr('id');
		console.log(contentSelect);
		$('.radio label[class="'+contentSelect+'"]').attr('style',' display:"" ');
		$('.radio label[class!="'+contentSelect+'"]').attr('style','display:none');
		$("#reference option:first").prop("selected", true);
		$('#reference').attr('style','display: "" ');
	})
	
	$(document).on('click','.radio',function(){
		$('#textArea').attr('style','display:""');
	})
	
	
});

</script>
<style>
	.radio label{
	color: #555; 
	margin-bottom: 20px;
	
	}
	
	.radio {margin-left: 50px;}
</style>
</head>
<body class="components-page">
<div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" data-background-color="green">
							<h4 class="title">발달평가</h4>
						</div>
						<div class="card-content table-responsive ">
							<div class="input-group row">
								<span class="input-group-addon" style="padding-top: 20px;">
									<i class="material-icons">face</i>
								</span>
								<div class="col-md-2">
									<input type="text" class="form-control" value="이름 : ${child. kidName}" readonly>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" value="성별 : ${child.kidGender}" readonly>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" value="반 : ${child.className}" readonly>
								</div>
								<div class="col-md-3">
									<input type="text" class="form-control" value="생년월일 : ${child.kidBirth}" readonly>
								</div>
								<div class="col-md-2">
									<input type="text" class="form-control" value="나이 : ${child.classAge}" readonly>
								</div>
							</div>
							<hr/>	
							
						<form action="${pageContext.request.contextPath}/ChildDevelopmentAdd" method="post" id="developmentForm">
							<input type="hidden" value="${child.kidFormationNo}" name="kidFormationNo"> <!-- 반편성번호 -->
							<input type="hidden" value="" name="opserveNo" id="opserveNo"> <!-- 관찰문항번호. 옵션 -->
							<input type="hidden" value="${child. kidName}" name="kidName" > <!-- 아이이름 -->
							<input type="hidden" value="${child. kidBirth}" name="kidBirth" > <!-- 아이이름 -->
							<input type="hidden" value="${child. classAge}" name="classAge" > <!-- 아이이름 -->
							<div class="input-group col-md-4">
								<span class="input-group-addon" style="padding-top: 20px;">
									<i class="material-icons">forward</i>
								</span>
								<select class="form-control" id="questionSelect">
									<option value="" selected disabled> 분류 선택 </option>
									<option value=1>신체운동,건강</option>
									<option value=2>의사소통</option>
									<option value=3>사회관계</option>
									<option value=4>예술경험</option>
									<option value=5>자연탐구</option>
								</select>
							</div>
							
							<div class="input-group col-md-11" id="afterSelect" style="display: none;">
								<span class="input-group-addon" style="padding-top: 20px;">
									<i class="material-icons">forward</i>
								</span>
								<select class="form-control" name="opserveNo" id="contentSelect">
									<option value="" selected disabled>내용/문항 선택</option>
									<c:forEach items="${opserveList}" var="opserve">
									<option value="${opserve.opserveNo}" id="${opserve.opserveQuestionNo}" class="${fn :substring(opserve.opserveQuestionNo,0,1)}">${opserve.opserveNo}  ${opserve.opserveContent} - ${opserve.opserveQuestion} </option>
									</c:forEach>
								</select>
								
							</div>
								
							<div class="input-group col-md-11" id="reference" style="display: none;">
									<c:forEach items="${opserveList}" var="opserve">
										<div class="radio ">
											<label class="${opserve.opserveQuestionNo}"><input type="radio" name="developmentGroup" value="1" >1수준 : ${opserve.opserveReference1}</label>
										</div>
										<div class="radio ">
											<label class="${opserve.opserveQuestionNo}"><input type="radio" name="developmentGroup" value="2" >2수준 : ${opserve.opserveReference2}</label>
										</div>
										<div class="radio ">
										<label class="${opserve.opserveQuestionNo}"><input type="radio" name="developmentGroup" value="3" >3수준 : ${opserve.opserveReference3}</label>
										</div>
									</c:forEach>
							</div>
								
							<div id="textArea" style="display: none;">
							<hr/>
								<textarea name="developmentCase" class="form-control" placeholder="수준에 관련된 사례를 입력하세요. &#13;&#10;예) 이야기 나누기 활동 시 정해진 주제와 관련된 이야기를 하던 도중 주제와 다른 이야기를 한다." rows="5"></textarea>
							<hr/>
							</div>
								<button class="btn btn-success" id="save"> 저장 </button>
						</form>
							<%-- <c:forEach items="${opserveList}" var="opserve">
								${opserve.opserveContent} <br>
							</c:forEach> --%>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>