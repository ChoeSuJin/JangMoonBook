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
<a onclick="sendValue('강남');" value="서울">강남</a>
<a onclick="sendValue('판교');" value="서울">판교</a>
<a onclick="sendValue('수원');" value="서울">수원</a>
<a onclick="sendValue('광주');" value="서울">광주</a>


</body>
</html>