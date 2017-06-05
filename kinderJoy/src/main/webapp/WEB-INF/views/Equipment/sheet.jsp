<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Title</title>
	<link rel="stylesheet" media="screen" href="js/KSS/handsontable.css">
	<link rel="stylesheet" media="screen" href="js/KSS/pikaday/pikaday.css">
	<script src="js/KSS/pikaday/pikaday.js"></script>
	<script src="js/KSS/moment/moment.js"></script>
	<script src="js/KSS/zeroclipboard/ZeroClipboard.js"></script>
	<script src="js/KSS/numbro/numbro.js"></script>
	<script src="js/KSS/numbro/languages.js"></script>
	<script src="js/KSS/EducationProject/handsontable.js"></script>
	<script src="js/jquery.js"></script>
	<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
	<c:import url="../module/importCSS.jsp"></c:import>
	<c:import url="../module/navbar.jsp"></c:import>
	
<%-- 	<script src="js/KSS/handsontable.js" type="text/javascript"></script>
	<link rel="stylesheet" media="screen" href="js/KSS/samples.css?20140331">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<!-- CSS Link -->
<c:import url="./EquipmentNav/SideNav.jsp"></c:import>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import> --%>


</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

 <div class="wrapper">
	<div class="main-panel">
		<div class="content">
			<div class="container-fluid">	
			
	<input type="hidden" name="boardCategoryNo" value="${sheetNo}" id="boardCategoryNo" readonly>  <!-- 카테고리 들고갈 input -->
	<div class="row">
		<div class="col-sm-1">
			<button class="form-control" id="btTest">저장</button>
		</div>
		<div class="col-sm-3">
		<input type="text" class="form-control" id="sheetName"/>
		</div>
		<div class="col-sm-8">

		</div>
	</div>
	

	<div class="wrapper" style="margin-top: 20px;">
		<div id="example1"></div>
	</div>
	

	
	
</div></div></div></div>
<script data-jsfiddle="example1">


	var container = document.getElementById('example1'),hot;
	var dataArray;
	
	var testData = [null,null,null,null,{"row":4,"col":7,"val":"1234"},{"row":5,"col":4,"val":"4321"},{"row":6,"col":10,"val":"2134"},null,null,null,{"row":10,"col":7,"val":"4321"},null,null,{"row":13,"col":6,"val":"1234"},{"mergedCellInfoCollection":[]}]; //데이터
	var testMerge = [{"row":5,"col":2,"rowspan":5,"colspan":3},{"row":10,"col":4,"rowspan":5,"colspan":5}];
	
	  
		hot = new Handsontable(container, {
// 			data: testData,    //데이터 가져오기
//			colWidths: [47],

			startRows: 30,
			startCols: 20,

			rowHeaders : true,
			colHeaders : true,
			
 			manualRowResize : true,
 			manualColumnResize : true,

			mergeCells : true,
			customBorders: true,
			
			contextMenu : true,
//			mergeCells : testMerge,
/* 			contextMenuCopyPaste: {
			    swfPath: 'swf/ZeroClipboard.swf'
			}, */
			
			afterChange : function(data, type){ //data{열, 행, 이전값, 현재값} type="이벤트 종류"
				console.log(data, type)
				
				if(dataArray === undefined){
					console.log('sheet확인')
					dataArray = [];
				}
				
				if(data != undefined && data != null){
					console.log('data 확인' + data[0][0]);
					var row = data[0][0];
					var col = data[0][1];
					var val = data[0][3];

					var meats = hot.getCellMeta(row,col);
					
					console.log('확인' + hot.mergeCells)
					console.log(hot.mergeCells.mergedCellInfoCollection.getInfo(row, col));
					console.log('테두리 확인');
					console.log(meats.borders)

					if(val !== null){
 						//console.log(row, col, val)

 						if(dataArray[row] === undefined){
							dataArray[row] = {};							
						}
 						console.log(row + "row확인");
						dataArray[row][col] = val;
					}
				}			
		}
	   
	});
	  	
	$('#btTest').click(function(){
/* 		dataArray[dataArray.length] = hot.mergeCells;	 */
		var param = $('#boardCategoryNo').val();
		console.log(param);
		var borderArray=[];
		var jparse=JSON.stringify(dataArray);
		var mergeparse = JSON.stringify(hot.mergeCells.mergedCellInfoCollection);
		for(var i = 0 ; i<hot.countRows(); i++){
			for(var j = 0; j<hot.countCols(); j++){
				if(hot.getCellMeta(i,j).borders !== null && hot.getCellMeta(i,j).borders !==undefined ){
					console.log('값이 있는 머지 확인!'+ JSON.stringify(hot.getCellMeta(i,j).borders));
					var borders = hot.getCellMeta(i,j).borders;
					borderArray.push(borders);
				}
			}
		}
		var borderparse=JSON.stringify(borderArray);
		console.log(borderparse+"<<<borderparse");
		
		var countRow =hot.countRows(); 
		var countCol =hot.countCols(); 
		var sheetName = $('#sheetName').val();		
	    $.ajax({
	        url:"${pageContext.request.contextPath}/save",
	        type:'POST',
	        async: false,
	        data: {"dataArray": jparse, "mergeArray": mergeparse, "borderArray" : borderparse,"countRow" : countRow, "countCol":countCol, "sheetName":sheetName, "sheetCategory" : param },
	        success:function(data){
	            alert("저장!");
/* 	            window.opener.location.reload();
	            window.close();
	            self.close(); */
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("저장실패~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
		});    
	    
	    
	setTimeout(function(){
//		console.log(hot.mergeCells)
// 		console.log(hot.getCellsMeta())
// 		console.log(dataArray);sdf
	},5000)
	})



</script>
</body>
<%-- <c:import url="../module/importJS.jsp"></c:import> --%>
</html>
