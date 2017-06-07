<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>라이선스</title>

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
		$('#license').attr('class','active');
		$('#sideLicense').attr('style','background-color:#3DB7CC');
	});
	</script>
	
</head>
<body>




<div class="wrapper">

	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">라이선스</h4>
	                                <p class="category">라이선스를 발급받으세요!</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
	                                <table class="table">

		이걸 hide
		<form action="${pageContext.request.contextPath}/licenseForm" method="POST">
		
		<div class="form-group">
		<input type="text" class="teacherName form-control" name="licenseKindergartenName" id="licenseKindergartenName" placeholder="유치원명을 입력하세요.">
		</div>
	
	
		<div class="form-group">
		<input type="text" class="form-control" id="licenseAddress" name="licenseAddress" placeholder="주소를 입력하세요.">
		</div>	
		
		<div class="form-group">
		<input type="text" class="form-control" id="licensePhone" name="licensePhone" placeholder="유치원 연락처를 입력하세요">
		</div>
		
		<div class="col-sm-10">
		<input type="submit" value="작성 완료 후 클릭 시 라이선스가 부여됩니다.">
		</div>
		</form>

										이걸 show
										<div style="display:none">
										
										<div class="form-group">
										<label class="control-label col-sm-2">발급된 라이선스 :</label>
									      <div class="col-sm-10">              
									        <input type="submit" id="licensecheckbutton" value="라이선스"/>
									      </div>
									      
									      <c:if test="${null != licenseKey}">
									      <c:out value="발급된 라이선스 : ${licenseKey}"></c:out>
									      </c:if>      		
									
									    </div>
	                                    </div>
	                                    
	                                    
	                                    
	                                </table>

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