<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>라이선스</title>

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
		$('#license').attr('class','active');
		$('#sideLicense').attr('style','background-color:#3DB7CC');
	});
	</script>
	
	
<!-- 	<style type="text/css">
	
	#map {
  	height: 100%;
	}
	/* Optional: Makes the sample page fill the window. */
	html, body {
	  height: 100%;
	  margin: 0;
	  padding: 0;
	}
	
	</style> -->
	
	
</head>
<body>



<div id="map"></div>
    <script>
      function initMap() {
        // Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          scrollwheel: false,
          zoom: 8
        });
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsFyXwj7q398hPA8E5tvInqnQt4VFi1iE&callback=initMap"
    async defer></script>
    





<div class="wrapper">

	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">라이선스</h4>
	                                <p class="category">라이선스를 발급받으세요!</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
	                                <table class="table">

										<!-- 값이 equal일 때 -->
										<c:if test="${license eq null || license eq GUEST}">
										<form action="${pageContext.request.contextPath}/licenseForm" method="POST">
										
										<div class="form-group">
										<input type="text" class="teacherName form-control" name="licenseKindergartenName" id="licenseKindergartenName" placeholder="유치원명을 입력하세요.">
										</div>
									
									
										<div class="form-group">
										<input type="text" class="form-control" id="licenseAddress" name="licenseAddress" placeholder="주소를 입력하세요.">
										</div>	
										
										<div class="form-group">
										<input type="text" class="form-control" id="licensePhone" name="licensePhone" placeholder="유치원 연락처를 입력하세요">
										</div>
										
										<div class="col-sm-10">
										<input type="submit" value="작성 완료 후 클릭 시 라이선스가 부여됩니다.">
										</div>
										</form>
									    </c:if>

										<!-- 값이 not equal 일 때 -->
										<c:if test="${license ne GUEST || license ne null}">
										<div class="form-group">
									     <div class="col-sm-10">  
									     <!-- 값이 하나일 땐 점.을 안찍어야 잘 나온다 -->
									     <!-- 계속 점을 찍어서 에러걸렸었다. -->
									     <!-- 값이 여러 개 일때만 포문을 돌리고 var="변수" 선언 후 사용해야 한다.-->
									     LICENSE : ${license}
									     </div>
									   </div>
									   </c:if>

	                                </table>

	                            </div>
	                        </div>
	                    </div>

	                </div>
	            </div>
	        </div>
	    </div>
	</div>

</body>
</html>