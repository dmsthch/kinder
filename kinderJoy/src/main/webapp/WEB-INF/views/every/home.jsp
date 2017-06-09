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


<!-- //js -->  
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
						<a href="#" data-toggle="modal" data-target="#myModal">
							<img src="css/LCR/file.png">
							<h1 style="font-size: 20px;">프로젝트 소개</h1>
							<div class="clear"></div>
						</a>
					</li>
					
					<li>
						<a href="#">
							<img src="css/LCR/idea.png">
							<h1 style="font-size: 20px;">사용 가이드 </h1>
							<div class="clear"></div>
						</a>
					</li>
					
					
					<li>
						<a href="#">
							<img src="css/LCR/users.png">
							<h1 style="font-size: 20px;">팀원 소개</h1>
							<div class="clear"></div>
						</a>
					</li>
					
				
					<li>
						<a href="#">
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
<div id="project" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
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