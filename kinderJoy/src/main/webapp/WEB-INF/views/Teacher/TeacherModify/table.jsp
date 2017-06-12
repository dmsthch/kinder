<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
<title>교원 명단</title>
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
		$('#kyotable').attr('class','active');
		$('#sidekyotable').attr('style','background-color:#3DB7CC');
		
	});
	</script>


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
	                    <div class="col-md-12 data-block elementA">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">교원 명단</h4>
	                                <p class="category">현재 활동중인 교직원 명단입니다.</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>아이디</th>
	                                    	<th>권한</th>
	                                    	<th>이름</th>
											<th>가입일자</th>
											<th>번호</th>
											<th>은행</th>
											<th>계좌</th>
											<th>호봉</th>
	                                    </thead>
	                                    
	                                    <c:forEach var="t" items="${tableList}">
	                                    <tbody>
	                                        <tr>
	                                        	<td>${t.teacherId}</td>
	                                        	<td>${t.teacherLevel}</td>
	                                        	<td>${t.teacherName}</td>
	                                        	<td>${t.teacherAddDay}</td>
	                                        	<td>${t.teacherPhone}</td>
	                                        	<td>${t.teacherBank}</td>
	                                        	<td>${t.teacherAccount}</td>
	                                        	<td>${t.teacherPaystep}</td>
	                                        <tr>
	                                    </tbody>
	                                   </c:forEach>
	                                </table>

	                            </div>
	                        </div>
	                    </div>

	                    <div class="col-md-12 data-block elementB">
	                        <div class="card card-plain">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">이직한 명단</h4>
	                                <p class="category">이전에 있었던 교직원 명단입니다.</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead>
	                                        <th>ID</th>
	                                    	<th>Name</th>
	                                    	<th>Level</th>
	                                    	<th>removeDay</th>
	                                    </thead>
	                                    <c:forEach var="R" items="${removeList}">
	                                    <tbody>
	                                        <tr>
	                                        	<td>${R.teacherId}</td>
	                                        	<td>${R.teacherName}</td>
	                                        	<td>${R.teacherLevel}</td>
	                                        	<td>${R.teacherRemoveDay}</td>
	                                        </tr>
	                                    </tbody>
	                                    </c:forEach>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
		
		<c:import url="./footer.jsp"></c:import>

	    </div>
	    
	    <ul id="tlyPageGuide" data-tourtitle="가이드를 시작하려면 클릭하세요.">
              <li class="tlypageguide_top" data-tourtarget=".tableSide">
              사이드 리스트 프로필 설명
              </li>
              
              <li class="tlypageguide_left" data-tourtarget=".elementA">
              바디 리스트 설명
              </li>
              
              <li class="tlypageguide_left" data-tourtarget=".elementB">
		  바디 리스트 설명2
              </li>
        </ul>
	    
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
