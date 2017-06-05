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

	<style type="text/css">
		h6 {
			color : black;
		}
	</style>
	
	<script>
		$(document).ready(function(e){

			var categoryNo = $('#boardCategoryNo').val()-1; //넘어온 카테고리번호 저장
			//검색창에서 카테고리 버튼
		    $('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
				var concept = $(this).text(); //해당 버튼의 내용
				$('.search-panel span#category').text(concept); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
				$('.input-group #boardCategoryNo').val(param);
			});

			$('.search-panel .dropdown-menu').find('a').eq(categoryNo).click(); //카테고리번호 셋팅
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
				<div class="col-md-12">
			        <div class="card">
			        	<div class="card-header" data-background-color="purple">
		                    <h4 class="title">수정</h4>
		                    <p class="category">MaterialModify</p>
		            	</div>
				
						<div class="row">
							<form action="${pageContext.request.contextPath}/MaterialModify" method="post" enctype="multipart/form-data">
								<div class="form-group">
								    <div class="row">    
								        <div class="col-xs-8 col-xs-offset-2">
										    <div class="input-group">
								                <div class="input-group-btn search-panel">
								                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								                    	<span id="category">카테고리 </span><span class="caret"></span>
								                    </button>
								                    <ul class="dropdown-menu" role="menu">
									                    <c:forEach var="boardCategory" items="${boardCategoryList}">
									                    	<li><a href="${boardCategory.categoryNo}">${boardCategory.categoryName}</a></li>
									                    </c:forEach>
								                    </ul>
								                </div>
								                <input type="text" name="boardTitle" value="${board.boardTitle}" class="form-control" placeholder="제목을 입력하세요 ...">
								                <input type="hidden" name="licenseKindergarten" value="${board.licenseKindergarten }" id="licenseKindergarten" readonly>
								                <input type="hidden" name="boardNo" value="${board.boardNo }" id="boardNo" readonly>
								        		<input type="hidden" name="teacherNo" value="${board.teacherNo}" id="teacherNo" readonly>
								        		<input type="hidden" name="boardCategoryNo" value="${board.boardCategoryNo }" id="boardCategoryNo" readonly>  <!-- 카테고리 들고갈 input --> 
								                
								            </div>
								        </div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">    
								        <div class="col-xs-8 col-xs-offset-2">
									    	<div class="input-group col-sm-12">
								                <textarea name="boardContent" rows="15" class="form-control">${board.boardContent}</textarea>
								            </div>
								        </div>
									</div>
								</div>
								
								<!-- 파일 -->
								<div class="form-group">
									<div class="row">    
								        <div class="col-xs-3 col-xs-offset-2">
									    	<div class="input-group col-sm-12">
								                <input type="text" value="file : ${originalName }" readonly >
								            </div>
								        </div>
									</div>
								</div>
								 
								<div class="form-group">
									<div class="row">    
								        <div class="col-xs-8 col-xs-offset-2">
								        	<div class="col-sm-offset-4 col-sm-2">
												<button type="reset" class="btn btn-warning">Reset</button>
								        	</div>
								        	<div class="col-sm-2">
												<button type="submit" class="btn btn-success">Submit</button>
								        	</div>
								        </div>
									</div>
								</div>
							</form>
						
						</div>
						
					</div>
				</div>	<!-- card End -->				
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>