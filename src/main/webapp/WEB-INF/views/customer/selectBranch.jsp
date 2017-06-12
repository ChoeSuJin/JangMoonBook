<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
<title>Insert title here</title>
<script type="text/javascript">
function sendValue(name) {
	opener.sendValue(name);
	window.close();
}
</script>
</head>
<body style="font-family:'Hanna', serif;">

<p style="font-size:2em;text-align:center;margin-top:20px;">지점을 선택하세요.</p>
<div style="margin-top:30px;text-align:center;">
	<div style="">
		<button class="btn btn-default" onclick="sendValue('강남');" value="강남">강남</button>
		<button class="btn btn-default" onclick="sendValue('판교');" value="판교">판교</button><br>
	</div>
	<div style="margin-top:15px;">
		<button class="btn btn-default" onclick="sendValue('수원');" value="수원">수원</a></button>
		<button class="btn btn-default" onclick="sendValue('광주');" value="광주">광주</a></button>
	</div>
</div>

</body>
</html>