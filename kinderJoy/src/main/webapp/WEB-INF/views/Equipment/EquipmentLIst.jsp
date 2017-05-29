
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- script -->
<script>

	$(document).ready(function(){
		$('#equipmentListNav').attr('class','active');
	})

	// TR태그 복사하기
	$(document).on('click','#button',function(){
			var getCopyObject = $('#sub').clone();			
			$('#main').append(getCopyObject.html())
			console.log('성공');//asdf
	});
	// 품명 더블클릭으로 readonly 해제
	$(document).on('dblclick','.equipmentName',function(){
		$(this).removeAttr('readonly');
	});
	// 품명 포커스아웃으로 readonly 생성
	$(document).on('focusout','.equipmentName',function(){
		$(this).attr('readonly','readonly');
	});
	// 구입처 더블클릭으로 readonly 해제
	$(document).on('dblclick','.equipmentCustomer',function(){
		$(this).removeAttr('readonly');
	});
	// 구입처 포커스아웃으로 readonly 생성
	$(document).on('focusout','.equipmentCustomer',function(){
		$(this).attr('readonly','readonly');
	});
	// 보관상태 더블클릭으로 readonly 해제
	$(document).on('dblclick','.equipmentState',function(){
		$(this).removeAttr('readonly');
	});
	// 보관상태 포커스아웃으로 readonly 생성
	$(document).on('focusout','.equipmentState',function(){
		$(this).attr('readonly','readonly');
	});		
	//plus 버튼 누를 시 태그 plus, minus 태그 삭제하고 plus 네입값 입력된 인풋 추가
	$(document).on('click','.Plus',function(){
		var testInput = '<input type="text" name="updatePlusInput" class="form-control"/>'
		$(this).after(testInput);
		console.log('plus 추가');
		$(this).parent().find('.Minus').remove();
		$(this).parent().find('.Plus').remove();
	});
	//plus 버튼 누를 시 태그 plus, minus 태그 삭제하고 plus 네입값 입력된 인풋 추가
	$(document).on('click','.Minus',function(){
		var testInput = '<input type="text" name="updateMinusInput" class="form-control"/>'
		$(this).after(testInput);
		console.log('minus 추가');
		$(this).parent().find('.updatePlus').remove();
		$(this).parent().find('.updateMinus').remove();
	});
</script>
<style>
	div{
		text-align: center;
	}
	input{
		text-align: center;
	}
</style>
<input class="btn btn-default dropdown-toggle" id="button" type="button" value="비품추가"/>
<div class="row">
	<div class="col-sm-1">카테고리</div>
	<div class="col-sm-2">품명</div>
	<div class="col-sm-1">수량</div>
	<div class="col-sm-1">수량변경</div>
	<div class="col-sm-1">개당단가</div>
	<div class="col-sm-1">총단가</div>
	<div class="col-sm-2">구입처</div>
	<div class="col-sm-2">보관상태</div>
	<div class="col-sm-1">저장</div>
</div>
<div id="main">
	<c:forEach var="plusMinus" items="${plusMinus}">
		<div class="row main">
			<form class="testForm">
				<div class="col-sm-1">
					<c:forEach var="a" items="${getCategory}">
						<c:if test="${a.categoryNo == plusMinus.categoryNo}">
							<input type="text" name="testCategoryNo" value="${a.categoryName}" class="form-control" readonly/>
							<input type="hidden" name="boardCategoryNo" value="${a.categoryName}" class="boardCategoryNo" readonly>  <!-- 카테고리 들고갈 input -->
						</c:if>
					</c:forEach>
				</div>
				<div class="col-sm-2">
					<input class="form-control equipmentName" name="equipmentName" type="text" value="${plusMinus.equipmentName}" readonly/>
				</div>
				<div class="col-sm-1">
					<input class="form-control equipmentAmout" name="equipmentAmout" type="text" value="${plusMinus.PLUS - plusMinus.MINUS}" readonly/>
				</div>
				<div class="col-sm-1">
					<input type="hidden" class="updatePlusInput form-control" name="updateInput"/>
					<input type="button" class="updatePlus plus" value="+"/>
					<input type="button" class="updateMinus minus" value="-"/>
				</div>
				<div class="col-sm-1">
					<input class="form-control equipmentPrice" name="equipmentPrice" type="text" value="${plusMinus.equipmentCost}"/>
				</div>
				<div class="col-sm-1">
					<input class="form-control equipmentTotalPrice" name="equipmentTotalPrice" type="text" value="${(plusMinus.PLUS - plusMinus.MINUS)*plusMinus.equipmentCost}" readonly/>
				</div>
				<div class="col-sm-2">
					<input class="form-control equipmentCustomer" name="equipmentCustomer" type="text" value="${plusMinus.equipmentCustomer}" readonly/>
				</div>
				<div class="col-sm-2">
					<input class="form-control equipmentState" name="equipmentState" type="text" value="${plusMinus.equipmentState}" readonly/>
				</div>
				<div class="col-sm-1">
					<input type="button" class="btn btn-default dropdown-toggle save" value="추가"/>
				</div>
			</form>
		</div>
	</c:forEach>
</div>
<div id="sub" style="display:none;">
	<div class="row sub">
		<form class="testForm">
			<div class="col-sm-1">
				<input type="hidden" name="boardCategoryNo" value="0" class="boardCategoryNo" readonly>  <!-- 카테고리 들고갈 input -->
				<div class="input-group-btn search-panel">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<span id="category">카테고리 </span><span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<c:forEach var="a" items="${getCategory}">
							<li><a id="test_romi" href="${a.categoryNo}">${a.categoryName}</a></li>
						</c:forEach>
					</ul>				
				</div>
			</div>
			<div class="col-sm-2">
				<input class="form-control equipmentName" name="equipmentName" type="text" readonly/>
			</div>
			<div class="col-sm-1">
				<input class="form-control equipmentAmout" name="equipmentAmout" type="text" value="0" readonly/>
			</div>
			<div class="col-sm-1">
				<input type="hidden" class="updatePlusInput form-control" name="updateInput"/>
				<input type="button" class="updatePlus plus" style="width:33px; height:33px;" value="+"/>
				<input type="button" class="updateMinus minus" style="width:33px; height:33px;" value="-"/>
			</div>
			<div class="col-sm-1">
				<input class="form-control equipmentPrice" name="equipmentPrice" value="0" type="text"/>
			</div>
			<div class="col-sm-1">
				<input class="form-control testTotalPrice" name="testTotalPrice" type="text" readonly/>
			</div>
			<div class="col-sm-2">
				<input class="form-control equipmentTotalPrice" name="equipmentTotalPrice" type="text" readonly/>
			</div>
			<div class="col-sm-2">
				<input class="form-control equipmentState" name="equipmentState" type="text" readonly/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-default dropdown-toggle save" value="추가"/>
			</div>
		</form>
	</div>
</div>
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
			$(this).parent().parent().parent().parent().parent().parent().find('.search-panel span#category').text(category); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
			$(this).parent().parent().parent().parent().parent().parent().find('.boardCategoryNo').val(param);
		});
	//});
</script>