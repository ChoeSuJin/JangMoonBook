<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
디테일 페이지
	<table>
		<tr>
			<td>제목</td>
			<td>가격</td>
			<td>저자</td>
			<td>출판</td>
			<td>타입</td>
			<td>번호</td>
			<td>카테</td>
		</tr>
		<tr>
			<td>${list.title }</td>
			<td>${list.price }</td>
			<td>${list.author }</td>
			<td>${list.publisher }</td>
			<td>${list.type }</td>
			<td>${list.isbn }</td>
			<td>${list.category }</td>
		</tr>
	</table>
</body>
</html>