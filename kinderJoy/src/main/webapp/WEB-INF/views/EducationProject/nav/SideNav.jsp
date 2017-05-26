<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="apple-touch-icon" sizes="76x76" href="css/LCR/EducationProject/assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="css/LCR/assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Material Dashboard by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    

	
<style>

.dropdown-submenu{position:absolute;}
 
.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px; display: none; } 
 
.dropdown-submenu:hover>.dropdown-menu{display:block;position:absolute;}
 
.dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#cccccc;margin-top:5px;margin-right:-10px;}
 
.dropdown-submenu:hover>a:after{border-left-color:#ffffff;}
 
.dropdown-submenu.pull-left{float:none;}.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;} 
.sidebar.sidebar{
	z-index:5555;
}
.components-page.components-page{
 z-index:10;
}

.nav li .active ul a {background-color: black;}

.subHr {
	font-size: 1px; padding: 0px; margin-top: -10px; margin-bottom: -10px; text-align: center; color: #CFCFCF;
}
</style>

<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
<%-- <c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>  --%>
<script>
$(document).ready(function(){
	
	//저장된 계획안의 양식 번호와 이름 가져오기
	var form = [];
		$.ajax({
			url : "${pageContext.request.contextPath}/educationProjectFormName",
			type : 'GET',
			dataType: 'JSON',
			async: false,
			success : function(data){
				form = data;
		},error: function(XMLHttpRequest, textStatus, errorThrown) { 
		     console.log("Status: " + textStatus);
		},timeout: 3000
		});    
	
		//console.log(form);
		//console.log(form.length)
		

	var formTitle;
	var formOrder;
	for(var i = 0; i<form.length; i++){
		formTitle = form[i].formTitle;
		formOrder = form[i].formOrder;
		//console.log(formTitle);
 		 $('.navFormLoad').append('<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?formOrder='+formOrder+'"> '+formTitle+'</a></li>');   	
		 /* $('.navFormLoad').append('<li><a href="#">'+i+'</a></li>');    */
 		 $('.navFormLoadDay').append('<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?categoryNo=4&formOrder='+formOrder+'"> '+formTitle+'</a></li>');
 		$('.navFormLoadWeek').append('<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?categoryNo=3&formOrder='+formOrder+'"> '+formTitle+'</a></li>');
 		$('.navFormLoadMonth').append('<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?categoryNo=2&formOrder='+formOrder+'"> '+formTitle+'</a></li>');
 		$('.navFormLoadYear').append('<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?categoryNo=1&formOrder='+formOrder+'"> '+formTitle+'</a></li>');
	}
	
	//반 정보 가져오기
	var childClass = [];
	$.ajax({
		url : "${pageContext.request.contextPath}/educationProjectGetClassInfo",
		type : 'POST',
		dataType: 'JSON',
		async: false,
		success : function(data){
			//console.log(data);
			childClass = data;
	},error: function(XMLHttpRequest, textStatus, errorThrown) { 
	     console.log("Status: " + textStatus);
	},timeout: 3000
	}); 

	for(i=0; i<childClass.length; i++){
		
		var day = '<li><a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=4&classNo='+childClass[i].classNo+'">'+childClass[i].className+'</a></li>';
		var week = '<li><a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=3&classNo='+childClass[i].classNo+'">'+childClass[i].className+'</a></li>';
		var month = '<li><a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=2&classNo='+childClass[i].classNo+'">'+childClass[i].className+'</a></li>';
		
		if(childClass[i].classAge == 3){
			$('#day .3').append(day);
			$('#week .3').append(week);
			$('#month .3').append(month);
		}
		if(childClass[i].classAge == 4){
			$('#day .4').append(day);
			$('#week .4').append(week);
			$('#month .4').append(month);
		}
		if(childClass[i].classAge == 5){
			$('#day .5').append(day);
			$('#week .5').append(week);
			$('#month .5').append(month);
		}
	}

})
</script>

