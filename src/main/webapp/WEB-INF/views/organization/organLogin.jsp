<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>기관 로그인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #login-form > div {
        margin: 15px 0;
    }
	</style>
</head>
<body>
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">기관 로그인</div>
            </div>
            <div class="panel-body">
<<<<<<< HEAD
=======
            	<c:if test="${param.error != null}">
					<div>
						<p style="color:red;">로그인실패 사원번호와 비밀번호를 확인하세요.</p>
					</div>
				</c:if>
>>>>>>> branch 'newMaster' of https://github.com/ChoeSuJin/JangMoonBook.git
                <form name='f' action="organLogin.do" method="post" id="login-form">
                    <div>
                        <input type="text" class="form-control" name="oname" placeholder="기관명을 입력하세요" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="opwd" placeholder="기관 비밀번호를 입력하세요">
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>