<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!--   
	<style>
	    body {
	      padding-top: 70px;
	    }
	</style> -->

		<!-- draggable -->
		<script type="text/javascript" src="https://johnny.github.io/jquery-sortable/js/jquery-sortable.js"></script>
		<link rel="stylesheet" type="text/css" href="https://johnny.github.io/jquery-sortable/css/application.css">
		<!-- draggable -->
	
<style>
       #container {
           margin-top: 20px;
       }

       #container .ui-droppable { }

       ul { margin: 0; }
       hr { margin: 5px 0; }
       .btn-block { padding-left: 5px; padding-right: 5px; }

       #selectable .ui-selecting { background: #FECA40; }
       #selectable .ui-selected { background: #F39814; color: white; }

       .badge.badge-drag { position: absolute; top: -7px; right: -7px; }

       i.move {cursor: move;}

   </style>
		
			<script>
			$(document).ready(function(){
				$('#takeForm').attr('class','active');
				$('#sidetakeForm').attr('style','background-color:green');	
			});
			</script>
			
			<script>
			$(document).ready(function(){
			var oldContainer;
				$("ol.jkc").sortable({
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
				
					$("ol.simple_with_no_drop").sortable({
					  group: 'no-drop',
					  drop: false
					});
				
					$("ol.simple_with_no_drag").sortable({
					  group: 'no-drop',
					  drag: false
					});	
			});
			</script>

</head>
<body>

<div class="wrapper" id="container">


<div class="main-panel">
	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12" data-background-color="green">
	                        <div class="card">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">반 배정</h4>
	                                <p class="category">반에 선생님을 배정시키세요.</p>
	                            </div>                            
	<div class="card-content table-responsive">                         
	                            
	<select name="selValue" data-live-search="true" class="selectpicker">
	<c:forEach var="TC" items="${takeClass}">      
	<c:if test="${TC.classAge == 3}">
	   <option value="">${TC.className} [${TC.classAge}]</option>
	</c:if>
	</c:forEach>
	</select>
	
	<select name="selValue" data-live-search="true" class="selectpicker">
	<c:forEach var="TC" items="${takeClass}">               
	<c:if test="${TC.classAge == 4}">
		<option value="">${TC.className} [${TC.classAge}]</option>
	</c:if>
	</c:forEach>
	</select>
	
	<select name="selValue" data-live-search="true" class="selectpicker">
	<c:forEach var="TC" items="${takeClass}">                      
	<c:if test="${TC.classAge == 5}">
		<option value="">${TC.className} [${TC.classAge}]</option>
	</c:if>
	</c:forEach>
	</select>
	
	<select id="lunchBegins" class="selectpicker" data-live-search="true" title="선생">
		<c:forEach var="TT" items="${takeTeacher}">
			<option>${TT.teacherName}</option>
		</c:forEach>
	</select>
	
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
		<!-- 사이드메뉴바 END -->

		<c:import url="./footer.jsp"></c:import>


</body>
</html>
