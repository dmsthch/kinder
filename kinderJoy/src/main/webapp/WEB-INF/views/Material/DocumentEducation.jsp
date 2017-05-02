<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	
	<!-- 따라다니는 메뉴 -->
	<script src="js/KHS/RefreshStaticMenu.js"></script>
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	
	<style>
		body{
			margin-top: 5%;
		}
	</style>


	<style type="text/css">
	#staticMenu { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
	.myBtn {
	  background: transparent;
	  border: 2px solid white;
	  border-radius: 0;
	  color: white;
	  font-size: 15px;
	  font-weight: bold;
	  letter-spacing: 2px;
	  padding: 5px 35px;
	  margin-top: 5px;
	  transition: all 0.4s ease-in-out;
	}
	.myBtn:hover {
	  background: #00c6d7;
	  border-color: transparent;
	}
	body{
	  background-color: #3B3B3B;
	}
	p{
	  color: white;
	}
	h1{
	  color: white;
	}
	h3 {
		color: white;
	}
	.tabContent {
	  padding: 28px;
	  position: relative;
	  transition: all 0.4s ease-in-out;
	}
	.tabContent:hover {
	  background-color: #646464;
	  box-shadow: 0px 2px 8px 0px rgba(50, 50, 50, 0.20);
	}
	i {
		color: white;
	}
	#portfolio {
  background-color: transparent;
  text-align: center;
  }
	</style>

</head>

<body class="container" onload="InitializeStaticMenu();">
<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

<!-- Follow sideNave -->
<div id="staticMenu">
	<a href="#" class="smoothScroll btn btn-default myBtn">버튼</a><br/>
</div>

<!-- content -->
<div>
	<div id="portfolio">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="section-title text-center">
					<h1 class="heading bold">자료실</h1>
					<hr>
				</div>
				<!-- ISO section -->
				<div class="iso-section">
					<ul class="filter-wrapper clearfix">
                   		 <li><a href="#" data-filter="*" class="selected opc-main-bg">All</a></li>
                   		 <li><a href="#" class="opc-main-bg" data-filter=".documentForm">DocumentForm</a></li>
                   		 <li><a href="#" class="opc-main-bg" data-filter=".material">Material</a></li>
               		</ul>
               		<div class="iso-box-section wow fadeIn" data-wow-delay="0.5s">
               			<div class="iso-box-wrapper col4-iso-box">
							 
							 <!-- DocumentForm -->
               				 <div class="iso-box col-lg-3 col-md-4 col-sm-6 documentForm">
               				 	<a href="#">
	               				 	<div class="col-lg-12 col-md-12 col-sm-12 fadeInUp tabContent text-center">
										<h3>문서 양식 리스트</h3>
										<hr>
									</div>
               				 	</a>
               				 </div>
               				 <div class="iso-box col-lg-3 col-md-4 col-sm-6 documentForm">
               				 	<a href="#">
	               				 	<div class="col-lg-12 col-md-12 col-sm-12 fadeInUp tabContent text-center">
										<h3>문서 양식 추가</h3>
										<hr>
									</div>
               				 	</a>
               				 </div>
               				 
               				 
               				 <div class="iso-box col-lg-3 col-md-4 col-sm-6 material">
               				 	<a href="#">
	               				 	<div class="col-lg-12 col-md-12 col-sm-12 fadeInUp tabContent text-center">
										<h3>교육 자료 리스트</h3>
										<hr>
									</div>
               				 	</a>
               				 </div>
               				 <div class="iso-box col-lg-3 col-md-4 col-sm-6 material">
               				 	<a href="#">
	               				 	<div class="col-lg-12 col-md-12 col-sm-12 fadeInUp tabContent text-center">
										<h3>교육 자료 추가</h3>
										<hr>
									</div>
               				 	</a>
               				 </div>
               				 
               			</div>
               		</div>

				</div>
			</div>
		</div>
	</div>
</div>


<div class="row">
	<div class="col-sm-6 text-center" style="border:1px solid white">
		<h1>문서양식 리스트</h1>
		<p>문서양식 리스트</p>
		<p>문서양식 리스트</p>
		<p>문서양식 리스트</p>
		<p>문서양식 리스트</p>
		<p>문서양식 리스트</p>
	</div>
	
	<div class="col-sm-6 text-center" style="border:1px solid white">
		<h1>교육자료 리스트</h1>
		<p>교육자료 리스트</p>
		<p>교육자료 리스트</p>
		<p>교육자료 리스트</p>
		<p>교육자료 리스트</p>
		<p>교육자료 리스트</p>
	</div>
	
</div>
	
</div>



<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>


</body>
</html>