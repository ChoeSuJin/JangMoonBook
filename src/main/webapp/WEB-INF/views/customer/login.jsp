<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
    <title>StarBooks</title>
    <link href="${resources}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${resources}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${resources}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${resources}/css/price-range.css" rel="stylesheet">
    <link href="${resources}/css/animate.css" rel="stylesheet">
	<link href="${resources}/css/main.css" rel="stylesheet">
	<link href="${resources}/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="${resources}/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resources}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${resources}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resources}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${resources}/images/ico/apple-touch-icon-57-precomposed.png">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
    <script>
	   $(document).ready(function(){
	      $("#btnLogin").click(function(){
	         var id = $("#id").val();
	         var pwd = $("#pwd").val();
	         if(id==""){
	            alert("아이디를 입력하세요");
	            $("#id").focus();
	            return;
	         }
	         if(pwd==""){
	            alert("비밀번호를 입력하세요");
	            $("#pwd").focus();
	            return;
	         }
	         //폼 내부의 데이터를 전송 할 주소
	         document.form1.action="starBooks.do?cmd=main";
	         document.form1.submit();
	      });      
	      
	   });
	</script>
</head><!--/head-->

<body>
	<!-- header -->
	<jsp:include page="customerHeader.jsp"/>
	<!-- header -->
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				
				<div class="col-sm-4 col-sm-offset-1-login">
					<div class="login-form"><!--login form-->
						<h2>StarBooks Login</h2>
						<form name="form1" method="post">
							<input type="text" name="id" id="id" placeholder="User Id" />
							<input type="password" name="pwd" id="pwd" placeholder="User Password" />
							<c:if test = "${message=='error'}">
								<div style="color:red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
							</c:if>
							<input type="button" id="btnLogin" class="btn btn-default" value="login">
						</form>
					</div><!--/login form-->
				</div>
				
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				
				<div class="col-sm-4">
					<div class="signup-form" style="margin-top:58px;"><!--sign up form-->
						<a href="organLoginForm.do">기관 로그인</a><br><br>
						<a href="starBooks.do?cmd=join">회원가입</a>
					</div><!--/sign up form-->
				</div>
				
			</div>
		</div>
	</section><!--/form-->
	
	<!-- footer -->
	<jsp:include page="customerFooter.jsp" />
	<!-- footer -->
	
    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
</body>
</html>