</head>
<body class="components-page nav" style="">

	    <div class="sidebar" data-color="blue">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo" style="padding-bottom: 51px;">
				<a href="http://www.creative-tim.com" class="simple-text">
					
				</a>
			</div>

	    	<div class="sidebar-wrapper" style="overflow: visible;">
	            <ul class="nav ">
            	   <li class="navEducationProject" id="eduHome">
	                   <a href="${pageContext.request.contextPath}/educationProject" class="smoothScroll">
	                        <i class="material-icons">dashboard</i>
	                        
	                        <p>계획안 메인화면</p>
	                    </a>
	                </li>
	                
	                <li class="dropdown"  id="educationProjectAddPage">
	                    <a class="dropdown-toggle" type="button" data-toggle="dropdown" style="cursor:pointer;" id="formManagement">
	                        <i class="material-icons">library_books</i>
	                        <p>양식관리 <span class="caret"></span></p>
                        </a>
						    <ul class="pull-right dropdown-menu" style="margin-right:-62%; margin-top:-20%" >
						    	<li><a href="${pageContext.request.contextPath}/educationProjectAddPage">양식 추가하기</a></li>
						    	<li class="divider"></li>
							    	<li class="dropdown-submenu ">
							    		<a href="#" > 양식 불러오기 </a>
							    	<ul class="dropdown-menu navFormLoad" style="margin-left:0.3%" id="navFormLoad">
							    		
							    	</ul>
							    	
							    	</li>	
						    </ul>
	                </li>
	                
	                <!-- 요기부터 -->
	               <li class="dropdown" id="activeDay">
	                	
	                    <a class="dropdown-toggle" type="button" data-toggle="dropdown" style="cursor:pointer;">
	                        <i class="material-icons">content_paste</i>
	                        <p>일일계획안 <span class="caret"></span></p>
                        </a>
						    <ul class="pull-right dropdown-menu navEducationProject" id="day" style="margin-right:-62%; margin-top:-20%" >
						    	<li class="dropdown-submenu ">
							    	<a href="#" > 일일계획안 작성 </a>
							    	<ul class="dropdown-menu navFormLoadDay" style="margin-left:0.3%" id="navFormLoad">
							    		<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?categoryNo=4&isBlank=1">빈 시트</a></li>
							    		<li class="subHr" >-------사용자 저장 양식-------</li>
							    	</ul>
							    </li>	
						    	<li class="divider"></li>
						    	<li><a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=4">일일계획안 전체 보기</a></li>
						    	<li class="divider"></li>
						    	
						    	<c:forEach begin="3" end="5" var="age"> <!-- 요놈!! -->
							    	<li class="dropdown-submenu">
							    		<a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=4&age=${age}"> ${age}세 </a>
								    	<ul class="dropdown-menu ${age}" style="margin-left:0.3%">
								    		<!-- <li><a href="#" class="">test0001</a></li> -->
								    	</ul>
							    	</li>
						    	</c:forEach>
						    </ul>
	                </li>
	                <!-- 요기까지 반복됨 // 반복될것 : 카테고리, 나이 -->
	                
	                 <li class="dropdown" id="activeWeek">
	                	
	                    <a class="dropdown-toggle" type="button" data-toggle="dropdown" style="cursor:pointer;">
	                        <i class="material-icons">content_paste</i>
	                        <p>주간계획안 <span class="caret"></span></p>
                        </a>
						    <ul class="pull-right dropdown-menu navEducationProject" id="week" style="margin-right:-62%; margin-top:-20%" >
						    	
						    	<li class="dropdown-submenu ">
							    	<a href="#" > 주간계획안 작성 </a>
							    	<ul class="dropdown-menu navFormLoadWeek" style="margin-left:0.3%" id="navFormLoad">
							    		<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?categoryNo=3&isBlank=1">빈 시트</a></li>
							    		<li class="subHr" >-------사용자 저장 양식-------</li>
							    	</ul>
							    </li>
						    	<li class="divider"></li>
						    	<li><a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=3">주간계획안 전체 보기</a></li>
						    	<li class="divider"></li>
						    	<c:forEach begin="3" end="5" var="age"> <!-- 요놈!! -->
							    	<li class="dropdown-submenu">
							    		<a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=3&age=${age}"> ${age}세 </a>
								    	<ul class="dropdown-menu ${age}" style="margin-left:0.3%">
								    		<!-- <li><a href="#" class="">test0001</a></li> -->
								    	</ul>
							    	</li>
						    	</c:forEach>
						    </ul>
	                </li>
	                
	                <li class="dropdown" id="activeMonth">
	          
	                    <a class="dropdown-toggle" type="button" data-toggle="dropdown" style="cursor:pointer;">
	                        <i class="material-icons">content_paste</i>
	                        <p>월간계획안 <span class="caret"></span></p>
                        </a>
						    <ul class="pull-right dropdown-menu navEducationProject" id="month" style="margin-right:-62%; margin-top:-20%" >
						    	<li class="dropdown-submenu ">
							    	<a href="#" > 월간계획안 작성 </a>
							    	<ul class="dropdown-menu navFormLoadMonth" style="margin-left:0.3%" id="navFormLoad">
							    		<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?categoryNo=2&isBlank=1">빈 시트</a></li>
							    		<li class="subHr" >-------사용자 저장 양식-------</li>
							    	</ul>
							    </li>
						    	<li class="divider"></li>
						    	<li><a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=2">월간계획안 전체 보기</a></li>
						    	<li class="divider"></li>
						    	
						    	<c:forEach begin="3" end="5" var="age"> <!-- 요놈!! -->
							    	<li class="dropdown-submenu">
							    		<a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=2&age=${age}"> ${age}세 </a>
								    	<ul class="dropdown-menu ${age}" style="margin-left:0.3%">
								    		<!-- <li><a href="#" class="">test0001</a></li> -->
								    	</ul>
							    	</li>
						    	</c:forEach>
						    </ul>
	                </li>
	                
	                <li class="dropdown" id="activeYear">
	                	
	                    <a class="dropdown-toggle" type="button" data-toggle="dropdown" style="cursor:pointer;">
	                        <i class="material-icons">content_paste</i>
	                        <p>연간계획안 <span class="caret"></span></p>
                        </a>
						    <ul class="pull-right dropdown-menu navEducationProject" id="month" style="margin-right:-62%; margin-top:-20%" >
						    	<li class="dropdown-submenu ">
							    	<a href="#" > 연간계획안 작성 </a>
							    	<ul class="dropdown-menu navFormLoadYear" style="margin-left:0.3%" id="navFormLoad">
							    		<li><a href="${pageContext.request.contextPath}/educationProjectFormLoad?categoryNo=1&isBlank=1">빈 시트</a></li>
							    		<li class="subHr" >-------사용자 저장 양식-------</li>
							    	</ul>
							    </li>
						    	<li class="divider"></li>
						    
						    	<li><a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=1">연간계획안 전체 보기</a></li>
						    	<li class="divider"></li>
						    	
						    	<c:forEach begin="3" end="5" var="age"> <!-- 요놈!! -->
							    	<li>
							    		<a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=1&age=${age}"> ${age}세 </a>
								    	
							    	</li>
						    	</c:forEach>
						    </ul>
	                </li>
	                
	                
	                <!-- 테스트중!! -->
	                <li>
	                	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#testModal">Open Modal</button>
	                </li>
	                
		                <!-- Modal -->
						<div id="testModal" class="modal fade" role="dialog">
						  <div class="modal-dialog" >
						
						    <!-- Modal content-->
						    <div class="modal-content" style="width: 1000px;">
						    <div id="myCarousel" class="carousel slide" dat/a-ride="carousel">
								  <!-- Indicators -->
								  <ol class="carousel-indicators">
								    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								    <li data-target="#myCarousel" data-slide-to="1"></li>
								    <li data-target="#myCarousel" data-slide-to="2"></li>
								  </ol>
								
								  <!-- Wrapper for slides -->
								  <div class="carousel-inner">
								    <div class="item active">
								      <img src="images/LCR/manual/education_1.jpg" alt="Los Angeles">
								    </div>
								
								    <div class="item">
								      <img src="chicago.jpg" alt="Chicago">
								    </div>
								
								    <div class="item">
								      <img src="ny.jpg" alt="New York">
								    </div>
								  </div>
								
								  <!-- Left and right controls -->
								  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
								    <span class="glyphicon glyphicon-chevron-left"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="right carousel-control" href="#myCarousel" data-slide="next">
								    <span class="glyphicon glyphicon-chevron-right"></span>
								    <span class="sr-only">Next</span>
								  </a>
							</div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
						
						  </div>
						</div>
	                <!-- 테스트중!! -->
	                
	            </ul>
	    	</div>
	    </div>    
	
  </div><!-- /.container-fluid -->
</nav>