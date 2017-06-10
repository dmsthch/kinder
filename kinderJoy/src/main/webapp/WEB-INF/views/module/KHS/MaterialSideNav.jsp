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
                <li class="">
                    <a href="" data-toggle="modal" data-target="#myModal">
                        <i class="material-icons">dashboard</i>
                        <p>Help</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>
    
    <!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width:80%;">
		
			<!-- Modal content-->
			<div class="modal-content">

				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
				
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
					
						<div class="item active">
							<img src="images/KHS/materialHelp/material.png">
						</div>
						
						<div class="item">
							<img src="images/KHS/materialHelp/list.png">
						</div>
						
						<div class="item">
							<img src="images/KHS/materialHelp/materialAdd.png">
						</div>
						
					</div>
				
					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>

			</div> <!-- Modal content End-->
		
		</div>
	</div>