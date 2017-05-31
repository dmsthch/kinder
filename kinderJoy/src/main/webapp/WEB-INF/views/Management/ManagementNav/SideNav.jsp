<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

    <!-- Bootstrap core CSS     -->
    <link href="css/LCR/EducationProject/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="css/LCR/EducationProject/assets/css/material-dashboard.css" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    
    <script src="js/LCR/Calendar/lib/jquery.min.js"></script>
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
</style>
</head>
<body class="components-page">
<script>console.log('asdf');</script>

	

	    <div class="sidebar" data-color="red" >
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo" style="margin-bottom: 20px;">
				<a href="http://www.creative-tim.com" class="simple-text">
					
				</a>
			</div>

	    	<div class="sidebar-wrapper" style="overflow:visible;">
	            <ul class="nav" style="overflow:visible;">
	                <!-- <li class="active"> -->
	                <li id="equipmentListNav" class="dropdown">
	                    <a class="dropdown-toggle" type="button" data-toggle="dropdown" style="cursor:pointer;" id="formManagement">
	                        <i class="material-icons">dashboard</i>
	                        <p>비품 예산<span class="caret"></span></p>
                        </a>
						    <ul class="pull-right dropdown-menu" style="margin-right:-62%; margin-top:-20%" >
						    	<li><a href="${pageContext.request.contextPath}/Management?test=6">전체</a></li>
						    	<li><a href="${pageContext.request.contextPath}/Management?test=1">교제,교구</a></li>
								<li><a href="${pageContext.request.contextPath}/Management?test=2">사무용품</a></li>
								<li><a href="${pageContext.request.contextPath}/Management?test=3">체육용품</a></li>
								<li><a href="${pageContext.request.contextPath}/Management?test=4">도서목록</a></li>
								<li><a href="${pageContext.request.contextPath}/Management?test=5">기타</a></li>
						    </ul>
	                </li>
	               	<li class="dropdown">
	                	
	                    <a class="dropdown-toggle" type="button" data-toggle="dropdown" style="cursor:pointer;">
	                        <i class="material-icons">content_paste</i>
	                        <p>일일계획안 <span class="caret"></span></p>
                        </a>
						    <ul class="pull-right dropdown-menu navEducationProject" id="day" style="margin-right:-62%; margin-top:-20%" >
						    	<li class="dropdown-submenu ">
							    	<a href="#" > 일일계획안 작성 </a>
							    	<ul class="dropdown-menu navFormLoad" style="margin-left:1%" id="navFormLoad">
							    		<li><a href="${pageContext.request.contextPath}/EducationProjectAdd">빈 시트</a></li>
							    	
							    	</ul>
							    </li>	
						    	<li class="divider"></li>
						    	<li><a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=4">일일계획안 전체 보기</a></li>
						    	<li class="divider"></li>
						    	
						    	<c:forEach begin="3" end="5" var="age"> <!-- 요놈!! -->
							    	<li class="dropdown-submenu">
							    		<a href="${pageContext.request.contextPath}/EducationProjectList?categoryNo=4&age=${age}"> ${age}세 </a>
								    	<ul class="dropdown-menu ${age}" style="margin-left:1%">
								    		<!-- <li><a href="#" class="">test0001</a></li> -->
								    	</ul>
							    	</li>
						    	</c:forEach>
						    </ul>
	                </li>
	                <li id="equipmentSheetListNav">
	                    <a href="${pageContext.request.contextPath}/SheetList">
	                        <i class="material-icons">person</i>
	                        <p>직원 예산</p>
	                    </a>
	                </li>
	                <li id="equipmentRequestNav">
	                    <a href="${pageContext.request.contextPath}/test01">
	                        <i class="material-icons">content_paste</i>
	                        <p>계획 예산</p>
	                    </a>
	                </li>
	               	<li id="equipmnetRequestListNav">
	                    <a href="${pageContext.request.contextPath}/testList">
	                        <i class="material-icons">content_paste</i>
	                        <p>임초롬님 탈세 용도 예산</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    </div>
	    
<!-- 	      Core JS Files  
	<script src="css/LCR/EducationProject/assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="css/LCR/EducationProject/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="css/LCR/EducationProject/assets/js/material.min.js" type="text/javascript"></script>

	 Charts Plugin
	<script src="css/LCR/EducationProject/assets/js/chartist.min.js"></script>

	 Notifications Plugin   
	<script src="css/LCR/EducationProject/assets/js/bootstrap-notify.js"></script>


	Material Dashboard javascript methods
	<script src="css/LCR/EducationProject/assets/js/material-dashboard.js"></script>

	Material Dashboard DEMO methods, don't include it in your project!
	<script src="css/LCR/EducationProject/assets/js/demo.js"></script> -->
	    

  </div><!-- /.container-fluid -->
</nav>