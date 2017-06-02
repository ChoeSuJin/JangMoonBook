<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>제목</td>
			<td>가격</td>
			<td>저자</td>
			<td>출판사</td>
			<td>대분류</td>
			<td>소분류</td>
			<td>ISBN</td>
		</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>
						<form action="content">
							<a href="content?title=${dto.title}">${dto.title}</a>
						</form>
					</td>
					<td>${dto.price}</td>
					<td>${dto.author}</td>
					<td>${dto.publisher}</td>
					<td>${dto.type}</td>
					<td>${dto.category}</td>
					<td>${dto.isbn}</td>
				</tr>
			</c:forEach>
	</table>

</body>
</html>