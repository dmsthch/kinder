<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<div class="sidebar" data-color="purple">
		<!--
	        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

	        Tip 2: you can also add an image using data-image tag
	    -->

		<div class="logo">
			<a href="http://www.creative-tim.com" class="simple-text">
				&nbsp
			</a>
		</div>

    	<div class="sidebar-wrapper">
            <ul class="nav">
            
                <li class="">
                    <a href="${pageContext.request.contextPath}/CommuteInfo">
                        <i class="material-icons">dashboard</i>
                        <p>출석현황 홈</p>
                    </a>
                </li>
                
                <li class="">
                    <a href="${pageContext.request.contextPath}/Commute">
                        <i class="material-icons">dashboard</i>
                        <p>출석부</p>
                    </a>
                </li>
                
                <li class="">
                    <a href="${pageContext.request.contextPath}/CommuteForMonth">
                        <i class="material-icons">dashboard</i>
                        <p>월별 출석 현황</p>
                    </a>
                </li>
                
            </ul>
    	</div>
    </div>