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
    
	    <link rel="stylesheet" href="css/JKC/Multi-Column-Select/Multi-Column-Select.css">
        <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed|Ubuntu' rel='stylesheet' type='text/css'>

        <style>
            .clear{
                margin-bottom: 10px;
            }
        </style>
        
	<link rel="stylesheet" type="text/css" href="css/JKC/takeTab/tabs.css" />
	<link rel="stylesheet" type="text/css" href="css/JKC/takeTab/tabstyles.css" />
 	<script src="js/JKC/takeTab/modernizr.custom.js"></script>
 	
 	<script>
 	$(document).ready(function(){
 		
 		var selectClassName = "?";
 		var selectTeacherName = "?";
 		
 		$('.submit').click(function(){
 	 		/* var val = $("select option:selected").val();
 	 		alert(val+"<-선택값") */
 			/* var s = $('section').attr("class"); */
 			var s = $(this).parent().parent().parent().attr('class');
 			$(this).parent().find('#classNo').val(s);
 		});
 		
 		$('.tabClass').click(function(){ 			
 			selectClassName = $(this).find('span').html();
 			$('.inputResultView').val(selectClassName + "에 들어갈 선생님의 이름은 " + selectTeacherName + "입니다.");
 		});
 		
 		$(document).on('click','.mcs-item',function(){
 			console.log('클릭!');
 			selectTeacherName = $(this).html();
 			console.log(selectTeacherName);
 			$('.inputResultView').val(selectClassName + "에 들어갈 선생님의 이름은 " + selectTeacherName + "입니다.");
 			
 		});

		
 	});
 	</script>

</head>

<body>
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
									<c:forEach begin="3" end="5" var="age">
										
											<div class="wrapper">
											<header class="codrops-header">
											<h1>${age}살 편성</h1>
											</header>
												<!-- <section> -->
													<div class="tabs tabs-style-linetriangle">
														<nav>
															<ul>
															<c:forEach var="TC" items="${takeClass}" >
															<c:if test="${TC.classAge == age}"> 
															<li id="classN"><a class="tabClass" href="${TC.classNo}"><span>${TC.className}반</span></a></li>
															</c:if>
															</c:forEach>
															</ul>
														</nav>
													
													<div class="content-wrap">
															<c:forEach var="TC" items="${takeClass}" >
															<c:if test="${TC.classAge == age}">
																<section id="${TC.classNo}" >
																<div class="${TC.classNo}">
																
																<div class="wrapper">
																	   <form action="${pageContext.request.contextPath}/pyeonseong" method="POST">
																	   
																	   <!-- 시작 -->
																	   <div class="selectcontrol">
																	   <select class="jsel" name="teacherNo">
																		   <c:forEach var="TT" items="${takeTeacher}">
																		   <!--   -->       <option value="${TT.teacherNo}">${TT.teacherName}</option>
																		   </c:forEach>
																	   </select>
																	   </div>
																	   <!-- 엔드 -->
																	   
																	       <div class="clear"></div>
																	       <input type="hidden" name="classNo" id="classNo">
																	       <input type="submit" value="저장하기" class="btn submit" />
																	       <br><br><br><br><br>
																	       <input type="button" class="inputResultView" value="?반에 들어갈 선생님의 이름은 ? 입니다">
																	   </form>
																	</div>
																</div>
																</section>
															</c:if>
															</c:forEach>
													</div>
													</div>
												<!-- </section> -->
											</div>
									</c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>

		
		<c:import url="./footer.jsp"></c:import>

	    </div>
	

     <script src="js/JKC/Multi-Column-Select/Multi-Column-Select.min.js"></script>
    <script>
    $(document).ready(function(){
        $('.selectcontrol').MultiColumnSelect({
            menuclass : 'mcs',
            openmenuClass : 'mcs-open',
            openmenuText : '일반선택',
            containerClass : 'mcs-container',
            itemClass : 'mcs-item',
            duration : 200,
            onOpen: function() {
                // some action
            },
            onClose: function() {
                // some action
            },
            onItemSelect: function() {
                // some action

            }
        });

        $('.selectcontrolm').MultiColumnSelect({
            multiple: true,
            menuclass : 'mcs',
            openmenuClass : 'mcs-open',
            openmenuText : '다중선택',
            containerClass : 'mcs-container',
            itemClass : 'mcs-item',
	    idprefix : 'yourOwnID-',
            duration : 200,

        });

         /* $('#selectcontrolm').MultiColumnSelectAddItem('New','New Item'); */

     });
    </script>
	
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