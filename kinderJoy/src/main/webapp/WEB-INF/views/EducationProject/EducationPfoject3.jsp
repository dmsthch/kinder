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
            <div class="pad" data-jsfiddle="example1">
              
                <button name="load" id="load">Load</button>
                <button name="save" id="save">Save</button>
                <label><input type="checkbox" name="autosave" id="autosave" checked="checked" autocomplete="off"> Autosave</label>
            

              <div id="example1"></div>

              <p>
                <button name="dump" data-dump="#example1" data-instance="hot" title="Prints current data source to Firebug/Chrome Dev Tools">
                  Dump data to console
                </button>
              </p>
            </div>
          </div>

          <div class="codeLayout">
            <div class="pad">
             
              <script data-jsfiddle="example1">
                var $ = function(id) {
                      return document.getElementById(id);
                  },
                  container = $('example1'),
                  exampleConsole = $('example1console'),
                  autosave = $('autosave'),
                  load = $('load'),
                  save = $('save'),
                  autosaveNotification,
                  hot;

                hot = new Handsontable(container, {
                  startRows: 8,
                  startCols: 6,
                  rowHeaders: true,
                  colHeaders: true,
                  minSpareRows: 1,
                  contextMenu: true,
                  afterChange: function (change, source) {
                    if (source === 'loadData') {
                      return; //don't save this change
                    }
                    if (!autosave.checked) {
                      return;
                    }
                    clearTimeout(autosaveNotification);
                    ajax('json/save.json', 'GET', JSON.stringify({data: change}), function (data) {
                      exampleConsole.innerText  = 'Autosaved (' + change.length + ' ' + 'cell' + (change.length > 1 ? 's' : '') + ')';
                      autosaveNotification = setTimeout(function() {
                        exampleConsole.innerText ='Changes will be autosaved';
                      }, 1000);
                    });
                  }
                });

                Handsontable.Dom.addEvent(load, 'click', function() {
                  ajax('json/load.json', 'GET', '', function(res) {
                    var data = JSON.parse(res.response);

                    hot.loadData(data.data);
                    exampleConsole.innerText = 'Data loaded';
                  });
                });

                Handsontable.Dom.addEvent(save, 'click', function() {
                	alert('test');
                  // save all cell's data
                  ajax('json/save.json', 'GET', JSON.stringify({data: hot.getData()}), function (res) {
                    var response = JSON.parse(res.response);

                    if (response.result === 'ok') {
                      exampleConsole.innerText = 'Data saved';
                    }
                    else {
                      exampleConsole.innerText = 'Save error';
                    }
                  });
                });

                Handsontable.Dom.addEvent(autosave, 'click', function() {
                  if (autosave.checked) {
                    exampleConsole.innerText = 'Changes will be autosaved';
                  }
                  else {
                    exampleConsole.innerText ='Changes will not be autosaved';
                  }
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

<div id="outside-links-wrapper"></div>

</body>
</html>