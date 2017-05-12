
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- script -->
<script>
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
	// 숫자 유효성 검사
	$(document).on('focusout','.testNote',function(){	
		var testNote2 = $(this).val();
		var testValue2 = $(this).parent().parent().parent().parent().find('.testValue').val();
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
		var testNote = $(this).parent().parent().find('.testNote').val();
		var testValue = $(this).parent().parent().parent().parent().find('.testValue').val();
		if(testNote == '') {
			var testPlusValue = parseInt(testValue) + parseInt(1);
			console.log(testPlusValue);
			$(this).parent().parent().parent().parent().find('.testValue').val(testPlusValue);
		}else if(testNote !== '') {
			var testPlusValue = parseInt(testValue) + parseInt(testNote);
			console.log(testPlusValue);
			$(this).parent().parent().parent().parent().find('.testValue').val(testPlusValue);
			$(this).parent().parent().find('.testNote').val('');
		}
		var testPrice = $(this).parent().parent().parent().parent().find('.testPrice').val();
		console.log(testPrice);
		var testValuePrice = parseInt(testPrice) * parseInt(testPlusValue);
		console.log(testValuePrice);
		$(this).parent().parent().parent().parent().find('.testTotalPrice').val(testValuePrice);
	});
	// 수량 빼기 및 수량 0미만 유효성 검사
	$(document).on('click','.minus',function(){
		var testNote = $(this).parent().parent().find('.testNote').val();
		var testValue = $(this).parent().parent().parent().parent().find('.testValue').val();
		if(testNote == '') {
			if(testValue == 0) {
				alert('수량의 값은 0 밑으로 입력하실 수 없습니다.');
			} else {
			var testPlusValue = parseInt(testValue) - parseInt(1);
			console.log(testPlusValue);
			$(this).parent().parent().parent().parent().find('.testValue').val(testPlusValue);
			}
		}else if(testNote !== '') {
			var testPlusValue = parseInt(testValue) - parseInt(testNote);
			if(testPlusValue >= 0){
			console.log(testPlusValue);
			$(this).parent().parent().parent().parent().find('.testValue').val(testPlusValue);
			$(this).parent().parent().find('.testNote').val('');
			} else {
				alert('수량변경의 값은 수량의 값보다 크게 입력하실 수 없습니다.');
				$(this).parent().parent().find('.testNote').val('');
				$(this).parent().parent().find('.testNote').focus();
			}
		}
		var testPrice = $(this).parent().parent().parent().parent().find('.testPrice').val();
		console.log(testPrice);
		var testValuePrice = parseInt(testPrice) * parseInt(testPlusValue);
		console.log(testValuePrice);
		$(this).parent().parent().parent().parent().find('.testTotalPrice').val(testValuePrice);
	});
	//카테고리 셀렉트 카테고리 글씨 삭제
 	$(document).on('click','.select',function(){
 		$(this).find('.option').remove();
 		console.log('삭제완료');
 	});
	// 총단가 구하기
	$(document).on('focusout','.testPrice',function(){
		var testPrice = $(this).val();
		console.log(testPrice);
		var testValue3 = $(this).parent().parent().find('.testValue').val();
		console.log(testValue3);
		var testValuePrice = parseInt(testPrice) * parseInt(testValue3);
		console.log(testValuePrice);
		$(this).parent().parent().find('.testTotalPrice').val(testValuePrice);
	});
	// 비품 한줄 저장
 	$(document).on('click','.save',function(){
 		var params = $(this).parent().parent().parent().find('.testForm').serialize();
 	    jQuery.ajax({
 	        url: '${pageContext.request.contextPath}/testSave',
 	        type: 'POST',
 	        data:params,
 	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
 	        dataType: 'html',
 	        success: function (result) {
 	            if (result){
 	                console.log('데이터 보내기 성공');
 	                console.log(result);
 	            }
 	        }
 	    });
 	});
 	/*	$(documnen).on('','',function(){});123112323
	$(document).on('','',function(){}); asdf*/
