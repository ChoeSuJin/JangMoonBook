<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
  	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  	<style type="text/css">
  		.btn_write{
  			float:right;
  			margin-top:10px;
  		}
  		p{
  			font-size:1.3em;
  		}
  	</style>
</head><!--/head-->

<body>
<%@ include file= "../session_check.jsp" %>
	<!-- header -->
	<jsp:include page="../customer/customerHeader.jsp"/>
	<!-- header -->
	
	<section id="form" style="margin-top:-10px;"><!--form-->
		<div class="container">
			<div class="row">
				<div class="category-tab shop-details-tab"><!--category-tab-->
					<div class="tab-content" style="margin-top:30px;">
						<p style="font-size:2em;text-align:center;color:#93B658;">Q n A</p>
						<div class="login-form"><!--login form-->
							<form class="myPage-form" id="form1" name="form1" method="post" action="boardInsert.do">
								<p>제목<input type="text" name="title">
								<p>내용<textarea name="content" rows="10" cols="50"></textarea>	
								<div class="btn_write">
									<input type="hidden" name="writer" value="${ sessionScope.id }">
									<button class="btn btn-default" type="button" id="btnSave">글쓰기</button>
								</div>
							</form>
						</div>
					</div>
				</div><!--/category-tab-->
			</div>
		</div>
	</section><!--/form-->
	
	<!-- footer -->
	<jsp:include page="../customer/customerFooter.jsp" />
	<!-- footer -->
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btnSave").click(function(){
			var content=document.form1.content.value;
			var title=document.form1.title.value;
			if(content==""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			if(title==""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}		
	
			document.form1.submit();
		});
	});
	</script>
    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
</body>
</html>