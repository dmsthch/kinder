<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

 <!--
  Loading Handsontable (full distribution that includes all dependencies apart from jQuery)
  -->
  <script  src="js/jquery.js"></script>

  <link  rel="stylesheet" media="screen" href="js/LCR/EducationProject/handsontable.css">
  <link rel="stylesheet" media="screen" href="js/LCR/EducationProject/pikaday/pikaday.css">
  <script src="js/LCR/EducationProject/pikaday/pikaday.js"></script>
  <script src="js/LCR/EducationProject/moment/moment.js"></script>
  <script src="js/LCR/EducationProject/zeroclipboard/ZeroClipboard.js"></script>
  <script src="js/LCR/EducationProject/numbro/numbro.js"></script>
  <script src="js/LCR/EducationProject/numbro/languages.js"></script>
  <script src="js/LCR/EducationProject/handsontable.js"></script>
  
<title>Insert title here</title>
</head>
<body>



<div class="wrapper">
  <div class="wrapper-row">
    <div id="global-menu-clone">
      <h1><a href="../index.html">Handsontable</a></h1>

    </div>

    <div id="container">
      <div class="columnLayout">

        <div class="rowLayout">
          <div class="descLayout">
            <div class="pad" data-jsfiddle="hot">

              <div id="hot"></div>

            </div>
          </div>

          <div class="codeLayout">
            <div class="pad">

              <script data-jsfiddle="hot">
              
              $(document).ready(function(){
            		
                    
                  /*   $('#save').click(function(){
           				alert('test');
           				//console.log(hot.data[0][0]+"체크체크");
           				
           				
           				//var res =JSON.stringify({data: getData()});
          			 	   console.log(JSON.parse(res));
           				//alert('test');
           			    // save all cell's data\
           			     
           			     
           			    $.ajax('scripts/json/save.json', 'GET', JSON.stringify({data: getData()}), function (res) {
           			      var response = JSON.parse(res.response);
           					console.log(response);
           			      if (response.result === 'ok') {
           			        exampleConsole.innerText = 'Data saved';
           			      }
           			      else {
           			        exampleConsole.innerText = 'Save error';
           			      }
           			    }); 
           			}); */
                  
            		
            	  
            	   function getData() {
                       return [
                         ['0','2',null,'3'],
                         ['2008', 10, 11, 12, 13],
                         ['2009', 20, 11, 14, 13],
                         ['2010', 30, 15, 12, 13]
                       ];
                     }
            	  var dataString;
            	  var dataArray=[];
             
                // Instead of creating a new Handsontable instance with the container element passed as an argument,
                // you can simply call .handsontable method on a jQuery DOM object.
                var $container = $("#hot");

               $container.handsontable({
                    data: getData(),
                    startRows: 10,
                    startCols: 10,
                    minRows: 10,
                    minCols: 10,
                    maxRows: 10,
                    maxCols: 10,
                    rowHeaders: true,
                    colHeaders: true,
                    minSpareRows: 1,
                    mergeCells: true,
                    customBorders: true,
                    manualColumnMove: true,
                    manualColumnResize: true,
                    manualRowMove: true,
                    manualRowResize: true,
                    contextMenu: true,
        			afterChange : function(data, type){ //data{열, 행, 이전값, 현재값} type="이벤트 종류"
        				console.log(data, type+" ++요놈")
        				console.log(data[0][1]);
        				  $('#save').click(function(){
                 				alert('test');
                 				var jparse=JSON.parse(JSON.stringify(data));
                 				console.log(jparse);
                 				
                 				
                 				/* console.log(data[0][0]+"<-row");
                 				console.log(data[0][1]+"<-col");
                 				console.log(data[0][3]+"<-val");
                 				dataString = '{ "row" : "'+data[0][0]+'" ,"col" : "'+data[0][1]+'", "val" : "'+data[0][3]+'" }';
                 				dataArray.push(dataString);
                 				console.log(dataArray) */
        				  });
        				
        			/* 	if(dataArray === undefined){
        					console.log('초깅화')
        					dataArray = [];
        				}
        				
        				if(data !== undefined && data !== null){
        					var row = data[0][0];
        					var col = data[0][1];
        					var val = data[0][3];

        					//var meats = hot.getCellMeta(row,col);
        					
        					//console.log(hot.mergeCells.mergedCellInfoCollection.getInfo(row, col));
//        					console.log(hot.mergeCells);
        					//console.log(meats.borders)

        					if(val !== null){
         						console.log(row, col, val)

         						if(dataArray[row] === undefined){
        							//dataArray[row] = {};							
        						}
         						dataArray[row] = [row, col, val];
        						dataArray[row][col] = val;
        						dataArray2 = hot.mergeCells.mergedCellInfoCollection.getInfo(row, col) 
        					}
        				} */
        				
        				
        		}
                    
                  });
 

                // This way, you can access Handsontable api methods by passing their names as an argument, e.g.:
             /*    var hotInstance = $("#hot").handsontable('getInstance');
                console.log(hotInstance); */
                
    			
    			
              });
              </script>
            </div>
          </div>
        </div>

        <div class="footer-text">
        </div>
      </div>

    </div>

  </div>
</div>
<div> <input type="button" id="save" value="테스트"></div>
<div id="outside-links-wrapper"></div>


</body>
</html>