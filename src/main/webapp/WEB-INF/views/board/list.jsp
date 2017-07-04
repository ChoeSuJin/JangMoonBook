<<<<<<< HEAD
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

=======
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html lang="en">
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
    <title>StarBooks</title>
    <link href="${resources}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${resources}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${resources}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${resources}/css/price-range.css" rel="stylesheet">
    <link href="${resources}/css/animate.css" rel="stylesheet">
	<link href="${resources}/css/main.css" rel="stylesheet">
	<link href="${resources}/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="${resources}/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resources}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${resources}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resources}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${resources}/images/ico/apple-touch-icon-57-precomposed.png">
  	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head><!--/head-->

<body>
<%@ include file= "../session_check.jsp" %>
	<!-- header -->
	<jsp:include page="../customer/customerHeader.jsp"/>
	<!-- header -->
	
	<section id="form" style="margin-top:-10px;"><!--form-->
		<div class="container">
			<div class="row">
				<div class="category-tab shop-details-tab"><!--category-tab-->
					<div class="tab-content" style="margin-top:30px;">
						<p style="font-size:2em;text-align:center;color:#93B658;">Q n A</p>
							<!-- 검색-->
							<form name="form1" method="post" action="boardList.do" style="float:right;">
								<select name="searchOption" style="width:100px;margin-bottom:25px;">
									 <option value="all" <c:out value="${map.searchOption=='all'?'selected':''}"/>	>내용+제목</option>
									 <option value="content" <c:out value="${map.searchOption=='content'?'selected':''}"/>	>내용</option>
									 <option value="title" <c:out value="${map.searchOption=='title'?'selected':''}"/> >제목</option>
								</select>
								
								<input name="keyword" value="${map.keyword}">
								<input type="submit" class="btn btn-default" value="검색" style="height:28px;">
								
								<c:if test="${sessionScope.id != null}">	
										<button type="button" id="btnWrite" class="btn btn-default" style="height:28px;">글쓰기</button>
								</c:if>
							</form>
							
							<table style="width:100%;text-align:center;" class="type09">
								<tr style="height:40px;font-size:1.3em;">
									<th><center>번호</center></th>
									<th><center>아이디</center></th>
									<th><center>제목</center></th>
									<th><center>날짜</center></th>
									<th><center>조회수</center></th>
								</tr>
								<c:forEach var="row" items="${map.list}">
									<tr>
									   <td>${row.bno}</td>
									   <td>${row.writer}</td>
									   <td>
									  	   <a href="boardView.do?bno=${row.bno} &curPage=${map.pager.curPage} &searchOption=${map.searchOption}	&keyword=${map.keyword}">${row.title}</a>
									   </td>
									   <td>
											<!-- value="날짜" pattern="출력형식" -->  	
											<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/>  	
									   </td>
									   <td>${row.viewcnt}</td>
								   </tr>
								</c:forEach>
								   <tr>
									    <td colspan="5" align="center">
											<c:if test="${map.pager.curBlock > 1}">
											  <a href="javascript:list('1')">[처음]</a>
											</c:if>    
											<c:if test="${map.pager.curBlock > 1 }">
											  <a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
											</c:if>
											<c:forEach var="num"  begin = "${map.pager.blockBegin}" end = "${map.pager.blockEnd}">
											  <c:choose>
											  	<c:when test="${num == map.pager.curPage}">
											  	<!-- 현재 페이지이면 하이퍼링크 제거 -->
											  	  <span style="color:red">${num}</span>&nbsp;
											  	</c:when>
											  	<c:otherwise>
												  <a href="javascript:list('${num}')">
												  	${num}</a>&nbsp;
											  	</c:otherwise>
											  </c:choose>
											</c:forEach>    
											<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
											  <a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
											</c:if>
											<c:if test="${map.pager.curPage <= map.pager.totPage}">
											  <a href="javascript:list('${map.pager.totPage}')">[끝]</a>
											</c:if>
									    </td>
								  </tr>  
							</table>
					</div>
				</div><!--/category-tab-->
			</div>
		</div>
	</section><!--/form-->
	
	<!-- footer -->
	<jsp:include page="../customer/customerFooter.jsp" />
	<!-- footer -->
	
	
	<script>
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			//페이지 주소 변경(이동)
			location.href="boardWrite.do";
		});	
	});
	
	function list(page){
		location.href=
		"boardList.do?curPage=" + page + "&searchOption=${map.searchOption}" + "&keyword=${map.keyword}";
	}
	</script>
    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
>>>>>>> branch 'newMaster' of https://github.com/ChoeSuJin/JangMoonBook.git
</body>
</html>