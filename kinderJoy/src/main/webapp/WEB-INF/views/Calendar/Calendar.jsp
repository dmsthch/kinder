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
			$('#opneModal').trigger('click');
			//var title = prompt('Event Title:');
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
		//기존에 있는것에 카테고리를 추가하여, 카테고리별로 다른색을 나타내도록 함!
		events: [
 		<c:forEach items="${allSchedule}" var="allSchedule">
				{id : ${allSchedule.scheduleNo} , title : '${allSchedule.scheduleTitle}' , start : '${allSchedule.scheduleStartDay}', end : '${allSchedule.scheduleEndDay}', scheduleCategory : '${allSchedule.categoryNo}' , url : 'asdf'} ,
		</c:forEach> 
	/* 		{id : 2 ,title : '테스트제목2' , start : '2017-05-01', end : '2017-05-05' } ,
			{id : 3 ,title : '테스트22' , start : '2017-05-01', end : '2017-05-01' } , */
/* 			{title : 'asdftest', start : '20170501', end : '20170501' },
			{id: 999, title: 'Repeating Event', start: '2017-04-09T16:00:00'} */
			
		
		]
	});
	
		
	//모달창열기!!!!!!!!!!!!!!
	$('.callModal').click(function(){
		
		//id로 하면 일정이 일주일을 넘어서 다른줄로 넘어갈때 각 개체마다 id를 부여해버려서 안됨.
		//그래서 scheduleNo를 클래스로 넣어버렸음. schedule_no_숫자  이렇게!
		//그걸 가져와야함.
		//일단 클릭한것의 class들을 다 가져옴
		var getClass = $(this).attr('class');
		console.log(getClass);
		
		//그리고 띄어쓰기 단위 기준으로 자름
		var getClassArray = getClass.split(' ');
		console.log(getClassArray);
		
		var resultIndex;
		//for문으로 돌리면서  schedule의 위치가 0인곳(딱맞는곳)의 i를 가져옴
		for(i=0; i<getClassArray.length; i++){
			if(getClassArray[i].indexOf('schedule') == 0){
				resultIndex = i;
			}
		}
		
		//resultIndex의 값이 undefined가 아닐때.
		if(resultIndex != undefined){
			console.log(getClassArray[resultIndex]);
			//배열의 i번째 값을 가져옴
			var getValue = getClassArray[resultIndex];
			//값을 가져온것에서 아이디값만 남기고 자름.
			var getScheduleNo = getValue.substring(getValue.length-1 , getValue.length);
			console.log('값은!! :'+getScheduleNo);
		}else{
			console.log('Not Found');
		}
		
		//ajax로 해당 일정 클릭하면 modal에 세부사항 표기해주기
		$.ajax({
	        url:"${pageContext.request.contextPath}/getScheduleContent",
	        type:'GET',
	        data: {"scheduleNo" : getScheduleNo},
	        dataType:'JSON',
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        success:function(data){
	            //alert("성공!")
	            //alert(data.scheduleContent);
	            $('.calendarModalTitle').text(data.scheduleTitle);
	            $('.calendarModalBody').html(' 내용 : '+data.scheduleContent+'<br/>');
	            $('.calendarModalBody').append(' 일시 : '+data.scheduleStartDay+" ~ "+data.scheduleEndDay);
	            $('.calendarModalFooter').html('<a href="${pageContext.request.contextPath}/deleteSchedule?scheduleNo='+data.scheduleNo+'"><button class="btn btn-default">삭제하기</button></a>');
	            $('#opneModal').trigger('click');
	            
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("실패" + textStatus + " : " + errorThrown);
	        }
		});
		
	})

	
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

	<!-- id calendar로  -->
	<div id='calendar' style="margin-top: 50px;"></div>
	
<%-- 	<c:if var="allSchedule" test="${allSchedule.category_no==1}">
		cat1[cat1Length] = 	${allSchedule.schedule_no}
		cat1Length++;
		console.log(cat1.length);
	</c:if> --%>
	
	

	<!-- 모달버튼! -->
<div style="display: none;">
	<button type="button" id="opneModal" class="btn btn-info btn-lg" data-toggle="modal" data-target="#calendarModal">Open Modal</button>
	<button type="button" id="opneAdd" class="btn btn-info btn-lg" data-toggle="modal" data-target="#calendarAdd">Open Modal</button>
</div>



	<!-- Modal -->
<div id="calendarModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content calendarModalContent">
      <div class="modal-header calendarModalHeader">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title calendarModalTitle"></h4>
      </div>
      <div class="modal-body calendarModalBody">
        modal
      </div>
      <div class="modal-footer calendarModalFooter">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

	<!-- Modal -->
<div id="calendarAdd" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content calendarModalContent">
      <div class="modal-header calendarModalHeader">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title calendarModalTitle"></h4>
      </div>
      <div class="modal-body calendarModalBody">
        modal
      </div>
      <div class="modal-footer calendarModalFooter">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


</body>
</html>