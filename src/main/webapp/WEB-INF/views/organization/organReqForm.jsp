<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<title>e_book 목록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 구매신청 완료하면 alert창 띄우기 -->
	<jsp:include page="organNav.jsp" />
	<div class="container">
		<div class="tab-content" style="margin-left: 5%;">
			<h3>e_book 목록</h3>
			<br>
			<form action="mOrganSearch.do" method="post">
				<div class="input-group">
					<span class="input-group-addon" style="width:100px;">책 제목</span>
					<input id="msg"	type="text" class="form-control" name="title" 
						   placeholder="제목을 입력하고 Enter키를 입력하세요" style="width:280px;">
				</div>
			</form><br>
			<table class="table table-condensed">
				<tr>
					<th>책 제목</th>
					<th>작가</th>
					<th>출판사</th>
					<th></th>
				</tr>
				<c:forEach var="e" items="${ ebookList }" varStatus="status">
					<form action="mOrganReq.do" method="post">
						<tr>
							<td><input readonly="readonly" style="border: none"
								name="title" value="${ e.title }"></td>
							<td><input readonly="readonly"
								style="border: none; width: 100px;" value="${ e.author }"></td>
							<td><input readonly="readonly"
								style="border: none; width: 100px;" value="${ e.publisher }"></td>
							<td style="display: none;"><input readonly="readonly"
								value="${ e.isbn }" name="isbn"></td>
							<td><input type="submit" value="구독신청"
								class="btn btn-default"></td>
						</tr>
					</form>
				</c:forEach>
			</table>
			<form action="OrganReqForm.do" method="post" style="float:right;margin-top:-10px;">
				<input type="submit" class="btn btn-default" value="전체보기">
			</form><br>
		</div>
	</div>
</body>
</html>