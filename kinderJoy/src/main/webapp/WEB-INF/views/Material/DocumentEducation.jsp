<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	
	<!-- CSS Link -->
	<c:import url="../module/KHS/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="../module/KHS/importJS.jsp"></c:import>

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
			
			// 처음 실행할때 리스트 미리보기 탭에서 전체텝이 출력되는 현상 방지
			$('.nav-tabs-wrapper').find('a').eq(1).click();
			$('.nav-tabs-wrapper').find('a').eq(0).click()
			
			//검색창에서 카테고리 버튼
		    $('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
				var concept = $(this).text(); //해당 버튼의 내용
				$('.search-panel span#search_concept').text(concept); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
				$('.input-group #search_param').val(param);
			});
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
					<div class="text-center"><h1>자료실</h1></div>
				</div><br/>
								
				<div class="row">
					<form action="${pageContext.request.contextPath}/MaterialSearch" method="post">
						<div class="col-xs-8 col-xs-offset-2">
						    <div class="input-group">
				                <div class="input-group-btn search-panel">
				                    <button type="button" class="btn btn-info dropdown-toggle btnSearchForm" data-toggle="dropdown">
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
				                <input type="hidden" name="boardCategoryNo" value="0" id="search_param">  
				                <input type="text" class="form-control" value="" name="boardContent" placeholder="Search ..."><!-- 검색내용을 들고갈 input --> 
				                <span class="input-group-btn">
				                    <button class="btn btn-info btnSearchForm" id="#btnSearch" type="submit">검색</button>
				                </span>
				            </div>
				        </div>
					</div>
					</form>
				</div><br/>
				
				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=0">
							<div class="card card-stats">
								<div class="card-header" data-background-color="orange" style="width=10%;">
									<i class="material-icons">content_copy</i>
								</div>
								<div class="card-content">
									<p class="category">List</p>
									<h6 class="title">전체 리스트</h6>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons text-danger">warning</i> <a href="#pablo">Get More Space...</a>
									</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="col-lg-3 col-md-6 col-sm-6">
						<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=1">
							<div class="card card-stats">
								<div class="card-header" data-background-color="green">
									<i class="material-icons">store</i>
								</div>
								<div class="card-content">
									<p class="category">List</p>
									<h6 class="title">문서 양식 리스트</h6>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons text-danger">warning</i> <a href="#pablo">Get More Space...</a>
									</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="col-lg-3 col-md-6 col-sm-6">
						<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=2">
							<div class="card card-stats">
								<div class="card-header" data-background-color="red">
									<i class="material-icons">store</i>
								</div>
								<div class="card-content">
									<p class="category">List</p>
									<h6 class="title">교육 자료 리스트</h6>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons text-danger">warning</i> <a href="#pablo">Get More Space...</a>
									</div>
								</div>
							</div>
						</a>
					</div>
					
					<div class="col-lg-3 col-md-6 col-sm-6">
						<a href="${pageContext.request.contextPath}/MaterialAdd">
							<div class="card card-stats">
								<div class="card-header" data-background-color="blue">
									<i class="material-icons">content_copy</i>
								</div>
								<div class="card-content">
									<p class="category">Add</p>
									<h6 class="title">자료 추가</h6>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons text-danger">warning</i><a href="#pablo">Get More Space...</a>
									</div>
								</div>
							</div>
						</a>
					</div>
				
				</div><!-- 바로가기 row End -->
				
				<br/>
				<div class="row"> <!-- 자료실 미리보기 -->
					<div class="col-sm-12">
							<div class="card card-nav-tabs">
								<div class="card-header" data-background-color="purple">
									<div class="nav-tabs-navigation">
										<div class="nav-tabs-wrapper">
											<span class="nav-tabs-title">자료실 :</span>
											<ul class="nav nav-tabs" data-tabs="tabs">
												<li class="active">
													<a href="#allList" data-toggle="tab">
														<i class="material-icons">code</i>
														전체 리스트
													<div class="ripple-container"></div></a>
												</li>
												<li class="">
													<a href="#documentList" data-toggle="tab">
														<i class="material-icons">cloud</i>
														문서 양식 리스트
													<div class="ripple-container"></div></a>
												</li>
												<li class="">
													<a href="#educationList" data-toggle="tab">
														<i class="material-icons">cloud</i>
														교육 자료 리스트
													<div class="ripple-container"></div></a>
												</li>
											</ul>
										</div>
									</div>
								</div>

								<div class="card-content">
									<div class="tab-content">
									
										<div class="tab-pane active" id="allList">
											<table class="table table-hover">
												<thead class="text-center">
													<tr>
														 <th>No</th>
														 <th>제목</th>
														 <th>작성자</th>
														 <th>작성일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="board" items="${allList}">
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
										
										<div class="tab-pane active" id="documentList">
											<table class="table">
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
										
										<div class="tab-pane active" id="educationList">
											<table class="table">
												<thead>
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
								</div><!-- content End -->
								
							</div>
						</div>
				
				
				</div> <!-- 자료실 미리보기 row End -->
				
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>