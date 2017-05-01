<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script data-jsfiddle="common" src="js/jquery.js"></script>

  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="js/LCR/Sheet/handsontable.css">
  <link data-jsfiddle="common" rel="stylesheet" media="screen" href="js/LCR/Sheet/pikaday/pikaday.css">
  <script data-jsfiddle="common" src="js/LCR/Sheet/pikaday/pikaday.js"></script>
  <script data-jsfiddle="common" src="js/LCR/Sheet/moment/moment.js"></script>
  <script data-jsfiddle="common" src="js/LCR/Sheet/zeroclipboard/ZeroClipboard.js"></script>
  <script data-jsfiddle="common" src="js/LCR/Sheet/numbro/numbro.js"></script>
  <script data-jsfiddle="common" src="js/LCR/Sheet/numbro/languages.js"></script>
  <script data-jsfiddle="common" src="js/LCR/Sheet/handsontable.js" type="text/javascript"></script>
</head>
<body>
<div class="wrapper">

 <div id="hot"></div>
 <div>
 	<button id="test">test</button>
 </div>
 <script data-jsfiddle="common">
                function getData() {
                  return [
                    ['', 'Kia', 'Nissan', 'Toyota', 'Honda'],
                    ['2008', 10, 11, 12, 13],
                    ['2009', 20, 11, 14, 13],
                    ['2010', 30, 15, 12, 13]
                  ];
                }
              </script>
              <script data-jsfiddle="hot">
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
                  contextMenu: true
                });

                // This way, you can access Handsontable api methods by passing their names as an argument, e.g.:
                var hotInstance = $("#hot").handsontable('getInstance');
                console.log(hotInstance);
              </script>
              <script>
              
              $('#test').on("click",function(){
            	  
              })
              </script>
              </div>
</body>
</html>