<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script>
  
  $(document).ready(function(){
		$("#idcheckbutton").click(function(){
			var gogo="teacher_ajax_id="+$("#teacher_ajax_id").val();
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/li",
				data : gogo,
				success : function(data){
					if (data == 0){
						$("jeon").html("��밡��")
						}else{
						$("jeon").html("���Ұ�")
					}
				}
			})
		});
	});
  
  </script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/li" method="post">
	<div class="form-group">
	<label class="control-label col-sm-2">���̼��� �߱޹ޱ�</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="teacher_ajax_id" name="teacher_id" placeholder="���̵� �Է��ϼ���">
        <input type="button" id="idcheckbutton" value="���̵�üũ"/>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2">�߱޵� ���̼��� : </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="license_kindergarten" placeholder="�߱޵� ���̼����� �Է��ϼ���">
        <button name="license" type="submit" value="li">���̼��� �߱޹ޱ�</button>
      </div>
    </div>
	</form>
</body>
</html>