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
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head><!--/head-->

<body>
	<!-- header -->
	<jsp:include page="customerHeader.jsp"/>
	<!-- header -->
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Join in StarBooks</h2>
							<form action="starBooks.do?cmd=join" method="post" name="joinForm">
								<input type="text" name="id" placeholder="아이디">
								<input type="password" name="pwd" placeholder="비밀번호">
								<input type="password" name="pwd2" placeholder="비밀번호 확인">
								<input type="text" name="email" placeholder="이메일 주소">
								<input type="text" name="phone" placeholder="연락처 - 기호 없이 입력하세요">
								<input type="button" id="zipcode" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
								<input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호">
								<input type="text" id="sample6_address" name="address1" placeholder="주소">
								<input type="text" id="sample6_address2" name="address2" placeholder="상세주소">
								<input type="button" id="btnJoin" onclick="join_check()" value="회원가입">
							</form>
					</div><!--/login form-->
				</div>
				
			</div>
		</div>
	</section><!--/form-->
	
	<!-- footer -->
	<jsp:include page="customerFooter.jsp"/>
	<!-- footer -->
	
    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
    <script src="${resources}/js/main.js"></script>
</body>
</html>
