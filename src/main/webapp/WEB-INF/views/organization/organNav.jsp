<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<title>내비게이션 바</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
      	<span class="icon-bar"></span>
      	<span class="icon-bar"></span>
        <span class="icon-bar"></span>                  
      </button>
      <a class="navbar-brand" href="">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="OrganReqForm.do">e_book 목록</a></li>
        <li><a href="mOrganDistList.do">e_book 보유목록</a></li>
        <li><a href="mOrganReqList.do">e_book 신청목록</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<c:if test="${ main != null }">
	<div class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">신간,추천 도서</a></li>
				<li><a data-toggle="tab" href="#menu1">뭐 할 까 ?</a></li>
			</ul>

			<div class="tab-content" style="margin-left: 5%;">
				<div id="home" class="tab-pane fade in active">
					<h3>신간,추천 도서</h3>
						신책,추천 도서 쌸라쌸라
				</div>
				
				<div id="menu1" class="tab-pane fade">
					<h3>뭐 할 까 ?</h3>
						??????
				</div>
			</div>
		</div>
</c:if>
</body>
</html>