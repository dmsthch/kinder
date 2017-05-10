<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>1TEAM</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="css/JKC/modiassets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="css/JKC/modiassets/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/JKC/modiassets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>

<body>

	<div class="wrapper">
	
	<!-- 사이드메뉴바 BEGIN -->
	    <div class="sidebar" data-color="orange" data-image="../assets/img/sidebar-1.jpg">
			<!--
	        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
		    Tip 2: you can also add an image using data-image tag

			-->

			<div class="logo">
				<a href="${pageContext.request.contextPath}/" class="simple-text">
					햇병아리
				</a>
			</div>


	    	<div class="sidebar-wrapper">
				<ul class="nav">
	                <li>
	                    <a href="${pageContext.request.contextPath}/kyo">
	                        <i class="material-icons">person</i>
	                        <p>User Profile</p>
	                    </a>
	                </li>
	                <li class="active">
	                    <a href="${pageContext.request.contextPath}/kyotable">
	                        <i class="material-icons">content_paste</i>
	                        <p>Table List</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
		</div>
<!-- 사이드메뉴바 END -->


	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">교원 명단</h4>
	                                <p class="category">현재 활동중인 교직원 명단입니다.</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>Name</th>
	                                    	<th>Country</th>
	                                    	<th>City</th>
											<th>Salary</th>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                        	<td>Dakota Rice</td>
	                                        	<td>Niger</td>
	                                        	<td>Oud-Turnhout</td>
												<td class="text-primary">$36,738</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>Minerva Hooper</td>
	                                        	<td>Curaçao</td>
	                                        	<td>Sinaai-Waas</td>
												<td class="text-primary">$23,789</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>Sage Rodriguez</td>
	                                        	<td>Netherlands</td>
	                                        	<td>Baileux</td>
												<td class="text-primary">$56,142</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>Philip Chaney</td>
	                                        	<td>Korea, South</td>
	                                        	<td>Overland Park</td>
												<td class="text-primary">$38,735</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>Doris Greene</td>
	                                        	<td>Malawi</td>
	                                        	<td>Feldkirchen in Kärnten</td>
												<td class="text-primary">$63,542</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>Mason Porter</td>
	                                        	<td>Chile</td>
	                                        	<td>Gloucester</td>
												<td class="text-primary">$78,615</td>
	                                        </tr>
	                                    </tbody>
	                                </table>

	                            </div>
	                        </div>
	                    </div>

	                    <div class="col-md-12">
	                        <div class="card card-plain">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">이직한 명단</h4>
	                                <p class="category">이전에 있었던 교직원 명단입니다.</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead>
	                                        <th>ID</th>
	                                    	<th>Name</th>
	                                    	<th>Salary</th>
	                                    	<th>Country</th>
	                                    	<th>City</th>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                        	<td>1</td>
	                                        	<td>Dakota Rice</td>
	                                        	<td>$36,738</td>
	                                        	<td>Niger</td>
	                                        	<td>Oud-Turnhout</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>2</td>
	                                        	<td>Minerva Hooper</td>
	                                        	<td>$23,789</td>
	                                        	<td>Curaçao</td>
	                                        	<td>Sinaai-Waas</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>3</td>
	                                        	<td>Sage Rodriguez</td>
	                                        	<td>$56,142</td>
	                                        	<td>Netherlands</td>
	                                        	<td>Baileux</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>4</td>
	                                        	<td>Philip Chaney</td>
	                                        	<td>$38,735</td>
	                                        	<td>Korea, South</td>
	                                        	<td>Overland Park</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>5</td>
	                                        	<td>Doris Greene</td>
	                                        	<td>$63,542</td>
	                                        	<td>Malawi</td>
	                                        	<td>Feldkirchen in Kärnten</td>
	                                        </tr>
	                                        <tr>
	                                        	<td>6</td>
	                                        	<td>Mason Porter</td>
	                                        	<td>$78,615</td>
	                                        	<td>Chile</td>
	                                        	<td>Gloucester</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
		
		<c:import url="./footer.jsp"></c:import>

	    </div>
	</div>

</body>

	<!--   Core JS Files   -->
	<script src="js/JKC/modiassets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="js/JKC/modiassets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/JKC/modiassets/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="js/JKC/modiassets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="js/JKC/modiassets/js/bootstrap-notify.js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="js/JKC/modiassets/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="js/JKC/modiassets/js/demo.js"></script>

</html>
