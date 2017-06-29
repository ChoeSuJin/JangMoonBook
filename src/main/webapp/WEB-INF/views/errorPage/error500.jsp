<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
<title>오류 페이지</title>
</head>
<body>
	<img src="${resources}/image/500/e500.png" align="top">
	<font color="59afff" size="20">죄송합니다.<br>현제 서버가 불안정하여 접속할 수 없습니다.</font>
</body>
</html>