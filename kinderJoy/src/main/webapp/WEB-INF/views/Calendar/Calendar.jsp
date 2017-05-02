<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="../module/importJS.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/LCR/Calendar/fullcalendar.css" rel="stylesheet" />
<link href="css/LCR/Calendar/fullcalendar.print.min.css" rel="stylesheet" media="print" />
<script src="js/LCR/Calendar/lib/moment.min.js"></script>
<script src="js/LCR/Calendar/lib/jquery.min.js"></script>
<script src="js/LCR/Calendar/fullcalendar2.js"></script>



<script type="text/javascript">
$(document).ready(function() {
		$('#calendar').fullCalendar({
		//맨위에 나오는것들. 왼쪽에는 달 앞뒤로 넘기는거랑 오늘로가기,
		//가운데는 제목, 오른쪽에는 달, 주, 일별로 보기
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		//일이나 주 이름을 클릭해서 탐색할수있다. 
		navLinks: true,
		//드래그해서 선택가능하게하는것
		selectable: true,
		
		//드래그해서 선택했을때 나오는것
		select: function(start, end) {
			var title = prompt('Event Title:');
			var eventData;
			if (title) {
				eventData = {
					title: title,
					start: start,
					end: end
				};
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick이 뭐지?
			}
			$('#calendar').fullCalendar('unselect');
		},
		
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		//이부분이 데이터 표시해주는 부분.
		events: [
 		<c:forEach items="${allSchedule}" var="allSchedule">
				{id : ${allSchedule.schedule_no} ,title : '${allSchedule.schedule_title}' , start : '${allSchedule.schedule_start_day}', end : '${allSchedule.schedule_end_day}', cateTest : '${allSchedule.category_no}' } ,
		</c:forEach> 
	/* 		{id : 2 ,title : '테스트제목2' , start : '2017-05-01', end : '2017-05-05' } ,
			{id : 3 ,title : '테스트22' , start : '2017-05-01', end : '2017-05-01' } , */
/* 			{title : 'asdftest', start : '20170501', end : '20170501' },
			{id: 999, title: 'Repeating Event', start: '2017-04-09T16:00:00'} */
			
		
		]
	});
	

	
});

</script>
<title>Insert title here</title>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body >
<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

	<!-- id를 calendar로 해줘야함! -->
	<div id='calendar' style="margin-top: 50px;"></div>
	
<%-- 	<c:if var="allSchedule" test="${allSchedule.category_no==1}">
		cat1[cat1Length] = 	${allSchedule.schedule_no}
		cat1Length++;
		console.log(cat1.length);
	</c:if> --%>
</body>
</html>