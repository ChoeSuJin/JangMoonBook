<<<<<<< HEAD
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
<c:set var="book" value="${ bookDetail }"/> 
디테일 페이지
	<table>
		<tr>
			<td>제목</td>
			<td>가격</td>
			<td>저자</td>
			<td>출판</td>
			<td>타입</td>
			<td>번호</td>
			<td>카테</td>
			<td rowspan="2">
				<form action="bookCart" method="post">
					<input type="radio" name="status" value="바로구매" checked="checked">바로구매
					<input type="radio" name="status" value="장바구니">장바구니
					<input type="hidden" name="title" value=${book.title }>
					<input type="hidden" name="isbn" value=${book.isbn }>
					<input type="hidden" name="price" value=${book.price }>
					<input type="text" name="amount" value="0">개
					<input type="submit" value="카트담기">
				</form>
			</td>
		</tr>
		<tr>
			<td>${book.title }</td>
			<td>${book.price }</td>
			<td>${book.author }</td>
			<td>${book.publisher }</td>
			<td>${book.type }</td>
			<td>${book.isbn }</td>
			<td>${book.category }</td>
		</tr>
	</table>
=======
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
    <title>StarBooks</title>
    <link href="${resources}/css/bootstrap.min.css?ver=1" rel="stylesheet">
    <link href="${resources}/css/font-awesome.min.css?ver=1" rel="stylesheet">
    <link href="${resources}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${resources}/css/price-range.css" rel="stylesheet">
    <link href="${resources}/css/animate.css" rel="stylesheet">
	<link href="${resources}/css/main.css?ver=1" rel="stylesheet">
	<link href="${resources}/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resources}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${resources}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resources}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${resources}/images/ico/apple-touch-icon-57-precomposed.png">
    <link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
</head><!--/head-->

<body>

	<!-- header -->
	<jsp:include page="customerHeader.jsp" />
	<!-- header -->
	
	<section>
		<div class="container">
			<div class="row">
				<!-- category -->
				<div class="col-sm-3">
					<jsp:include page="sidebar.jsp"/>
				</div>
				<!-- category -->
				
				<!-- img 랜덤으로 가져오기 위한 것 -->
				<jsp:useBean id="random" class="java.util.Random" scope="application"/>
				<!-- img 랜덤으로 가져오기 위한 것 -->
				
 				<div class="col-sm-9 padding-right">
					<!-- BookDetail -->
					<c:set var="detail" value="${bookDetail}"/>
					<div class="product-details">
						<div class="col-sm-5">
							<div class="view-product">
								<img src="${resources}/images/book/${random.nextInt(147)+8}.jpg" alt="" />
							</div>
						</div>
						
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="${resources}/images/product-details/new.jpg" class="newarrival" alt="" />
								<p style="font-size:2em;">${detail.title}</p>
									<span>${detail.price}</span><br>
									<form action="cartInsert.do" method="post" style="margin-bottom:10px;">
										<input type="text" id="amount" name="amount" value="1" style="width:25px;height:28px;"/>
										<input type="hidden" name="isbn" value="${detail.isbn}">
										<input type="hidden" name="title" value="${detail.title}">
										<input type="hidden" name="price" value="${detail.price}">
										<input type="hidden" name="image" value="${detail.image}">
										<input type="hidden" name="type" value="${detail.type}">
										<input type="hidden" name="status" value="장바구니">
										<input type="hidden" id="session" name="session" value="${sessionScope.id}">
										<input type="submit" style="margin-bottom:-1px;" onclick="return check_cart()" class="btn btn-default" value="장바구니">
									</form>
								<p style="font-size:1em;"><b>저자 :</b> ${detail.author}</p>
								<p style="font-size:1em;"><b>분류 :</b> ${detail.type}</p>
								<p style="font-size:1em;"><b>출판사 :</b> ${detail.publisher}</p>
								<a href=""><img src="${resources}/images/product-details/share.png" class="share img-responsive"  alt="" /></a>
							</div><!--/product-information-->
						</div>
					</div>
					<!-- BookDetail -->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#intro" data-toggle="tab"> 책 소개</a></li>
								<li><a href="#details" data-toggle="tab">???</a></li>
							</ul>
						</div>
						<div class="tab-content" style="margin-left:10px;margin-right:10px;">
							<div class="tab-pane fade active in" id="intro" >
								<div class="col-sm-12">
									<p><b>${detail.title}</b></p>
									<p>
									     우리는 날씨와 더불어 살아갑니다. 날씨는 자연을 풍성하게 해 주고, 순식간에 파괴하기도 하면서 우리의 기분을 들었다 놨다 합니다. 즉, 우리는 날씨에 따라 갑자기 우울해지기도 하고 또 금세 명랑해지기도 합니다. 또, 날씨는 옷이나 식단, 나들이와 같은 우리의 일상생활에 영향을 미칩니다. 그래서 일기 예보는 어떤 뉴스든 빠지지 않고 나오고, 날씨 관련 홈페이지는 사람들이 인터넷에서 가장 많이 찾는 곳 가운데 하나입니다. 예전에는 주로 농사를 짓거나 물고기를 잡아 생활했기 때문에 날씨의 영향을 크게 받을 수밖에 없어, 날씨에 대한 정보가 훨씬 더 중요했습니다.
									     계몽주의 시대가 시작되면서 온도계와 기압계는 가장 널리  사용되는 과학 도구가 되었습니다.<br> 또 르네상스 시대부터, 풍경 화가들은 기상 현상을 점점 더 정확하게 관찰했고, 날씨가 자아내는 ‘분위기’로 사람들의 감정을 표현하는 법을 익혔습니다. 브리타 테큰트럽은 모네나 고흐 같은 풍경 화가들에 힘입어, 마치 한 장 한 장 그림엽서를 그리듯 아름다운 색채로 날씨의 종류에 따른 대기의 특성을 매우 잘 잡아냈습니다. 유명 화가의 화보나 날씨에 관한 시에 멋진 그림을 곁들인 시화집처럼 오래 들여다보고 싶은 이 한 권의 책을 온 가족이 아이들 둘레에 모여 앉아 즐기면 좋겠습니다.
									</p>
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->
					
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer -->
	<jsp:include page="customerFooter.jsp" />
	<!-- footer -->
	
    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
>>>>>>> branch 'newMaster' of https://github.com/ChoeSuJin/JangMoonBook.git
</body>
</html>