<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>
<style>
	.radio {margin-left: 30px;}
</style>
<script>
$(document).ready(function(){
	$('#ChildDevelopement').attr('class','active');

	
})

$(document).ready(function(){
	var developmentGroup = ${result.developmentGroup};
	console.log(developmentGroup);
	$('#opserveReference'+developmentGroup).attr('checked',true);
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
							<h4 class="title">${result.developmentTitle}</h4>
						</div>
						<div class="card-content table-responsive ">
							<div class="input-group row">
								<span class="input-group-addon" style="padding-top: 20px;">
									<i class="material-icons">face</i>
								</span>	
							<div class="col-md-2"><input type="text" value="이름 : ${result.kidName}" readonly class="form-control"></div>
							<div class="col-md-2"><input type="text" value="연령 : ${result.classAge}" readonly class="form-control"></div>
							<div class="col-md-2"><input type="text" value="성별 : ${result.kidGender}" readonly class="form-control"></div>
							<div class="col-md-2"><input type="text" value="${result.className}반" readonly class="form-control"></div>
							
							</div>
							<hr>
							<div class="input-group row">
								<span class="input-group-addon" style="padding-top: 20px;">
									<i class="material-icons">perm_identity</i>
								</span>	
							<div class="col-md-2"><input type="text" value="작성자 : ${result.teacherName}" readonly class="form-control"></div>
							<div class="col-md-2"><input type="text" value="ID : ${result.teacherID}" readonly class="form-control"></div>
							<div class="col-md-2"><input type="text" value="관찰일 : ${result.developmentDay}" readonly class="form-control"></div>
							</div>
							
							<hr>
								
							<div class="input-group row">
								<span class="input-group-addon" style="padding-top: 20px;">
									<i class="material-icons">input</i>
								</span>	
								<input type="text" value="문항 ) ${result.opserveContent}" readonly class="form-control">
							</div>
							
							<div class="radio ">
								<label class=""><input type="radio" name="developmentGroup" value="1" id ="opserveReference1" disabled>1수준 : ${result.opserveReference1}</label>
							</div>
							<div class="radio ">
								<label class=""><input type="radio" name="developmentGroup" value="2" id="opserveReference2" disabled>2수준 : ${result.opserveReference2}</label>
							</div>
							<div class="radio ">
							<label class=""><input type="radio" name="developmentGroup" value="3" id="opserveReference3" disabled>3수준 : ${result.opserveReference3}</label>
							</div>
							<hr/>
							사례:
							<div>
								<textarea rows="" cols="" class="form-control"  readonly> ${result.developmentCase}</textarea>
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