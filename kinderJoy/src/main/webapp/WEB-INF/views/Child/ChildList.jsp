<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ChildList</title>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>
	

 
<script>
$(document).ready(function(){
	$('#ChildList').attr('class','active');

	
})
	
</script>
</head>

<body class="components-page">
<div class="wrapper">
	<div class="main-panel">
		<div class="content">
	            <div class="container-fluid">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="green">
	                                <h4 class="title">유아 리스트</h4>
	                                <p class="category">우리 반</p>
	                            </div>
	                         		<div class="card-content table-responsive">
  									 <table class="table table-hover table-striped">
	                                    <thead class="text-second">
	                                    	<tr>
		                                    	<th>이름</th>
	                							<th>생년월일</th>
			                					<th>주소</th>
								                <th>보호자번호</th>
								                <th>보호자예비번호</th>
								                <th>주의사항</th>
								                <th>성별</th>
								                <th>통학방법</th>
								                <th>입학일</th>
							                </tr>
	                                    </thead>
	                                    <tbody>
	                                    
	                                    	<c:forEach var="c" items="${list}">
	                                        	<tr>
		                                        	<td><a href="${pageContext.request.contextPath}/ChildModify?kidNo=${c.kidNo}">${c.kidName}</a></td>
								                    <td>${c.kidBirth}</td>
								                    <td>${c.kidAddress}</td>
								                    <td>${c.kidProtectorPhone}</td>
								                    <td>${c.kidProtectorPhoneReserve}</td>
								                    <td>${c.kidPrecautions}</td>
								                    <td>${c.kidGender}</td>
								                    <td>${c.kidCommuting}</td>
								                    <td>${c.kidEntranceDay}</td>
	                                        	</tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>
	                             <ul  class="pager">
							        <c:if test="${currentPage > 1}">
							            <li class="previous"><a href="${pageContext.request.contextPath}/ChildList?currentPage=${currentPage-1}">이전</a></li>
							        </c:if>
							        <c:if test="${currentPage < lastPage}">
							            <li class="next"><a href="${pageContext.request.contextPath}/ChildList?currentPage=${currentPage+1}">다음</a></li>
							        </c:if>
							    </ul>
							    <div class="center">
							        <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildAdd">유아 등록</a>
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