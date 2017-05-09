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
		#staticMenu p{
		  color: black;
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
		  border-radius: 8px;
		}
		.pageBtn{
			padding: 5px 15px;
			border-radius: 13px;
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
<div id="staticMenu" class="text-center">
	<div>
		<a href="${pageContext.request.contextPath}/Material" class="smoothScroll btn btn-default myBtn">자료실</a>
	</div>
</div>
<div class="section-title text-center">
	<h1 class="heading bold">게시글 상세보기</h1>
	<hr>
</div>

<div class="row">
	<div class="form-group">
	    <div class="row">    
	        <div class="col-xs-8 col-xs-offset-2">
			    <div class="input-group">
	                <div class="input-group-btn search-panel">
	                    <button type="button" class="btn btn-default">
	                    	<span id="category">카테고리 </span>
	                    </button>
	                </div> 
	        		<input type="text" name="boardTitle" class="form-control" value="${board.boardTitle }" style="background-color:white;" readonly>
	            </div>
	        </div>
		</div>
	</div>
	
	<div class="form-group">
	    <div class="row">   
	    	<div class="col-xs-3 col-xs-offset-2">
<%-- 	        	<input type="text" name="boardTeacher" class="form-control" value="첨부파일 : ${board.boardDay }" style="background-color:white;" readonly> --%>
				
				<span>첨부파일 : <a href="">someone@example.com</a></span> 
            </div> 
	        <div class="col-xs-2">
	        	<input type="text" name="boardTeacher" class="form-control" value="작성자 : ${}" style="background-color:white;" readonly>
            </div>
	        <div class="col-xs-2 col-xs-offset-1">
        		<input type="text" name="boardDay" class="form-control" value="작성일 : ${board.boardDay }" style="background-color:white;" readonly>
            </div>
        </div>
	</div>
	
	<div class="form-group">
		<div class="row">    
	        <div class="col-xs-8 col-xs-offset-2">
		    	<div class="input-group col-sm-12">
	                <textarea readonly name="boardContent" style="background-color:white;" rows="15" class="form-control">${board.boardContent }</textarea>
	            </div>
	        </div>
		</div>
	</div>
	 
	<div class="form-group">
		<div class="row">    
	        <div class="col-xs-8 col-xs-offset-2 text-right">
				<button type="button" class="btn btn-default">글목록</button>
	        </div>
		</div>
	</div>

</div>




<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>

</body>
</html>