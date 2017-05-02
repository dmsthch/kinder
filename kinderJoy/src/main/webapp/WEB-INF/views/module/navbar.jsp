<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- navigation section -->
<section class="navbar navbar-fixed-top custom-navbar" role="navigation"s>
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<a href="#" class="navbar-brand">Digital Team</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">

				<li><a href="/home" class="smoothScroll">캘린더</a></li>
				<li><a href="#" class="smoothScroll">교육계획</a></li>
				<li><a href="#" class="smoothScroll">유아</a></li>
				<li><a href="#" class="smoothScroll">비품</a></li>
				<li><a href="#" class="smoothScroll">교원</a></li>
				<li><a href="#" class="smoothScroll">자료실</a></li>
				<li><a href="#" data-toggle="modal" data-target="#myModal" class="smoothScroll">로그인</a></li>
			</ul>
		</div>
	</div>
</section>

<body>

<div class="container">
  <!-- Trigger the modal with a button -->

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        <div class="modal-body">
          




  <form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post">
    <div class="form-group">
      <label>아이디:</label>
      <input type="text" class="form-control" name="teacher_id" placeholder="아이디를 입력하세요">
    </div>
    <div class="form-group">
      <label>비밀번호:</label>
      <input type="password" class="form-control" name="teacher_pw" placeholder="비밀번호를 입력하세요">
    </div>
    
    <button type="submit" class="btn btn-default">Submit</button>
  </form>





        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>