<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>	

  	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>

	<style>
	
/*  	body {
  background: #313841;
  color: #fff;
  font-family: "Roboto", sans-serif;
  font-size: 13px;
}  */

.centerMe {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
}

button {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  cursor: pointer;
  border: 0;
  background: transparent;
  outline: 0;
  overflow: hidden;
}
button .icon {
  position: relative;
  background: #1D242B;
  line-height: 30px;
  width: 30px;
  height: 30px;
  text-align: center;
  color: #fff;
  font-size: 18px;
  -webkit-transition: .2s color;
  transition: .2s color;
  border-radius: 2px;
}
button .icon .fa {
  width: 30px;
  -webkit-transition: .2s all;
  transition: .2s all;
}
button .icon .fa-check {
  color: #38B87C;
}
button .icon .fa-question {
  color: #2492FF;
}
button .icon:after {
  content: ' ';
  display: block;
  position: absolute;
  width: 5px;
  height: 5px;
  -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
  background: #1D242B;
  top: 12.5px;
  right: 1px;
  -webkit-transition: .2s right;
  transition: .2s right;
  z-index: 1;
}
button .text {
  position: relative;
  width: 0;
  height: 30px;
  overflow: hidden;
  font-family: "Roboto", sans-serif;
  background: #F34541;
  text-align: center;
  line-height: 30px;
  color: #fff;
  font-weight: 300;
  -webkit-transition: .2s all;
  transition: .2s all;
  border-top-right-radius: 2px;
  border-bottom-right-radius: 2px;
}
button .text spam {
  width: 100%;
  opacity: 0;
  position: absolute;
  top: -30px;
  left: 50%;
  -webkit-transform: translateX(-50%);
          transform: translateX(-50%);
  -webkit-transition: .3s all;
  transition: .3s all;
}
button:hover .icon {
  color: #F34541;
  border-radius: 0;
  border-top-left-radius: 2px;
  border-bottom-left-radius: 2px;
}
button:hover .icon:after {
  right: -2px;
}
button:hover .text {
  width: 120px;
}
button:hover .text spam {
  opacity: 1;
  top: 0;
}
button.confirm .icon {
  border-radius: 0;
  border-top-left-radius: 2px;
  border-bottom-left-radius: 2px;
}
button.confirm .icon .fa {
  -webkit-transform: translateY(-30px);
          transform: translateY(-30px);
}
button.confirm .icon:after {
  right: -2px;
}
button.confirm .text {
  background: #2492FF;
  width: 120px;
}
button.confirm .text spam {
  opacity: 1;
  top: 0;
}
button.done .icon {
  border-radius: 0;
  border-top-left-radius: 2px;
  border-bottom-left-radius: 2px;
}
button.done .icon .fa {
  -webkit-transform: translateY(-60px);
          transform: translateY(-60px);
}
button.done .icon:after {
  right: -2px;
}
button.done .text {
  background: #38B87C;
  width: 120px;
}
button.done .text spam {
  opacity: 1;
  top: 0;
}

@-webkit-keyframes fadeInZoom {
  0% {
    opacity: 0;
    -webkit-transform: scale(0.7);
            transform: scale(0.7);
  }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

@keyframes fadeInZoom {
  0% {
    opacity: 0;
    -webkit-transform: scale(0.7);
            transform: scale(0.7);
  }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
	
	</style>
	
	<script type="text/javascript">
$(document).ready(function(){	
	$("button").click(function(){
		if($(this).hasClass("confirm")){
			$(this).addClass("done");
			$("spam").text("Deleted");
		} else {
			$(this).addClass("confirm");
			$("spam").text("Are you sure?");
		}
	});

	// Reset
	$("button").on('mouseout', function(){
		if($(this).hasClass("confirm") || $(this).hasClass("done")){
			setTimeout(function(){
				$("button").removeClass("confirm").removeClass("done");
				$("spam").text("Delete");
			}, 3000);
		}
	});
});	
	</script>
	
</head>
<body class="components-page nav" style="">
<div class="sidebar" data-color="blue">
			<!--
	        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
		    Tip 2: you can also add an image using data-image tag
		    -->
		    <div class="logo">
			</div>
			<div class="logo">
			</div>
		    
	    	<div class="sidebar-wrapper" style="overflow: visible;">
				<ul class="nav" >
	                <li id="kyo">
	                    <a id="sidekyo"  href="${pageContext.request.contextPath}/kyo">
	                        <i class="material-icons">person</i>
	                        <p>교원 프로필</p>
	                    </a>
	                </li>
	                
	                <li id="kyotable">
	                    <a id="sidekyotable" href="${pageContext.request.contextPath}/kyotable">
	                        <i class="material-icons">content_paste</i>
	                        <p>교원 리스트</p>
	                    </a>
	                </li>
	                
	                <li id="takeForm">
	                    <a id="sidetakeForm" href="${pageContext.request.contextPath}/takeForm">
	                        <i class="material-icons">people</i>
	                        <p>교원 편성하기</p>
	                    </a>
	                </li>
	                
	                <li id="takeFormList">
	                    <a id="sidetakeForm" href="${pageContext.request.contextPath}/takeFormList">
	                        <i class="material-icons">people</i>
	                        <p>교원 편성표</p>
	                    </a>
	                </li>
	                
	                <li id="license">
	                    <a id="sideLicense" href="${pageContext.request.contextPath}/license">
	                        <i class="material-icons">check</i>
	                        <p>라이선스</p>
	                    </a>
	                </li>
	                    
	                <li id="delete" class="active-pro">
                        <a id="sideDelete" href="${pageContext.request.contextPath}/delete">
	                        <i class="material-icons">delete</i>
	                        <p>계정 삭제</p>
	                    </a>
                    </li>      
	            </ul>
	    	</div>
		</div>