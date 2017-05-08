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
		#staticMenu { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
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
		.pageBtn{
			padding: 5px 15px;
		}
		#body{
			margin-top: 5%;
		}
	</style>
	
</head>
<body id="body" class="container" onload="InitializeStaticMenu();">

<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>
<!-- Follow sideNav -->
<div id="staticMenu" class="text-center">
	<div>
		<a href="${pageContext.request.contextPath}/Material" class="smoothScroll btn btn-default myBtn">자료실</a>
	</div>
	<div>
		<p>현재 페이지 : ${nowPage }</p>
	</div>
	<div>
		<c:if test="${nowPage>1}">
			<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=${categoryNo}&nowPage=${nowPage-1}" class="smoothScroll btn btn-default myBtn pageBtn">&lt 이전</a>
		</c:if>
		<c:if test="${nowPage<lastPage}">
			<a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=${categoryNo}&nowPage=${nowPage+1}" class="smoothScroll btn btn-default myBtn pageBtn">다음 &gt</a>
		</c:if>
	</div>
</div>

<div class="section-title text-center">
	<h1 class="heading bold">
		<c:if test="${categoryNo == 0}">All List</c:if>
		<c:if test="${categoryNo == 1}">Document List</c:if>
		<c:if test="${categoryNo == 2}">Material List</c:if>
	</h1>
	<hr>
</div>

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
						<td>${board.boardCategoryNo}</td>
						<td><a href="#">${board.boardTitle }</a></td>
						<td>${board.teacherNo }</td>
						<td>${board.boardDay }</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
	</div>
</div>

<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>

</body>
</html>