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
		                    <h4 class="title">상세보기</h4>
		                    <p class="category">MaterialSelect</p>
		            	</div>
				
						<div class="row">
							<div class="form-group">
							    <div class="row">    
							        <div class="col-xs-8 col-xs-offset-2">
									    <div class="input-group">
							                <div class="input-group-btn search-panel">
							                    <button type="button" class="btn btn-default">
							                    	<span id="category">${category } </span>
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
										<span>첨부파일 : 
											<c:if test="${boardData == null}">없음</c:if>
											<c:if test="${boardData != null }">
												<a href="${pageContext.request.contextPath}/FileDownload?dataNo=${board.dataNo}">${boardData.dataOriginalName }</a>
											</c:if>
										</span> 
						            </div> 
							        <div class="col-xs-2">
							        	<input type="text" name="boardTeacher" class="form-control" value="작성자 : ${teacher.teacherName}" style="background-color:white;" readonly>
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
										<a href="${pageContext.request.contextPath}/MaterialDocumnetList"><button type="button" class="btn btn-default">글목록</button></a>
							        	<a href="${pageContext.request.contextPath}/MaterialModify?boardNo=${board.boardNo}"><button type="button" class="btn btn-success">글수정</button></a>
							        	<a href="${pageContext.request.contextPath}/MaterialDelete?boardNo=${board.boardNo}&teacherName=${teacher.teacherName}"><button type="button" class="btn btn-danger">글삭제</button></a>
							        </div>
								</div>
							</div>
						
						</div>	
										
					</div>
				</div>
			
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>