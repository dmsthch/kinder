<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Ÿ��Ʋ ����</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	//����ڰ� �Է��� ���� DB�� ����� ���� ���Ͽ� �ߺ��ϴ��� üũ�Ѵ�
	
	$(document).ready(function(){
		$("#idcheckbutton").click(function(){
			var gogo="teacher_ajax_id="+$("#teacher_ajax_id").val();
			$.ajax({
				type : "post",
				url  : "${pageContext.request.contextPath}/logincheck",
				data : gogo,
				success : function(data){
					$("jeon").html(data);
				}
			})
		});
	});
</script>



</head>
<body>

<div class="container">
  <h2>ȸ������</h2>
  <form action="${pageContext.request.contextPath}/insert" class="form-horizontal" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2">���̼���:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="license_kindergarten" placeholder="�߱޵� ���̼����� �Է��ϼ���">
      </div>
    </div>
    
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">����:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_level" placeholder="������ �Է��ϼ���">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">�̸�:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_name" placeholder="�̸��� �Է��ϼ���">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">���̵�:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="teacher_ajax_id" name="teacher_id" placeholder="���̵� �Է��ϼ���">
        <input type="button" id="idcheckbutton" value="���̵�üũ" id="result"/>
        DB�� �ִ� ���̵��� �� : <jeon />
      </div>
    </div>
 
    
    <div class="form-group">
      <label class="control-label col-sm-2">Password:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_pw" placeholder="��й�ȣ�� �Է��ϼ���">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">�������:</label>
      <div class="col-sm-10">          
        <input type="date" class="form-control" name="teacher_add_day">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">����ó:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_phone" placeholder="����ó�� �Է��ϼ���">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">����:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_bank" placeholder="������ �Է��ϼ���">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">���¹�ȣ:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_account" placeholder="���¹�ȣ�� �Է��ϼ���">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">ȣ��:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="teacher_paystep" placeholder="ȣ���� �Է��ϼ���">
      </div>
    </div>
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>
