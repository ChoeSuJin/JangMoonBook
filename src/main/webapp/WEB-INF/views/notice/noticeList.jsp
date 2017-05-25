<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>제목</td>
			<td>내용</td>
			<td>번호</td>
			<td>아티클 넘버</td>
		</tr>
		<c:forEach items="${noticeList}" var="list">
			<tr>
				<td><a href="detailView?articleNumber=${list.articleNumber}">${list.title}</a></td>
				<td>${list.content}</td>
				<td>${list.regDate}</td>
				<td>${list.articleNumber}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html> 