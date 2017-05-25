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
	//네비바 색주기
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
 			
			startRows: 40,
			startCols: 15,
			rowHeaders : true,
			colHeaders : true,
			colWidths: 80,
			rowHeights: 30,
// 			manualRowResize : true,
// 			manualColumnResize : true,
			mergeCells : true,
			customBorders: true,
			contextMenu : true,
			 manualColumnMove: true,
			    manualRowMove: true,
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
		
		
	//입력후 유효성 경고창 띄우기
	$(document).on('change','.inspection',function(){
		var $this=$(this)
		var thisVal = $this.val();
		var id = $this.attr('id');
		console.log(isNaN(thisVal)+"<<<<")
		if(id == 'projectDateInfoYear' || id =='projectDateInfo'){
			if(thisVal.length!=4||thisVal<0||isNaN(thisVal)){
				showNotification('top','right','year');
				$this.focus();
			}
		}else if(id == 'projectDateInfoMonth'){
			console.log('월일때')
			if(thisVal.length>2||thisVal<0 || isNaN(thisVal)){
				showNotification('top','right','month');
				$this.focus();
			}
		}
	})
		
	$('#save').click(function(){
		//저장하기 전유효성검사
				//검사할 항목 : 연령, 반, 날짜
				//일일계획안(카테고리넘버 4)일때 --> 연령, 반, 날짜 (selectAge ,selectClass ,projectDateInfo)가 널이 아니여야 함.
				//주간계획안(카테고리넘버 3)일때 -->연령, 반, 날짜-년,월,주(selectAge ,selectClass,projectDateInfoYear,projectDateInfoMonth,projectDateInfoWeek)가 널이 아니여야함.
				//월간계획안(카테고리넘버 2)일때 --> 연령, 반, 날짜-년,월(selectAge ,selectClass,projectDateInfoYear,projectDateInfoMonth)이 널이 아니여야함.
				//연간계획안(카테고리넘버 1)일때 -->연령, 날짜 (selectAge, projectDateInfo)가 널이 아니여야함.
				
				//날짜-년은 4자리 숫자여야한다.
				//날짜-월은 숫자만 입력되어야 하며 2자리이다.
				//날짜-일은 숫자만 입력되어야 하며 2자리이고 1이상이며 32를 넘길수 없다. 
				//날짜-월은 1자리 수를 입력했을때 (1~9) 자동으로 2자리 수를 만들어주도록 한다.
				//날짜 - 주는 숫자, 1자리수, 1~5까지 입력가능. -- 셀렉트박스로 바꿀까?
					
				var age = $('#selectAge').val();
				var weekInfoYear = $('#projectDateInfoYear').val();
				var weekInfoMonth = $('#projectDateInfoMonth').val();
				var weekInfoWeek = $('#projectDateInfoWeek').val();
				var projectDateInfo; //조건에 따라서 달라짐.
				var classNo = $('#selectClass').val();
				var categoryNo = ${categoryNo};
				var saveOk = 0;
				if(age == null || age == undefined){
					//연령은 모든곳에서 null이 아니여야함.
					showNotification('top','right','empty');
					$('#selectAge').focus();
				}else if(categoryNo==4){
				//계획안 종류에 따라 조건 시작
				//일일계획안일때
					projectDateInfo = $('#projectDateInfo').val();
				console.log(projectDateInfo+"<<<<projectDateInfo");
					if(classNo == null || classNo == undefined ){
						$('#selectClass').focus();
						showNotification('top','right','empty');
					}else if(projectDateInfo == null || projectDateInfo == undefined ||projectDateInfo==''){
						$('#projectDateInfo').focus();
						showNotification('top','right','empty');
					}else{
						saveOk = 1;
					}
				}else if(categoryNo==3){
				//주간계획안일때
					if(classNo == null || classNo == undefined ){
						showNotification('top','right','empty');
						$('#selectClass').focus();
					}else if(weekInfoYear == null || weekInfoYear == undefined ){
						$('#projectDateInfoYear').focus();
						showNotification('top','right','empty');
					}else if(weekInfoMonth == null || weekInfoMonth == undefined){
						$('#projectDateInfoMonth').focus();
						showNotification('top','right','empty');
					}else if(weekInfoWeek== null || weekInfoWeek == undefined){
						$('#projectDateInfoWeek').focus();
						showNotification('top','right','empty');
					}else if(weekInfoYear.length != 4 || weekInfoYear <0 ||isNaN(weekInfoYear)){
						$('#projectDateInfoYear').focus();
						showNotification('top','right','empty');
					}else if(weekInfoMonth.length > 2 || weekInfoMonth < 0 ||isNaN(weekInfoMonth)){
						('#projectDateInfoMonth').focus();
						showNotification('top','right','empty');
					}else{
						saveOk = 1;
						//주간계획안은 YYYY-MM-주 (1~5)로 입력되어야함. 해당하는 형식으로 바꿔준다.
						if(weekInfoMonth<10){
							//달 입력할때 숫자 하나만 입력했을때
							if(weekInfoMonth.length<2){
								weekInfoMonth = "0"+weekInfoMonth;
							}
						}
						projectDateInfo =weekInfoYear+"-"+weekInfoMonth +"-"+weekInfoWeek;
					}
				}else if(categoryNo==2){
				//월간계획안일때
					if(classNo == null || classNo == undefined ){
						$('#selectClass').focus();
						showNotification('top','right','empty');
					}else if(weekInfoYear == null || weekInfoYear == undefined ){
						$('#projectDateInfoYear').focus();
						showNotification('top','right','empty');
					}else if(weekInfoMonth == null || weekInfoMonth == undefined || weekInfoMonth==''){
						$('#projectDateInfoMonth').focus();
						showNotification('top','right','empty');
					}else if(weekInfoYear.length != 4 || weekInfoYear <0 || isNaN(weekInfoYear)){
						$('#projectDateInfoYear').focus();
						showNotification('top','right','empty');
					}else if(weekInfoMonth.length > 2 || weekInfoMonth < 0 || isNaN(weekInfoMonth)){
						('#projectDateInfoMonth').focus();
						showNotification('top','right','empty');
					}else{
						//월간 계획안은 YYYY-DD형식이어야 한다. 해당하는 형식으로 바꿔준다.
						if(weekInfoMonth<10){
							//달 입력시 숫자 하나만 입력했을때 0붙여서 만들어줌
							if(weekInfoMonth.length<2){
								weekInfoMonth = "0"+weekInfoMonth;
							}
						}
						projectDateInfo = weekInfoYear+"-"+weekInfoMonth
						saveOk = 1;
					}
				}else if(categoryNo==1){
				//연간계획안일때
					projectDateInfo = $('#projectDateInfo').val();
					if(projectDateInfo== null || projectDateInfo == undefined ||projectDateInfo==''){
						$('#projectDateInfo').focus();
						showNotification('top','right','empty');
					}else if(projectDateInfo.length != 4 || projectDateInfo <0 || isNaN(projectDateInfo)){
						$('#projectDateInfoYear').focus();
						showNotification('top','right','empty');
					}else{
						saveOk = 1;
					}
				
				}
				
				if(saveOk==1){
	
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
					
			      $.ajax({
						url : "${pageContext.request.contextPath}/educationProjectAdd",
						type : 'POST',
						dataType: 'JSON',
						async: false,
						data: {"dataArray": jparse, "mergeArray": mergeparse, "borderArray" : borderparse,"countRow" : countRow, "countCol":countCol, "categoryNo":categoryNo, "age":age, "classNo":classNo, "projectDateInfo":projectDateInfo},
						success : function(data){
							showNotification('top','right',data.result);             
			   		},error: function(XMLHttpRequest, textStatus, errorThrown) { 
			   		     console.log("Status: " + textStatus);
			   		},timeout: 3000
			   		});   
				}	
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
						<select class="form-control" id="selectAge" >
						<option value="" disabled selected> 연령 선택  </option>
						<option value="3" >3세</option>
						<option value="4">4세</option>
						<option value="5">5세</option>
						
						</select>
					</div>
					<div class="col-sm-3" id="afterAge" style="display: none;">
						<select class="form-control" id="selectClass" name="selectClass" >
							<option value="" disabled selected> 반 선택  </option>
							<c:forEach items="${listChildClass}" var="childClass">
								<option value="${childClass.classNo}" class="${childClass.classAge}">${childClass.className}</option>
							</c:forEach>
						</select>
					</div>
					<!-- 일일계획안 -->
					<c:if test="${categoryNo==4}">
						<div class="col-sm-3" id="afterClass" style="display: none;">
						<input class="form-control" type="date" id="projectDateInfo" >
						</div>
					</c:if>
					<!-- 주간계획안 -->
					<c:if test="${categoryNo==3}"> 
						<div class="col-sm-3" id="afterClass" style="display: none;">
							<div class="col-sm-4"> <input class="form-control inspection" type="text" id="projectDateInfoYear" placeholder="년 입력" > </div>
							<div class="col-sm-3"> <input class="form-control inspection" type="text" id="projectDateInfoMonth" placeholder="월 입력" > </div>
							<div class="col-sm-5"><select class="form-control" id="projectDateInfoWeek">
													<option value="" disabled selected>주 선택</option>
													<option value=1>1주</option>
													<option value=2>2주</option>
													<option value=3>3주</option>
													<option value=4>4주</option>
													<option value=5>5주</option>
													</select></div>
						</div>
					</c:if>
					<!-- 월간계획안 -->
					<c:if test="${categoryNo==2}">
						<div class="col-sm-3" id="afterClass" style="display: none;">
						<div class="col-sm-6"><input class="form-control inspection" type="text" id="projectDateInfoYear" placeholder="년 입력" ></div>
						<div class="col-sm-6"><input class="form-control inspection" type="text" id="projectDateInfoMonth" placeholder="월 입력" ></div>
						</div>
					</c:if>
					<!-- 연간계획안 -->
					<c:if test="${categoryNo==1}">
						<div class="col-sm-3" id="afterClass" style="display: none;">
						<input class="form-control inspection" type="text" id="projectDateInfo" placeholder="년 입력" >
						</div>
					</c:if>
					
				</div>
				<button name="save" id="save">Save</button>
				
				<div class="wrapper" style="margin-top: 20px;">
					<div id="example1"></div>
				</div>
			</div>
		</div>
	</div>
	





</body>
</html>