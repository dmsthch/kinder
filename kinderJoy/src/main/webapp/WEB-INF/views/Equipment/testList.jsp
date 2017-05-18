<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today" />
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>
<!--  -->
     <link href='https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic|Roboto+Slab:400,700|Inconsolata:400,700&subset=latin,cyrillic'
          rel='stylesheet' type='text/css'>
     <link rel="stylesheet" href="https://swisnl.github.io/jQuery-contextMenu/css/screen.css" type="text/css"/>
<!--     <link rel="stylesheet" href="https://swisnl.github.io/jQuery-contextMenu/css/theme.css" type="text/css"/> -->
    <link rel="stylesheet" href="https://swisnl.github.io/jQuery-contextMenu/css/theme-fixes.css" type="text/css"/>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/styles/github.min.css">
    <link href="js/KSS/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/KSS/jquery.contextMenu.js" type="text/javascript"></script>
    <script src="js/KSS/jquery.ui.position.min.js" type="text/javascript"></script>
    <script src="https://swisnl.github.io/jQuery-contextMenu/js/main.js" type="text/javascript"></script>

<!--  -->
<style>
@font-face{
	font-family: 'koverwatch';
	src: url(fonts/koverwatch.ttf) format('truetype');
}
body {
	font-family: koverwatch
}
/* .form-control{
	width:400px;
} */
</style>

<script>

$(document).ready(function(){
	$('#equipmnetRequestListNav').attr('class','active');
})
//비품 우클릭 이벤트
/* $(document).ready(function(){a
	$('.table tbody tr').mouseup(function(){
		console.log('마우스 오버 확인');
		var testTD = $(this).find('.textTD').text();
		console.log(testTD);
	});


}); */
</script>

</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<script type="text/javascript">
$(document).ready(function(){
$(function(){
    /**************************************************
     * Custom Command Handler123
     **************************************************/
    $.contextMenu.types.label = function(item, opt, root) {
        // this === item.$node

        $('<span>Label<ul>'
            + '<li class="label1" title="label 1">label 1'
            + '<li class="label2" title="label 2">label 2'
            + '<li class="label3" title="label 3">label 3'
            + '<li class="label4" title="label 4">label 4'
            +'</ul></span>')
            .appendTo(this)
            .on('click', 'li', function() {
                // do some funky stuff
                console.log('Clicked on ' + $(this).text());
                // hide the menu
                root.$menu.trigger('contextmenu:hide');
            });

        this.addClass('labels').on('contextmenu:focus', function(e) {
            // setup some awesome stuff
        }).on('contextmenu:blur', function(e) {
            // tear down whatever you did
        }).on('keydown', function(e) {
            // some funky key handling, maybe?
        });
    };
/* 	$.contextMenu.types.open = function(item, opt, root) {
		$('<span class="buyEnd">구입 완료</span>').appendTo(this).on('click','.buyEnd',function(){
			var testTD = $('#testTD').val();
			alert('확인완료' + testTD);
			 console.log('Clicked on ' + $(this).text());
             // hide the menu
             root.$menu.trigger('contextmenu:hide');
		});
        this.addClass('open').on('contextmenu:focus', function(e) {
            // setup some awesome stuff
        }).on('contextmenu:blur', function(e) {
            // tear down whatever you did
        }).on('keydown', function(e) {
            // some funky key handling, maybe?
        });
	} */
    /**************************************************
     * Context-Menu with custom command "label"
     **************************************************/
    $.contextMenu({
        selector: '.table tbody tr', 
        callback: function(key, options) {
			if(key == 'open') {
				console.log('확인');
				var textIP = $(this).find('.textIP').val();
				console.log(textIP);
		 	    jQuery.ajax({
		 	        url: '${pageContext.request.contextPath}/testListSave',
		 	        type: 'POST',
		 	        data:{"textIP":textIP},
		 	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
		 	        dataType: 'html',
		 	        success: function (result) {
		 	            if (result == 1){
		 	                console.log('데이터 보내기 성공');
		 	                alert('삭제되었습니다.');
		 	               location.href="${pageContext.request.contextPath}/testList"
		 	            }else{
		 	            	alert('삭제에 실패하였습니다.');
		 	            }
		 	        }
		 	    });
			}
        },
        items: {
//            open: {type: "open", customName: "Open"},
			open:{name: "구입완료"},
/*             label: {type: "label", customName: "Label"},
            edit: {name: "Edit", callback: $.noop}  */
        }
    });
});
});
</script>
 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">
	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card card-plain">
	                            <div class="card-header" data-background-color="purple">
	                                <h4 class="title">비품 건의 리스트</h4>
	                                <p class="category">EQUIPMENT REQUEST LIST</p>
	                            </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead>
	                                        <th>건의자</th>
	                                    	<th>건의 품목</th>
	                                    	<th>건의 품명</th>
	                                    	<th>건의 사유</th>
	                                    	<th>예상 가격</th>
	                                    	<th>건의 날짜</th>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach var="equipmentRequest" items="${equipmentRequest}">
		                                        <tr>
		                                        	<td class="textTD">${equipmentRequest.teacherNo}</td>
		                                        	<td>${equipmentRequest.categoryNo}</td>
		                                        	<td>${equipmentRequest.requestName}</td>
		                                        	<td>${equipmentRequest.requestReason}</td>
		                                        	<td>${equipmentRequest.requestPrice}</td>
		                                        	<td>${equipmentRequest.requestDay}<td>
		                                        	<input type="hidden" class="textIP" value="${equipmentRequest.requestNo}"/>
		                                        </tr>
	                                        </c:forEach>
	                                    </tbody>
	                                </table>
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
<br><br><br><br><br>


</body>
<!-- 껐는데 왜 자꾸 나와 -->
<%-- <c:import url="../module/importJS.jsp"></c:import> --%>
</html>