<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>

<!-- navigation -->

<nav class="navbar navbar-transparent navbar-fixed-top navbar-color-on-scroll" >
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button id="menu-toggle" type="button" class="navbar-toggle">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar bar1"></span>
        <span class="icon-bar bar2"></span>
        <span class="icon-bar bar3"></span>
      </button>
      <a href="http://www.creative-tim.com">
           <div class="logo-container">
                <div class="logo">
                    <!-- <img src="../assets/img/new_logo.png" alt="Creative Tim Logo"> -->
                </div>
                <div class="brand">
                  <p><a href="${pageContext.request.contextPath}/" class="navbar-brand">Team. 햇병아리</a></p>
                </div>
            </div>
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
		<ul  class="nav navbar-nav navbar-right">
			<c:if test= "${null eq teacherId}"> <!-- teacherId값이 null 이라면 --> <!-- 모달 영역 밖 클릭 시 닫힘 방지 //data-backdrop="static" -->
				<li><a href="#" data-toggle="modal" data-target="#signIn" class="smoothScroll">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/Add" class="smoothScroll">회원가입</a></li>
			</c:if>
		
			<c:if test="${null ne teacherId}"> <!-- teacherId값이 null이 아니라면 -->
				<li><a href="${pageContext.request.contextPath}/calendarTest" class="smoothScroll">캘린더</a></li>
				<li><a href="${pageContext.request.contextPath}/educationProject" class="smoothScroll">계획안</a></li>
				<li><a href="${pageContext.request.contextPath}/ChildList" class="smoothScroll">유아</a></li>
				<li><a href="${pageContext.request.contextPath}/Equipment" class="smoothScroll">비품</a></li>
				<li><a href="${pageContext.request.contextPath}/kyo" class="smoothScroll">교원</a></li>
				<li><a href="${pageContext.request.contextPath}/Material" class="smoothScroll">자료실</a></li>
				<li><a href="${pageContext.request.contextPath}/Management" class="smoothScroll">예산</a></li>
				<li><a href="#" data-toggle="modal" data-target="#signOut" class="smoothScroll">로그아웃</a></li>
			</c:if>

    	</ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<!-- ★★★★★ 로그인 모달 시작★★★★★ -->
<c:import url="/WEB-INF/views/Login/login.jsp"></c:import>
<!-- ★★★★★로그아웃 모달 시작★★★★★ -->
<c:import url="/WEB-INF/views/Login/logout.jsp"></c:import>

