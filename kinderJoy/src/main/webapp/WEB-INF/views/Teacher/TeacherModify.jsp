<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- jsp로 받을 땐 값이 담겨있는 name값과 name안에 있는 value값을 적어줘야 한다 .으로 구분 -->
<!-- 세션에 담겨있는  -->

	${kyoteacher.teacher_no},
	${kyoteacher.teacher_id},
	${kyoteacher.license_kindergarten},
	${kyoteacher.teacher_level},
	${kyoteacher.teacher_name},
	${kyoteacher.teacher_pw},
	${kyoteacher.teacher_add_day},
	${kyoteacher.teacher_phone},
	${kyoteacher.teacher_bank},
	${kyoteacher.teacher_account},
	${kyoteacher.teacher_paystep}


</body>
</html>