<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c"  uri= "http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${ pageContext.request.contextPath}"/>
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
<h2 align="center">비밀번호 찾기</h2>
<div align="center">
<p >아이디와 이메일 주소를 입력해 주세요.</p>
<form action="${path}/customer/sendpw.do" name="pwsearch" method="post" >
	<table border="1" >
		
		<tr>
			<td>아이디</td>
			<td>e-mail</td>
		</tr>
		<tr>
			<td><input type="text" name="id"/></td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="button" value="비밀번호 찾기 " onclick="search()" /></td>
		<c:if test=	"${message='EmailSended'}">
			비밀번호 정보가 이메일로 발송되었습니다.  
		</c:if>
		</tr>
	</table>

</form>


</div> 
</body>
</html>