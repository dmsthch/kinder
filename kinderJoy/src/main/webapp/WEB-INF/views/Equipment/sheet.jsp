<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

	<div class="btn-group">
	  <button type="button" class="btn btn-primary">:: 비품카테고리 ::</button>
	  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
	    <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu" role="menu">
	    <li><a href="#">교재,교구</a></li>
	    <li><a href="#">사무용품</a></li>
	    <li><a href="#">체육용품</a></li>
	    <li><a href="#">도서목록</a></li>
	    <li><a href="#">기타</a></li>
	  </ul>
	</div>
	<button id="btTest">save</button>
	<button id="reroad">road</button>
	<div class="wrapper" style="margin-top: 20px;">
		<div id="example1"></div>
	</div>
	
	
	<!-- Trigger the modal with a button -->
	<div style="display : none;">
	<button type="button" id="roadmodal" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
	</div>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">저장 목록</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>

  	</div>
	</div>


<script data-jsfiddle="example1">
	var container = document.getElementById('example1'),hot;
	var dataArray;
	var dataArray2;
	
	var testData = [null,null,null,null,[4,8,"123"],null,null,[7,5,"123"],null,null,null,null,[12,7,"123"],{"mergedCellInfoCollection":[]}]	; //데이터
	var testMerge = [{"row":5,"col":4,"rowspan":3,"colspan":3},{"row":11,"col":4,"rowspan":5,"colspan":3},{"row":6,"col":8,"rowspan":6,"colspan":3}];
	
	
		hot = new Handsontable(container, {
// 			data: testData,    //데이터 가져오기
			startRows: 30,
			startCols: 20,
			contextMenu : true,
			rowHeaders : true,
			colHeaders : true,
 			manualRowResize : true,
 			manualColumnResize : true,
			mergeCells : true,
			customBorders: true,	
//			mergeCells : testMerge,
/* 			contextMenuCopyPaste: {
			    swfPath: 'swf/ZeroClipboard.swf'
			}, */
			
			afterChange : function(data, type){ //data{열, 행, 이전값, 현재값} type="이벤트 종류"
				console.log(data, type)
				
				if(dataArray === undefined){
					console.log('초깅화')
					dataArray = [];
					dataArray2 = [];
				}
				
				if(data !== undefined && data !== null){
					var row = data[0][0];
					var col = data[0][1];
					var val = data[0][3];

					var meats = hot.getCellMeta(row,col);
					
					console.log(hot.mergeCells.mergedCellInfoCollection.getInfo(row, col));
//					console.log(hot.mergeCells);
					console.log(meats.borders)

					if(val !== null){
 						//console.log(row, col, val)

 						if(dataArray[row] === undefined){
							//dataArray[row] = {};							
						}
 						dataArray[row] = [row, col, val];
					/*	dataArray[row][col] = val;
						dataArray2 = hot.mergeCells.mergedCellInfoCollection.getInfo(row, col) */
					}
				}			
		}
	   
	});
 	$('#reroad').click(function(){
 		console.log('더워 미치겠네');
 		$('#roadmodal').trigger('click');

 		$.ajax({
 			url : "${pageContext.request.contextPath}/reroad",
 			type : 'POST',
 			dataType: "json",
 			async: false,
 			data:Sheet,
 			success : function(data){

 			var jsondata = JSON.stringify(data);

 			alert(jsondata);
 		                        
 		},error: function(XMLHttpRequest, textStatus, errorThrown) { 
 		     console.log("Status: " + textStatus);
 		},timeout: 3000
 		});    
 	});
	  	
	  	
	$('#btTest').click(function(){
		dataArray[dataArray.length] = hot.mergeCells;	
		var jArray = new Array();
		var jArray2 = new Array();
		
		jArray = dataArray;
		jArray2 = dataArray;
		
		console.log(jArray);
		console.log('====구분====');
		console.log(jArray2);
		
		var jsonStr = JSON.stringify(jArray);
		
		console.log(jsonStr);
		
	    $.ajax({
	        url:"${pageContext.request.contextPath}/save",
	        type:'GET',
	        data: {jsonStr:jsonStr},
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
// 		console.log(hot.mergeCells)
// 		console.log(hot.getCellsMeta())
// 		console.log(dataArray);sdf
	},5000)
	})
  
</script>

