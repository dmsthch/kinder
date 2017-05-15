<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	
<head>
	
	<!-- Bootstrap core CSS     -->
    <link href="css/JKC/modiassets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="css/JKC/modiassets/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/JKC/modiassets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>

	<!-- 여기부터 -->
	  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	  <script type="text/javascript" src="https://johnny.github.io/jquery-sortable/js/jquery-sortable.js"></script>
	  <link rel="stylesheet" type="text/css" href="https://johnny.github.io/jquery-sortable/css/application.css">
	<!-- 여기까지 draggable -->

	<script>
	$(document).ready(function(){
		$('#takeForm').attr('class','active');
		$('#sidetakeForm').attr('style','background-color:green');
		
	});
	</script>

	<script type="text/javascript">
	
	$(document).ready(function(){
		var oldContainer;
		$("ol.nested_with_switch").sortable({
		  group: 'nested',
		  afterMove: function (placeholder, container) {
		    if(oldContainer != container){
		      if(oldContainer)
		        oldContainer.el.removeClass("active");
		      container.el.addClass("active");
	
		      oldContainer = container;
		    }
		  },
		  onDrop: function ($item, container, _super) {
		    container.el.removeClass("active");
		    _super($item, container);
		  }
		});
		
/*
		온 오프
 		$(".switch-container").on("click", ".switch", function  (e) {
		  var method = $(this).hasClass("active") ? "enable" : "disable";
		  $(e.delegateTarget).next().sortable(method);
		}); 
*/
		
	});
	</script>
	
</head>

<body>
	<div class="wrapper">
		<!-- 사이드메뉴바 BEGIN -->
		<c:import url="./side.jsp"></c:import>
		<!-- 사이드메뉴바 END -->
	   	 <div class="main-panel">
	     	<div class="content">
	     	   <div class="card">
	        	   <div class="container-fluid">
	             	  <div class="row" >
	                  	<div class="col-md-10"  data-background-color="green">
	            			<div class="card-header">
	                        	<h4 class="title">편성표</h4>
	                            <p class="category">편성표를 작성해주세요.</p>
            				</div>
            					<form action="주소" name="이름" method="POST">
	                                <div class="card-content table-responsive">
										<div class="col-md-5" >
										<%-- <%if (session.getAttribute("licenseKindergarten") != null) { %>
										값있음
										<%}else{ %>
										값없음
										<%} %> --%>
									              <!-- <div class="switch-container">
									              온 오프
									                <div class="switch" data-off="OFF" data-on="ON" data-toggle="switch">
									                <span class="switch-track"></span>
									                <span class="switch-thumb" data-on="ON" data-off="OFF"></span>
									                </div>
									                
									              </div> -->
									              
									              <ol class="nested_with_switch vertical">
									              	반
									        	  	<c:forEach var="C" items="${takeClass}">							           	  
									           	    <li class="" style="">
									              	${C.classNo}반
									              	<ol class="">
									              	</ol>
									           		</li>
									           	  	</c:forEach>
								        	 	 </ol>
											</div>
											<!-- "span4" -->
										 	<div class="col-md-5">   
									        	<ol class="nested_with_switch vertical">
									        			교원목록
										             	<c:forEach var="T" items="${takeTeacher}">
												        <li>${T.teacher_id}</li>
												        </c:forEach>
									       		</ol>
											</div>
	                            		</div>
	                            	<button type="submit" name="submit">저장하기</button>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
		  <c:import url="./footer.jsp"></c:import>
	   </div>
	</div>
</body>

</html>
