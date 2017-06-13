<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
     <title>���� ��ǥ</title>
  	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- ���̵�޴��� BEGIN -->
	<c:import url="./side.jsp"></c:import>

		<script>
	$(document).ready(function(){
		$('#takeFormList').attr('class','active');
		$('#sidetakeFormList').attr('style','background-color:#3DB7CC');
		
	});
	</script>
	
	<style>
	.rounded {
	  background: black;
	  border-radius: 5px;
	}
	</style>
	
	
	<!-- ���̵� ���⵵ ���� ����-->
	
	<link rel="stylesheet" href="css/pageguide.min.css" />
    <style type="text/css">
        body {
            font-family: Helvetica, Arial, sans-serif;
        }	/* ���������� */
        .wrapper {
            margin: 0 auto;
            width: 100%;
            max-width: auto;	/* �ٵ� �κ� ����ũ�� ���� */
        }
        .data-block {
            width: 100%;
            min-height: auto; /* ���̵� �κ� ���̵� �κ� ����ũ�� ���� */
        }
        .data-block img {
            width: 100%;
        }
        #titlePageGuide {
            display: none;
        }
    </style>
<!-- ���̵� ���⵵ ���� ���� -->
	
</head>

<body>



<div class="wrapper">

	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="blue">
	                                <h4 class="title">��ǥ</h4>
	                                <p class="category">���� ǥ�� Ȯ���ϼ���.</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
                             <c:forEach begin="3" end="5" var="age">
	                                
		                         <table class="table">
		                         
									<h1 class="data-block elementA">${age}�� ��</h1>
										
										<c:forEach var="List" items="${List}">
											<c:if test="${List.classAge == age }">
											<div class="card-header style_card data-block elementB" data-background-color="blue" style=" border: 3px solid black;  float: left; height: auto; width: auto; margin: 10px; padding: 10px;" > 
												<h5 class="card card-stats">${List.className}��</h5>
												${List.teacherName}
											</div>
											</c:if>	
										</c:forEach>
		                         </table>
		                         
                             </c:forEach>
	                            </div>
	                        </div>
	                    </div>

	                </div>
	            </div>
	        </div>
	    </div>
	    
	    <!-- ���̵�  -->
	    <ul id="tlyPageGuide" data-tourtitle="���̵带 �����Ϸ��� Ŭ���ϼ���.">
              <li class="tlypageguide_top" data-tourtarget=".takeFormListSide">
              ���� ǥ�� �� �� �ֽ��ϴ�.
              </li>
              
              <li class="tlypageguide_top" data-tourtarget=".elementA">
              �� ������ �� �� �ֽ��ϴ�.
              </li>
              
              <li class="tlypageguide_top" data-tourtarget=".elementB">
              �ݰ� �ݿ� ������ �������� �̸��� �� �� �ֽ��ϴ�.
              </li>              
	    
	</div>

	<!-- ���������̵� -->
	<script type="text/javascript" src="js/pageguide.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            var pageguide = tl.pg.init();
        });
    </script>
<!-- ���������̵� --> 

</body>

</html>