<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<title>ChildDevelopment</title>
<<<<<<< HEAD

<style>
.mydiv{
	border: 1px solid black;

}

.mmydiv{
	border-right: 1px solid black;
}

</style>

=======
>>>>>>> branch 'master' of https://github.com/dmsthch/kinder.git
</head>

<body>

<div class="container">
<<<<<<< HEAD
  <h2>Bordered Table</h2>
  
  
	<div class="row">
		<div class="col-sm-12 row">
		
			<div class="col-sm-5 mydiv">
				<div class="row">
					<div class="col-sm-4 text-center mmydiv">1 <br/><br/></div>
					<div class="col-sm-4 text-center mmydiv">1 <br/><br/></div>
					<div class="col-sm-4 text-center">1 <br/><br/></div>
				</div>
			</div>
			
			<div class="col-sm-7 ">
				<div class="row">
					<div class="col-sm-12 text-center mydiv">1</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mydiv">1</div>
					<div class="col-sm-4 mydiv">1</div>
					<div class="col-sm-4 mydiv">1</div>
				</div>
			</div>
		
		</div>
		
		
	</div>
          
 
=======
    <h1>ChildDevelopment</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/ChildDevelopment" method="post">
        <div class="form-group">
            <label for="development_group">분류 :</label>
            <input class="form-control" name="development_group" id="development_group" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_content">내용 :</label>
            <input class="form-control" name="development_content" id="development_content" type="text"/>
        </div>
         <div class="form-group">
            <label for="development_details">세부내용 :</label>
            <input class="form-control" name="development_details" id="development_details" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_question">관찰문항 :</label>
            <input class="form-control" name="development_question" id="development_question" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_standart">관찰준거 :</label>
            <input class="form-control" name="development_standart" id="development_standart" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_case">관찰사례 :</label>
            <input class="form-control" name="development_case" id="development_case" type="text"/>
        </div>
        <div class="form-group">
            <label for="development_day">관찰일 :</label>
            <textarea class="form-control" name="kidPrecautions" id="kidPrecautions" rows="5" cols="50"></textarea>
        </div>
        <div class="form-group">
            <label for="development_title">제목 :</label>
            <input class="form-control" name="development_title" id="development_title" type="text"/>
        </div>
         <div class="form-group">
            <label for="license_kindergarten">유치원라이선스 :</label>
            <input class="form-control" name="license_kindergarten" id="license_kindergarten" type="text"/>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="button" value="글입력"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/ChildList">글목록</a>
        </div>
    </form>
>>>>>>> branch 'master' of https://github.com/dmsthch/kinder.git
</div>

</body>
</html>
