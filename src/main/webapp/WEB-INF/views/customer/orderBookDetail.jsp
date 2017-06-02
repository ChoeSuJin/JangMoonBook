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
<c:set var="book" value="${ bookDetail }"/> 
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
			<td rowspan="2">
				<form action="bookCart" method="post">
					<input type="radio" name="status" value="바로구매" checked="checked">바로구매
					<input type="radio" name="status" value="장바구니">장바구니
					<input type="hidden" name="title" value=${book.title }>
					<input type="hidden" name="isbn" value=${book.isbn }>
					<input type="hidden" name="price" value=${book.price }>
					<input type="text" name="amount" value="0">개
					<input type="submit" value="카트담기">
				</form>
			</td>
		</tr>
		<tr>
			<td>${book.title }</td>
			<td>${book.price }</td>
			<td>${book.author }</td>
			<td>${book.publisher }</td>
			<td>${book.type }</td>
			<td>${book.isbn }</td>
			<td>${book.category }</td>
		</tr>
	</table>
</body>
</html>