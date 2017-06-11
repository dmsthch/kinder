<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
		
<!-- script �±׿��� �������� �ڹٽ�ũ��Ʈ ������ ������ �����ؾ��Ѵ�! ������ Ʋ����� �ڹٽ�ũ��Ʈ ������ �߻��Ѵ�. -->
        <script type="text/javascript" src="js/JKC/t/jsbn.js"></script>
        <script type="text/javascript" src="js/JKC/t/rsa.js"></script>
        <script type="text/javascript" src="js/JKC/t/prng4.js"></script>
        <script type="text/javascript" src="js/JKC/t/rng.js"></script>
        <script type="text/javascript" src="js/JKC/t/login.js"></script>
       	<c:import url="/WEB-INF/views/module/importJS.jsp"></c:import>
       <script>
       
       $(document).ready(function(){
       function validateEncryptedForm() {
    	    var username = $("#teacherId").val();
    	    console.log(username+" <--���̵�");
    	    var password = $("#teacherPw").val();
    	    console.log(password+" <--�н�����");
    	    if (!username || !password) {
    	        alert("ID/PASSWORD.");
    	        return false;
    	    }

    	    try {
    	        var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
    	        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
    	        submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent);
    	    } catch(err) {
    	        alert(err);
    	    }
    	    return false;
    	}

    	function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    	    var rsa = new RSAKey();
    	    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

    	    // �����ID�� ��й�ȣ�� RSA�� ��ȣȭ�Ѵ�.
    	    var securedUsername = rsa.encrypt(username);
    	    console.log(securedUsername+" <--��ȣȭ�� ���̵�");
    	    console.log("asd");
    	    var securedPassword = rsa.encrypt(password);
    	    console.log(securedPassword+" <--��ȣȭ�� �н�");

    	    // POST �α��� ���� ���� �����ϰ� ����(submit) �Ѵ�.
    	    var securedLoginForm = document.getElementById("securedLoginForm");
    	    console.log(securedLoginForm);
    	    securedLoginForm.securedUsername.value = securedUsername;
    	    console.log(securedUsername+" <--��ȣȭ�� ���̵�");
    	    securedLoginForm.securedPassword.value = securedPassword;
    	    console.log(securedPassword+" <--��ȣȭ�� �н�");
    	    securedLoginForm.submit();
    	}
    	});
       </script> 
</head>
    
<body>
    <div>
        userID : <input type="text" id="username" name="teacherId" size="16"/>
            ��й�ȣ : <input type="password" id="password" name="teacherPw" size="16" />
        <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
        <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />
        <a href="<%=request.getContextPath()%>/loginFailure.jsp" onclick="validateEncryptedForm(); return false;">�α���</a>
    </div>
    <form id="securedLoginForm" name="securedLoginForm" action="${pageContext.request.contextPath}/loginTest" method="post" style="display: none;">
        <input type="hidden" name="securedUsername" id="securedUsername" value="" />
        <input type="hidden" name="securedPassword" id="securedPassword" value="" />
    </form>
</body>



</html>