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
	<!-- 따라다니는 메뉴 -->
	<script src="js/KHS/RefreshStaticMenu.js"></script>
	<script src="js/KHS/hsCustom.js"></script>
	
	<style type="text/css">
		h6 {
			color : black;
		}
		#staticMenu { 
			margin: 30pt; 
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
		.myBtn.myBtn {
 		  background: transparent;
		  border-radius: 0;
		  color: black;
		  font-size: 20px;
		  font-weight: bold;
		  letter-spacing: 2px;
		  padding: 0px 15px;
		  margin-top: 5px;
		  transition: all 0.4s ease-in-out;
		  border-radius: 8px;
		}
	</style>
	
	<script>
	
		$(document).ready(function(){
			
			//사이드바 active속성 주기
			var categoryNo = $('#categoryNo').val();
			if(categoryNo == 0){
				setSidenavActive(1);
			}else if(categoryNo == 1){
				setSidenavActive(2);
			}else if(categoryNo == 2){
				setSidenavActive(3);
			}
			
		});
	
	</script>
	
</head>

<body class="container-fluid" onload="InitializeStaticMenu();">
<input type="hidden" id="categoryNo" value="${categoryNo }">

<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>
<!-- Follow sideNav -->
<div id="staticMenu" class="text-center">
	<div>
		<br/>
		<p>현재 페이지 : ${nowPage }</p>
	</div>
	<div>
		<c:if test="${nowPage>1}">
			<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=${categoryNo}&nowPage=${nowPage-1}" class="smoothScroll btn btn-default myBtn pageBtn">&lt </a>
		</c:if>
		<c:if test="${nowPage<lastPage}">
			<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=${categoryNo}&nowPage=${nowPage+1}" class="smoothScroll btn btn-default myBtn pageBtn"> &gt</a>
		</c:if>
	</div>
</div>

<div class="wrapper">
	
	<!-- sideNav -->
    <c:import url="../module/KHS/MaterialSideNav.jsp"></c:import>

    <div class="main-panel">
		<div class="content">
			<div class="container-fluid">
			
				<div class="row">
					<div class="text-center">
						<h1>
							<c:if test="${categoryNo == 0}">All List</c:if>
							<c:if test="${categoryNo == 1}">Document List</c:if>
							<c:if test="${categoryNo == 2}">Material List</c:if>
						</h1>
					</div>
				</div><br/>
				
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<table class="table table-hover">
						
							<thead>
								<tr>
									 <th>No</th>
									 <th>카테고리</th>
									 <th>제목</th>
									 <th>작성자</th>
									 <th>작성일</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="board" items="${getList}">
									<tr>
										<td>${board.boardNo }</td>
										<td>
											<c:forEach var="category" items="${category}">
												<c:if test="${category.categoryNo == board.boardCategoryNo}">${category.categoryName}</c:if>
											</c:forEach>	
										</td>
										<td><a href="${pageContext.request.contextPath}/MaterialSelect?boardNo=${board.boardNo}">${board.boardTitle }</a></td>
										<td>${board.teacherNo }</td>
										<td>${board.boardDay }</td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>
					</div>
				
				</div>							
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>