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
	
	<!-- 달력 css -->
	<link rel="stylesheet" type="text/css" href="css/KHS/Calendar.css" />
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700">
	
	
	<style type="text/css">
		h6 {
			color : black;
		}
	</style>
	
	<script>
	
		var showCommuteCheck = function(month){
			var getCommute = [];
			$.ajax({
				url : "${pageContext.request.contextPath}/showCommuteCheck?month="+month,
				type : 'GET',
				dataType: 'JSON',
				async: false,
				success : function(data){
					console.log(data+":data")
					getCommute = data;
			},error: function(XMLHttpRequest, textStatus, errorThrown) { 
				console.log("XMLHttpRequest" + XMLHttpRequest);
			    console.log("Status: " + textStatus);
			    console.log('errorThrown: ' + errorThrown);
			},timeout: 3000
			});	

			for(i=0; i<getCommute.length; i++){
				console.log(getCommute[i]);
				
				var commuteDay = getCommute[i].attendanceDay;
				var absenceNo = getCommute[i].absenceNo;
				commuteDay = commuteDay.substring(8,10);
				
				if(commuteDay.substring(0,1) == '0'){
					commuteDay = commuteDay.substring(1,2);
				}
				
				console.log(commuteDay);
				
				$('#'+commuteDay).css('border','2px solid green');
				
				if(absenceNo != "null"){ //외출이 있는 경우
					$('#'+commuteDay).css('border','2px solid orange');
				}
				
			}
			
		};
	
		$(document).ready(function(e){
			
			//사이드바 active속성 주기
		    setSidenavActive(2);
			
		    var date = new Date();
		    var nowMonth = date.getMonth()+1; //현재의 월, 0부터 시작하니 +1
		    
		    drawCarendar(nowMonth);
		    showCommuteCheck(nowMonth);
		    
		    $('#otherMonth').click(function(){
		    	
		    	if(nowMonth > 1){
		    		drawCarendar(--nowMonth);
				    showCommuteCheck(nowMonth);
		    		console.log(nowMonth);
		    	}
		    	
		    });
		    
		    $('#nextMonth').click(function(){

		    	if(nowMonth < 12){
		    		drawCarendar(++nowMonth);
				    showCommuteCheck(nowMonth);
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
					<div class="text-center"><h1 id="calTitle">월별 출석 현황</h1></div>
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