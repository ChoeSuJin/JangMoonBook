<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<form action="usedWrite" method="post">
		제목 : <input type="text" name="title" value="${book.title}" style="border: 0px;" readonly="readonly"><br>
		내용<br>
		<textarea rows="20" cols="50" name="comment" ></textarea><br>
		프라이스 <input type="text" name="price" /><br>
		저자 <input type="text" name="author" value="${book.author }" style="border: 0px;" readonly="readonly"><br>
		isbn  <input type="text" name="isbn" value="${book.isbn }" style="border: 0px;" readonly="readonly"><br>
		출판사 <input type="text" name="publisher" value="${book.publisher}" style="border: 0px;" readonly="readonly"><br>
		카테고리 <input type="text" name="category" value="${book.category}" style="border: 0px;" readonly="readonly"> <br>
		<input type="submit" value="ok">
	</form>
</body>
</html>