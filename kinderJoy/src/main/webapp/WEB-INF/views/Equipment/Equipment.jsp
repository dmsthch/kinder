<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="../module/importCSS.jsp"></c:import>
	
	<style>
	  .ui-tabs-vertical { width: 55em; }
	  .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
	  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
	  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
	  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; }
	  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
	 </style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">


<!-- navbar -->
<jsp:include page="../module/navbar.jsp"></jsp:include>

<!-- home section -->
	<br><br><br><br><br><br><br>
<style>
	.nav-tabs li a{color: #000;}
	.nav-tabs li{width: 50px !important;}
</style>
<div role="tabpanel">

  <!-- Nav tabs -->
  <div class="col-sm-2">
	  <ul id="tablist" class="nav nav-stacked nav-pills" role="tablist">
	    <li role="presentation" class="active"><a href="#TeachingMaterial" aria-controls="TeachingMaterial" role="tab" data-toggle="tab">비품 등록</a></li>
	    <li role="presentation"><a href="#OfficeSupplies" aria-controls="OfficeSupplies" role="tab" data-toggle="tab">품의서 작성</a></li>
	  </ul>
  </div>

	<c:import url="../module/sheetjs.jsp"></c:import>
	
<div class="col-sm-10">
	  <!-- Tab panes --> 
	  <div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="TeachingMaterial">
	    	
	    </div>
	    <div role="tabpanel" class="tab-pane" id="OfficeSupplies">
	    	<jsp:include page="../Equipment/Hansol.jsp"></jsp:include>
	    </div>
	    <div role="tabpanel" class="tab-pane" id="PhysicalApparatus">
	    </div>
	    <div role="tabpanel" class="tab-pane" id="BookList">
	    </div>
	    <div role="tabpanel" class="tab-pane" id="Etc">
	    </div>	
	  </div>
</div>

</div>
<br><br><br><br><br>
<!-- footer -->
<c:import url="../module/footer.jsp"></c:import>

<!-- JS Link -->
<c:import url="../module/importJS.jsp"></c:import>
<script type="text/javascript">
	$('#tablist').tab();
</script>
</body>
</html>
