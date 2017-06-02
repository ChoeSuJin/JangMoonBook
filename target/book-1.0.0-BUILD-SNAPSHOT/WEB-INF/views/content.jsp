<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Content</h1>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>제목</td>
			<td>내용</td>
			<td>날짜</td>
		<tr>
			<c:forEach items="${contentView}" var="c">
				<tr>
					<td>${c.title}</td>
					<td>${c.content}</td>
					<td>${c.regDate}</td>
				<tr>
			</c:forEach>
	</table>
</body>
</html>