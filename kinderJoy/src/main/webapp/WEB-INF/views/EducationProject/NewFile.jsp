<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function () {
	var container = document.getElementById('Grille_competences'); 
	var headerRenderer = function (instance, td, row, col, prop, value, cellProperties){ 
	Handsontable.renderers.TextRenderer.apply(this, arguments);
	td.style.fontWeight = 'bold'; 
	td.style.textAlign = 'center'; 
	td.style.backgroundColor = '#B0C4DE';
	};
	//Initialisation des données de la grille. 
	var data = [["Compétences","Description","Code",""], ["", "", "",""], ["","", "",""], ["","", "",""], ["","", "",""], ["","", "",""]]; 
	//Création de la grille 
	hot = new Handsontable(container, {
		data: data, height: 800, width: 1183, colWidths: [35,200,25,80], 
		manualRowResize: true, 
		colHeaders: true, 
		rowHeaders: true, 
		mergeCells: true, 
		stretchH: 'all', 
		columnSorting: true, 
		contextMenu: true, 
		contextMenuCopyPaste: { swfPath: './zeroclipboard/dist/ZeroClipboard.swf' },
		//Fonctionnalités lors d'un clic droit dans la grille. 
		contextMenu: { items: { "row_above": { name: 'Insérer ligne au dessus', disabled: function () {return hot.getSelected()[0] === 0; } },
		"row_below": { name: 'Insérer ligne en dessous', disabled: function() { return hot.getSelected()[0] === 0; } }, 
		"hsep1": "---------", 
		"col_left": { name: 'Insérer colonne à gauche', disabled: function () { return hot.getSelected()[0] === 0; } },
		"col_right": { name: 'Insérer colonne à droite', disabled: function() { return hot.getSelected()[0] === 0; } }, 
		"hsep2": "---------", 
		"remove_row": { name: 'Supprimer la ligne', disabled: function () { return hot.getSelected()[0] === 0; } }, 
		"remove_col": { name: 'Supprimer la colonne', disabled: function () { return hot.getSelected()[0] === 0; } }, 
		"hsep3": "---------", 
		"copy": { name:'Copier', disabled: function () { return hot.getSelected()[0] === 0; } }, 
		"paste": { name: 'Coller', disabled: function(){ return hot.getSelected()[0] === 0; } }, 
		"hsep4": "---------", 
		"undo": { name:'Précédent', disabled: function(){ return hot.getSelected()[0] === 0; } }, 
		"redo": { name: 'Suivant', disabled: function(){ return hot.getSelected()[0] === 0; } }, 
		"hsep5": "---------", 
		"make_read_only": { name: 'Lecture seule', disabled: function() { return hot.getSelected()[0] === 0; } },
		"alignment": { name: 'Alignement du texte', disabled: function () { return hot.getSelected()[0] === 0; } }, 
		"mergeCells": { name: 'Fusionner les cellules', disabled: function () { return hot.getSelected()[0] === 0; } 
	},
	}, 
	}, //Entetes de la grille en lecture seule. 
	cells: function(row, col, prop) { 
	var cellProperties = {}; 
	if(row===0){ cellProperties.renderer = headerRenderer; } 
	if(row === 0 && col <3){ cellProperties.readOnly = true; } return cellProperties; } });
	//Lors d'un clic sur le bouton valider, transmission des données de la grille. 
	});
	$('#save').click(function(){ 
	$.ajax({ url: "testGetData.php", dataType: 'json', data: {data: hot.getData() },
	type: 'GET', success: function () { $console.text('Saved !'); } }); }); 

</script>
</head>
<body>

<?php
 session_start(); 
require_once('./lib/demo/php/functions.php'); 
$db = getConnection(); 
createBDD($db); 
if($db) { $db = new PDO('mysql:host=localhost; dbname=bdd'.$_SESSION['login'],'root', 'passwd'); 
createTableBDD($db); 
foreach ($_GET['data'] as $value){ $query = $db->prepare('INSERT INTO Competences(libelle) VALUES('.$value[0].')'); $query->execute(); } } ?> 

</body>
</html>