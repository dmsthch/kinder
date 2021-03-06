
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- script -->
<script>

	$(document).ready(function(){
		$('#equipmentListNav').attr('class','active');
	})

	// TR태그 복사하기
	$(document).on('click','#button',function(){
			var getCopyObject = $('#copyTargetTable tbody').clone();			
			$('#table tbody').append(getCopyObject.html())
			console.log('성공');
	});
	// 품명 더블클릭으로 readonly 해제
	$(document).on('dblclick','.test1',function(){
		$(this).removeAttr('readonly');
	});
	// 품명 포커스아웃으로 readonly 생성
	$(document).on('focusout','.testCustomer',function(){
		$(this).attr('readonly','readonly');
	});
	// 구입처 더블클릭으로 readonly 해제
	$(document).on('dblclick','.testCustomer',function(){
		$(this).removeAttr('readonly');
	});
	// 구입처 포커스아웃으로 readonly 생성
	$(document).on('focusout','.testState',function(){
		$(this).attr('readonly','readonly');
	});
	// 보관상태 더블클릭으로 readonly 해제
	$(document).on('dblclick','.testState',function(){
		$(this).removeAttr('readonly');
	});
	// 보관상태 포커스아웃으로 readonly 생성
	$(document).on('focusout','.test1',function(){
		$(this).attr('readonly','readonly');
	}); 
	//plus 버튼 누를 시 태그 plus, minus 태그 삭제하고 plus 네입값 입력된 인풋 추가
	$(document).on('click','.updatePlus',function(){
		$(this).parent().find('.updatePlusInput').attr('type','text');
		$(this).parent().find('.updateMinus').remove();
		$(this).parent().find('.updatePlus').remove();
	});
	//plus 버튼 누를 시 태그 plus, minus 태그 삭제하고 plus 네입값 입력된 인풋 추가
	$(document).on('click','.updateMinus',function(){
		var testInput = '<input type="text" name="updateMinusInput" class="form-control"/>'
		$(this).after(testInput);		
		$(this).parent().find('.updatePlus').remove();
		$(this).parent().find('.updateMinus').remove();
	});
 	// 숫자 유효성 검사
	$(document).on('focusout','.testNote',function(){	
		var testNote2 = $(this).val();
		var testValue2 = $(this).parent().parent().parent().parent().parent().find('.testValue').val();
		var isTestNote = isNaN(testNote2);
		console.log(isTestNote);
		if(isTestNote === true) {
			alert('숫자만 입력해주세영.ㅠㅠ');
			$(this).val('');
			$(this).focus();
		}else if(testNote2 < 0) {
			alert('양수만 입력해주세영.ㅠㅠ');
			$(this).val('');
			$(this).focus();
		}
	});
	// 수량 더하기
	$(document).on('click','.plus',function(){
		var testNote = $(this).parent().parent().parent().find('.testNote').val();
		var testValue = $(this).parent().parent().parent().parent().parent().find('.testValue').val();
		if(testNote == '') {
			var testPlusValue = parseInt(testValue) + parseInt(1);
			console.log(testPlusValue);
			$(this).parent().parent().parent().parent().parent().find('.testValue').val(testPlusValue);
		}else if(testNote !== '') {
			var testPlusValue = parseInt(testValue) + parseInt(testNote);
			console.log(testPlusValue);
			$(this).parent().parent().parent().parent().parent().find('.testValue').val(testPlusValue);
			$(this).parent().parent().parent().find('.testNote').val('');
		}
		var testPrice = $(this).parent().parent().parent().parent().parent().find('.testPrice').val();
		console.log(testPrice);
		var testValuePrice = parseInt(testPrice) * parseInt(testPlusValue);
		console.log(testValuePrice);
		$(this).parent().parent().parent().parent().parent().find('.testTotalPrice').val(testValuePrice);
	});
	// 수량 빼기 및 수량 0미만 유효성 검사
	$(document).on('click','.minus',function(){
		var testNote = $(this).parent().parent().parent().find('.testNote').val();
		var testValue = $(this).parent().parent().parent().parent().parent().find('.testValue').val();
		if(testNote == '') {
			if(testValue == 0) {
				alert('수량의 값은 0 밑으로 입력하실 수 없습니다.');
			} else {
			var testPlusValue = parseInt(testValue) - parseInt(1);
			console.log(testPlusValue);
			$(this).parent().parent().parent().parent().parent().find('.testValue').val(testPlusValue);
			}
		}else if(testNote !== '') {
			var testPlusValue = parseInt(testValue) - parseInt(testNote);
			if(testPlusValue >= 0){
			console.log(testPlusValue);
			$(this).parent().parent().parent().parent().parent().find('.testValue').val(testPlusValue);
			$(this).parent().parent().parent().find('.testNote').val('');
			} else {
				alert('수량변경의 값은 수량의 값보다 크게 입력하실 수 없습니다.');
				$(this).parent().parent().parent().find('.testNote').val('');
				$(this).parent().parent().parent().find('.testNote').focus();
			}
		}
		var testPrice = $(this).parent().parent().parent().parent().parent().find('.testPrice').val();
		console.log(testPrice);
		var testValuePrice = parseInt(testPrice) * parseInt(testPlusValue);
		console.log(testValuePrice);
		$(this).parent().parent().parent().parent().parent().find('.testTotalPrice').val(testValuePrice);
	});
