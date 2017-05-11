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
		body{
			margin-top: 6%;
		}
	</style>


	<style type="text/css">
/* 	#staticMenu { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;} */
	.myBtn {
	  background: transparent;
	  border: 2px solid white;
	  border-radius: 0;
	  color: white;
	  font-size: 15px;
	  font-weight: bold;
	  letter-spacing: 2px;
	  padding: 5px 35px;
	  margin-top: 5px;
	  transition: all 0.4s ease-in-out;
	}
	.myBtn:hover {
	  background: #00c6d7;
	  border-color: transparent;
	}
	body{
	  background-color: #3B3B3B;
	}
	p{
	  color: white;
	}
	h1{
	  color: white;
	}
	h3 {
		color: white;
	}
	.tabContent {
	  padding: 28px;
	  position: relative;
	  transition: all 0.4s ease-in-out;
	}
	.tabContent:hover {
	  background-color: #646464;
	  box-shadow: 0px 2px 8px 0px rgba(50, 50, 50, 0.20);
	}
	i {
		color: white;
	}
	#portfolio {
	  background-color: transparent;
	  text-align: center;
	}
	</style>
	
</head>

<body class="container-fluid">
<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>

<!-- Follow sideNav -->
<!-- <div id="staticMenu"> -->
<!-- 	<a href="#" class="smoothScroll btn btn-default myBtn">버튼</a><br/> -->
<!-- </div> -->

<!-- content -->
<div>
	<div id="portfolio">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="section-title text-center">
					<h1 class="heading bold">자료실</h1>
					<hr>
				</div>
				
				<!-- 검색창 -->
				<form action="${pageContext.request.contextPath}/MaterialSearch" method="post">
				<div class="container">
				    <div class="row">    
				        <div class="col-xs-8 col-xs-offset-2">
						    <div class="input-group">
				                <div class="input-group-btn search-panel">
				                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				                    	<span id="search_concept">전체검색 </span><span class="caret"></span>
				                    </button>
				                    <ul class="dropdown-menu" role="menu">
				                      <li><a href="#0">전체검색</a></li>
				                      <li class="divider"></li>
						                  <c:forEach var="boardCategory" items="${boardCategoryList}">
							             	 <li><a href="${boardCategory.categoryNo}">${boardCategory.categoryName}</a></li>
							              </c:forEach>
				                    </ul>
				                </div>
				                <input type="hidden" name="boardCategoryNo" value="0" id="search_param"><!-- 검색내용을 들고갈 input -->      
				                <input type="text" class="form-control" name="boardContent" placeholder="Search ...">
				                <span class="input-group-btn">
				                    <button class="btn btn-default" id="#btnSearch" type="submit">검색</button>
				                </span>
				            </div>
				        </div>
					</div>
				</div>
				</form>
				
				<!-- ISO section -->
				<div class="iso-section">
					<ul class="filter-wrapper clearfix">
                   		 <li><a href="#" data-filter="*" class="selected opc-main-bg">All</a></li>
                   		 <li><a href="#" class="opc-main-bg" data-filter=".documentForm">DocumentForm</a></li>
                   		 <li><a href="#" class="opc-main-bg" data-filter=".material">Material</a></li>
               		</ul>
               		<div class="iso-box-section wow fadeIn" data-wow-delay="0.5s">
               			<div class="iso-box-wrapper col4-iso-box">
							 
               				 
               				 <div class="iso-box col-lg-3 col-md-4 col-sm-6 all">
               				 	<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=0">
	               				 	<div class="col-lg-12 col-md-12 col-sm-12 fadeInUp tabContent text-center">
										<h3>전체 리스트</h3>
										<hr>
									</div>
               				 	</a>
               				 </div>               				 
               				 
							 <!-- DocumentForm -->
               				 <div class="iso-box col-lg-3 col-md-4 col-sm-6 documentForm">
               				 	<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=1">
	               				 	<div class="col-lg-12 col-md-12 col-sm-12 fadeInUp tabContent text-center">
										<h3>문서 양식 리스트</h3>
										<hr>
									</div>
               				 	</a>
               				 </div>
               				 
               				 <div class="iso-box col-lg-3 col-md-4 col-sm-6 material">
               				 	<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=2">
	               				 	<div class="col-lg-12 col-md-12 col-sm-12 fadeInUp tabContent text-center">
										<h3>교육 자료 리스트</h3>
										<hr>
									</div>
               				 	</a>
               				 </div>
               				 
               				 <div class="iso-box col-lg-3 col-md-4 col-sm-6 material documentForm">
               				 	<a href="${pageContext.request.contextPath}/MaterialAdd">
	               				 	<div class="col-lg-12 col-md-12 col-sm-12 fadeInUp tabContent text-center">
										<h3>자료 추가</h3>
										<hr>
									</div>
               				 	</a>
               				 </div>
               				 
               			</div>
               		</div>

				</div>
			</div>
		</div>
	</div>
</div>


<div class="row" style="margin-top: -5%;">
	<div class="col-sm-4 col-sm-offset-1" style="">
		<br/><h1 class="text-center">문서양식</h1><br/>
		<table class="table" style="color:white">
		
			<thead class="text-center">
				<tr>
					 <th>No</th>
					 <th>제목</th>
					 <th>작성자</th>
					 <th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="board" items="${documentList}">
					<tr onClick="location.href='${pageContext.request.contextPath}/MaterialSelect?boardNo=${board.boardNo}'" style="cursor:pointer;">
						<td>${board.boardNo }</td>
						<td>${board.boardTitle }</td>
						<td>${board.teacherNo }</td>
						<td>${board.boardDay }</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
	</div>
	
	<div class="col-sm-4 col-sm-offset-1" style="">
		<br/><h1 class="text-center">교육자료</h1><br/>
		<table class="table" style="color:white">
		
			<thead class="text-center">
				<tr>
					 <th>No</th>
					 <th>제목</th>
					 <th>작성자</th>
					 <th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="board" items="${educationList}">
					<tr onClick="location.href='${pageContext.request.contextPath}/MaterialSelect?boardNo=${board.boardNo}'" style="cursor:pointer;">
						<td>${board.boardNo }</td>
						<td>${board.boardTitle }</td>
						<td>${board.teacherNo }</td>
						<td>${board.boardDay }</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
	</div>
	
</div>
	
</div>



<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>

<!-- select button -->
<script>
	$(document).ready(function(e){
	    $('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
			var concept = $(this).text(); //해당 버튼의 내용
			$('.search-panel span#search_concept').text(concept); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
			$('.input-group #search_param').val(param);
		});
	});
</script>

</body>
</html>