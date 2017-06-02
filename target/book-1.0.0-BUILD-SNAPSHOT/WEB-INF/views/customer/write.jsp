<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<c:set var = "path" value = "${pageContext.request.contextPath }"/>
</head>
<body>
<h2>회원가입</h2>
	<form name = "form1" method = "post" action="${path}/customer/insert.do">
		<table border = "1" width = "400px">
			<tr>
				<td>ID </td>
				<td><input name ="id"></td>
			</tr>
			<tr>
				<td>비밀번호 </td>
				<td><input type="password"  name ="pwd"></td>
			</tr>
			<tr>
				<td>우편번호 </td>
				<td><input name ="zipcode"></td>
			</tr>
			<tr>
				<td>주소 </td>
				<td><input name ="address1"></td>
			</tr>
			<tr>
				<td>상세주소 </td>
				<td><input name ="address2"></td>
			</tr>
			<tr>
				<td>Email </td>
				<td><input name ="email"></td>
			</tr>
			<tr>
				<td>전화번호 </td>
				<td><input name ="phone"></td>
			</tr>
			<tr>
				<td colspan = "2"><input type = "submit" value = "등록"></td>
			</tr>
		</table>	
	</form>
</body>
</html>