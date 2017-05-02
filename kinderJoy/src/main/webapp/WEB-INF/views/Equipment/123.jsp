<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link data-jsfiddle="common" rel="stylesheet" media="screen" href="../dist/handsontable.css">
	<link data-jsfiddle="common" rel="stylesheet" media="screen" href="../dist/pikaday/pikaday.css">
	<script data-jsfiddle="common" src="../dist/pikaday/pikaday.js"></script>
	<script data-jsfiddle="common" src="../dist/moment/moment.js"></script>
	<script data-jsfiddle="common" src="../dist/zeroclipboard/ZeroClipboard.js"></script>
	<script data-jsfiddle="common" src="../dist/numbro/numbro.js"></script>
	<script data-jsfiddle="common" src="../dist/numbro/languages.js"></script>
	<script data-jsfiddle="common" src="../dist/handsontable.js"></script>
	<link data-jsfiddle="common" rel="stylesheet" media="screen" href="css/samples.css?20140331">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<button id="btTest">bt</button>
	<div class="wrapper" style="margin-top: 20px;">
		<div id="example1"></div>
	</div>
	
<script data-jsfiddle="example1">
	var container = document.getElementById('example1'),hot;
	var dataArray;
	
	var testData = [ {0:1 ,1:2} , {0:1 ,1:2} , {0:1 ,1:2} ]; //데이터
	var testMerge = [ {row: 1, col: 1, rowspan: 3, colspan: 3} , {row: 3, col: 4, rowspan: 2, colspan: 2} ];
	
	var myMerge = [ {row: 0, col: 0, rowspan: 2, colspan: 2},  {row: 0, col: 2, rowspan: 2, colspan: 2}, 
			{row: 0, col: 4, rowspan: 2, colspan: 2},  {row: 0, col: 6, rowspan: 1, colspan: 9},
			{row: 1, col: 6, rowspan: 1, colspan: 3},  {row: 1, col: 9, rowspan: 1, colspan: 3},
			{row: 1, col: 12, rowspan: 1, colspan: 3}, {row: 2, col: 0, rowspan: 12, colspan: 2},
			{row: 2, col: 2, rowspan: 12, colspan: 2}, {row: 2, col: 4, rowspan: 12, colspan: 2},
			{row: 2, col: 6, rowspan: 12, colspan: 3}, {row: 2, col: 9, rowspan: 12, colspan: 3},
			{row: 2, col: 12, rowspan: 12, colspan: 3} ];
	
	var myMerge2 = [
		{"row": "0", "col": "0", "rowspan": "2", "colspan": "2"},  {"row": "0", "col": "2", "rowspan": "2", "colspan": "2"}, 
			{"row": "0", "col": "4", "rowspan": "2", "colspan": "2"},  {"row": "0", "col": "6", "rowspan": "1", "colspan": "9"},
			{"row": "1", "col": "6", "rowspan": "1", "colspan": "3"},  {"row": "1", "col": "9", "rowspan": "1", "colspan": "3"},
			{"row": "1", "col": "12", "rowspan": "1", "colspan": "3"}, {"row": "2", "col": "0", "rowspan": "12", "colspan": "2"},
			{"row": "2", "col": "2", "rowspan": "12", "colspan": "2"}, {"row": "2", "col": "4", "rowspan": "12", "colspan": "2"},
			{"row": "2", "col": "6", "rowspan": "12", "colspan": "3"}, {"row": "2", "col": "9", "rowspan": "12", "colspan": "3"},
			{"row": "2", "col": "12", "rowspan": "12", "colspan": "3"}
																		];
	var myMerge3 = [
		{"row": "0", "col": "0", "rowspan": "2", "colspan": "2"}, {"row": "0", "col": "2", "rowspan": "2", "colspan": "2"}, 
				];
	
	
		hot = new Handsontable(container, {
// 			data: testData,    //데이터 가져오기
			startRows: 14,
			startCols: 15,
			rowHeaders : true,
			colHeaders : true,
// 			manualRowResize : true,
// 			manualColumnResize : true,
			mergeCells : true,
			customBorders: true,
			contextMenu : true,
// 			contextMenuCopyPaste: {
// 			    swfPath: 'swf/ZeroClipboard.swf'
// 			},
			mergeCells: myMerge, //셀병합 가져오기
// 			mergeCells: testMerge, //셀병합 가져오기
			
			afterChange : function(data, type){ //data{열, 행, 이전값, 현재값} type="이벤트 종류"
				console.log(data, type)
				
				if(dataArray === undefined){
					console.log('초깅화')
					dataArray = [];
				}
				
				if(data !== undefined && data !== null){
					var row = data[0][0];
					var col = data[0][1];
					var val = data[0][3];
					var meats = hot.getCellMeta(row,col);
					
					console.log(meats.borders)

					if(val !== null){
// 						console.log(row, col, val)
						if(dataArray[row] === undefined){
							dataArray[row] = {};							
						}
						dataArray[row][col] = val;
					}
				}			
		}
	   
	});
	$('#btTest').click(function(){
// 		dataArray[dataArray.length] = hot.mergeCells;
		
		var sendData = myMerge3;
		alert(sendData);
		
		
		var request = $.ajax({
		    url:"http://localhost:8088/HandsonTableTest/demo/hansol2Test.jsp",
		    type:"POST",
		    data:sendData,
		    dataType:"json",
		    error : function(error) {
		    	console.log(data);
				alert(error);
		    }
		   });
		
// 		$.ajax({
// 		    type : 'POST',
// 		    url : "http://localhost:8088/HandsonTableTest/demo/hansol2Test.jsp",
// 		    dataType : "json",
// 		    headers : {
// 		    	Accept: "application/json; charset=utf-8",
// 		        "Content-Type": "application/json; charset=utf-8"
// 		    },
// 		    statusCode : {
// 		        200 : function(data) {
// 		        	console.log(data);
// 		        }
// 		    },
// 		    contentType : "application/json",
// 		    data : JSON.stringify(sendData),
// 		    success:function(data){
// 		    	console.log(data);
// 		    	alert(s);
// 		    },
// 		    error : function(error) {
// 		    	console.log(data);
// 				alert(f);
// 		    }
// 		});

	})
  
	setTimeout(function(){
// 		console.log(hot.mergeCells)
// 		console.log(hot.getCellsMeta())
// 		console.log(dataArray);
	},5000)
  
</script>

</body>
</html>