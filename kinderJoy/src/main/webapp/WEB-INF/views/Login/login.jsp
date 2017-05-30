<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
<link rel="stylesheet" type="text/css" href="css/JKC/sign/login.css" />
<script type="text/javascript" src="js/JKC/sign/login.js"></script> 
-->

<script>
//키업방식
$(document).ready(function(){
		$("#teacherId").keyup(function(){
			var gogo="teacherId="+$("#teacherId").val();
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/login_id_check",
				data : gogo,
				success : function(data){
					if (data == 0){
						$("jeon").html("아이디가 없습니다.")
						}else{
						$("jeon").html("아이디가 확인되었습니다.")
						}
					}
			})
		});
	});
</script>

<!-- 관리자 자동선택 -->
<!--  <script>
$(document).ready(function(){
	$('#btnAdmin').trigger('click');
});
</script>  -->


<style>

<style>
body {font-family: "Lato", sans-serif;}

/* Style the tab */
div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
</style>

<!-- Modal content--> 
<div class="container">
<!-- Modal -->
	<div class="modal fade" id="signIn" role="dialog">
		<div class="modal-dialog">
	
	<div class="tab">
	  <button class="tablinks" onclick="openCity(event, 'admin')" id="btnAdmin">관리자</button>
	  <button class="tablinks" onclick="openCity(event, 'client')">일반</button>
	</div>
<!-- 관리자 로그인 -->	
<form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post" accept-charset="UTF-8">
	<div class="modal-content">
		<div id="admin" class="tabcontent">
		
		<h3>관리자 로그인</h3>
		
			<div class="modal-header">
			값 체크 : <jeon />
			<h4 class="modal-title">로그인</h4>
			</div>
			
			<div class="modal-body">
			<!-- 모달 바디  -->
			<input type="text" id="teacherId" name="teacherId" value="test01">
			<input type="password" name="teacherPw" value="test01">
			<input type="submit" name="submit" value="로그인">
			<!-- 모달 바디 END -->
			</div>
			
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			
		</div>
	</div>
</form>

<!-- 일반 로그인 -->
<form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post" accept-charset="UTF-8">
	<div class="modal-content">
		<div id="client" class="tabcontent">
		
			<h3>일반 로그인</h3>
			
			<div class="modal-header">
			값 체크 : <jeon />
			<h4 class="modal-title">로그인</h4>
			</div>
			
			<div class="modal-body">
			<!-- 모달 바디  -->
			<input type="text" id="teacherId" name="teacherId" value="test03">
			<input type="password" name="teacherPw" value="test03">
			<input type="submit" name="submit" value="로그인">`
			<!-- 모달 바디 END -->
			</div>
			
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			
		</div> 
	</div>
</form>


<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
		

		
		
		
		</div>
	</div>
</div>