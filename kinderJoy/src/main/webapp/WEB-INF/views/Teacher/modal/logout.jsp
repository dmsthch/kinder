<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<!-- �ڡڡڡڡڱ���Ȯ�� �� �α׾ƿ� ��� ���ۡڡڡڡڡ� -->

<div class="container">
  <!-- Trigger the modal with a button -->

  <!-- Modal -->
  <div class="modal fade" id="signOut" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">�α� �ƿ�</h4>
        </div>
        <div class="modal-body">
        
<!-- �ٵ���� -->
<form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post">
		<div class="text-center">�α׾ƿ� �Ͻðڽ��ϱ�?</div>
  </form>  
<!-- �ٵ𿣵� -->

        </div>
        <div class="modal-footer">
        <a href="${pageContext.request.contextPath}/logOut"><button type="button" class="btn btn-default">�α׾ƿ�</button></a>
        </div>
      </div>
      
    </div>
  </div>
</div>
	
</body>
</html>