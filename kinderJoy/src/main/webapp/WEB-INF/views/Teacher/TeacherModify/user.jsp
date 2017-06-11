<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
<title>내 프로필</title>
	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- 사이드메뉴바 BEGIN -->
	<c:import url="./side.jsp"></c:import>
	
	<script>
	$(document).ready(function(){
		$('#kyo').attr('class','active');
		$('#sidekyo').attr('style','background-color:#3DB7CC');	
	});
	</script>


<!-- 가이드 여기도 문제 없음-->
	
	<link rel="stylesheet" href="css/pageguide.min.css" />
    <style type="text/css">
        body {
            font-family: Helvetica, Arial, sans-serif;
        }	/* 사이즈조절 */
        .wrapper {
            margin: 0 auto;
            width: 100%;
            max-width: auto;	/* 바디 부분 가로크기 조절 */
        }
        .data-block {
            width: 100%;
            min-height: auto; /* 가이드 부분 사이드 부분 세로크기 조절 */
        }
        .data-block img {
            width: 100%;
        }
        #titlePageGuide {
            display: none;
        }
    </style>
<!-- 가이드 여기도 문제 없음 -->

</head>

<body>

	<div class="wrapper">
	
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
												<div class="form-group label-floating data-block elementA">
													<label class="control-label">아이디</label>
													<input type="text" class="form-control" value="${kyoteacher.teacherId}" readonly>
												</div>
	                                        </div>
    
	                                        
	                                        
	                                        <div class="col-md-3">
												<div class="form-group label-floating data-block elementB">
													<label class="control-label">이름</label>
													<input type="text" class="form-control" name="teacherName" value="${kyoteacher.teacherName}" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating data-block elementC">
													<label class="control-label">핸드폰 번호</label>
													<input type="text" class="form-control" name="teacherPhone" value="${kyoteacher.teacherPhone}">
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-6">
												<div class="form-group label-floating data-block elementD">
													<label class="control-label">권한</label>
													<input type="text" class="form-control" name="teacherLevel" value="${kyoteacher.teacherLevel}">
												</div>
	                                       </div>
	                                        <div class="col-md-6">
												<div class="form-group label-floating data-block elementE">
													<label class="control-label">add</label>
													<input type="text" class="form-control" value="${kyoteacher.teacherAddDay}" readonly>
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-12">
												<div class="form-group label-floating data-block elementF">
													<label class="control-label">라이선스</label>
													<input type="text" class="form-control" value="${kyoteacher.licenseKindergarten}">
												</div>
	                                        </div>
	                                    </div>
										
	                                    <div class="row">
	                                        <div class="col-md-4">
												<div class="form-group label-floating data-block elementG">
													<label class="control-label">은행</label>
													<input type="text" class="form-control" name="teacherBank" value="${kyoteacher.teacherBank}">
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating data-block elementH">
													<label class="control-label">계좌</label>
													<input type="text" class="form-control" name="teacherAccount" value="${kyoteacher.teacherAccount}">
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating data-block elementI">
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
	    
    	      <ul id="tlyPageGuide" data-tourtitle="가이드를 시작하려면 클릭하세요.">
    	      
    	      
    	      
  
              <li class="tlypageguide_right" data-tourtarget=".userSide">
                사이드 교원 프로필 설명
              </li>
    	      
    	      
    	      
              <li class="tlypageguide_TOP" data-tourtarget=".elementA">
                바디 교원 프로필의 아이디 설명
              </li>
              
              
              <li class="tlypageguide_LEFT" data-tourtarget=".elementB">
                바디 교원 프로필의 이름 설명
              </li>
              
              <li class="tlypageguide_BOTTOM" data-tourtarget=".elementC">
                바디 교원 프로필의 핸드폰 번호 설명
              </li>
              
              <li class="tlypageguide_right" data-tourtarget=".elementD">
                바디 교원 프로필의 권한 설명
              </li>
              
              <li class="tlypageguide_right" data-tourtarget=".elementE">
                바디 교원 프로필의 생성일 설명
              </li>
              
              <li class="tlypageguide_right" data-tourtarget=".elementF">
                바디 교원 프로필의 라이선스 설명
              </li>
              
              <li class="tlypageguide_right" data-tourtarget=".elementG">
                바디 교원 프로필의 은행 설명
              </li>
              
              <li class="tlypageguide_right" data-tourtarget=".elementH">
                바디 교원 프로필의 계좌 설명
              </li>
              
              <li class="tlypageguide_right" data-tourtarget=".elementI">
                바디 교원 프로필의 호봉 설명
              </li>
              
                          
              </ul>
	    
	</div>
	
<!-- 페이지가이드 -->
	<script type="text/javascript" src="js/pageguide.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            var pageguide = tl.pg.init();
        });
    </script>
<!-- 페이지가이드 -->   
    
</body>

</html>
