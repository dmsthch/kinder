<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		.btnSearchForm.btnSearchForm {
			margin-top: 10%;
			background-color: rgba(189,189,189,0.4);
			border-bottom: 1px solid #BD24A9;
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

		    $('[data-toggle=tab]').eq(0).click();
		    
		});
	</script>
	
</head>

<body class="container-fluid">


<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>


<div class="wrapper">

    <c:import url="../module/KHS/MaterialSideNav.jsp"></c:import>

    <div class="main-panel">
		<div class="content">
			<div class="container-fluid">
			
				<div class="row">
					<div class="text-center"><h1>Search Page</h1></div>
				</div><br/>
											
				<br/>
				<div class="row"> <!-- 자료실 미리보기 -->
					<div class="col-sm-12">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="purple">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">자료실 :</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
											
												<c:forEach var="searchCat" items="${pageName }">
												
													<li class="">
														<a href="${searchCat}" data-toggle="tab">
															<i class="material-icons">code</i>
															${fn:substringAfter(searchCat,'#')}
														<div class="ripple-container"></div></a>
													</li>
														
												</c:forEach>
																				
											</ul>
										</div>
									</div>
								</div>

								<div class="card-content">
									<div class="tab-content">
									
										<c:forEach var="list" varStatus="status" items="${allList }">
										
											<div class="tab-pane" id="${fn:substringAfter(pageName[status.index],'#')}">
												<table class="table table-hover">
													<thead class="text-center">
														<tr>
															 <th>No</th>
															 <th>제목</th>
															 <th>작성자</th>
															 <th>작성일</th>
														</tr>
													</thead>
													<c:forEach var="board" items="${list}">
														<tr>
															<td>${board.boardNo }</td>
															<td>
																<c:forEach var="category" items="${getCategory}">
																	<c:if test="${category.categoryNo == board.boardCategoryNo}">${category.categoryName}</c:if>
																</c:forEach>	
															</td>
															<td><a href="${pageContext.request.contextPath}/MaterialSelect?boardNo=${board.boardNo}">${board.boardTitle }</a></td>
															<td>${board.teacherNo }</td>
															<td>${board.boardDay }</td>
														</tr>
													</c:forEach>
												</table>
											</div>
										
										</c:forEach>
										
									</div>
								</div><!-- content End -->
								
							</div>
						</div>
				
				
				</div>  <!-- tab row End -->
				
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>