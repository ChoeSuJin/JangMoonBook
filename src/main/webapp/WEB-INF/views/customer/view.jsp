<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js">
</script>
<c:set var = "path" value = "${pageContext.request.contextPath }"/>

<script type="text/javascript">
	$(document).ready(function(){
		// 수정버튼
			$("#btnUpdate").click(function(){
		
				document.form1.action="${path}/customer/update.do";
				document.form1.submit();
				
			});
	
		// 삭제버튼
			$("#btnDelete").click(function(){
				if(confirm("탈퇴하시겠습니까?")){
				 document.form1.action="${path}/customer/delete.do";
				 document.form1.submit();
				}
			});
		
	});
</script>

</head>
<body>
<h2>마이페이지</h2>
	<form name = "form1" method = "post">
		<table border = "1" width = "400px">
			<tr>
				<td>ID </td>
				<td><input name ="id" value = "${dto.id}" readonly></td>
			</tr>
			<tr>
				<td>비밀번호 </td>
				<td><input type="password"  name ="pwd"></td>
			</tr>
			<tr>
				<td>회원등급 </td>
				<td>${dto.customerClass}</td>
			</tr>
			<tr>
				<td>우편번호 </td>
				<td><input name ="zipcode" value="${dto.zipcode}"></td>
			</tr>
			<tr>
				<td>주소 </td>
				<td><input name ="address1" value = "${dto.address1}"></td>
			</tr>
			<tr>
				<td>상세주소 </td>
				<td><input name ="address2" value = "${dto.address2}"></td>
			</tr>
			<tr>
				<td>Email </td>
				<td><input name ="email" value = "${dto.email}"></td>
			</tr>
			<tr>
				<td>전화번호 </td>
				<td><input name ="phone" value = "${dto.phone}"></td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<input type = "button" value = "수정하기" id = "btnUpdate">
					<input type = "button" value = "탈퇴하기" id = "btnDelete">
					<div style="color:red">${message}</div>				
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>