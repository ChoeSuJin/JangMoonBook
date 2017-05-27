<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${ pageContext.request.contextPath}"/>
</head>
<body>
<h2>메인페이지</h2>

<c:choose>
	<c:when test="${sessionScope.id ==null}">
		<a href="${path}/customer/login.do">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님 환영합니다.
	<a href = "${path}/customer/logout.do">  로그아웃  </a>
	<a href ="${path}/customer/view.do?id=${sessionScope.id}">  마이페이지  </a>
	</c:otherwise>
</c:choose>
</body>
</html>