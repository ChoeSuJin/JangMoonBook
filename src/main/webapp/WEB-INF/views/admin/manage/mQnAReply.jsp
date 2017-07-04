<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>QnAReply</title>
</head>
<body>
<jsp:include page="../adminNav.jsp"/>

<c:set var="list" value="${ list }" />

<div class="container">
<table class="table table-condensed">
	
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<tr>
			<th>${ list.bno }</th>
			<th>${ list.title }</th>
			<th>${ list.writer }</th>
			<th><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></th>
			<th>${ list.viewcnt }</th>
		</tr>
		<tr>
			<td colspan="5">
				<textarea rows="2" cols="100">${ list.content }</textarea>
			</td>
		</tr>	
		
		<form method="post" action="regReply.do">
		<tr>
			<td colspan="5">
				<input type="hidden" name="bno" value="${ list.bno }">
				<textarea rows="2" cols="100" name="replyText"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4"></td>
			<td><input type="submit" value="등록"></td>
		</tr>
	</form>
</table>
</div>

</body>
</html>