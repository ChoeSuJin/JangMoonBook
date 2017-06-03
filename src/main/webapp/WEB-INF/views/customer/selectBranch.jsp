<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function sendValue(name) {
	opener.sendValue(name);
	window.close();
}
</script>
</head>
<body>

지점을 선택하세요
<a onclick="sendValue('서울');" value="서울">서울</a>



</body>
</html>