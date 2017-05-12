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


	

	    <div class="sidebar" data-color="blue" data-image="../assets/img/sidebar-1.jpg">
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
	                <li id="educationProjectAddPage">
	                    <a href="${pageContext.request.contextPath}/educationProjectAddPage">
	                        <i class="material-icons">dashboard</i>
	                        <p>양식 추가</p>
	                    </a>
	                </li>
	                <li id="educationProjectFormLoad">
	                    <a href="${pageContext.request.contextPath}/educationProjectFormLoad?formOrder=1">
	                        <i class="material-icons">person</i>
	                        <p>임시</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/educationProjectAddPage">
	                        <i class="material-icons">content_paste</i>
	                        <p>임시2</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="typography.html">
	                        <i class="material-icons">library_books</i>
	                        <p>Typography</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="icons.html">
	                        <i class="material-icons">bubble_chart</i>
	                        <p>Icons</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="maps.html">
	                        <i class="material-icons">location_on</i>
	                        <p>Maps</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="notifications.html">
	                        <i class="material-icons text-gray">notifications</i>
	                        <p>Notifications</p>
	                    </a>
	                </li>
					<li class="active-pro">
	                    <a href="upgrade.html">
	                        <i class="material-icons">unarchive</i>
	                        <p>Upgrade to PRO</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    </div>
	    
	    <!--   Core JS Files   -->
	<script src="css/LCR/EducationProject/assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="css/LCR/EducationProject/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="css/LCR/EducationProject/assets/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="css/LCR/EducationProject/assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="css/LCR/EducationProject/assets/js/bootstrap-notify.js"></script>


	<!-- Material Dashboard javascript methods -->
	<script src="css/LCR/EducationProject/assets/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="css/LCR/EducationProject/assets/js/demo.js"></script>

	<script type="text/javascript">
    	$(document).ready(function(){

			// Javascript method's body can be found in assets/js/demos.js
        	demo.initDashboardPageCharts();

    	});
	</script>
	    

  </div><!-- /.container-fluid -->
</nav>