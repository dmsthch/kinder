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
</head>
<body class="components-page">


	

	    <div class="sidebar" data-color="red">
			<!--
		        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

		        Tip 2: you can also add an image using data-image tag
		    -->

			<div class="logo" style="margin-bottom: 20px;">
				<a href="http://www.creative-tim.com" class="simple-text">
					
				</a>
			</div>

	    	<div class="sidebar-wrapper">
	            <ul class="nav">
	                <!-- <li class="active"> -->
	                <li id="equipmentListNav">
	                    <a href="${pageContext.request.contextPath}/Equipment">
	                        <i class="material-icons">dashboard</i>
	                        <p>비품 리스트</p>
	                    </a>
	                </li>
	                <li id="equipmentSheetListNav">
	                    <a href="${pageContext.request.contextPath}/SheetList">
	                        <i class="material-icons">person</i>
	                        <p>품의서 리스트</p>
	                    </a>
	                </li>
	                <li id="equipmentRequestNav">
	                    <a href="${pageContext.request.contextPath}/EquipmentRequest">
	                        <i class="material-icons">content_paste</i>
	                        <p>비품 건의서</p>
	                    </a>
	                </li>
	               	<li id="equipmnetRequestListNav">
	                    <a href="${pageContext.request.contextPath}/EquipmentRequestList">
	                        <i class="material-icons">content_paste</i>
	                        <p>비품 건의 리스트</p>
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