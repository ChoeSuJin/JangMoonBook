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
<body> <center>
   <img src="${resources}/images/400/e400.png" align="top" />
   <font color="59afff" size="20">죄송합니다.<br>요청하신 페이지에 문제가 생겼습니다.</font></center>
</body>
</html>