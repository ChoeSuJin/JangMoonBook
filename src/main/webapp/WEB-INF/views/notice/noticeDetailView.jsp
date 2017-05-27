<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>제목</td>
			<td>내용</td>
			<td>번호</td>
			<td>아티클 넘버</td>
		</tr>
		<tr>
			<td>1${detailView.title}</td>
			<td>2${detailView.content}</td>
			<td>3${detailView.regDate}</td>
			<td>4${detailView.articleNumber}</td>
		</tr>
	</table>
</body>
</html>