<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>

    <!-- CSS Link -->
	<c:import url="/WEB-INF/views/module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>

    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.0-alpha.2/jquery.mobile-1.4.0-alpha.2.min.css" />
    <style>
    /* 아이템 가로 리스팅 

    li { float:left; }

    */
    </style>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.4.0-alpha.2/jquery.mobile-1.4.0-alpha.2.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="http://forresst.github.io/js/jquery.ui.touch-punch.min.js"></script>
    <script>
    $( document ).ready(function() {
        $( "#sortable" ).sortable({
            update: function( event, ui ){
                var arr = [];
                $('ul#sortable > li').each(function(){
                    arr.push( $(this).text() );
                });
                var result = arr.join(', ');
                $('#input-tag').val( result );
            }
        });
        $( "#sortable" ).sortable();
        $( "#sortable" ).disableSelection();
        $( "#sortable" ).bind( "sortstop", function(event, ui) {
            $('#sortable').listview('refresh');
        });
    });
    </script>
</head>
<body>
    <div data-role="content" data-theme="c">
  
        <input type="text" id="input-tag" value="">
        <!-- <input type="hidden" id="input-tag" value=""> --> 
        <ul id="sortable" data-role="listview" data-inset="true" data-theme="d">
            <li>아이템 1</li>
            <li>아이템 2</li>
            <li>아이템 3</li>
            <li>아이템 4</li>
            <li>아이템 5</li>
        </ul>
        <!-- 디자인 없는 버전 ~ 
54
        <div id="sortable">
55
            <span>아이템 1</span>
56
            <span>아이템 2</span>
57
            <span>아이템 3</span>
58
            <span>아이템 4</span>
59
            <span>아이템 5</span>
60
        </div>
61
        --> 
    </div>
</body>
