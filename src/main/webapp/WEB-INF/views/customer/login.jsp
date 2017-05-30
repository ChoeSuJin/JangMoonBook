<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c"  uri= "http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
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
			document.form1.action="${path}/customer/loginCheck.do";
			document.form1.submit();
			
		});		
		
	});

</script>
</head>
<body>
<h2>로그인</h2>
	<form name = "form1" method="post">
		<table style="border: 1; widows: 400px;">
			<tr>
				<td>ID </td>
				<td><input name = "id" id= "id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name = "pwd" id = "pwd"></td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<button type = "button" id="btnLogin">로그인</button>
					<input type = "button" value = "회원가입" onclick = "location.href= '${path}/customer/write.do'">
					
					<c:if test = "${message=='error'}">
						<div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if>
					<c:if test = "${message=='logout'}">
						<!-- alert("로그아웃되었습니다."); -->
					</c:if>
				
				</td>	
			</tr>
		
		</table>
	</form>

</body>
</html>