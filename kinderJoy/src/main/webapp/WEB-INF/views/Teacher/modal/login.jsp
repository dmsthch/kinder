<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="css/JKC/css/default.css">
</head>
<body>
	
	<!-- �ڡڡڡڡ� �α��� ��� ���ۡڡڡڡڡ� -->
<div class="container">
  <!-- Trigger the modal with a button -->

  <!-- Modal -->
  <div class="modal fade" id="signIn" role="dialog">
    <!-- <div class="modal-dialog">
    
      <!-- Modal content-->
      <!-- <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">�α���</h4>
        </div>
        <div class="modal-body"> -->
        
<!-- �ٵ���� -->

<div id="site-container">
	<div class="siteColorBg">	
															<!-- �̹��� -->
    <div class="siteAnimationBg active" style="background-image: url(&quot;images/JKC/kid.jpg&quot;);">
    </div>
</div>
<div class="siteCover"></div>    
<div class="be-cover">
    <div class="befrozen-container befrozen-wrap">
        <form id="LoginForm" action="${pageContext.request.contextPath}/Login" method="post" class="befrozen-login">

            <h1>�α���</h1>
            <fieldset>
                <div class="form-item">
                    <input type="text" class="form-text" name="teacher_id" value="test01" placeholder="���̵� �Է��ϼ���"></div>
                <div class="form-item">
                    <input type="password" class="form-text" name="teacher_pw" value="test01" placeholder="��й�ȣ�� �Է��ϼ���">
                </div>
                
                <div class="form-item"><button type="submit" class="vanellope rp-font vanellope-pascal">login</button></div>
     			<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
            </fieldset>
        	</form>
	      </div>
	      </div>
      </div>
  
<!-- �ٵ𿣵� -->

        </div>
      </div>
      
    </div>
  </div>
  
</div>
	
</body>
</html>