</script>

<input class="btn btn-default dropdown-toggle" id="button" type="button" value="추가"/>

<table id="table" border="1">
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
		<form class="testForm" method="psot">
			<tr>
				<td>	
<%-- 					<div class="input-group-btn search-panel">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							<span id="category">카테고리 </span><span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="a" items="${getCategory}">
								<li><a href="${a.categoryNo}">${a.categoryName}</a></li>
							</c:forEach>
						</ul>
					</div> --%>
					<select class="form-control select" name="equipmentCategorySelect">
						<option class="option">카테고리<span class="caret"></span></option>
						<option value="1">교재,교구</option>
						<option value="2">사무용품</option>
						<option value="3">체육용품</option>
						<option value="4">도서목록</option>
						<option value="5">기타</option>
					</select>
				</td>
				<td>
					<input class="form-control test1" name="test1" type="text" style="width : 400px" value="test" readonly/>
				</td>
				<td>
					<input class="form-control testValue" name="testValue" type="text" style="width : 100px" value="50" readonly/>
				</td>
				<td>
					<div class="form-inline">
						<div class="form-group">
							<input  class="form-control testNote" name="testNote" type="text" style="width : 50px"/>
						</div>
						<div class="form-group">
							<input type="button" class="plus" style="width:33px; height:33px" value="+"/>
							<input type="button" class="minus" style="width:33px; height:33px" value="-"/>
						</div>
					</div>
				</td>
				<td>
					<input class="form-control testPrice" name="testPrice" type="text" style="width : 100px" value="50"/>
				</td>
				<td>
					<input class="form-control testTotalPrice" name="testTotalPrice" type="text" style="width : 100px" readonly/>
				</td>
				<td>
					<input class="form-control testCustomer" name="testCustomer" type="text" style="width : 100px" value="집" readonly/>
				</td>
				<td>
					<input class="form-control testState" name="testState" type="text" style="width : 200px" value="집돌이" readonly/>
				</td>
				<td>
					<input type="button" class="btn btn-default dropdown-toggle save" value="저장"/>
				</td>
			</tr>
		</form>	
	</tbody>
</table>



<table id="copyTargetTable" style="display:none">
	<form class="testForm" method="psot">
		<tr>
			<td>	
<%-- 					<div class="input-group-btn search-panel">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							<span id="category">카테고리 </span><span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<c:forEach var="a" items="${getCategory}">
								<li><a href="${a.categoryNo}">${a.categoryName}</a></li>
							</c:forEach>
						</ul>
					</div> --%>
				<select class="form-control select" name="equipmentCategorySelect">
					<option class="option">카테고리<span class="caret"></span></option>
					<option value="1">교재,교구</option>
					<option value="2">사무용품</option>
					<option value="3">체육용품</option>
					<option value="4">도서목록</option>
					<option value="5">기타</option>
				</select>
			</td>
				<td>
				<input class="form-control test1" name="test1" type="text" style="width : 400px" value="test" readonly/>
			</td>
			<td>
				<input class="form-control testValue" name="testValue" type="text" style="width : 100px" value="50" readonly/>
			</td>
			<td>
				<div class="form-inline">
					<div class="form-group">
						<input  class="form-control testNote" name="testNote" type="text" style="width : 50px"/>
					</div>
					<div class="form-group">
						<input type="button" class="plus" style="width:33px; height:33px" value="+"/>
						<input type="button" class="minus" style="width:33px; height:33px" value="-"/>
					</div>
				</div>
			</td>
			<td>
				<input class="form-control testPrice" name="testPrice" type="text" style="width : 100px" value="50"/>
			</td>
			<td>
				<input class="form-control testTotalPrice" name="testTotalPrice" type="text" style="width : 100px" readonly/>
			</td>
			<td>
				
			</td>
			<td></td>
			<td>
				<input type="button" class="btn btn-default dropdown-toggle save" value="저장"/>
			</td>
		</tr>
	</form>	
</table>
