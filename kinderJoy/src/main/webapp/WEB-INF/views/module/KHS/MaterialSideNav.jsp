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
                    <a href="${pageContext.request.contextPath}/Material">
                        <i class="material-icons">dashboard</i>
                        <p>자료실</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=0">
                        <i class="material-icons">content_paste</i>
                        <p>전체 리스트</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=1">
                        <i class="material-icons">content_paste</i>
                        <p>문서 양식 리스트</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/MaterialDocumnetList?categoryNo=2">
                        <i class="material-icons">content_paste</i>
                        <p>교육 자료 리스트</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/MaterialAdd">
                        <i class="material-icons">library_books</i>
                        <p>자료 추가</p>
                    </a>
                </li>
                
            </ul>
    	</div>
    </div>