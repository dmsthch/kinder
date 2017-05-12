<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>

<html>
<head>

	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>1TEAM</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="css/JKC/modiassets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Material Dashboard CSS    -->
    <link href="css/JKC/modiassets/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/JKC/modiassets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
	
	<script src="js/jquery.js"></script>
	
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
	                                <form>
	                                    <div class="row">
	                                    
	                                    <!-- 인풋상자의 상 하 간격조절 -->
	                                        <div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label">아이디</label>
													<input type="text" class="form-control" value="${kyoteacher.teacher_id}" readonly>
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">이름</label>
													<input type="text" class="form-control" value="${kyoteacher.teacher_name}" >
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">핸드폰 번호</label>
													<input type="text" class="form-control" value="${kyoteacher.teacher_phone}">
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">권한</label>
													<input type="text" class="form-control" value="${kyoteacher.teacher_level}">
												</div>
	                                       </div>
	                                        <div class="col-md-6">
												<div class="form-group label-floating">
													<label class="control-label">add</label>
													<input type="text" class="form-control" value="${kyoteacher.teacher_add_day}">
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-12">
												<div class="form-group label-floating">
													<label class="control-label">라이선스</label>
													<input type="text" class="form-control" value="${kyoteacher.license_kindergarten}">
												</div>
	                                        </div>
	                                    </div>
										
	                                    <div class="row">
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">은행</label>
													<input type="text" class="form-control" value="${kyoteacher.teacher_bank}">
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">계좌</label>
													<input type="text" class="form-control" value="${kyoteacher.teacher_account}">
												</div>
	                                        </div>
	                                        <div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">호봉</label>
													<input type="text" class="form-control" value="${kyoteacher.teacher_paystep}">
												</div>
	                                        </div>
	                                    </div>

	                                    <div class="row">
	                                        <div class="col-md-12">
	                                            <div class="form-group">
	                                                <!-- <label>About Me</label> -->
													<div class="form-group label-floating">
									    				<label class="control-label"> Lamborghini Mercy, Your chick she so thirsty, I'm in that two seat Lambo.</label>
								    					<textarea class="form-control" rows="5"></textarea>
		                        					</div>
	                                            </div>
	                                        </div>
	                                    </div>

	                                    <button type="submit" class="btn btn-primary pull-right">프로필 수정하기</button>
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

	<!--   Core JS Files   -->
	<script src="js/JKC/modiassets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
	<script src="js/JKC/modiassets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/JKC/modiassets/js/material.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="js/JKC/modiassets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="js/JKC/modiassets/js/bootstrap-notify.js"></script>

	<!-- Material Dashboard javascript methods -->
	<script src="js/JKC/modiassets/js/material-dashboard.js"></script>

	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="js/JKC/modiassets/js/demo.js"></script>

</html>
