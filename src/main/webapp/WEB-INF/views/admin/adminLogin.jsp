<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:url value="/j_spring_security_check" var="loginURL"></c:url>

<form name='f' action="${ loginURL }" method="post">
	ID <input type="text" name="username" id="username">
	PWD <input type="text" name="password" id="password">
	<input type="submit" value="전송">
</form>

</body>
</html>