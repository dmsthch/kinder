<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
	<link rel="stylesheet" type="text/css" href="css/JKC/takeTab/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/JKC/takeTab/tabs.css" />
	<link rel="stylesheet" type="text/css" href="css/JKC/takeTab/tabstyles.css" />
 	<script src="js/JKC/takeTab/modernizr.custom.js"></script>
</head>

<body>

	<c:forEach var="age" begin="3" end="3">
		<c:forEach var="TC" items="${takeClass}">
			<c:if test="${TC.classAge == age}">
				<div class="container">
					
					<header class="codrops-header">
					<h1>${age}반 편성표<span>${age}반에 선생님들을 편성하세요.</span></h1>
					</header>
					
					<section>
						<div class="tabs tabs-style-linetriangle">
							<nav>
								<ul>
									<li><a href="#section-linetriangle-1"><span>${TC.className}</span></a></li>
								</ul>
							</nav>
							<div class="content-wrap">
								<section id="section-linetriangle-1"><p>1</p></section>
							</div>
						</div>
					</section>
						
				</div>
			</c:if>
		</c:forEach>
	</c:forEach>

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