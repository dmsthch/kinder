<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Ÿ��Ʋ ����</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	//����ڰ� �Է��� ���� DB�� ����� ���� ���Ͽ� �ߺ��ϴ��� üũ�Ѵ�
	
	function idDuplicationCheck (id) {
		//AJAX ������� ������ DATA�� �����ϰ� RETURN �޴´�
		$.ajax({
			//type�� �����Ѵ�
			type : 'POST',
			//�����ּҸ� ���´�
			url  : "/logincheck",
			//���� �Է��� id���� �޾Ƽ� ������ ������
			data : {"id" : id},
			//���������� ���� ������ ������ ��� success�ڵ带 ����Ͽ� �̺�Ʈ ó���� �Ѵ�
			success : function (data) {
				//�������� Return�� ������ �ߺ� ���θ� ����ڿ��� �˸���.
				
				//���ϵ� data�� ���� ��������� �ߺ��ǹǷ� ���Ұ��ϴ�.
				if (data) {
					alert("���Ұ�");
				} else {
					alert("��밡��")
				}
			}
		})
	}
</script>


</head>
<body>
<form>
	<input type="hidden" id="idChk" value="N" /><!-- IDüũ �ߴ���, ���ߴ���. -->
	
	���̵� : <input type="text" name="id" id="insertId" maxlength="30" /><input type="button" value="Idüũ" onclick="javascript:chkDupId();" />
	
	<input type="text" name="id" id="id" />
	<input type="button" value="��û" id="logincheck"/>
	<div id="loadtext">�غ���</div>
</form>
</body>
</html>