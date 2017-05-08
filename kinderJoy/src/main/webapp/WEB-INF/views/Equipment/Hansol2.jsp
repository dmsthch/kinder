<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link data-jsfiddle="common" rel="stylesheet" media="screen" href="js/KSS/handsontable.css">
	<link data-jsfiddle="common" rel="stylesheet" media="screen" href="js/KSS/pikaday/pikaday.css">
	<script data-jsfiddle="common" src="js/KSS/pikaday/pikaday.js"></script>
	<script data-jsfiddle="common" src="js/KSS/moment/moment.js"></script>
	<script data-jsfiddle="common" src="js/KSS/zeroclipboard/ZeroClipboard.js"></script>
	<script data-jsfiddle="common" src="js/KSS/numbro/numbro.js"></script>
	<script data-jsfiddle="common" src="js/KSS/numbro/languages.js"></script>
	<script data-jsfiddle="common" src="js/KSS/handsontable.js"></script>
	<link data-jsfiddle="common" rel="stylesheet" media="screen" href="js/KSS/samples.css?20140331">
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
		
		var jArray = myMerge3;
// 		var jArray = myMerge;
		
		var jsonStr = JSON.stringify(jArray);
		
		console.log(jsonStr + "JSON.stringify() 후");
		
		$.ajax({
	        url:"${pageContext.request.contextPath}/send",
	        type:'GET',
	        data: {jsonStr:jsonStr},
	        success:function(data){
	            alert("asdf!");
// 	            window.opener.location.reload();
// 	            self.close();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("fdsa~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
		});
		
	});
  
	setTimeout(function(){
// 		console.log(hot.mergeCells)
// 		console.log(hot.getCellsMeta())
// 		console.log(dataArray);
	},5000)
  
</script>

</body>
</html>