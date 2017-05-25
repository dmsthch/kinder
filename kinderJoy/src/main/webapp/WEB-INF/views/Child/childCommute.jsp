<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<head>
	<meta charset="utf-8">
	<title>Title</title>
	
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="../module/importJS.jsp"></c:import>

	<style>
	</style>
	
	<script>
		$(document).ready(function(){

			$('#btnAllCheckTrue').click(function(){
				$('.checkbox').prop('checked','true');
			});
			$('#btnAllCheckFalse').click(function(){
				$('.checkbox').prop('checked','');
			});
			
			$('#testBt').click(function(){

				var formKidNoValue = $('#formKidNo').val();
				var formKidNameValue = $('#formKidName').val();
				var formCheckboxValue = $('#formCheckbox').val();
				var formInput = $('#formInput').val();
				
				for(i=0; i < $('.tdKidNo').length; i++){
					console.log(i);
										
					if(formKidNoValue.length == 0){
						formKidNoValue = $('.tdKidNo').eq(i).html();
						formKidNameValue = $('.tdKidName').eq(i).html();
						formCheckboxValue = $('.checkbox').eq(i).prop('checked');
						
						if($('.tdInput').eq(i).val() == ''){
							formInput = 'null';						
						}else{
							formInput = $('.tdInput').eq(i).val();
						}
						
						
					}else{
						formKidNoValue += ',' + $('.tdKidNo').eq(i).html();
						formKidNameValue += ',' + $('.tdKidName').eq(i).html();
						formCheckboxValue += ',' + $('.checkbox').eq(i).prop('checked');
						
						if($('.tdInput').eq(i).val() == ''){
							formInput += ',null';					
						}else{
							formInput += ',' + $('.tdInput').eq(i).val();
						}
						
					}
					console.log(formKidNoValue);
					console.log(formKidNameValue);
					console.log(formCheckboxValue);
					console.log(formInput);
					
					//히든에 값셋팅 해야함
					
					//히든에 값셋팅해서 컨트롤러로 넘겨서
					//오늘 출석데이터 검색해서 없으면 insert
					//있으면 update 처리해서 데이터를 갱신해주어야 함
					
				}
				
			});
			
		});

	</script>
	
</head>

<body class="container-fluid" style="margin-top:5%;">


	<!-- navbar -->
	<c:import url="../module/navbar.jsp"></c:import>

	<!-- sideNav -->
	<c:import url="../Child/nav/SideNav.jsp"></c:import>
<div class="wrapper">
	

    <div class="main-panel">
		
		<div class="row">
			<h1 class="text-center">${getChildClass.className}반 출석부</h1><br>
			<div class="col-sm-10 col-sm-offset-1">
			<h3 class="text-right">날짜 : <fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd"/> &nbsp</h3>
			<div class="text-right">
				<button id="btnAllCheckTrue" class="btn btn-default">전체선택</button>
				<button id="btnAllCheckFalse" class="btn btn-default">전체해제</button>
			</div>
			
				<table class="table table-hover">
					<thead>
						<tr>
							<td>유아번호</td>
							<td>이름</td>
							<td>출석여부</td>
							<td>특이사항여부</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="child" items="${childList}">
							<tr>
								<td class="tdKidNo">${child.kidNo}</td>
								<td class="tdKidName">${child.kidName}</td>
								<td class="tdCheckbox"><input type="checkbox" class="checkbox"></td>
								<td class="tdInput"><input type="text" style="width:100%"></td>
							</tr>
						</c:forEach>	
					</tbody>
					
				</table>
				
				<form>
				
					<div class="text-right">
						<input type="hidden" value="" id="formKidNo">
						<input type="hidden" value="" id="formKidName">
						<input type="hidden" value="" id="formCheckbox">
						<input type="hidden" value="" id="formInput">
						
						<input type="button" id="testBt" value="갱신" class="btn btn-default">
<!-- 						<input type="submit" value="갱신" class="btn btn-default"> -->
					</div>
				</form>
			</div>
		
		</div>
			
	</div> <!-- main-panel End -->
	
</div>

</body>
</html>