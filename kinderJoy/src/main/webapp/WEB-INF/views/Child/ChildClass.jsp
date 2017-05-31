<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ChildList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- navbar -->
<c:import url="../Child/nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>

 <style>
	 #body{
	 	margin-top: 5%;
	 }
 </style>
 
</head>

<body id="body">



<script>
 $(document).ready(function(){
		//네비바 색주기
	
		$('#ChildClass').attr('class','active');

})
</script>
<div class="col-md-10 col-sm-offset-2">
 			<div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="green">
	                                <h4 class="title">반 리스트</h4>
	                                <p class="category">전체 반</p>
	                            </div>
	                         		
	                         		<table class="table table-striped">
	                                    <thead class="text-primary">
	                                    	<th>반이름</th>
							                <th>운영년도</th>
							                <th>나이</th>
							                <th>반편성</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach var="c" items="${list}">
	                                        	<tr>
		                                        	<td><a href="${pageContext.request.contextPath}/viewClass?classNo=${c.classNo}">${c.className}</a></td>
								                    <td>${c.classYear}</td>
								                    <td>${c.classAge}</td>
								                    <td><a href="${pageContext.request.contextPath}/testSelect?classAge=${c.classAge}&classNo=${c.classNo}"><button>반편성</button></a></td>
	                                        	</tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>	
					</div>
				</div>

    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/ChildClass?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/ChildClass?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/ClassAdd">반입력</a>
    </div>
</div>


</body>
</html>