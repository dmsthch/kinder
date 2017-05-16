<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	
		<!-- draggable -->
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="https://johnny.github.io/jquery-sortable/js/jquery-sortable.js"></script>
		<link rel="stylesheet" type="text/css" href="https://johnny.github.io/jquery-sortable/css/application.css">
		<!-- draggable -->
		
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
					
					$("#send").click(function(){
			            $.ajax({
			                url: "${pageContext.request.contextPath}/saveTakeForm",
			                method: "POST",
			                data: {text: $("#input").val(), data: $("ul.myList li.active").attr("data-id"),
			                success: function(result){
			                    alert(result);
			                }
			            });
			        });
			    });
					
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
            				<input type="text" name="input" id="input" />
                                <div class="card-content table-responsive">
									<div class="col-md-5" >
							            <c:forEach begin="3" end="5" var="age">
								            <ol class="simple_with_no_drag vertical">
								              	<li>
								              	${age}살
									            	<c:forEach var="C" items="${takeClass}">
											            <c:if test="${C.classAge == age}">
												            <ol class="jkc vertical">
												           	    <li class="" style="">
													              	<ol class="">
													              		${C.classNo}반
													              	</ol>
												           		</li>
											        	 	</ol>
										        	 	</c:if>
								        	 		</c:forEach>
								        	 	</li>
							        	 	</ol>
						        	 	</c:forEach>
									</div>
									 	<div class="col-md-5">
								        	<ol class="jkc vertical">교원목록
								             	<c:forEach var="T" items="${takeTeacher}">
										        	<li><i class="icon-move"></i>${T.teacher_name}</li>
										        </c:forEach>
								       		</ol>
										</div>
	                            	</div>
                            	<input type="button" value="저장하기" id="send" />
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