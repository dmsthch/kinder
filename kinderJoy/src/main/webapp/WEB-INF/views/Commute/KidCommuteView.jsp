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
	
		var getKidCommute = function(month, date){
			var getCommute = [];
			$.ajax({
				url : "${pageContext.request.contextPath}/getKidCommute?month="+month+"&date="+date,
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
			return getCommute;
		};
	
		$(document).ready(function(e){
			
			//사이드바 active속성 주기
		    setSidenavActive(3);
			
		    var date = new Date();
		    var nowMonth = date.getMonth()+1; //현재의 월, 0부터 시작하니 +1
		    		    
		    drawCarendar(nowMonth); //달력 보여주기
		    
		    $('#otherMonth').click(function(){ //전달
		    	if(nowMonth > 1){
		    		drawCarendar(--nowMonth);
		    		console.log(nowMonth);
		    	}
		    });
		    $('#nextMonth').click(function(){ //다음달
		    	if(nowMonth < 12){
		    		drawCarendar(++nowMonth);
		    		console.log(nowMonth);
		    	}
		    });
		    		    
		    $('.commuteDay').click(function(){
		    	var clickDate = $(this).attr('id');
		    	var getCommute = getKidCommute(nowMonth, clickDate);

		    	console.log(getCommute);
		    	
		    	var inputHtml = "";
		    	for(i=0; i<getCommute.length; i++){
		    		
		    		var addInputHtml = '<div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'">';
		    		addInputHtml += getCommute[i].kidName + '</a></h4></div><div id="collapse'+i+'" class="panel-collapse collapse in"><div class="panel-body">';
		    		
		    		addInputHtml += '<p style="font-size:20px;">출석 : ' + ((getCommute[i].Attendance == 1) ? "O" : "X") + '</p>';
		    		addInputHtml += '<p style="font-size:20px;">특이사항 : ' + ((getCommute[i].AttendanceUnusual == 1) ? "O" : "X") +'</p>';
		    		
		    		addInputHtml += '</div></div></div>';
		    		inputHtml += addInputHtml;		    		
		    	}

	    		$('#accordion').append().html(inputHtml);
		    	
		    });

    		var nowDate = date.getDate();
    		$('#'+nowDate).click();
		    
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
					<div class="calendar col-sm-10">
					<div class="text-center"><h1 id="calTitle"></h1></div>
						<header>		
							<h2></h2>
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
					
					<div class="col-sm-2">
						<br/><br/><br/><br/><br/><br/>
						
						<div class="panel-group" id="accordion">
						
							
							
						</div> 
					</div>
					
				</div> <!-- end container -->
				
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>