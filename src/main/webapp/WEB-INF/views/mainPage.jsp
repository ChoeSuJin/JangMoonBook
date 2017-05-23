<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<c:set var="path" value="${ pageContext.request.contextPath}"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
* {
	box-sizing: border-box
}

body {
	font-family: "Lato", sans-serif;
}

/* Style the tab */
div.tab {
	float: left;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	width: 30%;
	height: 300px;
}

/* Style the buttons inside the tab */
div.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 16px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current "tab button" class */
div.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0px 12px;
	border: 1px solid #ccc;
	width: 70%;
	border-left: none;
	height: 300px;
}
</style>
</head>
<body>


	<fieldset>
		<legend><h1>로그인이 필요한 기능</h1></legend>
		<fieldset>
			<legend>로그인</legend>
			<c:choose>
				<c:when test="${sessionScope.id ==null}">
					<a href="${path}/customer/login.do">로그인</a>
				</c:when>
				<c:otherwise>
					${sessionScope.id}님 환영합니다.
					<a href="${path}/customer/logout.do"> 로그아웃 </a>
					<a href="${path}/customer/view.do?id=${sessionScope.id}"> 마이페이지
					</a>
				</c:otherwise>
			</c:choose>
		</fieldset>
		<fieldset>
			<legend>마이페이지</legend>
			  <c:choose>
				<c:when test="${sessionScope.id ==null}">
					<a href="${path}/customer/login.do">로그인</a>
				</c:when>
				<c:otherwise>
					<a href="${path}/customer/view.do?id=${sessionScope.id}"> 마이페이지</a>
				</c:otherwise>
			</c:choose>
		</fieldset>
		<fieldset>
			<legend>구입, 결제 내역</legend>
		</fieldset>
		<fieldset>
			<legend>장바구니</legend>
		</fieldset>
	</fieldset>
	
	
	
	<fieldset>
		<legend>공지</legend>
		수정 기능 넣어야함.<br> <a href="writeForm">쓰기</a><br> <a
			href="list">공지 사이트로 가기</a><br> <a href="viewForm">제목으로 찾기</a>

		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>날짜</td>
				<td>삭제</td>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.articleNumber}</td>
					<td><form action="content">
							<a href="content?title=${dto.title}">${dto.title}</a>
						</form></td>
					<td>${dto.regDate}</td>
					<td><a href="delete?title=${dto.title}">X</a></td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	<fieldset>
		<legend>책 등록</legend>
		책 등록하기<form action="bookWrite" method="post">
			제목<input type="text" name="title"><br>
			가격<input type="text" name="price"><br>
			저자<input type="text" name="author"><br>
			출판사<input type="text" name="publisher"><br>
			대분류<input type="text" name="type"><br>
			isbn<input type="text" name="isbn"><br>
			소분류<input type="text" name="category"><br>
			<input type="submit" value="OK">
		</form>
		<a href="bookList">책 목록 보기(대, 소분류 입력하여 검색 가눙하도록)</a><br>
		<a href="bookUpdate">책 정보 수정하기</a><br>
		<a href="bookDelete">책 삭제하기</a>
	</fieldset>
	<fieldset>
		<legend>책 검색</legend>
		<table width="500">
			<form action="bookSearch" method="post">
				<tr>
					<td>타입</td>
					<td>title</td>
					<td>category</td>
				</tr>
				<tr>
					<td><input type="text" name="type" size="50"></td>
					<td><input type="text" name="title" size="50"></td>
					<td><input type="text" name="category" size="50"> <input
						type="submit" value="OK"></td>
				</tr>
			</form>
		</table>
	</fieldset>
	<fieldset>
		<legend>책 분류</legend>
		수진누나가 보내준 링크로 처리
		<div class="tab" style="width: 130px; height: 200px;">
			<button class="tablinks" onclick="openCity(event, 'DomesticBooks')"
				id="defaultOpen" style="height: 50px;">국내도서</button>
			<button class="tablinks" onclick="openCity(event, 'ForeignBooks')"
				style="height: 50px;">외국도서</button>
			<button class="tablinks" onclick="openCity(event, 'EBook')"
				style="height: 50px;">EBook</button>
			<button class="tablinks" onclick="openCity(event, 'UsedBooks')"
				style="height: 50px;">중고책</button>
		</div>

		<div id="DomesticBooks" class="tabcontent"
			style="width: 200px; height: 200px;">국내도서 리스트</div>

		<div id="ForeignBooks" class="tabcontent"
			style="width: 200px; height: 200px;">외국도서 리스트</div>

		<div id="EBook" class="tabcontent"
			style="width: 200px; height: 200px;">이북리스트</div>

		<div id="UsedBooks" class="tabcontent"
			style="width: 200px; height: 200px;">중고책 리스트</div>

		<script>
			function openCity(evt, cityName) {
				var i, tabcontent, tablinks;
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(
							" active", "");
				}
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";
			}
			document.getElementById("defaultOpen").click();
		</script>
	</fieldset>
	
	<font color="red">dd</font>
	<fieldset>
		<legend>이벤트 이미지 슬라이드</legend>
		<div class="container" style="height: 30%;">
			<h2>Carousel Example</h2>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">

					<div class="item active">
						<img src="la.jpg" alt="image1" style="width: 100%;">
						<div class="carousel-caption">
							<h3>이미지 첫 번째</h3>
							<p>11111</p>
						</div>
					</div>

					<div class="item">
						<img src="chicago.jpg" alt="image2" style="width: 100%;">
						<div class="carousel-caption">
							<h3>이미지 두 번째</h3>
							<p>22222</p>
						</div>
					</div>

					<div class="item">
						<img src="ny.jpg" alt="image3" style="width: 100%;">
						<div class="carousel-caption">
							<h3>이미지 세 번째</h3>
							<p>33333</p>
						</div>
					</div>

				</div>
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</fieldset>
	<fieldset>
		<legend>최근 들어온 책</legend>
		일단 보류<br> 하게된다면 책 들어온 순서를 int타입으로 하여 내림차순 할것
	</fieldset>
	<fieldset>
		<legend>추천 책</legend>
		일단 보류<br> 방법은 2가지가 있음<br> 1. 이벤트 형식으로 Manager가 입력<br>
		2. 월 단위 구매 횟수가 많은 순서대로 정렬
	</fieldset>
	<fieldset>
		<legend>Q&A</legend>
		혜신누나
	</fieldset>
	<fieldset>
		<legend>지도</legend>
	</fieldset>
	<fieldset>
		<legend>풋터</legend>
	</fieldset>
	
<!-- </body>
</html>
 -->



<div class="jumbotron" style="height: 150px;">
  <center>
  <p>헤드에 들어갈 내용 - 이곳은 Header입니다</p>
  <input type="text" name="dd" placeholder="sercher"><input type="submit" value="OK">
  </center>
</div>

<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">국내</a></li>
    <li><a data-toggle="tab" href="#menu1">외국</a></li>
    <li><a data-toggle="tab" href="#menu2">이북</a></li>
    <li><a data-toggle="tab" href="#menu3">중고</a></li>
  </ul>
  
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>홈키에 대한 설명</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>메뉴 1에 대한 설명</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>메뉴 2에 대한 설명</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>메뉴 3에 대한 내용
    </div>
  </div>
</div>

</body>
</html> 