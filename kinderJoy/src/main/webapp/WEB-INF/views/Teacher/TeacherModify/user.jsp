<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
	<!-- JS Link -->
<<<<<<< HEAD
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
=======
<%-- 	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	 --%>
	<title>1TEAM</title>
>>>>>>> branch 'master' of https://github.com/dmsthch/kinder.git

	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	
	<script>
	$(document).ready(function(){
		$('#kyo').attr('class','active');
		$('#sidekyo').attr('style','background-color:#3DB7CC');	
	});
	</script>
	
</head>

<body>

	<div class="wrapper">
	
	<!-- 사이드메뉴바 BEGIN -->
	<c:import url="./side.jsp"></c:import>
	<!-- 사이드메뉴바 END -->
	
	
	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                
	                <!-- 가로크기 -->
	                    <div class="col-md-12">
	                    
	                     <!-- 상자모양 설정 현재는 카드 -->
	                        <div class="card">
	                        
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">회원 정보 수정</h4>
									<p class="category">자신의 회원정보를 수정하세요.</p>
	                            </div>
	                            <div class="card-content">
	                                <form id="updateTeacherForm" action="${pageContext.request.contextPath}/teacherUpdate" method="post">
	                                    <div class="row">
	                                    
	                                    <!-- 인풋상자의 상 하 간격조절 -->
	                                        <div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label">아이디</label>
													<input type="text" class="form-control" value="${kyoteacher.teacherId}" readonly>
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">이름</label>
													<input type="text" class="form-control" name="teacherName" value="${kyoteacher.teacherName}" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">핸드폰 번호</label>
													<input type="text" class="form-control" name="teacherPhone" value="${kyoteacher.teacherPhone}">
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">권한</label>
													<input type="text" class="form-control" name="teacherLevel" value="${kyoteacher.teacherLevel}">
												</div>
	                                       </div>
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">add</label>
													<input type="text" class="form-control" value="${kyoteacher.teacherAddDay}" readonly>
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-12">
												<div class="form-group label-floating">
													<label class="control-label">라이선스</label>
													<input type="text" class="form-control" value="${kyoteacher.licenseKindergarten}" readonly>
												</div>
	                                        </div>
	                                    </div>
										
	                                    <div class="row">
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">은행</label>
													<input type="text" class="form-control" name="teacherBank" value="${kyoteacher.teacherBank}">
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">계좌</label>
													<input type="text" class="form-control" name="teacherAccount" value="${kyoteacher.teacherAccount}">
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">호봉</label>
													<input type="text" class="form-control" name="teacherPaystep" value="${kyoteacher.teacherPaystep}">
												</div>
	                                        </div>
	                                    </div>

	                                    <button type="submit" class="btn btn-fault">프로필 수정하기</button>
	                                    <div class="clearfix"></div>
	                                </form>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>    
		<c:import url="./footer.jsp"></c:import>
	    </div>
	</div>
</body>

</html>
