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

#topBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	border: none;
	outline: none;
	background-color: dddddd;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 10px;
}

#topBtn:hover {
	background-color: #555;
}

/* 검색 버튼 누르면 쫙 펴지는거 */
input[type=text] {
	width: 130px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-image: url('searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
}
/* 검색 버튼 누르면 쫙 펴지는거 크기 */
input[type=text]:focus {
	width: 30%;
}

/* 이벤트 이미지 슬라이드 */
.container {
	padding: 80px 120px;
}

.person {
	border: 10px solid transparent;
	margin-bottom: 25px;
	width: 80%;
	height: 80%;
	opacity: 0.7;
}

.person:hover {
	border-color: #f1f1f1;
}

.carousel-inner img {
	-webkit-filter: grayscale(90%);
	filter: grayscale(90%); /* make all photos black and white */
	width: 30%; /* Set width to 100% */
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}

/**************************************************/
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

/**************************************************/
</style>
</head>
<body>
<button onclick="topFunction()" id="topBtn" title="top">Top</button>
<script>
	// 버튼 누르면 위로 감
	window.onscroll = function() {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			document.getElementById("topBtn").style.display = "block";
		} else {
			document.getElementById("topBtn").style.display = "none";
		}
	}

	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>

<div class="jumbotron" style="height: 200px;">
  <center>
  <p>어서오세요 장문Books입니다!</p>
  <form action="bookTypeSearch" method="post">  
	<select name="type">
		<option value="all">모두검색</option>
	    <option value="국내도서">국내도서</option>
	    <option value="외국도서">외국도서</option>
	    <option value="E-Book">E-Book</option>
	    <option value="중고도서">중고도서</option>
	</select>
	<input type="text" name="title" placeholder="Search">
	<input type="submit" value="ok">  
  </form>
  </center>
</div>

	<button id="modalBtn">Open Modal</button>
	<div id="modalDisp" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2>Modal Header</h2>
			</div>
			<div class="modal-body">
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="pill" href="#menu1">국내</a></li>
						<li><a data-toggle="tab" href="#menu2">외국</a></li>
						<li><a data-toggle="tab" href="#menu3">이북</a></li>
						<li><a data-toggle="tab" href="#menu4">중고</a></li>
					</ul>

					<div class="tab-content">
						<div id="menu1" class="tab-pane fade">
							<h3>국내도서</h3>
							<p>
								<a href="bookSearch?type=국내도서&category=000">000번</a><br> <a
									href="bookSearch?type=국내도서&category=100">100번</a><br> <a
									href="bookSearch?type=국내도서&category=200">200번</a><br> <a
									href="bookSearch?type=국내도서&category=300">300번</a><br> <a
									href="bookSearch?type=국내도서&category=400">400번</a><br> <a
									href="bookSearch?type=국내도서&category=500">500번</a><br> <a
									href="bookSearch?type=국내도서&category=600">600번</a><br> <a
									href="bookSearch?type=국내도서&category=700">700번</a><br> <a
									href="bookSearch?type=국내도서&category=800">800번</a><br> <a
									href="bookSearch?type=국내도서&category=900">900번</a><br>
								<br>
							</p>
						</div>
						<div id="menu2" class="tab-pane fade">
							<h3>외국도서</h3>
							<p>
								<a href="bookSearch?type=외국도서&category=000">000번</a><br> <a
									href="bookSearch?type=외국도서&category=100">100번</a><br> <a
									href="bookSearch?type=외국도서&category=200">200번</a><br> <a
									href="bookSearch?type=외국도서&category=300">300번</a><br> <a
									href="bookSearch?type=외국도서&category=400">400번</a><br> <a
									href="bookSearch?type=외국도서&category=500">500번</a><br> <a
									href="bookSearch?type=외국도서&category=600">600번</a><br> <a
									href="bookSearch?type=외국도서&category=700">700번</a><br> <a
									href="bookSearch?type=외국도서&category=800">800번</a><br> <a
									href="bookSearch?type=외국도서&category=900">900번</a><br>
								<br>
							</p>
						</div>
						<div id="menu3" class="tab-pane fade">
							<h3>E-book</h3>
							<p>
								<a href="bookSearch?type=E-book&category=000">000번</a><br>
								<a href="bookSearch?type=E-book&category=100">100번</a><br>
								<a href="bookSearch?type=E-book&category=200">200번</a><br>
								<a href="bookSearch?type=E-book&category=300">300번</a><br>
								<a href="bookSearch?type=E-book&category=400">400번</a><br>
								<a href="bookSearch?type=E-book&category=500">500번</a><br>
								<a href="bookSearch?type=E-book&category=600">600번</a><br>
								<a href="bookSearch?type=E-book&category=700">700번</a><br>
								<a href="bookSearch?type=E-book&category=800">800번</a><br>
								<a href="bookSearch?type=E-book&category=900">900번</a><br>
								<br>
							</p>
						</div>
						<div id="menu4" class="tab-pane fade">
							<h3>중고도서</h3>
							<p>
								<a href="bookSearch?type=중고도서&category=000">000번</a><br> <a
									href="bookSearch?type=중고도서&category=100">100번</a><br> <a
									href="bookSearch?type=중고도서&category=200">200번</a><br> <a
									href="bookSearch?type=중고도서&category=300">300번</a><br> <a
									href="bookSearch?type=중고도서&category=400">400번</a><br> <a
									href="bookSearch?type=중고도서&category=500">500번</a><br> <a
									href="bookSearch?type=중고도서&category=600">600번</a><br> <a
									href="bookSearch?type=중고도서&category=700">700번</a><br> <a
									href="bookSearch?type=중고도서&category=800">800번</a><br> <a
									href="bookSearch?type=중고도서&category=900">900번</a><br>
								<br>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var modal = document.getElementById('modalDisp');
		var btn = document.getElementById("modalBtn");
		var span = document.getElementsByClassName("close")[0];
		btn.onclick = function() {
			modal.style.display = "block";
		}
		span.onclick = function() {
			modal.style.display = "none";
		}
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

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
		<legend>마이페이지 장바구니, 구입, 결제 내역</legend>
	</fieldset>
	<fieldset>
		<legend>중고책 등록</legend>
		<a href="usedWriteForm">Go usedWriteForm</a>
	</fieldset>
		
	
	
	<fieldset>
		<legend>공지</legend>
		다시 만들것<br>
		<a href="noticeWriteForm">쓰기</a><br>
		<a href="noticeList">보기</a><br><!-- 
		<a href="noticeListForm">공지 사이트로 가기</a><br>
		<a href="noticeTitleSelectForm">제목으로 찾기</a> -->

		<table>
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>번호</td>
			</tr>
			<c:forEach items="${noticeList}" var="list" begin="0" end="4" step="1">
				<tr>
					<td>${list.articleNumber}</td>
					<td><a href="detailView?articleNumber=${list.articleNumber}">${list.title}</a></td>
					<td>${list.content}</td>
					<td>${list.regDate}</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	<fieldset>
		<legend>이벤트 이미지 슬라이드</legend>

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="hh.jpg" alt="이미지 설명" width="1200" height="700">
					<div class="carousel-caption">
						이미지 설명 
					</div>
				</div>

				<div class="item">
					<img src="hh.jpg" alt="이미지 설명" width="1200" height="700">
					<div class="carousel-caption">
						이미지 설명
					</div>
				</div>

				<div class="item">
					<img src="hh.jpg" alt="이미지 설명" width="1200" height="700">
					<div class="carousel-caption">
						이미지 설명
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
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
		혜신누나가 하셨는데 어떻게 들어가야하는지 아직 모름
	</fieldset>
</body>
</html> 