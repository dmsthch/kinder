<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
		$('#ChildCommute').attr('class','active');

		
	})
		$(document).ready(function(){
			
			if(${fn:length(resultAttendanceList) > 0 }){
				
				console.log('출석값 있음')
				
				for(i=0; i<$('.getKidNo').length ; i++){
					
					console.log(i + ' : 아이');
					
					//체크박스 셋팅
					if( $('.getCheckbox').eq(i).val() == 1 ) $('.checkbox').eq(i).prop('checked','true')
					//카테고리 셋팅
					if( $('.getCategory').eq(i).val() != '' ) $('.tdCategory').find('select').eq(i).val( $('.getCategory').eq(i).val() )
					
					if( $('.getInput').eq(i).val() != '' ) $('.tdInput').eq(i).children().val( $('.getInput').eq(i).val() )
					
				}				
				
			}
			
						
			$('#btnAllCheckTrue').click(function(){
				$('.checkbox').prop('checked','true');
			});
			$('#btnAllCheckFalse').click(function(){
				$('.checkbox').prop('checked','');
			});
			
			$('.tdCategory').find('select').change(function(){
				var value = $(this).val();
				
				if(value != 'null'){
					$(this).parents('tr').find('.tdInput').children().val('');
					$(this).parents('tr').find('.tdInput').children().removeAttr('readonly');			
				}else{
					$(this).parents('tr').find('.tdInput').children().attr('readonly','readonly');
				}
				
			});
			
			$('#btnSubmit').click(function(){ //폼셋팅 후 submit
				
				$('#resultForm').find('input').val(''); //hiddenForm Reset
				$('#btnSubmit').val('출석');
				
				var formKidNoValue = $('#formKidNo').val();
				var formKidNameValue = $('#formKidName').val();
				var formCheckboxValue = $('#formCheckbox').val();
				var formCategory = $('#formCategory').val();
				var formInput = $('#formInput').val();
				
				for(i=0; i < $('.tdKidNo').length; i++){
					if(formKidNoValue.length == 0){
						formKidNoValue = $('.tdKidNo').eq(i).html();
						formKidNameValue = $('.tdKidName').eq(i).html();
						formCheckboxValue = $('.checkbox').eq(i).prop('checked');
						formCategory = $('.tdCategory').eq(i).find('select').val();
						
						if($('.tdInput').eq(i).find('input').val() == ''){
							formInput = 'null';						
						}else{
							formInput = $('.tdInput').eq(i).find('input').val();
						}
						
						
					}else{
						formKidNoValue += ',' + $('.tdKidNo').eq(i).html();
						formKidNameValue += ',' + $('.tdKidName').eq(i).html();
						formCheckboxValue += ',' + $('.checkbox').eq(i).prop('checked');
						formCategory += ',' + $('.tdCategory').eq(i).find('select').val();
						
						if($('.tdInput').eq(i).find('input').val() == ''){
							formInput += ',null';					
						}else{
							formInput += ',' + $('.tdInput').eq(i).find('input').val();
						}
						
					}
					
					$('#formKidNo').val(formKidNoValue);
					$('#formKidName').val(formKidNameValue);
					$('#formCheckbox').val(formCheckboxValue);
					$('#formCategory').val(formCategory);
					$('#formInput').val(formInput);

					console.log($('#formKidNo').val());
					console.log($('#formKidName').val());
					console.log($('#formCheckbox').val());
					console.log($('#formCategory').val());
					console.log($('#formInput').val());
					
					$('#resultForm').submit();
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
	

    <div class="col-md-10 col-sm-offset-2">
 			<div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="green">
	                                <h4 class="title""text-center">${getChildClass.className}반 출석부</h4>
	                                <p class="category"></p>
	                            </div>
	                           <h4 class="text-right">날짜 : <fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd"/> &nbsp</h4>
							   <div class="text-right">
									<button id="btnAllCheckTrue" class="btn btn-default">전체선택</button>
									<button id="btnAllCheckFalse" class="btn btn-default">전체해제</button>
						       </div>
  					 		  <table class="table table-striped">
	                     		<thead class="text-primary">
									<tr>
	                                    <th>유아번호</th>
                						<th>이름</th>
		                				<th>출석여부</th>
										<th>특이사항종류</th>
										<th>특이사항내용</th>
		                            </tr>    
					     		</thead>
	                          <tbody>
						<c:forEach var="child" items="${childList}">
							<tr>
								<td class="tdKidNo">${child.kidNo}</td>
								<td class="tdKidName">${child.kidName}</td>
								<td class="tdCheckbox"><input type="checkbox" class="checkbox"></td>
								<td class="tdCategory">
									<select>
										<option value="null">선택</option>
										<c:forEach var="category" items="${categoryList}">
											<option value="${category.categoryNo }">${category.categoryName}</option>
										</c:forEach>
									</select>
								</td>
								<td class="tdInput"><input type="text" style="width:100%"></td>
							</tr>
						</c:forEach>
							
					</tbody>
					
				</table>
				
				<form id="resultForm" action="${pageContext.request.contextPath}/ChildCommute" method="post">
					<div class="text-right">
						
						<input type="hidden" id="formKidNo" name="formKidNo">
						<input type="hidden" id="formKidName" name="formKidName">
						<input type="hidden" id="formCheckbox" name="formCheckbox">
						<input type="hidden" id="formCategory" name="formCategory">
						<input type="hidden" id="formInput" name="formInput">
						
						<input type="button" id="btnSubmit" value="출석" class="btn btn-default">
					</div>
				</form>
			</div>
			
			<div>
				
				<c:if test="${fn:length(resultAttendanceList) > 0 }">
					<c:forEach var="result" items="${resultAttendanceList }">
						<input type="hidden" value="${result.kidNo }" class="getKidNo">
						<input type="hidden" value="${result.attendance }" class="getCheckbox">
						<input type="hidden" value="${result.categoryNo }" class="getCategory">
						<input type="hidden" value="${result.attendanceMemo }" class="getInput">
					</c:forEach>
				</c:if>
			
			
			</div>
		
		</div>
			
	</div> <!-- main-panel End -->
	
</div>

</body>
</html>