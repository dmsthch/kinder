<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/LCR/Calendar/fullcalendar.min.css" rel="stylesheet" />
<link href="css/LCR/Calendar/fullcalendar.print.min.css" rel="stylesheet" media="print" />
<script src="js/LCR/Calendar/lib/moment.min.js"></script>
<script src="js/LCR/Calendar/lib/jquery.min.js"></script>
<script src="js/LCR/Calendar/fullcalendar.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var allSchedule = new Array();
	allSchedule = ${allSchedule};
	console.log(allSchedule);
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},

		defaultDate: '2017-04-12',
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectHelper: true,
		select: function(start, end) {
			var title = prompt('Event Title:');
			var eventData;
			if (title) {
				eventData = {
					title: title,
					start: start,
					end: end
				};
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			}
			$('#calendar').fullCalendar('unselect');
		},
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		
		//이부분이 데이터 표시해주는 부분.
		events: [
			/* $(allSchedule).each(function(){
				{id : ${schedule_no}, title : ${schedule_title}, start : ${schedule_start_day}, end :${schedule_end_day} }
			}) */
			
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
<body>
calendarTest
	<div id='calendar'></div>
	<div id='getCalendarTest'>
	<c:forEach items="${allSchedule}" var="allSchedule">
	id : ${allSchedule.schedule_no}
	</c:forEach>
	</div>
</body>
</html>