<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>

<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

<br><br><br><br><br><br><br>

<!-- script -->
<script>
	$(document).on('click','#button',function(){
			var getCopyObject = $('#copyTargetTable tbody').clone();			
			$('#table tbody').append(getCopyObject.html())
			console.log('성공');
			
/* 			$('#tr_clone').clone().insertAfter('#tr_clone')
			console.log('성공'); */
	})
	$(document).on('dblclick','.test1',function(){
		$('.test1').removeAttr('readonly');
	});
	$(document).on('focusout','.test1',function(){
		$('.test1').attr('readonly','readonly');
	});
	$(document).on('click','.plus',function(){
		console.log($('.testNote').val());
		if($('.testNote').val() == ''){
			var testvalue = $('.testValue').val();
			var testvalue2 = parseInt(testvalue) + parseInt(1);
			$('.testValue').val(testvalue2);
			console.log('완료');
		}else{
			console.log('실패');
		}
	});
	$(document).on('click','.minus',function(){
		console.log($('.testNote').val());
		if($('.testNote').val() == ''){
			var testvalue = $('.testValue').val();
			var testvalue2 = parseInt(testvalue) - parseInt(1);
			$('.testValue').val(testvalue2);
			console.log('완료');
		}else{
			console.log('실패');
		}
	});
/* 	$(document).on('','',function(){});
	$(document).on('','',function(){});
	$(documnen).on('','',function(){});123
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
			<td>저장</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>	
				<div class="input-group-btn search-panel">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<span id="category">카테고리 </span><span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<c:forEach var="a" items="${getCategory}">
							<li><a href="${a.categoryNo}">${a.categoryName}</a></li>
						</c:forEach>
					</ul>
				</div>
			</td>
			<td>
				<input class="form-control test1" type="text" style="width : 400px" value="test" readonly/>
			</td>
			<td>
				<input class="form-control testValue" type="text" style="width : 100px" value="50" readonly/>
			</td>
			<td>
				<div class="form-inline">
					<div class="form-group">
						<input  class="form-control testNote" type="text" style="width : 50px"/>
					</div>
					<div class="form-group">
						<button class="glyphicon glyphicon-plus plus" style="whdth:42px; height:33px"></button>
						<button class="glyphicon glyphicon-minus minus" style="whdth:42px; height:33px"></button>
					</div>
				</div>
			</td>
			<td>
				<button class="btn btn-default dropdown-toggle">저장</button>
			</td>
		</tr>
		
	</tbody>
</table>



<table id="copyTargetTable" style="display:none">
		<tr>
			<td>	
				<div class="input-group-btn search-panel">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<span id="category">카테고리 </span><span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<c:forEach var="a" items="${getCategory}">
							<li><a href="${a.categoryNo}">${a.categoryName}</a></li>
						</c:forEach>
					</ul>
				</div>
			</td>
			<td>
				<input class="form-control test1" type="text" style="width : 400px" value="test" readonly/>
			</td>
			<td>
				<input  class="form-control" type="text" style="width : 100px" value="50" readonly/>
			</td>
			<td>
				<div class="form-inline">
					<div class="form-group">
						<input  class="form-control" type="text" style="width : 50px"/>
					</div>
					<div class="form-group">
						<button class="glyphicon glyphicon-plus" style="whdth:42px; height:33px"></button>
						<button class="glyphicon glyphicon-minus" style="whdth:42px; height:33px"></button>
					</div>
				</div>
			</td>
			<td>
				<button class="btn btn-default dropdown-toggle">저장</button>
			</td>
		</tr>
</table>




<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>



</body>
</html>