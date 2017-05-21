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

<!-- 필요한것 : 카테고리넘버, 해당 유치원의 연령별 반넘버와 반이름과 연령, 라이센스,
	넘길것 : 카테고리넘버, 라이센스, 반넘버(연간일땐 X), 연령, 날짜,시트의 border,merge,value,row,col  -->
<title>계획안 작성(빈 시트)</title>

<script>
$(document).ready(function(){
	var categoryNo = ${categoryNo};
	console.log(categoryNo+"<<categoryNo")
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


<script data-jsfiddle="example1">
$(document).ready(function(){
	var container = document.getElementById('example1'),hot;
	var dataArray;

		hot = new Handsontable(container, {
 			
			startRows: 30,
			startCols: 20,
			rowHeaders : true,
			colHeaders : true,
			 colWidths: 80,
// 			manualRowResize : true,
// 			manualColumnResize : true,
			mergeCells : true,
			customBorders: true,
			contextMenu : true,
			contextMenuCopyPaste: {
			    swfPath: 'swf/ZeroClipboard.swf'
			},
			
			afterChange : function(data, type){ //data{열, 행, 이전값, 현재값} type="이벤트 종류"
				//console.log(data, type);
				
				if(dataArray === undefined){
					dataArray = [];
				}
				
				if(data !== undefined && data !== null){
					var row = data[0][0];
					var col = data[0][1];
					var val = data[0][3];
					var meats = hot.getCellMeta(row,col);
					
					//console.log(meats.borders)

					if(val !== null){
						if(dataArray[row] === undefined){
							dataArray[row] = {};							
						}
						dataArray[row][col] = val;
					}
				}			
		}
	   
	});

	
	
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
		console.log(categoryNo+"<<categoryNo222")
		var age = $('#selectAge').val();
		var classNo = $('#selectClass').val();
		var projectDateInfo = $('#projectDateInfo').val();
      $.ajax({
			url : "${pageContext.request.contextPath}/educationProjectAdd",
			type : 'POST',
			dataType: 'JSON',
			async: false,
			data: {"dataArray": jparse, "mergeArray": mergeparse, "borderArray" : borderparse,"countRow" : countRow, "countCol":countCol, "categoryNo":categoryNo, "age":age, "classNo":classNo, "projectDateInfo":projectDateInfo},
			success : function(data){
			alert('success');
		                        
   		},error: function(XMLHttpRequest, textStatus, errorThrown) { 
   		     console.log("Status: " + textStatus);
   		},timeout: 3000
   		});    
	})
}) 
</script>


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
				<button name="save" id="save">Save</button>
				<button name="test" id="test">Test</button>
				<div class="wrapper" style="margin-top: 20px;">
					<div id="example1"></div>
				</div>
			</div>
		</div>
	</div>
	





</body>
</html>