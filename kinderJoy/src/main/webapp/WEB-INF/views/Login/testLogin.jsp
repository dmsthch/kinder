<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
		
<!-- script 태그에서 가져오는 자바스크립트 파일의 순서에 주의해야한다! 순서가 틀릴경우 자바스크립트 오류가 발생한다. -->
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
    	    console.log(username+" <--아이디");
    	    var password = $("#teacherPw").val();
    	    console.log(password+" <--패스워드");
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

    	    // 사용자ID와 비밀번호를 RSA로 암호화한다.
    	    var securedUsername = rsa.encrypt(username);
    	    console.log(securedUsername+" <--암호화된 아이디");
    	    console.log("asd");
    	    var securedPassword = rsa.encrypt(password);
    	    console.log(securedPassword+" <--암호화된 패스");

    	    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    	    var securedLoginForm = document.getElementById("securedLoginForm");
    	    console.log(securedLoginForm);
    	    securedLoginForm.securedUsername.value = securedUsername;
    	    console.log(securedUsername+" <--암호화된 아이디");
    	    securedLoginForm.securedPassword.value = securedPassword;
    	    console.log(securedPassword+" <--암호화된 패스");
    	    securedLoginForm.submit();
    	}
    	});
       </script> 
</head>
    
<body>
    <div>
        userID : <input type="text" id="username" name="teacherId" size="16"/>
            비밀번호 : <input type="password" id="password" name="teacherPw" size="16" />
        <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}" />
        <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />
        <a href="<%=request.getContextPath()%>/loginFailure.jsp" onclick="validateEncryptedForm(); return false;">로그인</a>
    </div>
    <form id="securedLoginForm" name="securedLoginForm" action="${pageContext.request.contextPath}/loginTest" method="post" style="display: none;">
        <input type="hidden" name="securedUsername" id="securedUsername" value="" />
        <input type="hidden" name="securedPassword" id="securedPassword" value="" />
    </form>
</body>



</html>