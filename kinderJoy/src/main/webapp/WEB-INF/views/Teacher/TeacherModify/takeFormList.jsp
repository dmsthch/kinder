<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
     <title>교원 편성표</title>
  	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- 사이드메뉴바 BEGIN -->
	<c:import url="./side.jsp"></c:import>

		<script>
	$(document).ready(function(){
		$('#takeFormList').attr('class','active');
		$('#sidetakeFormList').attr('style','background-color:#3DB7CC');
		
	});
	</script>
	
	<style>
	.rounded {
	  background: black;
	  border-radius: 5px;
	}
	</style>
	
	
	<!-- 가이드 여기도 문제 없음-->
	
	<link rel="stylesheet" href="css/pageguide.min.css" />
    <style type="text/css">
        body {
            font-family: Helvetica, Arial, sans-serif;
        }	/* 사이즈조절 */
        .wrapper {
            margin: 0 auto;
            width: 100%;
            max-width: auto;	/* 바디 부분 가로크기 조절 */
        }
        .data-block {
            width: 100%;
            min-height: auto; /* 가이드 부분 사이드 부분 세로크기 조절 */
        }
        .data-block img {
            width: 100%;
        }
        #titlePageGuide {
            display: none;
        }
    </style>
<!-- 가이드 여기도 문제 없음 -->
	
</head>

<body>



<div class="wrapper">

	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">편성표</h4>
	                                <p class="category">편성된 표를 확인하세요.</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
                             <c:forEach begin="3" end="5" var="age">
	                                
		                         <table class="table">
		                         
									<h1 class="data-block elementA">${age}살 편성</h1>
										
										<c:forEach var="List" items="${List}">
											<c:if test="${List.classAge == age }">
											<div class="card-header style_card data-block elementB" data-background-color="blue" style=" border: 3px solid black;  float: left; height: auto; width: auto; margin: 10px; padding: 10px;" > 
												<h5 class="card card-stats">${List.className}반</h5>
												${List.teacherName}
											</div>
											</c:if>	
										</c:forEach>
		                         </table>
		                         
                             </c:forEach>
	                            </div>
	                        </div>
	                    </div>

	                </div>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 가이드  -->
	    <ul id="tlyPageGuide" data-tourtitle="가이드를 시작하려면 클릭하세요.">
              <li class="tlypageguide_top" data-tourtarget=".takeFormListSide">
              편성된 표를 볼 수 있습니다.
              </li>
              
              <li class="tlypageguide_top" data-tourtarget=".elementA">
              몇 살인지 알 수 있습니다.
              </li>
              
              <li class="tlypageguide_top" data-tourtarget=".elementB">
              반과 반에 배정된 선생님의 이름을 알 수 있습니다.
              </li>              
	    
	</div>

	<!-- 페이지가이드 -->
	<script type="text/javascript" src="js/pageguide.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            var pageguide = tl.pg.init();
        });
    </script>
<!-- 페이지가이드 --> 

</body>

</html>