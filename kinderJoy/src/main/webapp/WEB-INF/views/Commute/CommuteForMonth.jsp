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
	
		var drawCarendar = function(month){
			
			var date = new Date();
		    var nowYear = date.getFullYear(); //현재의 년
		    var nowMonth = month; //현재의 월, 0부터 시작하니 +1

// 		    var nowMonth = date.getMonth()+1; //현재의 월, 0부터 시작하니 +1
		    var nowDate = date.getDate(); //오늘 날짜
		    
		    var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');

		    var otherLastDay = ( new Date( nowYear, nowMonth-1, 0) ).getDate(); //저번달 마지막 날짜
		    var nowLastDay = ( new Date( nowYear, nowMonth, 0) ).getDate(); //이번달 마지막 날짜
		    var nowDay = ( new Date( nowYear, nowMonth-1, 1) ).getDay(); //이번달1일의 요일
		    
		    var lastWeek = Math.ceil( (nowLastDay+nowDay)/7 ); //이번달주수
		    
		    var otherDay = otherLastDay - nowDay+1 //달력에 표시할 저번달의 시작날짜
		    
		    
		    $('h2').html(nowMonth+' 월');
		    
		    // 요일 입력
		    $('#week').html('');
		    for(i=0; i<week.length; i++){
		    	var inputHtml = "<td>";
		    	if(i == 0){ //일요일
		    		inputHtml = "<td style='color:red'>";
		    	}else if(i == 6){ //토요일
		    		inputHtml = "<td style='color:blue'>";	
		    	}
		    	inputHtml += week[i] +"</td>";
		    	$('#week').append(inputHtml);
		    }
		    
		    // 날짜 입력
		    var dayCount = 1;
		    var nextCount = 1;
		    $('#day').html('');
		    for(i=0; i<lastWeek; i++){
		    	var inputHtml = "<tr>";
		    	for(j=0; j<7; j++){
		    		
		    		if(otherDay <= otherLastDay){
		    			inputHtml += "<td class='prev-month'>" + otherDay++ + "</td>";
		    		}else if(dayCount <= nowLastDay){
		    			if(j==0){ //일요일
		    				inputHtml += "<td style='color:red' id='"+ dayCount +"'>" + dayCount++ + "</td>";
		    			}else if(j==6){ //토요일
		    				inputHtml += "<td style='color:blue' id='"+ dayCount +"'>" + dayCount++ + "</td>";		    				
		    			}else{
			    			inputHtml += "<td id='"+ dayCount +"'>" + dayCount++ + "</td>";
		    			}
		    		}else{
		    			inputHtml += "<td class='next-month'>" + nextCount++ + "</td>";
		    		}
		    		
		    	}
		    	inputHtml += "</tr>"
				$('#day').append(inputHtml);
		    }
		    
		    $('#'+nowDate).attr('class','current-day'); //오늘날짜 표시
			
		}
	
	
		$(document).ready(function(e){
			
			//사이드바 active속성 주기
		    setSidenavActive(2);
			
			
		    var date = new Date();
		    var nowMonth = date.getMonth()+1; //현재의 월, 0부터 시작하니 +1
		    
		    drawCarendar(nowMonth);
		    
		    $('#otherMonth').click(function(){
		    	
		    	if(nowMonth > 0){
		    		drawCarendar(--nowMonth);
		    		console.log(nowMonth);
		    	}
		    	
		    });
		    
		    $('#nextMonth').click(function(){

		    	if(nowMonth < 11){
		    		drawCarendar(++nowMonth);
		    		console.log(nowMonth);
		    	}
		    	
		    });
		    
		    
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
							<a class="btn-prev fontawesome-angle-left" id="otherMonth" href="#"></a>
							<a class="btn-next fontawesome-angle-right" id="nextMonth" href="#"></a>
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