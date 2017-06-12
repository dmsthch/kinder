<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Flatty Weather Report Responsive Widget Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Flatty Weather Report template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- //Custom Theme files -->
<!-- web font -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!-- //web font -->

<!-- js -->   
<script src="js/skycons.js"></script> <!-- skycons-icons -->
<script src="js/jquery-3.1.0.min.js"></script> 	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Custom Theme files -->
<link href="css/LCR/style.css" rel="stylesheet" type="text/css" media="all" /> 


<style>
.modal-title{ font-size: 25px;}

.modal-dialog{ width: 50% }

</style>  
</head>
<body>
	<!-- w3ls-weather -->
	<div class="w3ls-weather " style="margin-top: 80px;">
		
		<div class="w3ls-weather-agileinfo"> 
			<div class="weather-left">
				<div class="weather-left-text">
					
				</div>
				<ul class="report">
					
				</ul>
			</div>
			<div class="weather-right">
				<ul>
					<li>
						<a href="#" data-toggle="modal" data-target="#project">
							<img src="css/LCR/file.png">
							<h1 style="font-size: 20px;">프로젝트 소개</h1>
							<div class="clear"></div>
						</a>
					</li>
					
					<li>
						<a href="#" data-toggle="modal" data-target="#guide">
							<img src="css/LCR/idea.png">
							<h1 style="font-size: 20px;">사용 가이드 </h1>
							<div class="clear"></div>
						</a>
					</li>
					
					<li>
						<a href="#" data-toggle="modal" data-target="#teamInfo">
							<img src="css/LCR/users.png">
							<h1 style="font-size: 20px;">팀원 소개</h1>
							<div class="clear"></div>
						</a>
					</li>
					
				
					<li>
						<a href="${pageContext.request.contextPath}/goHome">
							<img src="css/LCR/play-button.png">
							<h1 style="font-size: 20px;">프로젝트 바로가기</h1>
							<div class="clear"></div>
						</a>
					</li>
				</ul>
				<script>
					 var icons = new Skycons({"color": "#fff"}),
						  list  = [
							"partly-cloudy-day"
						  ],
						  i;

					  for(i = list.length; i--; )
						icons.set(list[i], list[i]);
					  icons.play();
				</script>
				<script>
					 var icons = new Skycons({"color": "#fff"}),
						  list  = [
							"clear-night","partly-cloudy-night", "cloudy", "clear-day", "sleet", "snow", "wind","fog"
						  ],
						  i;

					  for(i = list.length; i--; ) 
						icons.set(list[i], list[i]);
					  icons.play();
				</script>
			</div>
			<div class="clear"></div>
		</div>  
	</div>	
	
	<!-- Modal -->
<div id="project" class="modal fade" role="dialog" >
  <div class="modal-dialog" > 
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title" >프로젝트 소개</h2> 
      </div>
      <div class="modal-body">
      		프로젝트 완료 보고서 다운로드하기<br>
      		프로젝트 깃 주소 : <a href="https://github.com/dmsthch/kinder">https://github.com/dmsthch/kinder</a><br/>
			프로젝트 명 : 교육부 지정 유아교육기관 평가 인증 대비 통합 관리 시스템<br/>
			목적 : 유아교육기관의 평가 인증 대비의 편의성<br/>
			프로젝트 진행 기간 : 2017.04 ~ 2017.06<br/>
			프로젝트 진행 인원 : 5명<br/>
			주요기능소개 : <br/>
			<hr>
			1. 근태관리 <br/>
			버튼 하나로 출근/외출/복귀등을 간편하게 할 수 있으며, 달력 형식으로 근태 현황을 한눈에 볼 수 있습니다. 
			<hr/>
			2. 일정관리 <br/>
			캘린더에서 드래그 형식으로 빠르고 간편하게 일정을 등록, 삭제할 수 있으며 색으로 기관일정과 개인일정을 구분할 수 있습니다.<br>
			<hr>
			3. 계획안 관리 <br/>
			스프레드 시트를 이용하여 다양한 계획안 양식을 직접 만들어 저장, 불러오기 할 수 있습니다. 일/주/월/년간 계획안을 구분지어 볼 수 있으며 반별로도 확인할 수 있습니다.<br>
			<hr>
			4. 유아 관리 <br/>
			유아정보를 등록하고 수정할 수 있으며 반 이름만 적으면 반 생성이 가능합니다. 또한 유아들의 반 편성또한 간편합니다.<br>
			유아 출석을 할 수 있으며 특이사항(예를들어 지각, 조퇴 등)이 있을 경우 따로 기입이 가능하며 캘린더 형식으로 출석 현황을 확인할 수 있습니다.<br>
			유아 발달 평가도 시스템화 되어있어 간편하게 저장하고 관리할 수 있습니다. 
			<hr>
			5. 비품 관리 <br/>
			비품의 수량, 단가, 구입처 등을 간편하게 입력하고 관리할 수 있습니다. 스프레드 시트 형식으로 품의서를 관리할 수 있습니다.<br>
			또, 원하는 비품을 신청할 수 있으며 신청한 비품 리스트는 우클릭을 통해 간편하게 구입완료 처리 할 수 있습니다.
			<hr>
			6. 교원 관리 <br/>
			자신의 프로필을 확인할 수 있으며 전체 교원 목록도 확인할 수 잇습니다. 원장으로 로그인 시, 해당 년도의 교원편성을 할 수 있습니다.<br>
			그렇게 편성된 교원 편성표도 한눈에 볼 수 있습니다. 그리고 라이선스를 부여받을 수 있습니다.<br/>
			
			<hr>
			7. 자료 관리 <br/>
			유치원에서 필요한 다양한 문서양식이나 교육자료들을 업로드, 다운로드 할 수 있습니다.<br>
			<hr>
			8. 예산 관리 <br/>
			기간을 설정하여 해당 기간 내의 비품 예산(단가, 수량, 액수 등)을 확인 할 수 있습니다.<br>
			  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div> 
  
  	<!-- 팀원 소개 Modal -->
