//사이드바 active 속성 주기
var setSidenavActive = function(index){
	$('.sidebar-wrapper').find('li').removeAttr('class','active');
    $('.sidebar-wrapper').find('li').eq(index).attr('class','active');
}


//달력
var drawCarendar = function(month){
	
	var date = new Date();
    var nowYear = date.getFullYear(); //현재의 년
    var nowMonth = month; //현재의 월, 0부터 시작하니 +1

//	    var nowMonth = date.getMonth()+1; //현재의 월, 0부터 시작하니 +1
    var nowDate = date.getDate(); //오늘 날짜
    
    var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');

    var otherLastDay = ( new Date( nowYear, nowMonth-1, 0) ).getDate(); //저번달 마지막 날짜
    var nowLastDay = ( new Date( nowYear, nowMonth, 0) ).getDate(); //이번달 마지막 날짜
    var nowDay = ( new Date( nowYear, nowMonth-1, 1) ).getDay(); //이번달1일의 요일
  	
    //이번달주수
    var lastWeek = Math.ceil( (nowLastDay+nowDay)/7 );
    
    var otherDay = otherLastDay - nowDay+1 //달력에 표시할 저번달의 시작날짜
    
    $('#calTitle').html(nowMonth+'월 출석 현황');
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
	    			inputHtml += "<td id='"+ dayCount +"' class='commuteDay'>" + dayCount++ + "</td>";
    			}
    		}else{
    			inputHtml += "<td class='next-month'>" + nextCount++ + "</td>";
    		}
    	}
    	inputHtml += "</tr>"
		$('#day').append(inputHtml);
    }
//    $('#'+nowDate).attr('class','current-day'); //오늘날짜 표시
	
}