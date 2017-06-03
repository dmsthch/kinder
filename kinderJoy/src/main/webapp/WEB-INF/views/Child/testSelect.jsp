<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="../module/importJS.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>

<script>
$(document).ready(function(){
	$(document).on('click','#right',function(){
		var value;
		var name;
		var $before = $('.before:selected');
		console.log($before);
		
		if($before.length!=0){
		value = $before.val();
		name=$before.attr('id');
		$before.remove();
		$('#after').append('<option class="after" value="'+value+'" id="'+name+'">'+name+'</option>');
		}
	})
	
	$(document).on('click','#left',function(){
		var value;
		var name;
		var $after = $('.after:selected');
		console.log($after+"<<<<after");
		if($after.length!=0){
		value = $after.val();
		name=$after.attr('id');
		$after.remove();
		$('#before').append('<option class="before" value="'+value+'" id="'+name+'">'+name+'</option>');
		}
	})
	
	$('#testSelectButton').click(function(){
		var options = [];
		options = $('#after option');
		var kidNo = [];
		console.log(options.length + "leng");
		for(var i=0;i<options.length; i++){
			kidNo[i] = $('#after option').eq(i).attr('value');
		}
		console.log(kidNo);
		location.href ="${pageContext.request.contextPath}/ChildSelectClass?kidNo="+kidNo+"&classNo="+${classNo}; 
	 	
	})
	
})

</script>
    
</head>
 
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
		
			<div class="container-fluid">
    
    <div id="wrap" class="container">
    	       
   
           <form id="testSelectForm" action="${pageContext.request.contextPath}/testTest01" method="POST">
            <div class="row">
                <div class="col-xs-5">
                    <select id="before" name="before" style="height:500px" class="form-control" size="8">
                   		
                   		<c:forEach var="c" items="${getRematinderFormationList}">
                   			
                   			<option class="before" value="${c.kidNo}" id="${c.kidName}">${c.kidName}</option>
                   		
                   		</c:forEach>
                   		
                    </select>
                </div>
                
                <div class="col-xs-2">
                    <button type="button" id="left"> <span class="glyphicon glyphicon-chevron-left"></span>
                    <button type="button" id="right"><span class="glyphicon glyphicon-chevron-right"></span> </button>
                </div>
                
                <div class="col-xs-5">
                    <select id="after" name="kidNo" style="height:500px" class="form-control" size="8"></select>
                </div>
                <div>
                	<input class="btn btn-default" id="testSelectButton" type="button" value="확인"/>
                </div>
            </div>
           </form>
        </div>
  
			</div>
		</div>
	</div>
 </div>
<br><br><br><br><br>


</body>

</html>