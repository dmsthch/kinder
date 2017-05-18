<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="../module/importJS.jsp"></c:import>
	
	<script src="js/KHS/hsCustom.js"></script>

	<style type="text/css">
		h6 {
			color : black;
		}
	</style>
	
	<script>
		$(document).ready(function(e){
			
			//검색창에서 카테고리 버튼
		    $('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
				var concept = $(this).text(); //해당 버튼의 내용
				
				$('.search-panel span#search_concept').text(concept); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
				$('.input-group #search_param').val(param);
			});
			
			//사이드바 active속성 주기
		    setSidenavActive(4);
		    
		    
		});
	</script>
	
</head>

<body class="container-fluid">


<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>


<div class="wrapper">
	
	<!-- sideNav -->
    <c:import url="../module/KHS/CommuteSideNav.jsp"></c:import>

    <div class="main-panel">
		<div class="content">
			<div class="container-fluid">
			
				<div class="row">
					<div class="text-center"><h1>출석 현황</h1></div>
				</div><br/>
				
				<div class="row">
					
				
				</div>							
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>