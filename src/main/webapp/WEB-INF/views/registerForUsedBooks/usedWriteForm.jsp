<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>used book write form</title>
</head>
<body>
	<form action="usedWrite.do" method="post">
		Ÿ��Ʋ <input type="text" name="title" /><br>
		�����̽� <input type="text" name="price" /><br>
		���� <input type="text" name="author" /><br>
		���ǻ� <input type="text" name="publisher" /><br>
		ī�װ� <input type="text" name="category" />
		<input type="submit" value="ok">
	</form>
</body>
</html>