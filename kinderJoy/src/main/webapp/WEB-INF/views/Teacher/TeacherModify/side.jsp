<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	    <div class="sidebar" >
			<!--
	        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
		    Tip 2: you can also add an image using data-image tag
		    -->
		    <div class="logo">
			</div>
			<div class="logo">
			</div>
		    
	    	<div class="sidebar-wrapper">
				<ul class="nav">
	                <li id="kyo">
	                    <a id="sidekyo"  href="${pageContext.request.contextPath}/kyo">
	                        <i class="material-icons">person</i>
	                        <p>User Profile</p>
	                    </a>
	                </li>
	                
	                <li id="kyotable">
	                    <a id="sidekyotable" href="${pageContext.request.contextPath}/kyotable">
	                        <i class="material-icons">content_paste</i>
	                        <p>Table List</p>
	                    </a>
	                </li>
	                
	                <li id="takeForm">
	                    <a id="sidetakeForm" href="${pageContext.request.contextPath}/takeForm">
	                        <i class="material-icons">people</i>
	                        <p>Take Form</p>
	                    </a>
	                </li>
	                
	                <li id="license">
	                    <a id="sideLicense" href="${pageContext.request.contextPath}/license">
	                        <i class="material-icons">check</i>
	                        <p>License</p>
	                    </a>
	                </li>
	                
	                <!--  -->
	                <li id="delete" class="active-pro">
                        <a id="sideDelete" href="${pageContext.request.contextPath}/delete">
	                        <i class="material-icons">delete</i>
	                        <p>Delete_account</p>
	                    </a>
                    </li>
	                
	            </ul>
	    	</div>
		</div>