/* 	//카테고리 셀렉트 카테고리 글씨 삭제
 	$(document).on('click','.select',function(){
 		$(this).find('.option').remove();
 		console.log('삭제완료');
 	}); */
	// 총단가 구하기
	$(document).on('focusout','.testPrice',function(){
		var testPrice = $(this).val();
		console.log(testPrice);
		var testValue3 = $(this).parent().parent().parent().find('.testValue').val();
		console.log(testValue3);
		var testValuePrice = parseInt(testPrice) * parseInt(testValue3);
		console.log(testValuePrice);
		$(this).parent().parent().parent().find('.testTotalPrice').val(testValuePrice);
	});
	// 비품 한줄 저장
 	$(document).on('click','.save',function(){
 		var selectValue = $(this).parent().parent().find('.boardCategoryNo').val();
 		var priceValue = $(this).parent().parent().find('.testTotalPrice').val();
 		console.log(selectValue);
 		if(selectValue == 0) {
 			alert('카테고리를 선택해주세요.');
 			$(this).parent().parent().find('.search-panel').focus();
 		}else if(priceValue == '') {
 			alert('총단가의 가격이 없습니다.');
 			$(this).parent().parent().find('.testPrice').focus();
 		}
 		var params = $(this).parent().parent().find('.testForm').serialize();
 		console.log(params);
 	    jQuery.ajax({
 	        url: '${pageContext.request.contextPath}/testSave',
 	        type: 'POST',
 	        data:params,
 	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
 	        dataType: 'html',
 	        success: function (result) {
 	            if (result == 1){
 	                console.log('데이터 보내기 성공');
 	                alert('저장되었습니다.');
 	            }else{
 	            	alert('저장에 실패하였습니다.');
 	            }
 	        }
 	    });
 	});
/* 	//비품 리스트 호출하기
 	$(document).ready(function(){
 	    jQuery.ajax({
 	        url: '${pageContext.request.contextPath}/testSave',
 	        type: 'POST',
 	        data:params,
 	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
 	        dataType: 'html',
 	        success: function (result) {
 	            if (result == 1){
 	                console.log('데이터 보내기 성공');
 	                alert('저장되었습니다.');
 	            }else{
 	            	alert('저장에 실패하였습니다.');
 	            }
 	        }
 	    });
 	}); */
 		/*$(document).on('','',function(){}); asdf*/
</script>

<input class="btn btn-default dropdown-toggle" id="button" type="button" value="비품추가"/>

<table id="table">
	<thead>
		<tr>
			<td>카테고리</td>
			<td>품명</td>
			<td>수량</td>
			<td>수량변경</td>
			<td>개당단가</td>
			<td>총단가</td>
			<td>구입처</td>
			<td>보관상태</td>
			<td>저장</td>
		</tr>
	</thead>
	<tbody>  
 		<c:forEach var="plusMinus" items="${plusMinus}">
			<tr class="row">
				<td>
				<div class="col-sm-1">
				<form class="testForm">
<%-- 					<div class="input-group-btn search-panel">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:100px;">
							<span id="category">카테고리 </span><span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="a" items="${getCategory}">
								<li><a href="${a.categoryNo}">${a.categoryName}</a></li>
							</c:forEach>
						</ul>
					</div> --%>
					<c:forEach var="a" items="${getCategory}">
					<c:if test="${a.categoryNo == plusMinus.categoryNo}">
					<input type="text" name="testCategoryNo" value="${a.categoryName}" class="form-control" readonly/>
					
					<input type="hidden" name="boardCategoryNo" value="0" class="boardCategoryNo" readonly>  <!-- 카테고리 들고갈 input -->
					</c:if>
					</c:forEach>
