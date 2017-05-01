<%@ page language="java" contentType="application/vnd.mx-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	response.setHeader("Content-Disposition", "attachment;filename=excelsample.xls");
	response.setHeader("Content-Discription", "JSP Generated Data");
	response.setContentType("application/vnd.mx-excel");

%>
<!doctype html>
<html>
<head>

<body>
	<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>1</td>
		</tr>
		<tr>
			<td>2</td>
		</tr>
		<tr>
			<td>3</td>
		</tr>
	</table>
</body>
</html>