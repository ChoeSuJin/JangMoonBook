<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>used book write form</title>
</head>
<body>
	등록하실 책을 입력하세여
	<form action="bookTypeSearch.do" method="post">
		<input type="text" name="title">
		<input type="hidden" name="type" value="usedSelect">
		<input type="submit" value="ok"> 
	</form>
</body>
</html>