<!-- 					<select class="form-control select" name="equipmentCategorySelect">
						<option class="option">카테고리<span class="caret"></span></option>
						<option value="1">교재,교구</option>
						<option value="2">사무용품</option>
						<option value="3">체육용품</option>
						<option value="4">도서목록</option>
						<option value="5">기타</option>
					</select> -->
				</form>
				</div>
				</td>
				<td>
				<div class="col-sm-2">
				<form class="testForm">
					<input class="form-control test1" name="test1" type="text" style="width : 400px" value="${plusMinus.equipmentName}" readonly/>
				</form>
				</div>
				</td>
				<td>
				<div class="col-sm-1">
				<form class="testForm">
					<input class="form-control testValue" name="testValue" type="text" style="width : 100px" value="${plusMinus.PLUS - plusMinus.MINUS}" readonly/>
				</form>
				</div>
				</td>
				<td>
				<div class="col-sm-1">
				<form class="testForm">
					<input type="hidden" class="updatePlusInput form-control" name="updatePlusInput"/>
					<input type="hidden" class="updateMinusInput form-control" name="updateMinusInput"/>
					<input type="button" class="updatePlus" style="width:33px; height:33px;" value="+"/>
					<input type="button" class="updateMinus" style="width:33px; height:33px;" value="-"/>
				</form>
				</div>
				</td>
				<td>
				<div class="col-sm-1">
				<form class="testForm">
					<input class="form-control testPrice" name="testPrice" type="text" style="width : 100px" value="${plusMinus.equipmentCost}"/>
				</form>
				</div>
				</td>
				<td>
				<div class="col-sm-1">
				<form class="testForm">
					<input class="form-control testTotalPrice" name="testTotalPrice" type="text" style="width : 100px" readonly/>
				</form>
				</div>
				</td>
				<td>
				<div class="col-sm-2">
				<form class="testForm">
					<input class="form-control testCustomer" name="testCustomer" type="text" style="width : 100px" value="${plusMinus.equipmentCustomer}" readonly/>
				</form>
				</div>
				</td>
				<td>
				<div class="col-sm-2">
				<form class="testForm">
					<input class="form-control testState" name="testState" type="text" style="width : 200px" value="${plusMinus.equipmentState}" readonly/>
				</form>
				</div>
				</td>
				<td>
				<div class="col-sm-1">
					<input type="button" class="btn btn-default dropdown-toggle save" value="추가"/>
				</div>
				</td>
				
			</tr>
 		</c:forEach>
	</tbody>
</table>
<!-- Plus Math icon by Icons8 -->


<table id="copyTargetTable" style="display:none">
		<tr>
			<td>	
				<form class="testForm">
					<div class="input-group-btn search-panel">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:100px;">
							<span id="category">카테고리 </span><span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="a" items="${getCategory}">
								<li><a id="test_romi" href="${a.categoryNo}">${a.categoryName}</a></li>
							</c:forEach>
						</ul>
					</div>
					<input type="hidden" name="boardCategoryNo" value="0" class="boardCategoryNo" readonly>  <!-- 카테고리 들고갈 input -->
<!-- 				<select class="form-control select" name="equipmentCategorySelect">
					<option class="option">카테고리<span class="caret"></span></option>
					<option value="1">교재,교구</option>
					<option value="2">사무용품</option>
					<option value="3">체육용품</option>
					<option value="4">도서목록</option>
					<option value="5">기타</option>
				</select> -->
			</form>
			</td>
			<td>
			<form class="testForm">
				<input class="form-control test1" name="test1" type="text" style="width : 400px" value="test" readonly/>
			</form>
			</td>
			<td>
			<form class="testForm">
				<input class="form-control testValue" name="testValue" type="text" style="width : 100px" value="0" readonly/>
			</form>
			</td>
			<td>
			<form class="testForm">
				<div class="form-inline">
					<div class="form-group">
						<input  class="form-control testNote" name="testNote" type="text" style="width : 50px"/>
					</div>
					<div class="form-group">
						<input type="button" class="plus" style="width:33px; height:33px;" value="+"/>
						<input type="button" class="minus" style="width:33px; height:33px;" value="-"/>
					</div>
				</div>
			</form>
			</td>
			<td>
			<form class="testForm">
				<input class="form-control testPrice" name="testPrice" type="text" style="width : 100px" value="0"/>
			</form>
			</td>
			<td>
			<form class="testForm">
				<input class="form-control testTotalPrice" name="testTotalPrice" type="text" style="width : 100px" readonly/>
			</form>
			</td>
			<td>
			<form class="testForm">
				<input class="form-control testCustomer" name="testCustomer" type="text" style="width : 100px" readonly/>
			</form>
			</td>
			<td>
			<form class="testForm">
				<input class="form-control testState" name="testState" type="text" style="width : 200px" readonly/>
			</form>
			</td>
			<td>
				<input type="button" class="btn btn-default dropdown-toggle save" value="저장"/>
			</td>
		</tr>
</table>
<!-- select button -->
<script>
	//$(document).ready(function(e){
		$(document).on('click','.search-panel .dropdown-menu a',function(e){
	   // $('.search-panel .dropdown-menu').find('a').click(function(e) {
		/* 	 alert('romi'); */
		   e.preventDefault(); 
			//alert(this);
			var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
			var category = $(this).text(); //해당 버튼의 내용
			$(this).parent().parent().parent().parent().parent().find('.search-panel span#category').text(category); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
			$(this).parent().parent().parent().parent().parent().find('.boardCategoryNo').val(param);
		});
	//});
</script>