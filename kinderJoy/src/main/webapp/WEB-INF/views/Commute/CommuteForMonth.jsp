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
	
	<!-- sidevar 색칠하기 -->
	<script src="js/KHS/hsCustom.js"></script>
	
	<!-- 달력 css -->
	<link rel="stylesheet" type="text/css" href="css/KHS/Calendar.css" />
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700">
	
	
	<style type="text/css">
		h6 {
			color : black;
		}
	</style>
	
	<script>
		$(document).ready(function(e){
			
			//사이드바 active속성 주기
		    setSidenavActive(2);
			
		    var date = new Date();
		    var nowYear = date.getFullYear(); //현재의 년
		    var nowMonth = date.getMonth()+1; //현재의 월, 0부터 시작하니 +1
		    var nowDate = date.getDate(); //오늘 날짜
		    
		    var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');

		    var otherLastDay = ( new Date( nowYear, nowMonth-1, 0) ).getDate(); //저번달 마지막 날짜
		    var nowLastDay = ( new Date( nowYear, nowMonth, 0) ).getDate(); //이번달 마지막 날짜
		    var nowDay = ( new Date( nowYear, nowMonth-1, 1) ).getDay(); //이번달1일의 요일
		    
		    var lastWeek = Math.ceil( (nowLastDay+nowDay)/7 ); //이번달 주 수
		    
		    var otherDay = otherLastDay - nowDay //달력에 표시할 저번달의 시작날짜
		    
		    // 요일 입력
		    for(i=0; i<week.length; i++){
		    	var inputHtml = "<td>"+ week[i] +"</td>";
		    	$('#week').append(inputHtml);
		    }
		    
		    var dayCount = 1;
		    for(i=0; i<lastWeek; i++){
		    	
		    	var inputHtml = "<tr id='"+ i +"'>";
		    	
		    	for(j=0; j<7; j++){
		    		
		    		if(otherDay <= otherLastDay){
		    			inputHtml += "<td>" + otherDay++ + "</td>";
		    		}else if(dayCount <= nowLastDay){
		    			inputHtml += "<td>" + dayCount++ + "</td>";
		    		}
		    		
		    	}
		    	
		    	inputHtml += "</tr>"
		    	console.log(inputHtml); 
		    	
		    }
		    
		    console.log(nowYear + "이번 년");
		    console.log(nowMonth + "이번 달");
		    console.log(nowDate + "오늘 날짜");
		    console.log(otherLastDay + "저번달 마지막 날짜");
		    console.log(nowLastDay + "이번달 마지막 날짜");
		    console.log(nowDay + "이번달 1일 요일");
		    console.log(week[nowDay] + ":요일");
		    console.log(lastWeek + "주 수");
		    
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
					<div class="text-center"><h1>월별 출석 현황</h1></div>
				</div><br/>
				
				<div class="row">
					<div class="calendar col-sm-12">
						<header>		
							<h2>September</h2>
							<a class="btn-prev fontawesome-angle-left" href="#"></a>
							<a class="btn-next fontawesome-angle-right" href="#"></a>
						</header>
						<table>
							<thead>
								<tr id="week">
								
								</tr>
							</thead>
			
							<tbody id="day">
								
							</tbody>
						</table>
					</div> <!-- end calendar -->
				</div> <!-- end container -->
							
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>