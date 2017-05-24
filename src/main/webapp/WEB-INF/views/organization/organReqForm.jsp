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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<!-- 구매신청 완료하면 alert창 띄우기 -->
<jsp:include page="organHeader.jsp"/>
<div class="container">
  <div class="tab-content" style="margin-left:5%;">
    <div id="home" class="tab-pane fade in active">
      <h3>e_book 목록</h3><br>
      	<table class="table table-condensed">
      		<tr>
      			<th>책 제목</th><th>작가</th><th>출판사</th><th></th>
      		</tr>
      		<c:forEach var="e" items="${ ebookList }" varStatus="status">
   	  		  <form action="mOrganReq.do" method="post">
      			<tr>
      				<td><input readonly="readonly" style="border:none" name="title" value="${ e.title }"></td>
      				<td><input readonly="readonly" style="border:none;width:100px;" value="${ e.author }"></td>
      				<td><input readonly="readonly" style="border:none;width:100px;" value="${ e.publisher }"></td>
      				<td style="display:none;">
      					<input readonly="readonly" value="${ e.isbn }" name="isbn">
      				</td>
      				<td>
						<input type="submit" value="구매신청" class="btn btn-default">
					</td>
      			</tr>
      		  </form>
      		</c:forEach>
   		</table>
	</div>
  </div>
</div>
</body>
</html>