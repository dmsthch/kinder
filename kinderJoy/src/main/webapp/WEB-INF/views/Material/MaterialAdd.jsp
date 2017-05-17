<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="../module/importJS.jsp"></c:import>
	
	<script src="js/KHS/hsCustom.js"></script>

	<style type="text/css">
		h6 {
			color : black;
		}
	</style>
	
	<script>
		$(document).ready(function(e){
			
			//검색창에서 카테고리 버튼
		    $('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
				var concept = $(this).text(); //해당 버튼의 내용
				
				$('.search-panel span#search_concept').text(concept); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
				$('.input-group #search_param').val(param);
			});
			
			//사이드바 active속성 주기
		    setSidenavActive(4);
		    
		    
		});
	</script>
	
</head>

<body class="container-fluid">


<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>


<div class="wrapper">
	
	<!-- sideNav -->
    <c:import url="../module/KHS/MaterialSideNav.jsp"></c:import>

    <div class="main-panel">
		<div class="content">
			<div class="container-fluid">
			
				<div class="row">
					<div class="text-center"><h1>자료 추가</h1></div>
				</div><br/>
				
				<div class="row">
					<form action="${pageContext.request.contextPath}/MaterialAdd" method="post" enctype="multipart/form-data">
						
						<div class="form-group">
						    <div class="row">    
						        <div class="col-xs-8 col-xs-offset-2">
								    <div class="input-group">
						                <div class="input-group-btn search-panel">
						                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						                    	<span id="search_concept">카테고리 </span><span class="caret"></span>
						                    </button>
						                    <ul class="dropdown-menu" role="menu">
								                  <c:forEach var="boardCategory" items="${boardCategoryList}">
									             	 <li><a href="${boardCategory.categoryNo}">${boardCategory.categoryName}</a></li>
									              </c:forEach>
						                    </ul>
						                </div>
						                <input type="hidden" name="boardCategoryNo" value="0" id="search_param">  
						                <input type="text" class="form-control" value="" name="boardTitle" placeholder="Title ..."><!-- 검색내용을 들고갈 input --> 
						                
						            </div>
						        </div>
							</div>
						</div>
						<hr/>
						<div class="form-group">
							<div class="row">    
						        <div class="col-xs-8 col-xs-offset-2">
							    	<div class="input-group col-sm-12">
						                <textarea name="boardContent" rows="15" class="form-control"></textarea>
						            </div>
						        </div>
							</div>
						</div>
						<!-- 파일 -->
						<div class="row">    
					        <div class="col-xs-8 col-xs-offset-2">
						    	<div class="input-group col-sm-12">
					                <input type="file" name="files">
					            </div>
					        </div>
						</div>
						 
						<div class="form-group">
							<div class="row">    
						        <div class="col-xs-8 col-xs-offset-2">
						        	<div class="col-sm-offset-4 col-sm-2">
										<button type="reset" class="btn btn-default">Reset</button>
						        	</div>
						        	<div class="col-sm-2">
										<button type="submit" class="btn btn-default">Submit</button>
						        	</div>
						        </div>
							</div>
						</div>
					</form>
				
				</div>							
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>