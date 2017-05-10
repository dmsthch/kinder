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

</script>
<input id="button" type="button" value="추가"/>
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
				<select>
					<option>교재, 교구</option>
					<option>사무용품</option>
					<option>체육용품</option>
					<option>도서목록</option>
					<option>기타</option>
				</select>
			</td>
			<td>
				<input class="test1" type="text" readonly/>
			</td>
			<td>
				<input type="text" readonly/>
			</td>
			<td>
				<span><input type="text"/></span>
				<button><span class="glyphicon glyphicon-plus"></span></button>
				<button><span class="glyphicon glyphicon-minus"></span></button>
			</td>
			<td>
				<button>저장</button>
			</td>

		</tr>
		
	</tbody>
</table>



<table id="copyTargetTable" style="display:none">
	<tr>
		<td>	
			<select>
				<option>교재, 교구</option>
				<option>사무용품</option>
				<option>체육용품</option>
				<option>도서목록</option>
				<option>기타</option>
			</select>
		</td>
		<td>
			<input id="test1" type="text" readonly/>
		</td>
		<td>
			<input type="text" readonly/>
		</td>
		<td>
			<span><input type="text"/></span>
			<button><span class="glyphicon glyphicon-plus"></span></button>
			<button><span class="glyphicon glyphicon-minus"></span></button>
		</td>
		<td>
			<button>저장</button>
		</td>
	</tr>
</table>
<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>



</body>
</html>