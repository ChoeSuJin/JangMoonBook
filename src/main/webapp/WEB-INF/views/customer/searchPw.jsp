<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c"  uri= "http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
<c:set var="path" value="${ pageContext.request.contextPath}"/>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		document.ready(function(){
			var msg = $('#msg').value;
			alert(msg);
		});
			
		function search(){
			
			if(document.pwsearch.id.value=="") {
				alert("아이디를 입력하세요.");
				return;
			}else if(document.pwsearch.email.value=="") {
				alert("이메일주소를 입력하세요.");
				return;
			}else{
				
				document.pwsearch.submit();
				alert("비밀번호 정보가 이메일로 발송되었습니다."); 
			}
			
		}
	</script>
</head>
<body>

<!-- header -->
	<jsp:include page="customerHeader.jsp"/>
	<!-- header -->
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				
				<div class="col-sm-4 col-sm-offset-1-login">
					<div class="login-form"><!--login form-->
						<h2>StarBooks SearchPassword</h2>
						<form action="${path}/sendpw.do" name="pwsearch" method="post" >
							<input type="text" name="id" placeholder="아이디를 입력하세요."/>
							<input type="text" name="email" placeholder="가입할 때 입력한 이메일을 입력해주세요"/>
							<input type="button" class="btn btn-default" id="btnFindPw" value="비밀번호 찾기 " onclick="search()" />
						</form>
					</div><!--/login form-->
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

</div> 
</body>
</html>