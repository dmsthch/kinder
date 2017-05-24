<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	//네비바 색주기
	var categoryNo = ${categoryNo};
	//console.log(categoryNo+"<<categoryNo")
	if(categoryNo==1){
		$('#activeYear').attr('class','active');	
	}else if(categoryNo==2){
		$('#activeMonth').attr('class','active');
	}else if(categoryNo==3){
		$('#activeWeek').attr('class','active');
	}else if(categoryNo==4){
		$('#activeDay').attr('class','active');
	}
	
	//연령선택하면 해당 반 보여주는것
	$(document).on('change','#selectAge',function(){
		var selectAge = $('#selectAge').val();
		/* $('#selectClass').find().attr('class',3).remove(); */
		//아이디가 selectClass인 셀렉트박스 내의 옵션중 class가 selectAge 셀렉트 박스에서 셀렉트한 값과 같은 것을 구해야 함.
		$('select[name=selectClass] option[class!="'+selectAge+'"]').attr('style','display:none');
		$('select[name=selectClass] option[class="'+selectAge+'"]').attr('style','display:""');
		$("#selectClass option:first").prop("selected", true);
		
		$('#afterAge').attr('style','display:"";');
		
	})
	
	$(document).on('change','#selectClass',function(){
		$('#afterClass').attr('style','display:"";');
	})
	
})
</script>

<!-- 스프레드 시트 관련 스크립트 -->
<script data-jsfiddle="example1">


$(document).ready(function(){
	var container = document.getElementById('example1'),hot;
	/* var formOrder = ${formOrder} */
	var dataArray;

	var testData = [];
	
 		var container = document.getElementById('example1'),hot;
		var dataArray;
		var dataValue = ${resultData.formVal};
		//console.log(dataValue);
		//console.log("======================!!!===================");
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
		
		
		//console.log(dataValue);
		//console.log('===============================');
		//console.log(dataForSave); 
		
	
	
	
	//var testMerge = [ {row: 1, col: 1, rowspan: 3, colspan: 3} , {row: 3, col: 4, rowspan: 2, colspan: 2} ];
	
	
		hot = new Handsontable(container, {
			
			data: dataValue,   //데이터 가져오기
		 	startRows: countRow,
			startCols: countCol,
			minRows: countRow,
			minCols: countCol,
 			   
			/* startRows: 30,
			startCols: 20,
			minRows: 30,
			minCols: 20, */
			rowHeaders : true,
			colHeaders : true,
			colWidths: 80,
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
				//console.log(data, type)
				
				if(dataArray === undefined){
					//console.log('초깅화')
					dataArray = [];
				}
				
				if(data !== undefined && data !== null){
					var row = data[0][0];
					var col = data[0][1];
					var val = data[0][3];
					var meats = hot.getCellMeta(row,col);
					
					//console.log(meats.borders)

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
		//console.log(jparse+"<<<<jparse");
		//console.log(mergeparse);
		var borderArray=[];
		for(var i = 0 ; i<hot.countRows(); i++){
			for(var j = 0; j<hot.countCols(); j++){
				if(hot.getCellMeta(i,j).borders !== null && hot.getCellMeta(i,j).borders !==undefined ){
					//console.log('ㅇㅅㅇ!'+ JSON.stringify(hot.getCellMeta(i,j).borders));
					var borders = hot.getCellMeta(i,j).borders;
					borderArray.push(borders);
				}
			}
		}
		var borderparse=JSON.stringify(borderArray);
		//console.log(borderparse+"<<<borderparse");
		
		
		var countRow =hot.countRows(); 
		var countCol =hot.countCols(); 
      
		var categoryNo = ${categoryNo};
		
		var age = $('#selectAge').val();
		var classNo = $('#selectClass').val();
		var projectDateInfo = $('#projectDateInfo').val();
		console.log(countRow);
		console.log(countCol);
		console.log(categoryNo);
		console.log(age);
		console.log(classNo);
		console.log(projectDateInfo);
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



//

</script>

<style>
.wtBorder { border : 3px;}
</style>

</head>
<body class="components-page">
	<div class="wrapper">
		<div class="main-panel">
			<div class="content">
				<div class="row">
					<div class="col-sm-2">
						<select class="form-control" id="selectAge">
						<option value="" disabled selected> 연령 선택  </option>
						<option value="3" >3세</option>
						<option value="4">4세</option>
						<option value="5">5세</option>
						
						</select>
					</div>
					<div class="col-sm-4" id="afterAge" style="display: none;">
						<select class="form-control" id="selectClass" name="selectClass">
							<option value="" disabled selected> 반 선택  </option>
							<c:forEach items="${listChildClass}" var="childClass">
								<option value="${childClass.classNo}" class="${childClass.classAge}">${childClass.className}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-2" id="afterClass" style="display: none;">
					<input class="form-control" type="date" id="projectDateInfo">
					</div>
					
				</div>
				<button name="save" id="save">계획안 저장</button>
				<div class="wrapper" style="margin-top: 20px;">
					<div id="example1"></div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>