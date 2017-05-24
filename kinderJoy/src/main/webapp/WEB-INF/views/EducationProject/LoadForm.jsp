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

<!-- 네비바 관련 스크립트  -->
<script>//네비바 관련 스크립트 네비의 해당부분을 active클래스를 줌.
$(document).ready(function(){
	$('#educationProjectFormLoad').attr('class','active');
})
</script>

<!-- 스프레드 시트 관련 스크립트 -->
<script data-jsfiddle="example1">
$(document).ready(function(){
	var container = document.getElementById('example1'),hot;
	var dataArray;
	var dataValue = ${resultData.formVal};
	console.log(dataValue);
	console.log("======================!!!===================");
	var dataMerge = ${resultData.formMerge};
	var dataBorders = ${resultData.formBorders};
	//
	var countRow = ${resultData.formCountRow};
	var countCol = ${resultData.formCountCol};
	var dataForSave = ${resultData.formVal};

	/* var testData = [{},{"2":"esf"},{"2":"a","4":"ase"},{"5":"asdf"}]; //데이터 */
// {1:"", 2:"" }	
	for(j=0; j<dataValue.length;j++){
		if(dataValue[j]==null){
			dataValue[j]={ };
			//console.log(dataValue);
			for(i=0 ; i<countCol; i++){
				dataValue[j][i] ='';
				//console.log("ㅇㅅㅇ! ->> "+ i);
			}
		}	
	}
	
	
	console.log(dataValue);
	console.log('===============================');
	console.log(dataForSave);
	
	
	//var testMerge = [ {row: 1, col: 1, rowspan: 3, colspan: 3} , {row: 3, col: 4, rowspan: 2, colspan: 2} ];
	
	
		hot = new Handsontable(container, {
			
			data: dataValue,   //데이터 가져오기
			
 			  
			startRows: countRow,
			startCols: countCol,
			rowHeaders : true,
			colHeaders : true,
			minRows: countRow,
			minCols: countCol,
// 			manualRowResize : true,
// 			manualColumnResize : true,
			mergeCells : true,
			customBorders: true,
			customBorders: dataBorders,
			contextMenu : true,
			contextMenuCopyPaste: {
			    swfPath: 'swf/ZeroClipboard.swf'
			},
 			mergeCells: dataMerge, //셀병합 가져오기
 			minSpareRows: 1, //여유 행
 			
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
					console.log(row)
					console.log(col)
					console.log(val+"<<<<<<<<<<<<<<<<<val!!!!!!!!!!!!!!!!!!!")
					console.log(dataForSave[row]);
					var meats = hot.getCellMeta(row,col);
					
					console.log(meats.borders)
				
					if(val !== null){
						
						dataForSave[row][col] = val;
						dataArray=dataForSave;
					}
				}			
		}
	   
	});
		
	/* $('#btTest').click(function(){
		dataArray[dataArray.length] = hot.mergeCells;
	}) */
	
	$('#save').click(function(){
		alert('test');
		var jparse=JSON.stringify(dataArray);
		var mergeparse = JSON.stringify(hot.mergeCells.mergedCellInfoCollection);
		var inputDate = $('#date').val();
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
      
		var categoryNo = $('.categoryNo:checked').val();
		var age = $('.age:checked').val();
		var classNo = $('.classNo:checked').val();
		var projectDateInfo = $('.projectDateInfo').val();
      $.ajax({
			url : "${pageContext.request.contextPath}/educationProjectAdd",
			type : 'POST',
			dataType: 'JSON',
			async: false,
			data: {"dataArray": jparse, "mergeArray": mergeparse, "borderArray" : borderparse,"countRow" : countRow, "countCol":countCol, "categoryNo":categoryNo,"age":age, "classNo":classNo, "projectDateInfo":projectDateInfo},
			success : function(data){
				alert('success! '+data); 
		                        
   		},error: function(XMLHttpRequest, textStatus, errorThrown) { 
   		     console.log("Status: " + textStatus);
   		},timeout: 3000
   		});    
	})
  
	//setTimeout(function(){
// 		console.log(hot.mergeCells)
// 		console.log(hot.getCellsMeta())
// 		console.log(dataArray);
	//},5000)
})
</script>


</head>
<body class="components-page">
	<div class="wrapper">
		<div class="main-panel">
			<div class="content">
				<div class="radio">
					<label>
						<input type="radio" name="categoryNo" value="1" class="categoryNo">
						연간계획안
					</label>
				</div>
				<div class="radio">
					<label>
						<input type="radio" name="categoryNo" value="2" class="categoryNo">
						월간계획안
					</label>
				</div>
				<div class="radio">
					<label> 
						<input type="radio" name="categoryNo" value="3" class="categoryNo">
						주간계획안
					</label>
				</div>
				<div class="radio">
					<label>
						<input type="radio" name="categoryNo" value="4" class="categoryNo">
						일일계획안
					</label>
				</div>
				<hr>
				
				<div class="radio">
					<label>
						<input type="radio" name="age" value="3" class="age">
						3세
					</label>
				</div>
				
					<div class="radio">
					<label>
						<input type="radio" name="age" value="4" class="age">
						4세
					</label>
				</div>
				
					<div class="radio">
					<label>
						<input type="radio" name="age" value="5" class="age">
						5세
					</label>
				</div>
				<hr>
				
				<div class="radio">
					<label>
						<input type="radio" name="classNo" value="8" class="classNo">
						카나리아반
					</label>
				</div>
				<hr>
				<input type="date" class="projectDateInfo" name="projectDateInfo">
				
				<button name="save" id="save">계획안 저장</button>
				<div class="wrapper" style="margin-top: 20px;">
					<div id="example1"></div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>