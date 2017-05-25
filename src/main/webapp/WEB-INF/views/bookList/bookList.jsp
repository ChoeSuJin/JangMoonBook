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
	<table>
		<tr>
			<td>이미지</td>
			<td>책 이름</td>
			<td>가격</td>
			<td>저자</td>
			<td>출판사</td>
			<td>대분류</td>
			<td>소분류</td>
		</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>이미지</td>
					<td>
						<a href="bookDetail?title=${dto.title}">${dto.title}</a>
					</td>
					<td>${dto.price}</td>
					<td>${dto.author }</td>
					<td>${dto.publisher}</td>
					<td>${dto.type}</td>
					<td>${dto.category}</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>