<div id="teamInfo" class="modal fade" role="dialog" >
  <div class="modal-dialog" > 
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title" >팀원 소개</h2> 
      </div>
      <div class="modal-body">
'사   진' <br>
(팀장)임초롬<br>
깃 주소 : 추가예정 <br>
블로그 주소 : <a href="http://blog.naver.com/dmsthch">http://blog.naver.com/dmsthch</a><br>
일정관리(캘린더), 계획안 관리<hr>

'사   진' <br>
김신삼<br>
깃 주소 : 추가예정 <br>
블로그 주소 : 추가예정 <br>
비품관리, 예산 관리<hr>

'사   진' <br>
김한솔<br>
깃 주소 : 추가예정 <br>
블로그 주소 : 추가예정 <br>
근태관리(출석), 자료실<hr>

'사   진' <br>
양지연<br>
깃 주소 : 추가예정 <br>
블로그 주소 : 추가예정 <br>
유아 관리<hr>

'사   진' <br>
전광철<br>
깃 주소 : 추가예정 <br>
블로그 주소 : 추가예정 <br>
교원관리, 라이선스, 세션(로그인)


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<!-- 가이드 Modal -->
<div id="guide" class="modal fade" role="dialog" >
  <div class="modal-dialog" > 
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h2 class="modal-title" >사용 가이드</h2> 
      </div>
      <div class="modal-body">
<button class="btn btn-default" data-toggle="collapse" data-target="#demo1">1. 근태관리</button>
<div id="demo1" class="collapse">
출석하기 : 첫 화면 중앙의 출석부 클릭 -> 출근등록<br>
퇴근하기 : 첫 화면 중앙의 출석부 클릭 -> 출근 이후 -> 퇴근하기 <br>
외출 : 첫 화면 중앙의 출석부 클릭 -> 출근 이후 -> 외출/복귀 <br>
</div>
<hr>
<button class="btn btn-default" data-toggle="collapse" data-target="#demo2">2. 일정관리</button>
<div id="demo2" class="collapse">
일정확인 : 상단 메뉴바에서 캘린더 클릭 -> 캘린더에서 보고싶은 일정 클릭<br>
일정 추가 : 상단 메뉴바에서 캘린더 클릭 -> 원하는 날짜만큼 드래그 -> 내용 입력 후 일정 추가 버튼 클릭 <br>
일정 삭제 : 상단 메뉴바에서 캘린더 클릭 -> 삭제하고 싶은 일정 클릭 -> 삭제버튼 클릭

</div>
<hr>
<button class="btn btn-default" data-toggle="collapse" data-target="#demo3">3. 계획안관리</button>
<div id="demo3" class="collapse">
계획안 양식 추가 : 상단 메뉴바 계획안 클릭 -> 좌측 바에서 양식 관리 -> 양식 추가 <br>
계획안 양식 보기, 수정 : 상단 메뉴바 계획안 클릭 -> 좌측 바에서 양식 관리 -> 양식 불러오기 -> 원하는 양식 클릭 <br>
계획안 보기 : 상단 메뉴바 계획안 클릭 -> 계획안 메인 화면 혹은 좌측 메뉴바에서 원하는 계획안이나 반 클릭<br>
계획안 작성 : 상단 메뉴바 계획안 클릭 -> 좌측바에서 원하는 계획안 클릭-> 계획안 작성 -> 빈 시트나 양식 클릭<br> 
</div>
<hr>
<button class="btn btn-default" data-toggle="collapse" data-target="#demo4">4. 유아 관리</button>
<div id="demo4" class="collapse">
계획안 양식 추가 : 상단 메뉴바 계획안 클릭 -> 좌측 바에서 양식 관리 -> 양식 추가 <br>
계획안 양식 보기, 수정 : 상단 메뉴바 계획안 클릭 -> 좌측 바에서 양식 관리 -> 양식 불러오기 -> 원하는 양식 클릭 <br>
계획안 보기 : 상단 메뉴바 계획안 클릭 -> 계획안 메인 화면 혹은 좌측 메뉴바에서 원하는 계획안이나 반 클릭<br>
계획안 작성 : 상단 메뉴바 계획안 클릭 -> 좌측바에서 원하는 계획안 클릭-> 계획안 작성 -> 빈 시트나 양식 클릭<br> 
</div>
<hr>

</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	<!-- //w3ls-weather --> 
	<!-- copyright -->
	<div class="copyw3-agile">
		<p> © 2017 Flatty Weather Report . All rights reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts.</a></p>
	</div>
	<!-- //copyright -->
	
	
	
</body>
</html>