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
<title>QnA 게시판</title>

</head>
<body>
<jsp:include page="../adminNav.jsp"/>
<!-- header -->
	<div class="container" >
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#viewList">QnA리스트 보기</a></li>
		</ul>
		<br>
		<div class="tab-content" style="margin-left:5%;">
			<table class="table table-condensed">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>이름</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
					<c:if test="${ list == null }">
						<tr>
							<td colspan="5">새로 등록된 글이 없습니당>_< </td>
						</tr>
					</c:if>
					<c:if test="${ list != null }">
			      	<c:forEach var="list" items="${list}">
							<tr>
								<th>${list.bno}</th>
								<th><a href="detailQnA.do?bno=${ list.bno }">${list.title}</a></th>
								<th>${list.writer}</th>
								<th>
								<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</th>
								<th>${list.viewcnt}</th>
							</tr>
					</c:forEach>
					</c:if>
			
			</table>
			</div>	
			
		</div>
	</div>

</body>
</html>