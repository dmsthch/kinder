<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    
     
  	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- 사이드메뉴바 BEGIN -->
	<c:import url="./side.jsp"></c:import>
    
    <link rel="stylesheet" type="text/css" href="css/JKC/AnimatedCheckboxescss/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/JKC/AnimatedCheckboxescss/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/JKC/AnimatedCheckboxescss/component.css" />
	<script src="js/JKC/AnimatedCheckboxesjs/modernizr.custom.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/JKC/takeTab/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/JKC/takeTab/tabs.css" />
	<link rel="stylesheet" type="text/css" href="css/JKC/takeTab/tabstyles.css" />
 	<script src="js/JKC/takeTab/modernizr.custom.js"></script>

	<style>

	label {
	
	
	
	}
	
	#asd {
	
	font-size: 3em; line-height: 100%;
	
	}
	</style>
</head>

<body>asdasdsasd
	<c:forEach begin="3" end="5" var="age">
		<div class="container" style=" padding-top:50; float:right; ">
			<form class="ac-custom ac-checkbox ac-boxfill" autocomplete="off">
			
			<header class="codrops-header">
			<h1>${age}살 편성</h1>
			</header>
				asd
				<section>
					<div class="tabs tabs-style-linetriangle">
						<nav>
							<ul>
							<c:forEach var="TC" items="${takeClass}" >
							<c:if test="${TC.classAge == age}"> 
							<li><a href="${TC.classNo}"><span>${TC.className}반</span></a></li>
							</c:if>
							</c:forEach> 
							</ul>
						</nav>
					
						<div class="content-wrap">
							<c:forEach var="TC" items="${takeClass}" >
							<c:if test="${TC.classAge == age}">
							
							<section id="${TC.classNo}">
							<c:forEach var="TT" items="${takeTeacher}">
							
							<ul>
								<li>
								<label id="asd" for="${TT.teacherNo}">
								<input id="${TT.teacherNo}" name="${TT.teacherNo}" type="checkbox">${TT.teacherName} &nbsp
								</label>
								</li>
							</ul>
								
							</c:forEach>
							</section>
							
							</c:if>
							</c:forEach>
						</div>
					</div>
				</section>
			</form>			
		</div>
	</c:forEach>
	
	<script src="js/JKC/AnimatedCheckboxesjs/svgcheckbx.js"></script>
	<script src="js/JKC/takeTab/cbpFWTabs.js"></script>
	
	<script>
		(function() {
			[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
				new CBPFWTabs( el );
			});
		})();
	</script>
	
</body>

</html>