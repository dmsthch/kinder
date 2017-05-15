<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	
	<!-- sideNav -->
	<c:import url="./nav/SideNav.jsp"></c:import>
	
	<!-- 따라다니는 메뉴 -->
	<script src="js/KHS/RefreshStaticMenu.js"></script>
	
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	
	
	<style>
		#staticMenu { 
			margin: 0pt; 
			padding: 0pt;  
			position: absolute; 
			right: 0px; 
			top: 0px;
			position:absolute;
			z-index:9999;
			overflow:hidden;
			border-radius: 13px;
		}
		#staticMenu div{
		  height:100%;
		  width:100%;
		  color:#fff;
		  background:rgba(153,153,153,0.3);
		  padding:10px;
		}
		.myBtn {
 		  background: transparent; 
		  border: 2px solid black;
		  border-radius: 0;
		  color: black;
		  font-size: 15px;
		  font-weight: bold;
		  letter-spacing: 2px;
		  padding: 5px 30px;
		  margin-top: 5px;
		  transition: all 0.4s ease-in-out;
		}
		#body{
			margin-top: 6%;
		}
	</style>
	
	
</head>
<body id="body" class="container-fluid" onload="InitializeStaticMenu();">


<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>
<!-- Follow sideNav -->
<div id="staticMenu" class="text-right">
	<div>
		<a href="${pageContext.request.contextPath}/Material" class="smoothScroll btn btn-default myBtn">자료실</a>
	</div>

</div>

<div class="section-title text-center">
	<h1 class="heading bold">게시글 수정</h1>
	<hr>
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


<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>

<!-- select button -->
<script>
	$(document).ready(function(e){
		var categoryNo = $('#boardCategoryNo').val()-1; //넘어온 카테고리번호 저장
		
	    $('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
			var category = $(this).text(); //해당 버튼의 내용
			$('.search-panel span#category').text(category); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
			$('.input-group #boardCategoryNo').val(param);
		});

		$('.search-panel .dropdown-menu').find('a').eq(categoryNo).click(); //카테고리번호 셋팅
	    
	});
</script>

</body>
</html>