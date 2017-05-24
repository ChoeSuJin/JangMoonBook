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
     <h3>e_book 신청목록</h3><br>
      <c:forEach var="list" items="${ ebook_reqList }">
      	${ list.title }<br>
      </c:forEach>
  </div>
</div>
</body>
</html>