<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="contents" value="${ contents }"/>
<c:set var="contentsPerPage" value="20" />
<c:set var="PagePerBlock" value="5" />
<c:set var="allPage" value="${ contents / contenstPerPage }" />
<c:set var="allBlock" value="${ allPage / PagePerBlock }" />
<c:set var="currentBlock" value="${ currentBlock }"/>
<c:set var="currentPage" value="${ currentPage }"/>
<c:set var="start" value="${ start }"/>
<c:set var="end" value="${ end }"/>
<h3>총 ${ contents }개의 데이터가 검색되었습니다.</h3>
	<table>
		<tr>
			<td>이미지</td>
			<td>책 이름</td>
			<td>가격</td>
			<td>저자</td>
			<td>출판사</td>
			<td>대분류</td>
			<td>소분류</td>
			<td>등록번호 순서</td>
		</tr>
			<c:forEach items="${list}" var="dto" begin="${ start }" end="${ end }">
				<tr>
					<td>이미지</td>
					<td>
						<a href="bookDetail.do?title=${dto.title}">${dto.title}</a>
					</td>
					<td>${dto.price}</td>
					<td>${dto.author }</td>
					<td>${dto.publisher}</td>
					<td>${dto.type}</td>
					<td>${dto.category}</td>
					<td>${dto.book}</td>
				</tr>
			</c:forEach>
	</table>
	<!-- 페이지 링크 작성 -->
	<c:if test="${beginB eq 'no'}">
	    <a href="http://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${pageContext.request.contextPath}${uri}?type=${type}&category=${category}&currentPage=${currentBlock*5-5}&currentBlock=${currentBlock-1}">◀</a>
	</c:if>
	<c:forEach var="i" begin="${begin}" end="${suend}">
		<a href="http://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${pageContext.request.contextPath}${uri}?type=${type}&category=${category}&currentPage=${i}&currentBlock=${currentBlock}">${i}</a>
	</c:forEach>
	<c:if test="${suendB eq 'no'}">
	    <a href="http://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${pageContext.request.contextPath}${uri}?type=${type}&category=${category}&currentPage=${currentBlock*5+1}&currentBlock=${currentBlock+1}">▶</a>
	</c:if>
	
</body>
</html>