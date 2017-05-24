<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="organHeader.jsp" />
	<div class="container">
		<div class="tab-content" style="margin-left: 5%;">
			<h3>e_book 보유목록</h3>
			<br>
			<form action="" method="post">
				<div class="input-group">
					<span class="input-group-addon" style="width:100px;">책 제목</span>
					<input id="msg"	type="text" class="form-control" name="title" 
						   placeholder="제목을 입력하고 Enter키를 입력하세요" style="width:280px;">
				</div>
			</form><br>
			<table class="table table-condensed">
				<tr>
					<th>책 제목</th>
					<th>분류 번호</th>
				</tr>
				<c:forEach var="ed" items="${ ebookDistList }" varStatus="status">
					<tr>
						<td>${ ed.title }</td>
						<td>${ ed.isbn }</td>
					</tr>
				</c:forEach>
			</table>
			<form action="" method="post" style="float:right;margin-top:-10px;">
				<input type="submit" class="btn btn-default" value="전체보기">
			</form><br>
		</div>
	</div>
</body>
</html>