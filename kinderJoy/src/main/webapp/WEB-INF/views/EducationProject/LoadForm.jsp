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
	$('#educationProjectAddPage').attr('class','active');
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
	/* for(j=0; j<countRow;j++){
		if(dataValue[j]==null){
			dataValue[j]={ };
			//console.log(dataValue);
			for(i=0 ; i<countCol; i++){
				dataValue[j][i] ='';
				//console.log("ㅇㅅㅇ! ->> "+ i);
			}
		}	
	} */
	
	
	for(j=0; j<countRow;j++){
		if(dataValue[j]==null){
			dataValue[j]={ };
			//console.log(dataValue);
			for(i=0 ; i<countCol; i++){
				dataValue[j][i]=" ";
				//console.log("ㅇㅅㅇ! ->> "+ i);
			}
		}
		if(j==0){
			for(i=0 ; i<countCol; i++){
				if(dataValue[0][i] == null && dataValue[0][i] == undefined){
					dataValue[0][i] ='';
				}
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
			
		//	width: 1800,
		//  height: 700,
			startRows: countRow,
			startCols: countCol,
			rowHeaders : true,
			colHeaders : true,
			minRows: countRow,
			minCols: countCol,
			colWidths: 80,
			rowHeights: 30,
 		//	manualRowResize : true,
 	//		manualColumnResize : true,
			mergeCells : true,
			customBorders: true,
			customBorders: dataBorders,
			contextMenu : true,
//			renderAllRows: true,
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
					//console.log(dataForSave[row][col]);;
					var meats = hot.getCellMeta(row,col);
					
					console.log(meats.borders)
				
					if(val !== null){
						if(dataForSave[row] == null && dataForSave[row] == undefined){
							
							dataForSave[row] = {};
						}
						dataForSave[row][col] = val;
// 						/* dataForSave[row][col] = val; */
						dataValue=dataForSave;  
					}
				}			
		}
	   
	});
	
	$('#save').click(function(){
		
		var jparse=JSON.stringify(dataValue);
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
		var formOrder = ${formOrder};
		var formTitle = $('#formTitle').val();
		console.log(formOrder+"<<<<<<<<<<폼오더")
      $.ajax({
			url : "${pageContext.request.contextPath}/educationProjectFormAdd",
			type : 'POST',
			dataType: 'JSON',
			async: false,
			data: {"dataArray": jparse, "mergeArray": mergeparse, "borderArray" : borderparse,"countRow" : countRow, "countCol":countCol, "categoryNo":categoryNo,"age":age, "classNo":classNo, "projectDateInfo":projectDateInfo, "formOrder" : formOrder,"formTitle" : formTitle},
			success : function(data){
			showNotification('top','right',data.result);
		                        
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
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header" data-background-color="blue">
									<h3 class="title">양식 불러오기</h3>
								</div>
								
								<div class="card-content">
									<div class="row">
										<div class="col-sm-4">
												<div class="form-group label-floating">
													<label class="control-label">양식 제목 </label>
													<input type="text" class="form-control" name="formTitle" value="${resultData.formTitle}" id="formTitle">
												</div>
										</div>
										<div class="col-sm-2" style="padding-top: 15px; text-align: center;"> 
											<button name="save" id="save" class="btn btn-info">양식 수정</button>
										</div>
										<div class="col-sm-2" style="padding-left: 0px; padding-top: 15px; text-align: left;"> 
											<button data-toggle="modal" data-target="#deleteModal" name="delete" id="delete" class="btn btn-danger">양식 삭제</button>
										</div>
									</div>
									
								</div>
							</div>
							<div class="wrapper" style="margin-top: 20px;">
								<div id="example1"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  <!-- Modal -->
  <div class="modal fade" id="deleteModal" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <form method="post" action="${pageContext.request.contextPath}/educationProjectFormDelete">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">양식 삭제</h4>
	        </div>
	        <div class="modal-body">
	          <p>이 양식을 삭제하시겠습니까?</p>
	          <input type="hidden" name="formNo" value="${resultData.formNo}">
	        </div>
	        <div class="modal-footer">
	          <input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
	          <button class="btn btn-danger" type="submit">삭제하기</button>
	        </div>
        </form>
      </div>
    </div>
  </div>

</body>


</html>