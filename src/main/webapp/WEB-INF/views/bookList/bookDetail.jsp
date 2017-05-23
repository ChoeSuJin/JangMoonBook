<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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