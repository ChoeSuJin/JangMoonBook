<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mail Test</title>
</head>
<body>
<form action="sendAdMail.do">
	새로 들어온 책 3개를 전송합니다.
	제목 : <input name="title" type="text" placeholder="보내실 매일의 제목을 입력해주세요" size="50" value="새로 들어온 책을 빠르게 만나보세요!"> 
	<input type="submit" onclick="alertToUser();" value="확인">
</form>
</body>
<script type="text/javascript">

	function alertToUser() {
		alert("전송에는 다소 시간이 소요될 수 있습니다.");
	}

</script>
</html>