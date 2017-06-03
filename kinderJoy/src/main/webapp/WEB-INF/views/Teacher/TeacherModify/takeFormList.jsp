<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
     
  	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
	<!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- navbar -->
	<c:import url="/WEB-INF/views/module/navbar.jsp"></c:import>
	<!-- ���̵�޴��� BEGIN -->
	<c:import url="./side.jsp"></c:import>

</head>

<body>



<div class="wrapper">

	    <div class="main-panel">

	        <div class="content">
	            <div class="container-fluid">
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="card">
	                            <div class="card-header" data-background-color="orange">
	                                <h4 class="title">��ǥ</h4>
	                                <p class="category">���� ǥ�� Ȯ���ϼ���.</p>
	                            </div>                            
	                            <div class="card-content table-responsive">
	                                <forEach begin="3" end="5" var="age">
	                                
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>3�� �� �̸�</th>
	                                    </thead>
	                                    

	                                    <tbody>
	                                        <tr>
	                                        	<td>���� ������</td>
	                                        	<td>�߰�</td>
	                                        	<td>�߰�</td>
	                                        <tr>
	                                    </tbody>

	                                </table>
	                                </forEach>
	                                
	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>4�� �� �̸�</th>
	                                    </thead>
	                                    

	                                    <tbody>
	                                        <tr>
	                                        	<td>���� ������</td>
	                                        	<td>�߰�</td>
	                                        	<td>�߰�</td>
	                                        <tr>
	                                    </tbody>

	                                </table>	                                <table class="table">
	                                    <thead class="text-primary">
	                                    	<th>5�� �� �̸�</th>
	                                    </thead>
	                                    

	                                    <tbody>
	                                        <tr>
	                                        	<td>���� ������</td>
	                                        	<td>�߰�</td>
	                                        	<td>�߰�</td>
	                                        <tr>
	                                    </tbody>

	                                </table>
	                            </div>
	                        </div>
	                    </div>

	                </div>
	            </div>
	        </div>
		
		<c:import url="./footer.jsp"></c:import>

	    </div>
	</div>



</body>

</html>