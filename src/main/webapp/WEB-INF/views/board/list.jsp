<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jstl/core_rt" %>
	<%@ taglib prefix = "fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var = "path" value = "${pageContext.request.contextPath}"></c:set>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#btnWrite").click(function(){
		//페이지 주소 변경(이동)
		location.href="${path}/board/write.do"
	});	
});
</script>
</head>
<body>
	<h2>게시판 목록</h2>

	<!-- 검색-->
	<form name="form1" method="post" action="${path}/board/list.do">
		<select name="searchOption">
			<option value="all"
				<c:out value="${map.searchOption=='all'?'selected':''}"/>>내용+제목</option>
			<option value="content"
				<c:out value="${map.searchOption=='content'?'selected':''}"/>>내용</option>
			<option value="title"
				<c:out value="${map.search_option=='title'?'selected':''}"/>>제목</option>
		</select> <input name="keyword" value="${map.keyword}"> <input
			type="submit" value="검색">
		<c:if test="${sessionScope.id != null}">
			<button type="button" id="btnWrite">글쓰기</button>
		</c:if>
	</form>


	${map.count}개의 게시물이 있습니다.
	<table style="border: 1; width: 600px;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="list" items="${list}">	
			<tr>
				<th>${list.bno}</th>
				<th><a href="${path}/board/view.do?bno=${list.bno}">${list.title}</a></th>
				<th>${list.writer}</th>
				<th>
				<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</th>
				<th>${list.viewcnt}</th>
			</tr>
		</c:forEach>
	</table>

</body>
</html>