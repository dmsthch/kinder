<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="apple-touch-icon" sizes="76x76" href="css/LCR/EducationProject/assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="css/LCR/assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Material Dashboard by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	
<style>

.dropdown-submenu{position:absolute;}
 
.dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px; display: none; } 
 
.dropdown-submenu:hover>.dropdown-menu{display:block;position:absolute;}
 
.dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#cccccc;margin-top:5px;margin-right:-10px;}
 
.dropdown-submenu:hover>a:after{border-left-color:#ffffff;}
 
.dropdown-submenu.pull-left{float:none;}.dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;} 
.sidebar.sidebar{
	z-index:5555;
}
.components-page.components-page{
 z-index:10;
}
</style>
<script>
$(document).ready(function(){
	
	//반 정보 가져오기
	var childClass = [];
	$.ajax({
		url : "${pageContext.request.contextPath}/educationProjectGetClassInfo",
		type : 'POST',
		dataType: 'JSON',
		async: false,
		success : function(data){
			//console.log(data);
			childClass = data;
	},error: function(XMLHttpRequest, textStatus, errorThrown) { 
	     console.log("Status: " + textStatus);
	},timeout: 3000
	}); 

	for(i=0; i<childClass.length; i++){
		
		var classString = '<li><a href="${pageContext.request.contextPath}/viewClass?classNo='+childClass[i].classNo+'">' + childClass[i].className + '</a></li>';
		
		
		if(childClass[i].classAge == 3){
			$('#day .3').append(classString);
			
		}
		if(childClass[i].classAge == 4){
			$('#day .4').append(classString);
			
		}
		if(childClass[i].classAge == 5){
			$('#day .5').append(classString);
			
		}
	}

})
</script>

</head>
<body class="components-page nav" style="">

	    <div class="sidebar" data-color="blue">

			<div class="logo" style="padding-bottom: 51px;">
				<a href="http://www.creative-tim.com" class="simple-text"></a>
			</div>

	    	<div class="sidebar-wrapper" style="overflow: visible;">
	            <ul class="nav ">
            	   <li class="navChildList" id="ChildHome">
	                   <a href="${pageContext.request.contextPath}/ChildList" class="smoothScroll">
	                        <i class="material-icons">dashboard</i>
	                        
	                        <p>메인화면</p>
	                    </a>
	                </li>
	                
	                <!-- <li class="active"> -->
	                <li class="navChildClass" id="ChildClass">
	                    <a href="${pageContext.request.contextPath}/ChildClass">
	                        <i class="material-icons">person</i>
	                        <p>전체 반</p>
	                    </a>
	                </li>

	                <!-- 테스트 -->
	                <li class="dropdown">
	                	
	                    <a class="dropdown-toggle" type="button" data-toggle="dropdown" style="cursor:pointer;">
	                        <i class="material-icons">content_paste</i>
	                        <p>전체반보기테스트 <span class="caret"></span></p>
                        </a>
						    <ul class="pull-right dropdown-menu navEducationProject" id="day" style="margin-right:-62%; margin-top:-20%" >
						    	
						    	
						    	<c:forEach begin="3" end="5" var="age"> <!-- 요놈!! -->
							    	<li class="dropdown-submenu">
							    		<a href="${pageContext.request.contextPath}/ChildSelectClass?age=${age}"> ${age}세 </a>
								    	<ul class="dropdown-menu ${age}" style="margin-left:1%">
								    		<!-- <li><a href="#" class="">test0001</a></li> -->
								    	</ul>
							    	</li>
						    	</c:forEach>
						    </ul>
	                </li>
	                <!-- 테스트끝 -->
	                <li id="ChildCommute">
	                    <a href="${pageContext.request.contextPath}/ChildCommute">
	                        <i class="material-icons">person</i>
	                        <p>유아 출석</p>
	                    </a>
	                </li>
	            </ul>
	    	</div>
	    </div>
	    
	    <!--   Core JS Files   -->




	<!-- Material Dashboard javascript methods -->
<!-- 	<script src="css/LCR/EducationProject/assets/js/material-dashboard.js"></script> -->


	    

  </div><!-- /.container-fluid -->
</nav>