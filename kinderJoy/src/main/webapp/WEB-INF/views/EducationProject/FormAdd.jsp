<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" href="js/LCR/EducationProject/handsontable.css">
<link rel="stylesheet" media="screen" href="js/LCR/EducationProject/pikaday/pikaday.css">
<script src="js/LCR/EducationProject/pikaday/pikaday.js"></script>
<script src="js/LCR/EducationProject/moment/moment.js"></script>
<script src="js/LCR/EducationProject/zeroclipboard/ZeroClipboard.js"></script>
<script src="js/LCR/EducationProject/numbro/numbro.js"></script>
<script src="js/LCR/EducationProject/numbro/languages.js"></script>
<script src="js/LCR/EducationProject/handsontable.js"></script>
<c:import url="../module/importCSS.jsp"></c:import>
<c:import url="./nav/SideNav.jsp"></c:import>
<c:import url="../module/navbar.jsp"></c:import>


	<title>Insert title here</title>
	<script>
	$(document).ready(function(){
		$('#educationProjectAddPage').attr('class','active');
	})
	</script>
</head>
<body class="components-page">
	<div class="wrapper">
		<div class="main-panel">
			<div class="content">
				======양식 추가하기======<br/>
				<input type="text" placeholder="양식의 이름을 입력해주세요." name="formTitle" id="formTitle" style="width: 500px;"><br/>
				<button id="btTest">bt</button>
				<button name="save" id="save">Save</button>
				<button name="test" id="test">Test</button>
				<div class="wrapper" style="margin-top: 20px;">
					<div id="example1"></div>
				</div>
			</div>
		</div>
	</div>
	
<script data-jsfiddle="example1">
	var container = document.getElementById('example1'),hot;
	var dataArray;
	//var testBorders = [{"className":"border_row5col4","border":{"width":1,"color":"#000","cornerVisible":false},"row":5,"col":4,"top":{"width":1,"color":"#000"},"right":{"hide":true},"bottom":{"hide":true},"left":{"hide":true}}];
/* 	var dataTest;
	if(${dataTest}){
		dataTest = ${dataTest};
	}else{
		dataTest = [{"0":"123","1":"234","2":"adsf"}];
	} */

	/* var testData = [{},{"2":"esf"},{"2":"a","4":"ase"},{"5":"asdf"}]; //데이터 */
// {1:"", 2:"" }	
/* 	var colCount = 10;
	if(dataTest[0]==null){
		dataTest[0]={ };
		console.log(dataTest);
		for(i=0 ; i<colCount; i++){
			dataTest[0][i] ='';
			console.log("ㅇㅅㅇ! ->> "+ i);
		}
	} */
	
	//console.log(dataTest[0]);
	
	
	//var testMerge = [{"row":2,"col":1,"rowspan":2,"colspan":3},{"row":5,"col":2,"rowspan":3,"colspan":3}];;
	
	
		hot = new Handsontable(container, {
 			//data: dataTest,    //데이터 가져오기
			startRows: 40,
			startCols: 15,
			rowHeaders : true,
			colHeaders : true,
			colWidths: 80,
// 			manualRowResize : true,
// 			manualColumnResize : true,
			mergeCells : true,
			customBorders: true,
//			customBorders: testBorders,
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
						console.log('체크체크');
// 						console.log(row, col, val)
						if(dataArray[row] === undefined){
							dataArray[row] = {};							
						}
						dataArray[row][col] = val;
					}
				}			
		}
	   
	});
	$('#test').click(function(){
/* 		console.log(dataArray);
		var jparse=JSON.stringify(dataArray);
		console.log(jparse+"<<<<jparse");
		console.log(JSON.stringify(hot.mergeCells.mergedCellInfoCollection)); */
		//console.log(JSON.stringify(hot.getCellMeta(1,1).borders));
		var borderArray;
		var allCells = hot.getCellsMeta().borders;
		console.log(allCells);
		//console.log(hot.countRows()); 행수 구하기
		//console.log(hot.countCols());열수구하기
		var borderArray=[];
		for(var i = 0 ; i<hot.countRows(); i++){
			for(var j = 0; j<hot.countCols(); j++){
				if(hot.getCellMeta(i,j).borders !== null && hot.getCellMeta(i,j).borders !==undefined ){
					console.log('ㅇㅅㅇ!'+ JSON.stringify(hot.getCellMeta(i,j).borders));
					var borders = JSON.stringify(hot.getCellMeta(i,j).borders);
					borderArray.push(borders);
				}
			}
		}
		
		
		
	})
	$('#save').click(function(){
		alert('test');
		var jparse=JSON.stringify(dataArray);
		var mergeparse = JSON.stringify(hot.mergeCells.mergedCellInfoCollection);
		var formTitle = $('#formTitle').val();
		console.log(jparse+"<<<<jparse");
		console.log(mergeparse);
		var borderArray=[];
		for(var i = 0 ; i<hot.countRows(); i++){
			for(var j = 0; j<hot.countCols(); j++){
				if(hot.getCellMeta(i,j).borders !== null && hot.getCellMeta(i,j).borders !==undefined ){
					console.log('ㅇㅅㅇ!'+ JSON.stringify(hot.getCellMeta(i,j).borders));
					var borders = hot.getCellMeta(i,j).borders;
					borderArray.push(borders);
				}
			}
		}
		var borderparse=JSON.stringify(borderArray);
		console.log(borderparse+"<<<borderparse");
		
		var countRow =hot.countRows(); 
		var countCol =hot.countCols(); 
      
      $.ajax({
			url : "${pageContext.request.contextPath}/educationProjectFormAdd",
			type : 'POST',
			dataType: 'JSON',
			async: false,
			data: {"dataArray": jparse, "mergeArray": mergeparse, "borderArray" : borderparse,"countRow" : countRow, "countCol":countCol,"formTitle":formTitle },
			success : function(data){
			alert('저장완료');
		                        
   		},error: function(XMLHttpRequest, textStatus, errorThrown) { 
   		     console.log("Status: " + textStatus);
   		},timeout: 3000
   		});    
	})
  
	setTimeout(function(){
// 		console.log(hot.mergeCells)
//		console.log(hot.getCellsMeta())
 		
// 		console.log(dataArray);
	},5000)
  
</script>




</body>
</html>