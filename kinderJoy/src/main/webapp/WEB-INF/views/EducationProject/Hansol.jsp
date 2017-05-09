<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	 <link rel="stylesheet" media="screen" href="js/LCR/EducationProject/handsontable.css">
  <link rel="stylesheet" media="screen" href="js/LCR/EducationProject/pikaday/pikaday.css">
  <script src="js/LCR/EducationProject/pikaday/pikaday.js"></script>
  <script src="js/LCR/EducationProject/moment/moment.js"></script>
  <script src="js/LCR/EducationProject/zeroclipboard/ZeroClipboard.js"></script>
  <script src="js/LCR/EducationProject/numbro/numbro.js"></script>
  <script src="js/LCR/EducationProject/numbro/languages.js"></script>
  <script src="js/LCR/EducationProject/handsontable.js"></script>
  <script src="js/jquery.js"></script>

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
	
	var testData = [{0:"",1:"",2:""},{0:1 ,1:2} , {0:1 ,1:2} , {0:1 ,1:2} ]; //데이터
		
	var testMerge = [ {row: 1, col: 1, rowspan: 3, colspan: 3} , {row: 3, col: 4, rowspan: 2, colspan: 2} ];
	
	
		hot = new Handsontable(container, {
// 			data: testData,    //데이터 가져오기
			startRows: 30,
			startCols: 20,
			rowHeaders : true,
			colHeaders : true,
// 			manualRowResize : true,
// 			manualColumnResize : true,
			mergeCells : true,
			customBorders: true,
			contextMenu : true,
			contextMenuCopyPaste: {
			    swfPath: 'swf/ZeroClipboard.swf'
			},
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
		dataArray[dataArray.length] = hot.mergeCells;
	})
  
	setTimeout(function(){
// 		console.log(hot.mergeCells)
// 		console.log(hot.getCellsMeta())
// 		console.log(dataArray);
	},5000)
  
</script>

</body>
</html>