<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
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
		<a href="bookWrite">책 등록</a><br> <a href="bookList">책 목록
			보기(대, 소분류 입력하여 검색 가눙하도록)</a><br> <a href="bookUpdate">책 정보 수정하기</a><br>
		<a href="bookDelete">책 삭제하기</a>
	</fieldset>
	<fieldset>
		<legend>책 검색</legend>
		<table width="500" cellpadding="0" cellspacing="0" border="1">
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
			style="width: 200px; height: 200px;">리스트 쓸꺼임</div>

		<div id="ForeignBooks" class="tabcontent"
			style="width: 200px; height: 200px;">리스트 쓸꺼임</div>

		<div id="EBook" class="tabcontent"
			style="width: 200px; height: 200px;">리스트 쓸꺼임</div>

		<div id="UsedBooks" class="tabcontent"
			style="width: 200px; height: 200px;">리스트 쓸꺼임</div>

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
	<fieldset>
		<legend>이벤트 이미지 슬라이드</legend>
		<div class="container" style="height: 500px;">
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





















	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<!-- s:html:head -->
<head>
















































<!--MS의 최신 웹브라우저인 edge 브라우저 호환을 위해 넣어줌-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">












<title>국내도서 메인 - 인터넷교보문고</title>





<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="Pragma" content="nocache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Cache-Control" content="no-cache" />



<link rel="shortcut icon"
	href="http://image.kyobobook.co.kr/newimages/apps/b2c/kyobo.ICO" />




















<link rel="stylesheet" type="text/css"
	href="http://image.kyobobook.co.kr/ink/css/default_ink.css" />





<link rel="stylesheet" type="text/css"
	href="http://image.kyobobook.co.kr/ink/css/main.css" />











<!-- s:공통 스크립트 -->
<script type="text/javascript"
	src="http://image.kyobobook.co.kr/ink/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">jQuery.noConflict();</script>
<script type="text/javascript" src="/js/prototype.js"></script>
<!-- - Ajax 관련 -->

<script type="text/javascript" src="/js/KyoboBook.js?ymdh=20160727"></script>
<script type="text/javascript" src="/js/Navigation.js?ymdh=20160415"></script>
<script type="text/javascript" src="/js/ui.js"></script>
<script type="text/javascript" src="/search/js/search_top.js"></script>
<script type="text/javascript" src="/js/makePCookie.js"></script>
<script type="text/javascript" src="/common/kisFlash.js"></script>
<!-- script type="text/javascript" src="http://image.kyobobook.co.kr/ink/js/publisher.js"></script -->

<!-- https가 아닐 때 자동 완성 js Include - 2016. 10. 18. -->

<script type="text/javascript" src="/search/js/autoComplete.js"
	charset="euc-kr"></script>






<!-- //e:외부 스크립트 -->


<iframe name="HiddenActionFrame" frameborder="0" width="0" height="0"
	style="display: none;" title="빈 프레임"></iframe>

<script type="text/javascript">
var expdate = new Date();
expdate.setMonth(expdate.getMonth()+30);

setCookie('clickorder','c1a',expdate,'/','.kyobobook.co.kr');




function setCookie(name,value,expires,path,domain,secure) {
	document.cookie = name + '=' + escape(value) + ';'
	+ ((expires) ? ' expires=' + expires.toGMTString() + ';' : '')
	+ ((path) ? ' path=' + path + ';' : '')
	+ ((domain) ? ' domain=' + domain + ';' : '')
	+ ((secure) ? ' secure' + ';' : '');
}

</script>



<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-27007826-1']);
	_gaq.push(['_setDomainName', 'kyobobook.co.kr']);
	_gaq.push(['_trackPageview']);

	(function() {
	  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();

</script>








</head>
<!-- e:html:head -->


<script type="text/javascript" src="/common/xjos.js"></script>




<body>










	<div id="skip_to_content">
		<a href="#container">본문내용 바로가기</a>
	</div>
	<!-- #skip_content -->






















	<!-- 상단 띠배너 -->
	<!-- jsp:include page="/prom/TopRibbonBanner.jsp"/ -->
	<!-- // 상단 띠배너 -->





	<div id="wrapper">

		<div id="wrap">


			<div id="header">















































				<script type="text/javascript">
//제휴사이트유입시 각 케이스별 주문불가 alert 노출
function noOrderAlert(_linkno) {
	var notice = "";
	var noticenm = "";
	if( _linkno == "CVC" || _linkno == "MNC" ) {
		if  (_linkno == "CVC"){
			noticenm="신한 문화바우처카드는";
		} else if( _linkno == "MNC" ) {
			noticenm="문화누리카드는";
		}
		notice = noticenm  + " 도서, 음반/DVD, eBook 상품만 주문하실 수 있습니다. \n\n"
             	+ "<주문제한상품>\n"
             	+ "기프트, 오피스, 중고장터, 어린이전집, 해외주문도서";
	} else if( _linkno == "CLC"  || _linkno == "BCL" || _linkno == "CCS" ) {
		if  (_linkno == "CLC"){
			noticenm="컬쳐랜드 사이트를";
		} else if( _linkno == "BCL" ) {
			noticenm="비씨 Loun.G 몰을 ";
		} else if( _linkno == "CCS" ) {
			noticenm="씨티카드 몰을";
		}
		notice = noticenm  +" 통해 인터넷교보문고 방문 시, \n"
				+ "아래 상품군은 주문하실 수 없습니다.\n\n"
				+ "<주문제한상품>\n"
				+ "기프트, 오피스, 어린이전집, 중고장터, 해외주문도서";		
	}else if( _linkno == "EVL" ) {
		if  (_linkno == "EVL"){
			noticenm="에버랜드 사이트를";
		}
		notice = noticenm  +" 통해 인터넷교보문고 방문 시, \n"
				+ "아래 상품군은 주문하실 수 없습니다.\n\n"
				+ "<주문제한상품>\n"
				+ "eBook, 기프트, 오피스, 어린이전집, 중고장터, 해외주문도서";		
	}
	alert(notice);
	return;
}

//indexfav1.jsp call (orderClick 셋팅)
function clickForce(cd) { 
	var formname = document.FormFav;
	formname.target = "iframefav";
	formname.action = "http://www.kyobobook.co.kr/indexfav1.jsp?orderClick=" + cd;
	formname.method = "post";
	formname.submit();
} 
//페이지내 이벤트 바인딩
jQuery(document).ready(function($){
	
	//제휴사이트에서 유입시 LINK값에 따라 구매불가 alert을 띄워준다.
	$('.navigation01 li div a').click(function(){
		var linkParam = ''; 
		var clickHref = $(this).attr("href");
		var disableHref = [];
		if(linkParam == "CVC"){
		//주문불가 - eBook,GIFT,중고장터,어린이전집
			disableHref = [
			               "digital.kyobobook.co.kr"	//eBook
			               ,"ebook/device_info.jsp"		//eBook Device
			               ,"gift.kyobobook.co.kr"		//기프트
			               ,"used.kyobobook.co.kr"		//중고장터
			               ,"http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=51&mallGb=KOR"//어린이전집
			              ];
		}else if(linkParam == "CLC" || linkParam == "BCL" || linkParam == "CCS"  || linkParam == "MNC"){
		//주문불가 - GNB:기프트,중고장터 | 분야전체보기:어린이전집,기프트 | 추천서비스:기프트,중고장터
			disableHref = [
			               ,"gift.kyobobook.co.kr"		//기프트
			               ,"used.kyobobook.co.kr"		//중고장터
			               ,"http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=51&mallGb=KOR"//어린이전집
			              ];
		}
		for(var i in disableHref){
			if(clickHref == disableHref[i]){
				noOrderAlert('');
				return false;
				break;
			}	
		}
	});
});
</script>


				<script type="text/javascript">
(function($){
 $(window).load(function(){
		$.ajax({
				url : "/member/updateTimeStamp.laf",
				type : "post",
				//data : {mallGb:"KOR"},
				datatype : "json",
				success : function(result, status){
				},
				error : function(xhr, status, error){
				}
			});
	});
})(jQuery);
</script>
















				<script type="text/javascript">
//### [메뉴 노출/비노출 관련] ###
function msgWindowShow() {
	jQuery(".memo_modify").show();
}
function msgWindowHide() {
	jQuery(".memo_modify").hide();
}
function showNewImg(num) {
	if (num > 0)
	document.getElementById("msgNewImg").style.display = "inline";
}

function showMemo(num, count) {
	document.getElementById("myMessage_blank").style.display = "none";
		for (i = 0 ; i < count  ; i++) {
			if (i == num) {		
				document.getElementById("myMessage"+i).style.display = "block";
			}else {			
				document.getElementById("myMessage"+i).style.display = "none";
			}		
		}
}
function goTopBooklog() {
	
		goBookLog('g5hn2dck');
	
}

//GNB 전용 스크립트 전체메뉴 와 주요 레이어 메뉴판 쑈 히든 처리
var intSelect = document.getElementsByTagName("select");
function viewCateTab(val){
	document.getElementById("viewCategory_"+val).style.display = 'block';
	for(i=1;i<7;i++){
		if(val!=i){
			document.getElementById("viewCategory_"+i).style.display = 'none';
		}
	}
	for (i=0;i<intSelect.length;i++){intSelect[i].style.display = "none";}
}
function viewCateOff(){
	for(i=1;i<7;i++){
		document.getElementById("viewCategory_"+i).style.display = 'none';
	}
}

// 이벤트 발생 시 히든 상태면 보이고, 보이는 상태이면 히든
function divShowHidden(divName){
	if(document.getElementById(divName).style.display == 'block'){
		document.getElementById(divName).style.display = 'none';
		for (i=0;i<intSelect.length;i++){intSelect[i].style.display = "";}
	}else{
		document.getElementById(divName).style.display = 'block';
		for (i=0;i<intSelect.length;i++){intSelect[i].style.display = "none";}
	}
}
// 단순 DIV 디스플레이 설정
function divThisShowS(divName){
	document.getElementById(divName).style.display = 'block';
}
function divThisShow(divName){
	document.getElementById(divName).style.display = 'block';
	for (i=0;i<intSelect.length;i++){intSelect[i].style.display = "none";}
}
function divThisHidden(divName){
	document.getElementById(divName).style.display = 'none';
	for (i=0;i<intSelect.length;i++){intSelect[i].style.display = "";}
}
function selThisHidden(){
	for (i=0;i<intSelect.length;i++){intSelect[i].style.display = "none";}
}
function selThisShow(){
	for (i=0;i<intSelect.length;i++){intSelect[i].style.display = "";}
}

//### [사이트 북마크 관련] ###
function bookmarksiteFav() { 
    var formname = document.FormFav;
	formname.target = "iframefav";
	formname.action = "http://www.kyobobook.co.kr/indexfav1.jsp?Kc=GNHHNObookmark&orderClick=c23";
   	formname.method = "post";
	formname.submit();
} 
function bookmarksite(title,url) { 
   if (window.sidebar) // firefox 
   window.sidebar.addPanel(title, url, ""); 
   else if(window.opera && window.print)
   { // opera 
      var elem = document.createElement('a'); 
      elem.setAttribute('href',url); 
      elem.setAttribute('title',title); 
      elem.setAttribute('rel','sidebar'); 
      elem.click(); 
   }
   else if(document.all) // ie
   window.external.AddFavorite(url, title); 
} 
</script>



				<iframe name="iframefav" class="hidden" frameborder="0" width="0"
					height="0" title="빈프레임"></iframe>
				<form name="FormFav" method="get"></form>







				<!-- 네이버유입시 바로콘 Naver로 변경 -->

				<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
				<script type="text/javascript">
wcs.mileageWhitelist = ["kyobobook.co.kr", "www.kyobobook.co.kr",  "dev.kyobobook.co.kr", "digital.kyobobook.co.kr", "sam.kyobobook.co.kr", "used.kyobobook.co.kr", "music.kyobobook.co.kr", "gift.kyobobook.co.kr", "report.kyobobook.co.kr", "pod.kyobobook.co.kr"];
wcs.inflow("kyobobook.co.kr");
(function($){
	$(document).ready(function(){
		<!-- 네이버 마일리지 연동 성공시에 바로콘 대신 네이버 ON을 노출시켜 준다 -->
		if(wcs.getMileageInfo() != false){ 
			var totalAccumRate, baseAccumRate, addAccumRate;
    		baseAccumRate = parseFloat(wcs.getBaseAccumRate());	//기본 적립율 조회
    		addAccumRate = parseFloat(wcs.getAddAccumRate());	//추가 적립율 조회
    		totalAccumRate = baseAccumRate + addAccumRate;	//전체 적립율
			$('#cooperLayer').siblings().remove().end().parent().prepend('네이버 <img src="http://image.kyobobook.co.kr/ink/images/gnb/icon_on.gif" alt="ON" class="icon" />');
			$('#cooperLayer .text').html('네이버 마일리지 <strong>사용 및<br />' + totalAccumRate + '% 적립</strong>가능');	
		}
	});
})(jQuery);
</script>
				<!-- s:.top_header -->
				<div class="top_header">
					<!-- 기본 로고 (기본위치 left:62px;top:64px / 로고 사이드 배너가 있을 경우 위치 이동) -->
					<h1 class="kyobo">
						<a href="http://www.kyobobook.co.kr/index.laf"><img
							src="http://image.kyobobook.co.kr/ink/images/gnb/logo_kyobo.png"
							alt="KYOBO 교보문고" /></a>
					</h1>

					<!-- 로고 사이드 배너 -->
					<!-- <div class="kyobo2" style="left:-36px;top:31px;"><a href="http://www.kyobobook.co.kr/prom/2013/general/130625_kssqi.jsp?orderClick=c18"><img src="http://image.kyobobook.co.kr/ink/images/prom/2013/main/wel/130701/img_kssqi_n.gif" alt="KS-SQI"/></a></div> -->
					<!-- //헤더 우측 배너 -->
					<!-- *** //e:(자동화)헤더 우측 배너 *** -->

					<!-- *** s:(자동화)Seasonal배너 *** -->
					<!-- #####wel_SeasonalBanner_START##### -->
					<!-- 헤더 우측 배너 -->
					<div id="headerBanner" class="header_banner"></div>
					<script type="text/javascript">
var gnbBannerImgAr = new Array();
var gnbBannerLinkAr = new Array();
var gnbBannerSiteAr = new Array();
var gnbBannerNameAr = new Array();
var gnbBannerWindowAr = new Array();
var gnbBannerTotalCount = 5;
		gnbBannerImgAr[gnbBannerImgAr.length++] = "https://simage.kyobobook.co.kr/ink/images/prom/2016/banner/161205/bnL_32.jpg";
		gnbBannerLinkAr[gnbBannerLinkAr.length++] = "http://www.kyobobook.co.kr/prom/2016/general/160323_nonstop.jsp?orderClick=c0z";
		gnbBannerSiteAr[gnbBannerSiteAr.length++] = "01";
		gnbBannerNameAr[gnbBannerNameAr.length++] = "모바일혜택";
		gnbBannerWindowAr[gnbBannerWindowAr.length++] = "2";
		gnbBannerImgAr[gnbBannerImgAr.length++] = "https://simage.kyobobook.co.kr/ink/images/prom/2016/banner/161205/bnL_35.jpg";
		gnbBannerLinkAr[gnbBannerLinkAr.length++] = "http://www.kyobobook.co.kr/prom/2015/book/wallpaper.jsp?orderClick=c0z";
		gnbBannerSiteAr[gnbBannerSiteAr.length++] = "01";
		gnbBannerNameAr[gnbBannerNameAr.length++] = "월페이퍼X기프트콘";
		gnbBannerWindowAr[gnbBannerWindowAr.length++] = "2";
		gnbBannerImgAr[gnbBannerImgAr.length++] = "https://simage.kyobobook.co.kr/ink/images/prom/2017/banner/170123/bnF_04.jpg";
		gnbBannerLinkAr[gnbBannerLinkAr.length++] = "http://www.kyobobook.co.kr/prom/2017/book/170103_dailyCheck.jsp?orderClick=c0z";
		gnbBannerSiteAr[gnbBannerSiteAr.length++] = "01";
		gnbBannerNameAr[gnbBannerNameAr.length++] = "출석도장";
		gnbBannerWindowAr[gnbBannerWindowAr.length++] = "2";
		gnbBannerImgAr[gnbBannerImgAr.length++] = "https://simage.kyobobook.co.kr/ink/images/prom/2017/banner/170124/bnL_22.jpg";
		gnbBannerLinkAr[gnbBannerLinkAr.length++] = "http://www.kyobobook.co.kr/prom/2017/general/big10_main.jsp?orderClick=c0z";
		gnbBannerSiteAr[gnbBannerSiteAr.length++] = "01";
		gnbBannerNameAr[gnbBannerNameAr.length++] = "명강의BIG10";
		gnbBannerWindowAr[gnbBannerWindowAr.length++] = "2";
		gnbBannerImgAr[gnbBannerImgAr.length++] = "https://simage.kyobobook.co.kr/ink/images/prom/2017/book/170517_classic/bnD_w03.jpg";
		gnbBannerLinkAr[gnbBannerLinkAr.length++] = "http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32717&classGb=KOR&PRE=Y&orderClick=c0z";
		gnbBannerSiteAr[gnbBannerSiteAr.length++] = "01";
		gnbBannerNameAr[gnbBannerNameAr.length++] = "전략도서 세살버릇";
		gnbBannerWindowAr[gnbBannerWindowAr.length++] = "2";
var thisDomain = document.domain;
var serverGb = "02";
if(
		thisDomain.indexOf("sam.kyobobook.co.kr") != -1 ||			//sam
		thisDomain.indexOf("digidev.kyobobook.co.kr/sbweb") != -1 	//sam 개발서버
){
	//샘에서 접근
	serverGb = "03";
}else if(
	thisDomain.indexOf("digital.kyobobook.co.kr") != -1 ||		//eBook
	thisDomain.indexOf("digidev.kyobobook.co.kr") != -1 		//eBook 개발서버
){
	//디컨에서 접근
	serverGb = "03";
}else if(
	thisDomain.indexOf("gift.kyobobook.co.kr") != -1 ||			//기프트
	thisDomain.indexOf("giftfront.kyobobook.co.kr") != -1 ||	//기프트 개발서버
	thisDomain.indexOf("music.kyobobook.co.kr") != -1 ||		//음반
	thisDomain.indexOf("musictest.kyobobook.co.kr") != -1		//음반 개발서버
){
	//핫트랙스에서 접근
	serverGb = "04";
}else if(
	thisDomain.indexOf("used.kyobobook.co.kr") != -1 ||			//중고장터
	thisDomain.indexOf("usedtest.kyobobook.co.kr") != -1 		//중고장터 개발서버
){
	//중고장터에서 접근
	serverGb = "05";
}
var gnbBannerContent = "";
var gnbBannerStyle = "";
var gnbBannerWindow = "";
var gnbBannerCount = 0;
for (i = 0; i < gnbBannerTotalCount; i++) {
	if (gnbBannerSiteAr[i] == "01" || gnbBannerSiteAr[i] == serverGb) {
		gnbBannerCount++;
		if (i > 1) {
			gnbBannerStyle = "style='display:none;'";
		} else {
			gnbBannerStyle = "";
		}
		if (gnbBannerWindowAr[i] == "1") {
			gnbBannerWindow ="target='_blank'";	
		} else {
			gnbBannerWindow = "";
		}
		gnbBannerContent += "<li "+gnbBannerStyle+"><a href='"+gnbBannerLinkAr[i]+"' "+gnbBannerWindow+"><img src='"+gnbBannerImgAr[i]+"' alt='"+gnbBannerNameAr[i]+"'/> </a></li>";
	}
}
if (gnbBannerContent != "") {
	jQuery('#headerBanner').append("<ul>"+gnbBannerContent+"</ul>");
	var gnbBannerBtnContent = "";
	if (gnbBannerCount > 1) {
		gnbBannerBtnContent += "<div class=\"list_nav\">";
		gnbBannerBtnContent += "	<span class=\"page\" id=\"gnbBannerPage\"><strong class=\"current\">1</strong>/"+gnbBannerCount+"</span>";
		gnbBannerBtnContent += "	<button type=\"button\" class=\"btn_prev\">이전 배너</button><button type=\"button\" class=\"btn_next\">다음 배너</button>";
		gnbBannerBtnContent += "</div>";
		jQuery('#headerBanner').append(gnbBannerBtnContent);
	} else {
		jQuery('#headerBanner').append(gnbBannerBtnContent);
	}
}
(function($){
	var total = $('.header_banner li').size();
	var random = Math.floor(Math.random() * total);
	$('.header_banner li').hide().eq(random).show();
	$('.header_banner .list_nav .current').text( $('.header_banner li').index($('.header_banner li:visible')) +1 );
	$('.header_banner .btn_next').click(function(e){
		e.preventDefault();
		if ( $('.header_banner li:visible').next().size() ){
			$('.header_banner li:visible').hide().next().show();
		} else {
			$('.header_banner li').hide().filter(':first').show();
		}
		$(this).closest('.list_nav').find('.current').text( $('.header_banner li').index($('.header_banner li:visible')) +1 );
	});
	$('.header_banner .btn_prev').click(function(e){
		e.preventDefault();
		if ( $('.header_banner li:visible').prev().size() ){
			$('.header_banner li:visible').hide().prev().show();
		} else {
			$('.header_banner li').hide().filter(':last').show();
		}
		$(this).closest('.list_nav').find('.current').text( $('.header_banner li').index($('.header_banner li:visible')) +1 );
	});
})(jQuery);
</script>
					<!-- //헤더 우측 배너 -->

					<!-- *** //e:(자동화)Seasonal배너 *** -->

					<!-- s:.top_content_gnb -->
					<div class="top_content_gnb">


						<ul class="barocon">
							<li onmouseover="divThisShowS('cooperLayer');"
								onmouseout="divThisHidden('cooperLayer');"><a
								href="http://www.kyobobook.co.kr/prom/2010/general/100616_benefit.jsp?&Kc=GNHHNObarooff&orderClick=c24">바로콘
									<img
									src="http://image.kyobobook.co.kr/ink/images/gnb/icon_off2.gif"
									alt="바로콘 OFF" class="icon" />
							</a>


								<div class="cooper_layer" id="cooperLayer"
									style="display: none;">
									<div class="text">



										<strong>바로콘으로 인터넷교보문고 소식 받기</strong><br /> <a
											href="http://www.kyobobook.co.kr/prom/2010/general/100616_benefit.jsp?&Kc=GNHHNObarooff&orderClick=c24"
											class="detail">바로콘 자세히보기</a>


									</div>
								</div></li>
						</ul>
						<ul class="list external">
							<li class="store"><a href="#storeList">영업점 안내</a></li>
							<li class="parent">
								<div class="parent_title">
									<a href="http://www.kyobobook.co.kr/member/IndexMemBenefit.laf">회원혜택</a>
								</div>
								<ul class="layer">
									<li><a
										href="http://www.kyobobook.co.kr/member/MemBenefitSub.laf?subPage=NewMemberBenefit&orderClick=doh">신규회원
											혜택</a></li>
									<li><a
										href="http://www.kyobobook.co.kr/member/MemBenefitSub.laf?subPage=VipMemberBenefit&orderClick=doh">우수회원
											혜택</a></li>
									<li><a
										href="http://www.kyobobook.co.kr/member/MemBenefitSub.laf?subPage=ThisMonthBenefit&orderClick=doh">이달의
											혜택</a></li>
									<li><a
										href="http://www.kyobobook.co.kr/prom/2013/general/memberBenefit.jsp?orderClick=doh">등급UP
											혜택</a></li>
									<li><a
										href="http://www.kyobobook.co.kr/prom/2016/general/160217_review.jsp?orderClick=doh">참리뷰캠페인</a></li>
									<!-- //16-02-25 추가 -->
								</ul>
							</li>
						</ul>
						<meta http-equiv="Cache-Control" content="no-cache" />
						<meta http-equiv="Expires" content="0" />
						<meta http-equiv="Pragma" content="no-cache" />


						<script type="text/javascript">
function getCookieVal (offset) {
        var endstr = document.cookie.indexOf (";", offset);
        if (endstr == -1)
                endstr = document.cookie.length;
        return unescape(document.cookie.substring(offset, endstr));
}

function GetCookie (name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    while (i < clen) {
    var j = i + alen;
        if (document.cookie.substring(i, j) == arg)
            return getCookieVal (j);
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0) break; 
    }
    return null;
}
function toggleShowHide(id){
	jQuery("#"+id).toggle();
}
//갖고싶은상품으로 이동하기(통합주문 전용)
function goBooklogWishListForOrder(memid, wishCatId) {
	if (memid=='') {
		findTop().openLogin("http://order.kyobobook.co.kr/myroom/storeList?memid=$memid$&menuDvcd=B02&orderClick=zbc");
		return;
	}
	var id = "1";
	if (wishCatId !=null) {
		id = wishCatId;
	}
	findTop().location.href="http://order.kyobobook.co.kr/myroom/storeList?memid=" + memid + "&menuDvcd=B02&orderClick=zbc";
}
</script>

						<script type="text/javascript">
var ATEMCID = "";
var PRI = "";
if(PRI == null || PRI == ''){
	PRI = "N";
}

var EMCID = "g5hn2dck";
var CARTC = "0";
if(EMCID != null && EMCID != ''){
	CARTC = "0";
}else{
	CARTC = "";
}
if(CARTC == null || CARTC == ''){
	CARTC = "0";
} /*else {
	if (Number(CARTC) > 100) {
		CARTC = "99+";
	}
}*/
var UGRADE = "130";
var session_id = 'g5hn2dck';
var loginYN = "N";
var autoLoginYN = "N";
var uGradeName = "일반";

if( (ATEMCID != null && "" != ATEMCID) || (EMCID != null && "" != EMCID) ){
	//자동 로그인 or 로그인
	loginYN = "Y";
	
	
		// 일반 로그인은 세션체크 필수(ink에서만)
		if(session_id == null || session_id == ''){
			if(ATEMCID != null && "" != ATEMCID){ // 자동로그인일 경우에 로그인으로 체크
				loginYN = "Y";	
			}else{
				loginYN = "N";
				jQuery(document).ready(function(){ // 세션이 끊어져서 로그아웃 상태이기 때문에 0으로 초기화시킴
					//jQuery('.navigation_bar .user_menu .cart small').text('(0)');
					jQuery('.top_header .list .cart small span').text('0');
					jQuery('.sticky_header .item_2 small span').text('0');
				});
			}
		}
	
	if(ATEMCID != null && "" != ATEMCID){
		autoLoginYN = "Y";
	}
	//회원등급 셋팅
	if(UGRADE != null && "" != UGRADE){
		if("110" == UGRADE){
			uGradeName = "플래티넘";
		}else if("120" == UGRADE || "150" == UGRADE){
			uGradeName = "프라임";
		}else if("140" == UGRADE){
			uGradeName = "프랜드";
		}
	}
}
</script>

						<ul class="list" id="gnbLoginInfoList">


							<li><a
								href="http://www.kyobobook.co.kr/prom/2017/book/170103_dailyCheck.jsp?orderClick=c1j">출석체크</a></li>
							<li><a href="javascript:goCSCenter();">고객센터</a></li>
							<li><a href="javascript:goSendInquiry();">주문배송</a></li>
							<li class="cart"><a href="javascript:goCart();">장바구니 <small><span><script
												type="text/javascript">document.write(CARTC);</script></span></small></a></li>


						</ul>
						<script type="text/javascript">
String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
}
var gnbLoginInfoTag = "";
var gnbloginEtcHtml = "<li class=\"parent\">"  
+ "<div class=\"parent_title\"><a href=\"https://order.kyobobook.co.kr/myroom/commIframe?targetUrl=https://www.kyobobook.co.kr/myroom/joinModFormIframe.laf?iframe_yn=Y&orderClick=c0G\" id=\"gnbLoginUserName\">"
+"</a>"
+"<a href=\"https://order.kyobobook.co.kr/myroom/commIframe?targetUrl=https://www.kyobobook.co.kr/myroom/newGradeIframe.laf?iframe_yn=Y&orderClick=c0H\"><em>("+uGradeName+")</em></a></div>"
+"<ul class=\"layer\">"
+ "<li><a href=\"javascript:goMyRoom();\">마이룸 메인</a></li>"
+ "<li><a href=\"http://order.kyobobook.co.kr/myroom/coupon/usedCouponList?orderClick=c0A\">쿠폰함</a></li>"
+"<li><a href=\"http://sam.kyobobook.co.kr/sbweb/mylibrary/mylibraryListTr.ink?orderClick=c0B\">eBook서재</a></li>"
+"<li><a href=\"http://sam.kyobobook.co.kr/sbweb/mylibrary/mylibraryListSb.ink?orderClick=c0C\">sam 서재</a></li>"
+"<li><a href=\"javascript:goBooklogWishListForOrder('"+EMCID+"');\">보관함</a></li>"
+ "</ul>"
+"</li>";

if("Y" == loginYN){
	
	if("Y" == autoLoginYN){
		gnbLoginInfoTag = 	gnbloginEtcHtml + 
							(("Y" == PRI)?"<li class=\"button premium\"><a href=\"#\">리더스클럽 K</a></li>":"")+
							"<li class=\"button\"><a href=\"#guideAutoLogin\" onclick=\"javascript:toggleShowHide('autologin_guide2');return false;\">로그아웃</a></li>";
							
	}else{
		gnbLoginInfoTag = 	gnbloginEtcHtml + 
							(("Y" == PRI)?"<li class=\"button premium\"><a href=\"#\">리더스클럽 K</a></li>":"")+
							"<li class=\"button\"><a href=\"javascript:logout();\">로그아웃</a></li>";
							
	}
	
	
}else{
	
	
	
	
		var gnbLoginInfoTag =	"<li class=\"button\"><a href=\"javascript:openLoginTop(location.href);\">로그인</a></li>"+
								"<li><a href=\"javascript:goMemberJoin();\">회원가입</a></li>";
	
	
	
	
	
	
}

jQuery("#gnbLoginInfoList").prepend(gnbLoginInfoTag);

//Gnb 로그인 사용자 이름 셋팅
function setGnbName(uName){
	if(uName != ""){
		//이름 셋팅
		jQuery("#gnbLoginUserName").text(uName+"님");
	}else{
		jQuery("#gnbLoginInfoList > li ").each(function(index){
			
    		if(index < (("Y" == PRI)?3:2)){
    			jQuery(this).remove();
    		}
    		
    	});
		
    	
		
		
			var gnbLoginInfoTag =	"<li class=\"button\"><a href=\"javascript:openLoginEtc(location.href);\">로그인</a></li>" +
									"<li><a href=\"javascript:goMemberJoin();\">회원가입</a></li>";
		
		
		
		jQuery("#gnbLoginInfoList").prepend(gnbLoginInfoTag);
	}
}

(function ($) {
	if("Y" == loginYN){
		var uName = "";

	
		
		
		uName = "이영훈";
		setGnbName(uName);
	
	

	}
})(jQuery)


</script>
						<!-- 프리미엄라운지 팝업 -->
						<style type="text/css">
#header .top_content_gnb .list li.premium {
	background: none;
	padding-left: 0;
}

#header .top_content_gnb .list li.premium a {
	padding-left: 20px;
	background:
		url(https://simage.kyobobook.co.kr/ink/images/welcome/icon_premium.gif)
		no-repeat 4px 1px;
}

#premium_guide {
	position: absolute;
	left: 544px;
	top: 25px;
	min-width: 72px;
	max-width: 300px;
	padding: 15px 15px 13px;
	border: 1px solid #888;
	background: #fff;
	z-index: 100;
}

#premium_guide .arrow {
	width: 11px;
	height: 6px;
	position: absolute;
	left: 45px;
	top: -6px;
	background:
		url(https://simage.kyobobook.co.kr/ink/images/welcome/arrow_message.gif)
		no-repeat;
}

#premium_guide h2 {
	position: absolute;
	visibility: hidden;
	width: 0;
	height: 0;
	overflow: hidden;
}

#premium_guide p {
	line-height: 16px;
}

#premium_guide p img {
	vertical-align: middle;
}

#premium_guide p strong {
	color: #333333;
}

#premium_guide p strong em {
	color: #ff0000;
	font-style: normal;
}

#premium_guide .detail {
	padding-right: 7px;
	background:
		url('https://simage.kyobobook.co.kr/ink/images/common/arrow_04.gif')
		right 2px no-repeat;
}
</style>
						<div id="premium_guide" style="display: none;">
							<h2>채사장 강연 + 문화전시</h2>
							<p>
								<strong>채사장 강연 + 문화전시</strong>
							</p>
							<p>
								<a
									href="http://www.kyobobook.co.kr/prom/2017/book/170515_premium.jsp?orderClick=aao"
									class="detail"> <strong> <em>독서지원금 4000P 선물!</em>
								</strong>
								</a>
							</p>
							<div class="arrow"></div>
						</div>

						<script type="text/javascript">
	(function($){
		$(function(){
			var preTimer;
			if( $('.top_content_gnb .list .premium').size() && $('body.welcome').size() ){
				$('#premium_guide').slideDown();
				preTimer = window.setTimeout(function(){ $('#premium_guide').fadeOut(); },4000);
			}
			$('.top_content_gnb .list .premium, #premium_guide').hover(function(){
				if(preTimer) window.clearTimeout(preTimer);
				$('#premium_guide').show();
			},function(){
				$('#premium_guide').hide();
			});
			$('.top_content_gnb .list .premium a').attr('href', $('#premium_guide a.detail').attr('href') );
			if( $('.top_content_gnb .list .premium').size() ){
				$('#premium_guide').css('left', $('.top_content_gnb .list .premium').offset().left - $('.top_content_gnb').offset().left );
			}
		})
	})(jQuery);
	</script>
						<!-- // 프리미엄라운지 팝업 -->










						<div class="store_list wide" id="storeList" style="display: none;">
							<div class="link_main">
								<a
									href="http://www.kyobobook.co.kr/storen/MainTopStore.laf?Kc=GNHHNOoffstore&orderClick=rvd">영업점
									안내</a>
							</div>
							<ul class="first">
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=01&Kc=GNHHNOoffstore&orderClick=rvd">광화문점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=15&Kc=GNHHNOoffstore&orderClick=rvd">강남점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=29&Kc=GNHHNOoffstore&orderClick=rvd">잠실점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=33&Kc=GNHHNOoffstore&orderClick=rvd">목동점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=36&Kc=GNHHNOoffstore&orderClick=rvd">영등포점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=49&Kc=GNHHNOoffstore&orderClick=rvd">합정점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=66&Kc=GNHHNOoffstore&orderClick=rvd">디큐브시티<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=68&Kc=GNHHNOoffstore&orderClick=rvd">수유<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=41&Kc=GNHHNOoffstore&orderClick=rvd">동대문<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=46&Kc=GNHHNOoffstore&orderClick=rvd">은평<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=56&Kc=GNHHNOoffstore&orderClick=rvd">청량리<br />
										바로드림센터
								</a></li>
							</ul>
							<ul>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=13&Kc=GNHHNOoffstore&orderClick=rvd">부천점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=25&Kc=GNHHNOoffstore&orderClick=rvd">인천점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=34&Kc=GNHHNOoffstore&orderClick=rvd">천안점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=38&Kc=GNHHNOoffstore&orderClick=rvd">일산점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=69&Kc=GNHHNOoffstore&orderClick=rvd">판교<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=42&Kc=GNHHNOoffstore&orderClick=rvd">송도<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=52&Kc=GNHHNOoffstore&orderClick=rvd">광교
										센터</a></li>
							</ul>
							<ul>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=04&Kc=GNHHNOoffstore&orderClick=rvd">대구점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=05&Kc=GNHHNOoffstore&orderClick=rvd">부산점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=43&Kc=GNHHNOoffstore&orderClick=rvd">해운대<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=28&Kc=GNHHNOoffstore&orderClick=rvd">창원점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=39&Kc=GNHHNOoffstore&orderClick=rvd">울산점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=02&Kc=GNHHNOoffstore&orderClick=rvd">대전점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=31&Kc=GNHHNOoffstore&orderClick=rvd">전주<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=44&Kc=GNHHNOoffstore&orderClick=rvd">반월당<br />
										바로드림센터
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=45&Kc=GNHHNOoffstore&orderClick=rvd">센텀시티점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=48&Kc=GNHHNOoffstore&orderClick=rvd">칠곡
										센터</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=24&Kc=GNHHNOoffstore&orderClick=rvd">세종<br />
										바로드림센터
								</a></li>
							</ul>
							<ul>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=72&Kc=GNHHNOoffstore&orderClick=rvd">서울대점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=74&Kc=GNHHNOoffstore&orderClick=rvd">이화여대점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=80&Kc=GNHHNOoffstore&orderClick=rvd">숙명여대점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=79&Kc=GNHHNOoffstore&orderClick=rvd">가천대점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=86&Kc=GNHHNOoffstore&orderClick=rvd">성균관대점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=75&Kc=GNHHNOoffstore&orderClick=rvd">포항공대점</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/storen/MainStore.laf?SITE=77&Kc=GNHHNOoffstore&orderClick=rvd">전북대점</a></li>
							</ul>
							<div class="btn_close">
								<a href="#"><img
									src="http://image.kyobobook.co.kr/ink/images/gnb/btn_up3.gif"
									alt="닫기" /></a>
							</div>
						</div>
						<script type="text/javascript">
(function($){
	$('.top_content_gnb .list .store a').click(function(e){
		e.preventDefault();
		$(this).toggleClass('on');
		$('#storeList').toggle();
		if($(this).closest('.list').is('.external')){
			var left = $(this).closest('.store').position().left;
			$('#storeList').addClass('left').css({'left':left});
		}
	});
	$('.top_content_gnb .list .store a, #storeList').hover(function(){
		$('.top_content_gnb .list .store a').addClass('on');
		$('#storeList').show();
		if($(this).closest('.list').is('.external')){
			var left = $(this).closest('.store').position().left;
			$('#storeList').addClass('left').css({'left':left});
		}
	},function(){
		$('.top_content_gnb .list .store a').removeClass('on');
		$('#storeList').hide();
	});
	$('#storeList .btn_close').click(function(e){
		e.preventDefault();
		$('.top_content_gnb .list .store a').removeClass('on');
		$('#storeList').hide();
	});
	$('.top_content_gnb .list .store').one('mouseover',function(){
		$('#storeList .btn_close').hide();
	});
})(jQuery);
</script>



						<style>
#autologin_guide2 {
	position: absolute;
	right: 154px;
	top: 0;
	width: 250px;
	padding: 11px 40px;
	border: 1px solid #b2b2b2;
	border-top: none;
	background: #fff;
	z-index: 100;
}

#autologin_guide2 h2 {
	position: absolute;
	visibility: hidden;
	width: 0;
	height: 0;
	overflow: hidden;
}

#autologin_guide2 p strong {
	color: #333333;
}

#autologin_guide2 ul {
	margin: 5px 0;
}

#autologin_guide2 ul li {
	padding: 0 0 0 5px;
	background:
		url('http://image.kyobobook.co.kr/ink/images/common/icon_squ.gif')
		no-repeat 0 5px;
	font-size: 11px;
	line-height: 16px;
	color: #666;
}

#autologin_guide2 .btn_close {
	position: absolute;
	top: 10px;
	right: 10px;
}

#header .top_content_gnb .list li.autologin a {
	display: inline-block;
	margin-top: -3px;
	padding: 3px 18px 0 0;
	background:
		url('http://image.kyobobook.co.kr/ink/images/gnb/btn_down3.gif')
		no-repeat right center;
}
</style>

						<div id="autologin_guide2" style="display: none;">
							<h2>자동로그인 안내</h2>
							<p>
								<strong>자동로그인이 설정되어 있습니다.</strong>
							</p>
							<ul>
								<li>개인정보보호를 위해 공용PC에서는<br />서비스 이용 종료시 로그아웃해주시기 바랍니다.
								</li>
								<li>자동로그인시에는 사용이 제한되오니,<br />전체 서비스 사용을 위해 다시 로그인 바랍니다.
								</li>
							</ul>
							<div>



								<a href="javascript:openLoginTop(location.href);"><img
									src="http://image.kyobobook.co.kr/ink/images/login/btn_auto_login.gif"
									alt="재로그인" /></a> <a href="javascript:logout();"><img
									src="http://image.kyobobook.co.kr/ink/images/login/btn_auto_logout.gif"
									alt="로그아웃" /></a>
							</div>
							<div class="btn_close">
								<a href="#"
									onclick="javascript:toggleShowHide('autologin_guide2');return false;"><img
									src="http://image.kyobobook.co.kr/ink/images/common/btn_close_p2.png"
									alt="자동로그인 안내 닫기" /></a>
							</div>
						</div>









					</div>
					<!-- e:.top_content_gnb -->


					<!-- 검색  20110412 한승용 -->
					<form name="searchTopChk" method="post">
						<input type="hidden" name="vPsch" value="" />
					</form>
					<form id="searchTop" name="searchTop" method="post" action=""
						onsubmit="javascript:goSearch('t'); return false;">
						<input type="hidden" id="vPstrCategory" name="vPstrCategory"
							value="KOR" /> <input type="hidden" id="vPstrKeyWord"
							name="vPstrKeyWord" value="" /> <input type="hidden" id="vPsch"
							name="vPsch" value="" /> <input type="hidden" id="vPreSearch"
							name="vPreSearch" value="" /> <input type="hidden"
							id="vPstrStatus" name="vPstrStatus" value="" /> <input
							type="hidden" id="vPstrRead" name="vPstrRead" value="" /> <input
							type="hidden" id="orderClick" name="orderClick" value="" /> <input
							type="hidden" id="vPmallGb" name="vPmallGb" value="KOR" /> <input
							type="hidden" id="vPdetailUrl" name="vPdetailUrl" /> <input
							type="hidden" id="vPEventImg" name="vPEventImg" value="" /> <input
							type="hidden" id="vPEventUrl" name="vPEventUrl" value="" /> <input
							type="hidden" id="vPsearchOpt" name="vPsearchOpt" value="" /> <input
							type="hidden" id="vPcateSearch" name="vPcateSearch" value="" />
						<input type="hidden" id="vPplace" name="vPplace" /> <input
							type="hidden" id="vPcateGb" name="vPcateGb" /> <input
							type="hidden" id="vPreKeyWord" name="vPreKeyWord" /> <input
							type="hidden" id="vPorderClick" name="vPorderClick" value="" />
						<input type="hidden" id="searchCategory" name="searchCategory" />

						<!-- s:.searcharea is_option -->
						<div class="searcharea is_option">
							<div class="search_input">
								<div class="search_option">
									<input type="button" id="srcCategory" name="srcCategory"
										value="통합검색" />
									<ul>
										<li><a href="#">통합검색</a></li>
										<li class="on"><a href="#">국내도서</a></li>
										<li><a href="#">외국도서</a></li>
										<li><a href="#">eBook</a></li>
										<li><a href="#">sam</a></li>
										<li><a href="#">음반</a></li>
										<li><a href="#">DVD</a></li>
										<li><a href="#">기프트</a></li>
										<li><a href="#">중고장터</a></li>
									</ul>
								</div>
								<!-- 자동완성 분야설정 -->
								<script type="text/javascript">
	document.getElementById("srcCategory").value = '국내도서';
	document.searchTop.searchCategory.value = 'KOR';
</script>

								<script type="text/javascript">
(function($){

	$('.search_option input').click(
		function(){$('.search_option ul').toggle().find('li.on:visible a').focus();$(this).toggleClass('open');}
	);

	var hover_value = 0;
	var focus_value = 0;
	$('.search_option').hover(
		function(){hover_value = 1;}
		,function(){hover_value = 0;}
	);
	$('.search_option input').focus(
		function(){focus_value = 1;$(this).addClass('focus');}
	).blur(
		function(){focus_value = 0;$(this).removeClass('focus');}
	);
	$('body').click(
		function(){if(!hover_value&&!focus_value){$('.search_option ul').hide();$('.search_option input').removeClass('open');}}
	);
	/*$('.search_option input').focus(
		function(){
			$(this).blur();
		}
	);*/

	$('.search_option input').keydown(function(event){
		switch(event.which) {
			case 38: // up
				$(this).addClass('open');$('.search_option ul').show();
				if( $('.search_option ul li.on').prev().size() ) $('.search_option ul li.on').prev().children('a').focus();
				else $('.search_option ul li.on a').focus();
				return false;
			case 40: // down
				$(this).addClass('open');$('.search_option ul').show();
				if( $('.search_option ul li.on').next().size() ) $('.search_option ul li.on').next().children('a').focus();
				else $('.search_option ul li.on a').focus();
				return false;
		}
	});
	$('.search_option ul li a').keydown(function(event){
		switch(event.which) {
			case 38: // up
				$(this).parent('li').prev().children('a').focus();
				return false;
			case 40: // down
				$(this).parent('li').next().children('a').focus();
				return false;
			case 27: // esc
				$('.search_option ul').hide();$('.search_option input').removeClass('open').focus();
				return false;
		}
	});

	$('.search_option ul li a').click(
		function(e){
			e.preventDefault();
			/*if($(this).text().length > 5){
				$('.search_option input').addClass('small');
			} else {
				$('.search_option input').removeClass('small');
			}*/
			$('.search_option input').removeClass('open').val($(this).text()).focus();
			$('.search_option ul').hide();
			$('.search_option ul li').removeClass('on');
			$(this).parent().addClass('on');
			var idxNum = $(this).parent().parent().find('a').index($(this));
			
			if(idxNum == 1){
				document.searchTop.searchCategory.value = 'KOR';
			}else if(idxNum == 2){
				document.searchTop.searchCategory.value = 'ENG';
			}else if(idxNum == 3){
				document.searchTop.searchCategory.value = 'DIG';
			}else if(idxNum == 4){
				document.searchTop.searchCategory.value = 'SAM';
			}else if(idxNum == 5){
				document.searchTop.searchCategory.value = 'MUC';
			}else if(idxNum == 6){
				document.searchTop.searchCategory.value = 'DVD';
			}else if(idxNum == 7){
				document.searchTop.searchCategory.value = 'GFT';
			}else if(idxNum == 8){
				document.searchTop.searchCategory.value = 'USE';
			}else{
				document.searchTop.searchCategory.value = 'TOT';
			}
		}
	);
	
	$().ready(function(){
	});
})(jQuery);
</script>
								<input type="text" class="main_input" name="searchKeyword"
									id="searchKeyword" value="" style="ime-mode: active;"
									autocomplete="off" onBlur="setOutFocus();" title="검색어 입력" /> <input
									type="hidden" name="eventurl" id="eventurl" value="" /> <input
									type="hidden" name="eventurlFlag" id="eventurlFlag" value="" />
								<input type="hidden" name="eventurlDelFlag" id="eventurlDelFlag"
									value="" />

								<!-- 검색창 광고 -->
								<!-- 광고스크립트 //-->


								<script type="text/javascript">
	jQuery(function() {
		jQuery.getJSON("http://imac.kyobobook.co.kr/jsonp/INK/ink_wel_2016/ink_wel_2016@wel_02?callback=?", function(data) {
			if(data.items.length > 0){		
				jQuery.each(data.items, function(i, item) {				
					jQuery('#searchKeyword').css("background-image", "url("+item.ctvurl+")");
					jQuery('#eventurl').val(item.click_url);
					jQuery('#eventurlFlag').val(1);
					jQuery('#eventurlDelFlag').val(0);
				});
			}
		});
	})
	</script>


								<a href="javascript:showSugGuide();" id="set_sugicn"
									style="display:;"> <img
									src="http://image.kyobobook.co.kr/ink/images/gnb/btn_down4.gif"
									id="sugicn" alt="자동완성 펼치기" />
								</a> <a href="javascript:showSugGuide();" id="set_sugicnUP"
									style="display: none"> <img
									src="http://image.kyobobook.co.kr/ink/images/gnb/btn_up4.gif"
									id="sugicnUP" alt="자동완성 접기" />
								</a>

								<div class="auto_complete">
									<div id="SchSug" style="display:;">

										<iframe id="hFrame" name="hFrame"
											src="/search/autoComplete.html"
											style="display: none; height: 318px;" width="576"
											frameborder="0" scrolling="no" title="자동완성 검색"> </iframe>

									</div>
								</div>
							</div>
							<input type="submit" class="btn_search" value="검색" />
						</div>
						<!-- e:.searcharea is_option -->
					</form>






					<div class="searchbook_main_new">
						<!-- #####TopSearchNewIssueKeyword_START##### -->
						<script type="text/javascript">
	var hotWords = new Array();
	if( hotWords[1] == "" || typeof(hotWords[1]) == "undefined"){
		hotWords[1] = hotWords[1] + "<li class='first'><a href='http://www.kyobobook.co.kr/event/eventViewByPid.laf?orderClick=LBS&eventPid=31835'>해결의 법칙</a></li>";
	}else{
		hotWords[1] = hotWords[1] + "<li><a href='http://www.kyobobook.co.kr/event/eventViewByPid.laf?orderClick=LBS&eventPid=31835'>해결의 법칙</a></li>";
	}
	if( hotWords[0] == "" || typeof(hotWords[0]) == "undefined"){
		hotWords[0] = hotWords[0] + "<li class='first'><a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?orderClick=LBS&mallGb=KOR&ejkGb=KOR&barcode=9791187777151'>에린헌터의 전사들</a></li>";
	}else{
		hotWords[0] = hotWords[0] + "<li><a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?orderClick=LBS&mallGb=KOR&ejkGb=KOR&barcode=9791187777151'>에린헌터의 전사들</a></li>";
	}
	if( hotWords[0] == "" || typeof(hotWords[0]) == "undefined"){
		hotWords[0] = hotWords[0] + "<li class='first'><a href='http://www.kyobobook.co.kr/prom/2017/book/170508_president.jsp?orderClick=LBS'>문재인대통령</a></li>";
	}else{
		hotWords[0] = hotWords[0] + "<li><a href='http://www.kyobobook.co.kr/prom/2017/book/170508_president.jsp?orderClick=LBS'>문재인대통령</a></li>";
	}
	if( hotWords[1] == "" || typeof(hotWords[1]) == "undefined"){
		hotWords[1] = hotWords[1] + "<li class='first'><a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?orderClick=LBS&mallGb=KOR&ejkGb=KOR&barcode=9791195522125'>언어의 온도</a></li>";
	}else{
		hotWords[1] = hotWords[1] + "<li><a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?orderClick=LBS&mallGb=KOR&ejkGb=KOR&barcode=9791195522125'>언어의 온도</a></li>";
	}
	if( hotWords[1] == "" || typeof(hotWords[1]) == "undefined"){
		hotWords[1] = hotWords[1] + "<li class='first'><a href='http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?orderClick=LBS&eventPid=32717&classGb=KOR&PRE=Y'>세 살 버릇 글라스</a></li>";
	}else{
		hotWords[1] = hotWords[1] + "<li><a href='http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?orderClick=LBS&eventPid=32717&classGb=KOR&PRE=Y'>세 살 버릇 글라스</a></li>";
	}
	if( hotWords[0] == "" || typeof(hotWords[0]) == "undefined"){
		hotWords[0] = hotWords[0] + "<li class='first'><a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788983716897&orderClick=LAH&Kc='>빌게이츠추천도서</a></li>";
	}else{
		hotWords[0] = hotWords[0] + "<li><a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788983716897&orderClick=LAH&Kc='>빌게이츠추천도서</a></li>";
	}
	if( hotWords[1] == "" || typeof(hotWords[1]) == "undefined"){
		hotWords[1] = hotWords[1] + "<li class='first'><a href='http://www.kyobobook.co.kr/prom/2017/book/170427_secret.jsp?orderClick=LBS'>정촉매 단독판매</a></li>";
	}else{
		hotWords[1] = hotWords[1] + "<li><a href='http://www.kyobobook.co.kr/prom/2017/book/170427_secret.jsp?orderClick=LBS'>정촉매 단독판매</a></li>";
	}
	if( hotWords[0] == "" || typeof(hotWords[0]) == "undefined"){
		hotWords[0] = hotWords[0] + "<li class='first'><a href='http://www.kyobobook.co.kr/prom/2017/pube/05/170517_rich.jsp?orderClick=LBS'>부자언니 유수진</a></li>";
	}else{
		hotWords[0] = hotWords[0] + "<li><a href='http://www.kyobobook.co.kr/prom/2017/pube/05/170517_rich.jsp?orderClick=LBS'>부자언니 유수진</a></li>";
	}
	var rollKeywordRen = 0;
	var rollKeywordIdx = 0;
	var body = "";
	for(i=0;i<5;i++){	
		if(typeof(hotWords[i]) != "undefined"){
			hotWords[i] = '<div id="wordslist' + i + '" style="display:none">' + hotWords[i];
			rollKeywordRen = hotWords[i].length;
			//ren = ren - 2;
			if( rollKeywordRen > 0){
				hotWords[i] = hotWords[i].substring(0, rollKeywordRen);
				hotWords[i] = hotWords[i].replace("undefined", "");
				rollKeywordIdx++;
			}
			hotWords[i] = hotWords[i] + '</div>';
		}
	}
	var nowRollKeywordIdx = Math.floor(Math.random() * rollKeywordIdx);
	document.write("<ul>");
	for(i=0;i<rollKeywordIdx;i++){
		document.write(hotWords[i]);
	}
	var pageDomain = location.href;
	if ( pageDomain.indexOf("https") != -1 ){
		imgUrl = "https://simage.kyobobook.co.kr";
	}else{
		imgUrl = "http://image.kyobobook.co.kr"
	}
	document.write("</ul>");
	document.write("<a href=\"javascript:rollingLeftKeyword();\" class=\"btn01\"><img src=\"" + imgUrl + "/ink/images/gnb/btn_left.gif\" alt=\"이전 키워드 보기\"/></a>");
	document.write("<a href=\"javascript:rollingRightKeyword();\" class=\"btn02\"><img src=\"" + imgUrl + "/ink/images/gnb/btn_right.gif\" alt=\"다음 키워드 보기\"/></a>");
	// 초기 키워드
	document.getElementById("wordslist"+nowRollKeywordIdx).style.display="block";
	function rollingLeftKeyword(){
		document.getElementById("wordslist"+nowRollKeywordIdx).style.display="none";
		var newRollKeyowrdIdx = nowRollKeywordIdx-1;
		if(newRollKeyowrdIdx < 0)
			newRollKeyowrdIdx = rollKeywordIdx-1;
		document.getElementById("wordslist"+newRollKeyowrdIdx).style.display="block";
		nowRollKeywordIdx = newRollKeyowrdIdx;
	}
	function rollingRightKeyword(){
		document.getElementById("wordslist"+nowRollKeywordIdx).style.display="none";
		var newRollKeyowrdIdx = nowRollKeywordIdx+1;
		if(newRollKeyowrdIdx >= rollKeywordIdx)
			newRollKeyowrdIdx = 0;
		document.getElementById("wordslist"+newRollKeyowrdIdx).style.display="block";
		nowRollKeywordIdx = newRollKeyowrdIdx;
	}
</script>

					</div>





				</div>
				<!-- e:.top_header -->





















				<script type="text/javascript">
function getCookieVal (offset) {
        var endstr = document.cookie.indexOf (";", offset);
        if (endstr == -1)
                endstr = document.cookie.length;
        return unescape(document.cookie.substring(offset, endstr));
}

function GetCookie (name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    while (i < clen) {
    var j = i + alen;
        if (document.cookie.substring(i, j) == arg)
            return getCookieVal (j);
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0) break; 
    }
    return null;
}

function noOrderAlert(_linkno) {
	var notice = "";
	var noticenm = "";
	if( _linkno == "CVC" || _linkno == "MNC" ) {
		if  (_linkno == "CVC"){
			noticenm="신한 문화바우처카드는";
		} else if( _linkno == "MNC" ) {
			noticenm="문화누리카드는";
		}
		notice = noticenm  + " 도서, 음반/DVD 상품만 주문하실 수 있습니다. \n\n"
             	+ "<주문제한상품>\n"
             	+ "기프트, 오피스, eBook, 중고장터, 어린이전집, 해외주문도서";
	} else if( _linkno == "CLC"  || _linkno == "BCL" || _linkno == "CCS" ) {
		if  (_linkno == "CLC"){
			noticenm="컬쳐랜드 사이트를";
		} else if( _linkno == "BCL" ) {
			noticenm="비씨 Loun.G 몰을 ";
		} else if( _linkno == "CCS" ) {
			noticenm="씨티카드 몰을";
		}
		notice = noticenm  +" 통해 인터넷교보문고 방문 시, \n"
				+ "아래 상품군은 주문하실 수 없습니다.\n\n"
				+ "<주문제한상품>\n"
				+ "기프트, 오피스, 어린이전집, 중고장터, 해외주문도서";		
	}
	alert(notice);
	return;
}
</script>

				<script type="text/javascript">
var EMCID = "g5hn2dck";
var CARTC = "0";
if(EMCID != null && EMCID != ''){
	CARTC = "0";
}else{
	CARTC = "";
}
if(CARTC == null || CARTC == ''){
	CARTC = "0";
} /*else {
	if (Number(CARTC) > 100) {
		CARTC = "99+";
	}
}
*/
</script>




















				<!-- 플로팅 GNB (아래로 스크롤시 노출) -->
				<div class="sticky_header">
					<div class="sticky_inner">
						<div class="home">
							<a href="http://www.kyobobook.co.kr/index.laf">교보문고 홈</a>
						</div>
						<ul class="user_menu">
							<li class="item_1"><a href="javascript:goMyRoom();">마이룸</a></li>
							<li class="item_2"><a href="javascript:goCart();">장바구니 <small><span><script
												type="text/javascript">document.write(CARTC);</script></span></small></a></li>
							<li class="item_3"><a href="javascript:goSendInquiry();">주문배송</a></li>
							<li class="item_4"><a href="javascript:goCSCenter();">고객센터</a></li>
						</ul>

					</div>
				</div>

				<!-- //플로팅 GNB -->
				<!-- s:.navigation_bar (상단 네비게이션)-->
				<div class="navigation_bar">

					<!-- 주요메뉴 -->
					<ul class="gnb_main add_1">
						<li class="item_1"><a
							href="http://www.kyobobook.co.kr/indexKor.laf?mallGb=KOR&orderClick=c1a"
							class="text">국내도서<span></span></a></li>
						<li class="item_2"><a
							href="http://www.kyobobook.co.kr/indexEng.laf?mallGb=ENG&orderClick=c1b"
							class="text">외국도서<span></span></a></li>
						<li class="item_3 parent">
							<div class="parent_title">
								<a
									href="http://digital.kyobobook.co.kr/digital/ebook/ebookMain.ink?orderClick=c14"
									class="text">eBook<span></span></a>
							</div>
							<ul>
								<li><a
									href="http://digital.kyobobook.co.kr/digital/ebook/ebookMain.ink?tabSrnb=12&orderClick=c1n">일반도서</a></li>
								<li><a
									href="http://digital.kyobobook.co.kr/digital/ebook/ebookMain.ink?tabSrnb=13&orderClick=c1o">로맨스/BL</a></li>
								<li><a
									href="http://digital.kyobobook.co.kr/digital/ebook/ebookMain.ink?tabSrnb=14&orderClick=c1p">판타지/무협</a></li>
								<li><a
									href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubMain.ink?orderClick=c0y">sam</a></li>

								<li><a
									href="http://digital.kyobobook.co.kr/digital/ebook/comixMain.ink?tabSrnb=15&orderClick=ccj">코믹스</a></li>
								<li><a
									href="http://digital.kyobobook.co.kr/digital/article/useScholar.ink?orderClick=c6k">학술논문</a></li>
							</ul>
						</li>
						<li class="item_8"><a href="http://www.tocsoda.co.kr"
							target="_blank" class="text">웹소설<span></span></a></li>
						<li class="item_4 parent">
							<div class="parent_title">
								<a href="http://gift.kyobobook.co.kr/ht/giftMain?orderClick=c15"
									class="text">기프트<span></span></a>
							</div>
							<ul>
								<li><a
									href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000020&orderClick=c5a">디자인문구</a></li>
								<li><a
									href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000022&orderClick=c5c">디지털</a></li>
								<li><a
									href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000025&orderClick=c5x">홈인테리어</a></li>
								<li><a
									href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000006&orderClick=c5h">뷰티</a></li>
							</ul>
						</li>
						<li class="item_5 parent">
							<div class="parent_title">
								<a
									href="http://music.kyobobook.co.kr/ht/recordMain?orderClick=c1c"
									class="text">음반<span></span></a>
							</div>
							<ul>
								<li><a
									href="http://music.kyobobook.co.kr/ht/recordMain?orderClick=c1c">음반</a></li>
								<li><a
									href="http://music.kyobobook.co.kr/ht/dvdMain?orderClick=c1d">DVD</a></li>
								<li><a
									href="http://music.kyobobook.co.kr/ht/record/category/000400?orderClick=cbh">블루레이</a></li>
							</ul>
						</li>
						<li class="item_6"><a
							href="http://used.kyobobook.co.kr/index.ink?orderClick=c19"
							class="text">중고장터<span></span></a>
						<li class="item_7 parent">
							<div class="parent_title">
								<a href="#" class="text">더보기<span></span></a>
							</div>
							<ul>
								<li><a
									href="http://bc.kyobobook.co.kr/front/home/main.ink?orderClick=rvn">북캐스트</a></li>
								<li><a
									href="http://news.kyobobook.co.kr/main.ink?orderClick=rvh">북뉴스</a></li>
								<li><a
									href="http://booklog.kyobobook.co.kr/booklog.do?orderClick=rvg">북로그</a></li>
								<li><a
									href="http://digital.kyobobook.co.kr/digital/vod/vodBmnceo.ink?orderClick=c0E">북모닝CEO</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/culture/cultureMain.laf?orderClick=c0F">문화행사</a></li>
								<!--<li><a href="http://story.kyobobook.co.kr/story/kyoboStoryPlatform.ink?orderClick=c0l" target="_blank">스토리</a></li>-->
								<li><a
									href="http://storynew.kyobobook.co.kr/story/main/initMain.ink?orderClick=c0l"
									target="_blank">스토리</a></li>
							</ul>
						</li>
					</ul>
					<!-- //주요메뉴 -->

					<!-- 보조메뉴 -->
					<ul class="gnb_sub">
						<li><a
							href="http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?orderClick=d79">베스트</a></li>
						<li><a
							href="http://www.kyobobook.co.kr/newproduct/newProductIndexMain.laf?orderClick=d09">신상품</a></li>
						<li><a
							href="http://www.kyobobook.co.kr/event/eventMain.laf?orderClick=rvm">이벤트</a></li>
						<li><a
							href="http://www.kyobobook.co.kr/eventRenewal/eventMainCoupon.laf?orderClick=d7b">쿠폰&middot;혜택</a></li>
						<li><a
							href="http://www.kyobobook.co.kr/prom/2015/general/151028_promotion_gift.jsp?orderClick=c1i">사은품</a></li>
					</ul>
					<!-- //보조메뉴 -->


					<!-- 카테고리 보기 -->
					<div id="gnb_category">
						<a href="#">카테고리 보기</a>
					</div>
					<div class="navigation">
						<div class="navigation_header">
							<h2 class="title">
								메뉴 전체보기<span></span>
							</h2>
							<div class="sitemap">
								<a
									href="http://www.kyobobook.co.kr/contents/sitemap.jsp?orderClick=caA">서비스
									전체보기<span></span>
								</a>
							</div>
							<div class="cover"></div>
						</div>
						<ul class="navigation01">

							<li id="gnb_menu01" class="gnbGroup">
								<div class="navigation_title">
									<a
										href="http://www.kyobobook.co.kr/indexKor.laf?mallGb=KOR&orderClick=c1a">국내도서</a>
								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_3">
										<h3 class="title">
											<a
												href="http://www.kyobobook.co.kr/indexKor.laf?mallGb=KOR&orderClick=cb1">국내도서</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=01&mallGb=KOR&orderClick=daa"><em>소설</em></a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=03&mallGb=KOR&orderClick=dab"><em>시/에세이</em></a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=13&mallGb=KOR&orderClick=dag">경제/경영</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=15&mallGb=KOR&orderClick=dah"><em>자기계발</em></a></li>
											<li class="second"><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=05&mallGb=KOR&orderClick=dac"><em>인문</em></a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=19&mallGb=KOR&orderClick=dad">역사/문화</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=21&mallGb=KOR&orderClick=dae">종교</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=17&mallGb=KOR&orderClick=daf">정치/사회</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=23&mallGb=KOR&orderClick=dap">예술/대중문화</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=29&mallGb=KOR&orderClick=daz">과학</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=26&mallGb=KOR&orderClick=da1">기술/공학</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=33&mallGb=KOR&orderClick=da2">컴퓨터/IT</a></li>
										</ul>
										<ul class="category">
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=41&mallGb=KOR&orderClick=dai">유아(0~7세)</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=42&mallGb=KOR&orderClick=daj"><em>어린이(초등)</em></a></li>
											<li><a id="kids_complete"
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=51&mallGb=KOR&orderClick=dal">어린이전집</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=45&mallGb=KOR&orderClick=dak">어린이영어</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=38&mallGb=KOR&orderClick=dao">청소년</a></li>
											<li class="second"><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=39&mallGb=KOR&orderClick=dam">초등참고서</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=25&mallGb=KOR&orderClick=dan"><em>중/고등참고서</em></a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=50&mallGb=KOR&orderClick=da5">대학교재</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=31&mallGb=KOR&orderClick=da3"><em>취업/수험서</em></a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=27&mallGb=KOR&orderClick=dax">외국어</a></li>
										</ul>
										<ul class="category">
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=07&mallGb=KOR&orderClick=das">가정/육아</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=09&mallGb=KOR&orderClick=dav">건강</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=32&mallGb=KOR&orderClick=daq">여행</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=08&mallGb=KOR&orderClick=dat">요리</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=11&mallGb=KOR&orderClick=dar">취미/실용/스포츠</a></li>
											<li class="second"><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=35&mallGb=KOR&orderClick=dau">잡지</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=47&mallGb=KOR&orderClick=daw">만화</a></li>
											<li class="second"><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=53&mallGb=KOR&orderClick=da6">한국소개도서</a></li>
										</ul>
										<div class="btn_more">
											<a
												href="http://www.kyobobook.co.kr/indexKor.laf?mallGb=KOR&orderClick=cb1">전체보기</a>
										</div>
									</div>
									<div class="column_1">
										<h3 class="title">스페셜 코너</h3>
										<ul class="category">
											<li><a
												href="http://www.kyobobook.co.kr/todaybook/newTodaybook.laf?category=KOR&orderClick=d27">오늘의
													책</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/prom/2017/general/monthlybook.jsp?orderClick=sdb">이달의
													책</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/booktrend/booktrendMain.laf?orderClick=JA1">출간예정캘린더</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/reprice/repriceList.laf?orderClick=cdp">정가인하</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/specialPrice/specialPriceKorBookList.laf?orderClick=cdq">특가도서</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/recommpage/recommBookMain.laf?orderClick=cay">추천도서</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/thisbook/thisbook.laf?orderClick=cax">이럴
													땐 이런 책</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/kiwimom/KiwimomMain.laf?orderClick=d28">키위맘</a></li>
											<!--
							<li class="second"><a href="http://www.kyobobook.co.kr/prom/2016/general/160808_k_collection.jsp?orderClick=ccl"><em>:K컬렉션</em></a></a></li>
							<li><a href="http://www.kyobobook.co.kr/prom/2015/general/151028_promotion_gift.jsp?orderClick=ccg">사은품</a></li>
							<li><a href="http://www.kyobobook.co.kr/prom/2015/book/wallpaper.jsp?orderClick=cce">월페이퍼</a></li>
							<li><a href="http://www.kyobobook.co.kr/previewzone/previewzoneMain.laf?orderClick=c8s">Preview Zone</a></li>
-->
										</ul>
									</div>
								</div>
							</li>

							<li id="gnb_menu02" class="gnbGroup">
								<div class="navigation_title">
									<a
										href="http://www.kyobobook.co.kr/indexEng.laf?mallGb=ENG&orderClick=c1b">외국도서</a>
								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_3">
										<h3 class="title">
											<a
												href="http://www.kyobobook.co.kr/indexEng.laf?mallGb=ENG&orderClick=c34">외국도서</a>
										</h3>
										<ul class="category">
											<li><h4>
													<a
														href="http://www.kyobobook.co.kr/indexEng.laf?mallGb=ENG&orderClick=c35">영미도서</a>
												</h4></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=01&mallGb=ENG&orderClick=xaa">문학</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=09&mallGb=ENG&orderClick=xae">인문/사회</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=11&mallGb=ENG&orderClick=xaf">경제/경영</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=13&mallGb=ENG&orderClick=xag">과학/기술</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=03&mallGb=ENG&orderClick=xab">취미/실용/여행</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=81&mallGb=ENG&orderClick=xai">ELT/어학/사전</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=93&mallGb=ENG& orderClick=xaj">교재</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=05&mallGb=ENG&orderClick=xac">생활/요리/건강</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=07&mallGb=ENG&orderClick=xad">예술/건축</a></li>
										</ul>
										<ul class="category">
											<li><h4>
													<a
														href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=45&mallGb=KOR&orderClick=xah
							">어린이영어</a>
												</h4></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4501&mallGb=KOR&orderClick=c37">유아영어</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4506&mallGb=KOR&orderClick=c38">영역별영어학습</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4508&mallGb=KOR&orderClick=c39">코스북</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4509&mallGb=KOR&orderClick=c3b">영어동화/그림책</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4513&mallGb=KOR&orderClick=c3a">미국교과서</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4520&mallGb=KOR&orderClick=c3c">어린이중국어</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4523&mallGb=KOR&orderClick=c3d">어린이일본어</a></li>
										</ul>
										<ul class="category">
											<li><h4>
													<a
														href="http://www.kyobobook.co.kr/indexJap.laf?orderClick=c36">일본도서</a>
												</h4></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=41&mallGb=JAP&orderClick=rDq">잡지</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=57&mallGb=JAP&orderClick=rDv">실용서/예술</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=45&mallGb=JAP&orderClick=rDp">만화/애니</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=47&mallGb=JAP&orderClick=rDx">문학</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=51&mallGb=JAP&orderClick=rDt">문고</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=49&mallGb=JAP&orderClick=rDy">라이트노벨</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=63&mallGb=JAP&orderClick=rDr">어학/학습</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=43&mallGb=JAP&orderClick=rDs">엔터테인먼트</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=55&mallGb=JAP&orderClick=rDa">아동</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=59&mallGb=JAP&orderClick=rDw">인문/사회</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=61&mallGb=JAP&orderClick=rDz">자연/기술과학</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/category/categoryEng.laf?linkClass=53&mallGb=JAP&orderClick=rDu">신서</a></li>
										</ul>
										<div class="btn_more">
											<a
												href="http://www.kyobobook.co.kr/indexEng.laf?mallGb=ENG&orderClick=c34">전체보기</a>
										</div>
									</div>
									<div class="column_1">
										<h3 class="title">스페셜 코너</h3>
										<ul class="category">
											<li><a
												href="http://www.kyobobook.co.kr/bestseller/bestSeller.laf?orderClick=Dbe&mallGb=ENG&range=0&kind=0&orderClick=c67">베스트셀러</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/newproduct/newTopicEngList.laf?mallGb=ENG&ejkGb=ENG&orderClick=c68">새로나온책</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/event/eventEngViewByPid.laf?classGb=JAP&eventPid=52&orderClick=c6a">일본신간잡지</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/event/eventEngViewByPid.laf?classGb=JAP&eventPid=2959&orderClick=XXA">일본잡지
													정기구독</a></li>
											<!--
							<li class="second"><a href="http://www.kyobobook.co.kr/booklog/reviewListMain.laf?mallGb=ENG&orderClick=rqd">리뷰&amp;리스트</a></li>
							<li><a href="http://www.kyobobook.co.kr/event/eventEngMain.laf?orderClick=rqe&linkClass=all&orderClick=rqe">이벤트 마당</a></li>
-->
										</ul>
									</div>
								</div>
							</li>

							<li id="gnb_menu03" class="gnbGroup">
								<div class="navigation_title">
									<a
										href="http://digital.kyobobook.co.kr/digital/ebook/ebookMain.ink?orderClick=c14">eBook</a>
								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_3">
										<h3 class="title linked">
											<a
												href="http://digital.kyobobook.co.kr/kyobobook/main.jsp?orderClick=c3g">eBook</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=06&orderClick=c3h"><em>소설</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=02&orderClick=c3n"><em>경제/경영</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=04&orderClick=c3k"><em>자기계발</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=10&orderClick=c3l"><em>시/에세이</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=12&orderClick=c3m">인문</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=14&orderClick=c3n">국어/외국어</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=19&orderClick=c3o">역사/풍속/신화</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=16&orderClick=c3p">사회/정치/법</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=28&orderClick=c3q">가정/생활/요리</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=30&orderClick=c44">여행/취미</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=26&orderClick=c3s">건강/의학</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=35&orderClick=c3t">종교/역학</a></li>
										</ul>
										<ul class="category">
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=08&orderClick=c3i">장르소설</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=52&orderClick=c45">외국도서</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=47&orderClick=c3u"><em>코믹스</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=42&orderClick=c3v">아동</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=41&orderClick=c8e">유아</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=31&orderClick=c3w">예술/대중문화</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=36&orderClick=c3x">교재/수험서</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=38&orderClick=c3y">청소년교양</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=22&orderClick=c3z">자연과학/공학</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=24&orderClick=c41">컴퓨터/인터넷</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=34&orderClick=c42">매거진</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=55&orderClick=c9l">북모닝CEO</a></li>
										</ul>
										<ul class="category">
											<li><a
												href="http://digital.kyobobook.co.kr/digital/publicview/publicViewBest.ink?orderClick=c8m"><em>베스트</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/publicview/publicViewNew.ink?orderClick=c6q"><em>신간</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/publicview/publicViewFree.ink?orderClick=c6s"><em>무료</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/publicview/publicViewMDRecommend.ink?orderClick=c6p"><em>추천</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/eventTemplet/eventTempletMain.ink?tmplSeq=5237&orderClick=c6t"><em>eBook+</em></a></li>
											<!-- <li><a href="http://digital.kyobobook.co.kr/digital/event/eventMainHtml.ink?tmplSeq=41&orderClick=c6t"><em>eBook+</em></a></li> -->
										</ul>
										<!-- <div class="btn_more"><a href="http://digital.kyobobook.co.kr/kyobobook/main.jsp?orderClick=c3g">전체보기</a></div> -->
									</div>
									<div class="column_1">
										<h3 class="title">서비스 안내</h3>
										<ul class="category">
											<li><a
												href="http://image.kyobobook.co.kr/dwas/images/guide/ebook_how/ebook_how.html?orderClick=c71"
												onclick="window.open(this.href,'lguplus','scrollbars=yes,width=900,height=650');return false;">eBook은
													어떻게 읽나요?</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/event/eventMain.ink?eventId=201508181&orderClick=c72">eBook은
													어떻게 듣나요?</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/guide/guideMain.ink?guidePage=guide01&guide_menuNo=1&orderClick=c6x">eBook
													처음 만나기</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/guide/guideMain.ink?guidePage=guide01&guide_menuNo=1&orderClick=c6x">eBook
													뷰어설치</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ecash/ecashMain.ink?orderClick=c9k"><em>교보e캐시
														충전</em> <img
													src="http://image.kyobobook.co.kr/ink/images/welcome/icon_new02.gif"
													alt="new" class="icon_new" /></a></li>
											<li><a
												href="http://www.kyobobook.co.kr/prom/2014/ebook/story.jsp?orderClick=c6j">디키스토리
													출간 안내</a></li>
											<li class="second"><a
												href="http://sam.kyobobook.co.kr/sbweb/eFeelog/eFeelogMain.ink?orderClick=c6h"><em>독서노트
														eFeelog</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/article/articleMain.ink?selectedLargeCategory=006&orderClick=c6k">학술논문</a></li>
											<li><a
												href="http://pubple.kyobobook.co.kr?orderClick=c6w">개인출판
													PubPle</a></li>
										</ul>
									</div>
								</div>
							</li>

							<li id="gnb_menu04" class="gnbGroup">
								<div class="navigation_title">
									<a
										href="http://digital.kyobobook.co.kr/digital/ebook/ebookMain.ink?tabSrnb=14&orderClick=cc1">장르</a>
									&middot; <a
										href="http://digital.kyobobook.co.kr/digital/ebook/comixMain.ink?tabSrnb=15&orderClick=ccj">코믹스</a>
									<!-- &middot;
					<a href="http://www.tocsoda.co.kr/mainView" target="_blank">웹소설</a> -->

								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_1">
										<h3 class="title linked">
											<a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=08&orderClick=cc1">장르</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=08&selectedSmallCategory=0801&orderClick=cc2"><em>로맨스</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=08&selectedSmallCategory=0805&&orderClick=cc4"><em>판타지</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=08&selectedSmallCategory=0803&orderClick=cc3"><em>무협</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=08&selectedSmallCategory=0821&orderClick=cc6">라이트노벨</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=08&selectedSmallCategory=0823&orderClick=cc9">BL/GL</a></li>
										</ul>
									</div>
									<div class="column_1">
										<h3 class="title linked">
											<a
												href="http://digital.kyobobook.co.kr/digital/ebook/comixMain.ink?tabSrnb=15&orderClick=ce1">코믹스
												<img
												src="http://image.kyobobook.co.kr/ink/images/welcome/icon_new02.gif"
												alt="new" />
											</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://digital.kyobobook.co.kr/digital/division/divMain.ink"><em>연재</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/eventTemplet/eventTempletMain.ink?tmplSeq=4757&orderClick=ce2"><em>고화질만화</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=47&tabCd=00005&orderClick=ce3"><em>무료만화</em></a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=47&selectedSmallCategory=4701&orderClick=ce4">교양만화</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=47&selectedSmallCategory=4711&orderClick=ce5">순정만화</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=47&selectedSmallCategory=4721&orderClick=ce6">학원만화</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=47&selectedSmallCategory=4707&orderClick=ce7">드라마</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=47&selectedSmallCategory=4709&orderClick=ce8">성인만화</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=47&selectedSmallCategory=4723&orderClick=ce9">BL만화</a></li>
										</ul>
										<!-- <div class="btn_more"><a href="http://digital.kyobobook.co.kr/digital/ebook/ebookList.ink?selectedLargeCategory=001&selectedMiddleCategory=08&orderClick=cc1">전체보기</a></div> -->
									</div>
									<!-- <div class="column_1">
						<h3 class="title linked"><a href="http://www.tocsoda.co.kr/mainView" target="_blank">웹소설 <img src="http://image.kyobobook.co.kr/ink/images/welcome/icon_new02.gif" alt="new" /></a></h3>
						<ul class="category">
							<li><a href="http://www.tocsoda.co.kr/subMainView/01" target="_blank">로맨스/BL</a></li>
							<li><a href="http://www.tocsoda.co.kr/subMainView/02" target="_blank">판타지/무협</a></li>
							<li><a href="http://www.tocsoda.co.kr/subMainView/03" target="_blank">추리/기타</a></li>
						</ul>
					</div> -->

								</div>
							</li>

							<li id="gnb_menu05" class="gnbGroup">
								<div class="navigation_title">
									<a
										href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubMain.ink?orderClick=c0y">sam</a>
								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_1">
										<h3 class="title linked">
											<a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubMain.ink?orderClick=cb4">sam</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedMiddleCategory=06&orderClick=ca2"><em>소설</em></a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedLargeCategory=001&selectedMiddleCategory=04&orderClick=caB">자기계발</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedMiddleCategory=12&orderClick=ca1"><em>인문</em></a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedLargeCategory=001&selectedMiddleCategory=02&orderClick=caC">경제/경영</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedMiddleCategory=10&orderClick=ca3"><em>시/에세이</em></a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedMiddleCategory=30&orderClick=ca4">여행/취미</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedMiddleCategory=19&orderClick=ca5">역사/풍속/신화</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedMiddleCategory=16&orderClick=ca6">사회/정치/법</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedMiddleCategory=22&orderClick=ca7">자연과학/공학</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedMiddleCategory=28&orderClick=ca8">가족/생활/요리</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubList.ink?selectedLargeCategory=001&selectedMiddleCategory=14&orderClick=caD">국어/외국어</a></li>
										</ul>
										<!-- <div class="btn_more"><a href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubMain.ink">전체보기</a></div> -->
									</div>
									<div class="column_1">
										<h3 class="title">스페셜 코너</h3>
										<ul class="category">
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubGuide.ink?guideCd=1&orderClick=c96"><em>처음
														만나는 sam</em></a></li>
											<li><a
												href="https://sam.kyobobook.co.kr/sbweb/payment/useBuyMain.ink?orderClick=c9a"><em>이용권
														구매</em></a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/samclub/samclubMain.ink?orderClick=c95#content_r"><em>퐁당sam</em></a></li>
											<!-- <li><a href="http://sam.kyobobook.co.kr/sbweb/recommend/recommendMain.ink?orderClick=c94">추천</a></li> -->
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/recommend/recommendMain.ink?themeTypeSeq=1&orderClick=c93">명사추천</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/recommend/recommendMain.ink?themeTypeSeq=2&orderClick=caE">에디터추천</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/recommend/recommendMain.ink?themeTypeSeq=3&orderClick=caF">MD추천</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/best/bestMain.ink?orderClick=c92">베스트</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/newly/newlyMain.ink?orderClick=c93">신간</a></li>
											<li><a
												href="http://sam.kyobobook.co.kr/sbweb/recommend/recommendMain.ink?themeTypeSeq=0&orderClick=c94">오늘의
													sam</a></li>
										</ul>
									</div>
								</div>
							</li>

							<li id="gnb_menu06" class="gnbGroup">
								<div class="navigation_title">
									<a
										href="http://gift.kyobobook.co.kr/ht/giftMain?orderClick=c15"
										id="gift_navigation">기프트</a>
									<!--
					<a href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000022&orderClick=c5c">디지털</a>
					<a href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000006&orderClick=c5h">뷰티</a>
					<a href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000020&orderClick=c5a">디자인문구</a>
					<a href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000025&orderClick=c5x">홈인테리어</a>
-->
								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_1">
										<h3 class="title linked">
											<a
												href="http://gift.kyobobook.co.kr/ht/giftMain?orderClick=c8j"
												class="">기프트</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000007&orderClick=c5b">고급필기구</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000021&orderClick=c5l">오피스</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000018&orderClick=c5i">화방</a></li>
											<li class="second"><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000024&orderClick=c5f">가구</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000026&orderClick=c5y">키친/푸드</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000029&orderClick=c5g">베이비/키즈</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000027&orderClick=c5z">여행/레저</a></li>
											<li class="second"><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000028&orderClick=c5h">패션</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000023&orderClick=c5d">키덜트</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000008&orderClick=c5k">독서용품</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000030&orderClick=c5j">PET</a></li>
										</ul>
									</div>
									<div class="column_1">
										<h3 class="title linked">
											<a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000022&orderClick=c5c">디지털</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002210&orderClick=cd1">USB/메모리/외장하드</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002211&orderClick=cd2">USB선풍기.소형가전</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002200&orderClick=cd3">애플케이스/보호필름</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002203&orderClick=cd4">스마트
													주변기기</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002212&orderClick=cd5">블루투스/헤드폰/이어폰</a></li>
										</ul>
										<h3 class="title linked second">
											<a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000006&orderClick=c5h">뷰티</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00000615&orderClick=cd6">향수</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00000611&orderClick=cd7">스킨케어</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00000612&orderClick=cd8">바디케어/디자인</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00000613&orderClick=cd9">다이어트/헬스</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00000614&orderClick=cda">헤어케어/스타일링</a></li>
										</ul>
									</div>
									<div class="column_1">
										<h3 class="title linked">
											<a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000020&orderClick=c5a">디자인문구</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002000&orderClick=cdb">다이어리/스케줄러</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002004&orderClick=cdc">비즈니스플래너/노트</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002011&orderClick=cdd">캘린더/만년</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002003&orderClick=cde">필기구</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002006&orderClick=cdf">필통/파우치</a></li>
										</ul>
										<h3 class="title linked second">
											<a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategoryMain?ctgrId=000025&orderClick=c5x">홈인테리어</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002500&orderClick=cdg">조명</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002502&orderClick=cdh">침구</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002507&orderClick=cdi">홈케어</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002505&orderClick=cdj">패브릭</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/gift/giftCategorySub?ctgrId=00002501&orderClick=cdk">데코/소품</a></li>
										</ul>
									</div>
									<div class="column_1">
										<h3 class="title">스페셜코너</h3>
										<ul class="category">
											<li><a
												href="http://gift.kyobobook.co.kr/ht/hot/eventDetail?eventId=30557&oderClick=c7u">오늘의
													핫딜</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/hot/hotAwardPage?displayId=RANK_POPUL&categoryId=0000&orderClick=c7q">베스트</a></li>
											<li><a
												href="http://gift.kyobobook.co.kr/ht/hot/eventMain?orderClick=c7g">이벤트</a></li>
										</ul>
										<div class="add_url">
											<a
												href="http://www.kyobobook.co.kr/event/dreamCard.laf?orderClick=cdl"
												target="_blank">고마운 마음을 선물하는 <em>교보문고상품권드림카드</em></a>
										</div>
									</div>
								</div>
							</li>

							<li id="gnb_menu07" class="gnbGroup">
								<div class="navigation_title">
									<a
										href="http://music.kyobobook.co.kr/ht/recordMain?orderClick=c1c">음반</a>
									&middot; <a
										href="http://music.kyobobook.co.kr/ht/dvdMain?orderClick=c1d">DVD</a>
								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_1">
										<h3 class="title">
											<a
												href="http://music.kyobobook.co.kr/ht/recordMain?orderClick=cb6">음반</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/000300?orderClick=c46"><em>가요</em></a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/000308?orderClick=c4e"><em>클래식</em></a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/000301?orderClick=c47"><em>팝</em></a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/000302?orderClick=c48">락</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/000303?orderClick=c49">재즈</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/000305?orderClick=c4b">O.S.T/뮤지컬</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/000304?orderClick=c4a">일본음악</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/000310?orderClick=c4g">유아/아동</a></li>
										</ul>
										<div class="btn_more">
											<a
												href="http://music.kyobobook.co.kr/ht/recordMain?orderClick=cb6">전체보기</a>
										</div>
									</div>
									<div class="column_2">
										<h3 class="title">
											<a
												href="http://music.kyobobook.co.kr/ht/dvdMain?orderClick=cb7">DVD</a>
										</h3>
										<ul class="category">
											<li><h4>
													<a
														href="http://music.kyobobook.co.kr/ht/record/category/000400?orderClick=cc2">블루레이</a>
												</h4></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/00040000?orderClick=c4m">드라마/로맨스</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/00040001?orderClick=c4n">애니메이션</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/00040009?orderClick=c4v">MUSIC
													BLU-RAY</a></li>
										</ul>
										<ul class="category">
											<li><h4>
													<a
														href="http://music.kyobobook.co.kr/ht/record/category/000401?orderClick=cb7">DVD</a>
												</h4></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/00040100?orderClick=c4x">드라마/로맨스</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/00040101?orderClick=c4y">애니메이션</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/category/00040108?orderClick=c56">MUSIC
													DVD</a></li>
										</ul>
										<div class="btn_more">
											<a
												href="http://music.kyobobook.co.kr/ht/dvdMain?orderClick=cb7">전체보기</a>
										</div>
									</div>
									<div class="column_1">
										<h3 class="title">스페셜 코너</h3>
										<ul class="category">
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/reserve/0003?orderClick=rsc">예약음반</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/reserve/000400?orderClick=rte">예약BLU-RAY/DVD</a></li>
											<li><a
												href="http://music.kyobobook.co.kr/ht/record/newRecord/0003?orderClick=rsb">새로나온음반</a></li>
										</ul>
									</div>
								</div>
							</li>

							<li id="gnb_menu08" class="gnbGroup">
								<div class="navigation_title">
									<a href="http://used.kyobobook.co.kr/index.ink?orderClick=c19">중고장터</a>
								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_1">
										<h3 class="title">
											<a
												href="http://used.kyobobook.co.kr/index.ink?orderClick=cb8">중고장터</a>
										</h3>
										<ul class="category">
											<li><h4>
													<a
														href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=01&orderClick=ca9">중고도서</a>
												</h4></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0101&orderClick=caa">소설</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0103&orderClick=cab">시/에세이</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0113&orderClick=cac">경제/경영</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0115&orderClick=cad">자기계발</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0105&orderClick=cae">인문</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0117&orderClick=caf">정치/사회</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0126&orderClick=cag">기술/공학</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0133&orderClick=cah">컴퓨터/IT</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0142&orderClick=cai">아동</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0125&orderClick=caj">중/고등학습</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0127&orderClick=cak">외국어</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=0131&orderClick=cal">취업/수험서</a></li>

											<li class="second"><h4>
													<a
														href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=02&orderClick=cam">중고음반</a>
												</h4></li>
											<li><h4>
													<a
														href="http://used.kyobobook.co.kr/productList/viewProductList.ink?ctgrCode=03&orderClick=can">중고DVD</a>
												</h4></li>
										</ul>
										<div class="btn_more">
											<a
												href="http://used.kyobobook.co.kr/index.ink?orderClick=cb8">전체보기</a>
										</div>
									</div>
									<div class="column_1">
										<h3 class="title">스페셜 코너</h3>
										<ul class="category">
											<li><a
												href="http://used.kyobobook.co.kr/common/sellerCheckGoMain.ink?orderClick=c8b">판매자
													페이지</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/guide/saleInfo.ink?orderClick=c89">중고책
													판매방법</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/guide/buyInfo.ink?orderClick=c8a">중고책
													구매방법</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/myRoom/myOrderListForMain.ink?orderClick=c8c">구매상품
													배송조회</a></li>
											<li><a
												href="http://used.kyobobook.co.kr/product/smartGuide.ink?orderClick=c8u">스마트
													비교서비스</a></li>
										</ul>
									</div>
								</div>
							</li>

							<li id="gnb_menu09" class="gnbGroup">
								<div class="navigation_title">
									<a href="#">ONLY 교보문고</a>
								</div>
								<div class="navigation_layer" style="display: none;">
									<div class="column_1">
										<h3 class="title">추천</h3>
										<ul class="category">
											<li><a
												href="http://www.kyobobook.co.kr/todaybook/newTodaybook.laf?category=KOR&orderClick=d27">오늘의
													책</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/prom/2017/general/monthlybook.jsp?orderClick=sdb">이달의
													책</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/prom/2016/book/select_k_vol5.jsp?orderClick=c1k"
												target="_blank"><em>편집샵:K</em> <img
													src="http://image.kyobobook.co.kr/ink/images/welcome/icon_new02.gif"
													alt="new" class="icon_new" /></a></li>
											<li><a
												href="http://www.kyobobook.co.kr/thisbook/thisbook.laf?orderClick=c64">이럴
													땐 이런 책</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/kiwimom/KiwimomMain.laf?orderClick=d28">키위맘</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/recommpage/recommBookMain.laf?orderClick=cay">추천도서</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/booknFlower/BooknFlower.laf?orderClick=ccd">책
													그리고 꽃</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/readIT/readITColumnList.laf?orderClick=c8w">READ
													IT</a></li>
										</ul>
									</div>
									<div class="column_1">
										<h3 class="title">컨텐츠</h3>
										<ul class="category">
											<li><a
												href="http://bc.kyobobook.co.kr/front/home/main.ink?orderClick=c64">북캐스트</a></li>
											<li><a
												href="http://news.kyobobook.co.kr/main.ink?orderClick=rvh">북뉴스</a></li>
											<li><a
												href="http://booklog.kyobobook.co.kr/booklog.do?orderClick=rvg">북로그</a></li>
											<li><a
												href="http://digital.kyobobook.co.kr/digital/vod/vodBmnceo.ink?orderClick=c0E">북모닝CEO</a></li>
										</ul>
										<h3 class="title second">강연</h3>
										<ul class="category">
											<!--
							<li><a href="http://www.kyobobook.co.kr/prom/2017/book/170124_SchoolOfLife.jsp?orderClick=c1k"><em>365 인생학교</em> <img src="http://image.kyobobook.co.kr/ink/images/welcome/icon_new02.gif" alt="new" class="icon_new" /></a></li>
-->
											<li><a
												href="http://www.kyobobook.co.kr/eventRenewal/eventMain.laf?classGb_CUL=on&classGbType=CUL&linkClass=001&orderClick=c1k"><em>365
														인생학교</em> <img
													src="http://image.kyobobook.co.kr/ink/images/welcome/icon_new02.gif"
													alt="new" class="icon_new" /></a></li>
											<li><a
												href="http://www.kyobobook.co.kr/prom/2017/general/big10_main.jsp?orderClick=c66">명강의
													Big10</a></li>
											<!--
							<li><a href="http://www.kyobobook.co.kr/prom/2017/pube/02/170203_en.jsp?orderClick=c65">원데이 살롱</a></li>
-->
											<li><a
												href="http://www.kyobobook.co.kr/eventRenewal/eventMain.laf?classGb_CUL=on&classGbType=CUL&linkClass=003&orderClick=c65">원데이
													살롱</a></li>
										</ul>

										<!-- 17-02-07 -->
										<h3 class="title second">
											<a
												href="http://storynew.kyobobook.co.kr/story/main/initMain.ink?orderClick=C6B"
												target="_blank">스토리</a>
										</h3>
										<ul class="category">
											<li><a
												href="http://storynew.kyobobook.co.kr/story/up/initStoryUpMain.ink?orderClick=C6C"
												target="_blank">스토리업</a></li>
											<li><a
												href="https://storynew.kyobobook.co.kr/smkt/login/initStorySmktLogin.ink?orderClick=C6D"
												target="_blank">스토리마켓</a></li>
											<li><a
												href="http://storynew.kyobobook.co.kr/story/tv/initStoryTvMain.ink?orderClick=C6E"
												target="_blank">스토리TV</a></li>
										</ul>
										<!-- //17-02-07 -->


									</div>
									<div class="column_1">
										<h3 class="title">스페셜 코너</h3>
										<ul class="category">
											<!--
							<li><a href="http://www.kyobobook.co.kr/prom/2016/general/160808_k_collection.jsp?orderClick=c1m">K컬렉션</a></li>
-->
											<li><a
												href="http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?linkClass=55&mallGb=KOR&orderClick=c1m">K컬렉션</a></li>


											<li><a
												href="http://www.kyobobook.co.kr/culture/cultureMain.laf?orderClick=c0F">문화행사</a></li>
											<li><a
												href="http://pubple.kyobobook.co.kr/?orderClick=c6l">퍼플</a></li>
											<!--
							<li><a href="http://story.kyobobook.co.kr/story/kyoboStoryPlatform.ink?orderClick=cdm" target="_blank">스토리 공모</a></li>
-->
											<li><a
												href="http://www.kyoboreadingtree.com/?orderClick=cdn"
												target="_blank">리딩트리</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/prom/2013/book/130827_purchase.jsp?Kc=WHBLETcustomerservic&orderClick=cdo">대량구매
													서비스</a></li>
											<li><a href="http://report.kyobobook.co.kr/">문서검색</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/directbook/directbook.laf?category=2&linkClass=01&orderClick=c8o">바로드림전용상품</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/reprice/repriceList.laf?orderClick=cdp">정가인하</a></li>
											<li><a
												href="http://www.kyobobook.co.kr/specialPrice/specialPriceKorBookList.laf?orderClick=cdq">특가도서</a></li>
											<li><a
												href="http://pod.kyobobook.co.kr/index.ink?orderClick=c6A">도서주문판매POD</a></li>
										</ul>
									</div>
									<!--
					<div class="column_1">
						<h3 class="title">문서검색</h3>
						<ul class="category">
							<li><a href="http://report.kyobobook.co.kr/main/?rbc1=1&orderClick=cap">리포트</a></li>
							<li><a href="http://report.kyobobook.co.kr/main/?rbc1=2&orderClick=caq">논문</a></li>
							<li><a href="http://report.kyobobook.co.kr/main/?rbc1=3&orderClick=car">서식</a></li>
							<li><a href="http://report.kyobobook.co.kr/main/?rbc1=8">이력서</a></li>
							<li><a href="http://report.kyobobook.co.kr/main/?rbc1=5&orderClick=cas">자기소개서</a></li>
							<li><a href="http://report.kyobobook.co.kr/main/?rbc1=6&orderClick=cat">시험자료</a></li>
							<li><a href="http://report.kyobobook.co.kr/main/?rbc1=9&orderClick=cau">표지/속지</a></li>
							<li><a href="http://report.kyobobook.co.kr/main/?rbc1=10&orderClick=cav">PPT양식</a></li>
						</ul>
						<div class="btn_more"><a href="http://report.kyobobook.co.kr?orderClick=cao">전체보기</a></div>
					</div>
					<div class="column_1">
						<h3 class="title">스페셜 코너</h3>
						<ul class="category">
							<li class="second"><h4>문서검색</h4></li>
							<li><a href="http://report.kyobobook.co.kr/helpdesk/?orderClick=caz">이용안내</a></li>
						</ul>
					</div>
-->
								</div>
							</li>
						</ul>
						<!-- .navigation01 -->
					</div>
					<!-- .navigation -->
					<!-- //카테고리 보기 -->
					<!-- e:.navigation -->
				</div>
				<!-- e:.navigation_bar (상단 네비게이션)-->


				<!-- (관리도구)우측 대형 배너 -->
				<!-- *** s:(자동화)Ribbon배너 *** -->
				<!-- #####wel_BigBanner_START##### -->

				<!-- *** //e:(자동화)Ribbon배너 *** -->
				<!-- //우측 대형 배너 -->

				<!-- (관리도구)좌측 날개 배너 -->
				<div id="wing_ad">
					<div class="wing_content">

						<!-- 프리미엄 좌상단배너 -->

						<div class="wing_banner">
							<script type="text/javascript"
								src="http://imac.kyobobook.co.kr/js/INK/ink_wel_2016/ink_wel_2016@wel_03"></script>
						</div>

						<!-- *** s:(자동화)Ribbon배너 *** -->
						<!-- #####wel_LeftBanner_START##### -->
						<div class="wing_banner">
							<a
								href="http://www.kyobobook.co.kr/prom/2017/general/170428_omni.jsp?orderClick=dov"><img
								src="https://simage.kyobobook.co.kr/ink/images/prom/2017/book/170428_omnizone/bnV_w04.png"
								alt="옴니존 IN:K 합정 오픈" /></a>
						</div>
						<div class="wing_banner">
							<a
								href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32583&classGb=KOR&PRE=Y&orderClick=dou"><img
								src="https://simage.kyobobook.co.kr/ink/images/prom/2017/banner/170424/bnV_w04.png"
								alt="2017 손글쓰기문화확산 캠페인" /></a>
						</div>
						<div class="wing_banner">
							<a
								href="http://www.kyobobook.co.kr/prom/2017/general/170428_mayContest.jsp?"><img
								src="https://simage.kyobobook.co.kr/dwas/images/prom/banner/2017/04/28/bnS_ink_pc_83x118.jpg"
								alt="스토리X동화 공모전open" /></a>
						</div>

						<!-- *** //e:(자동화)Ribbon배너 *** -->


						<!-- *** s:(자동화) *** -->
						<!-- #####wel_LeftBottomBanner_START##### -->
						<!-- #####wel_LeftBottomBanner_START##### -->
						<div class="wing_banner_2" id="wing_banner">
							<ul>
								<li style="display: none;"><a
									href="http://www.kyobobook.co.kr/culture/cultureClassicDetail.laf?serviceGb=HUM&serviceCd=59&orderClick=zbu"><img
										src="https://simage.kyobobook.co.kr/ink/images/prom/2017/banner/170512/bn_03.jpg"
										alt="[길 위의 인문학] 김탁환 작가와 외국인 마을을 걷다" /></a></li>
								<li><a
									href="http://www.kyobobook.co.kr/prom/2017/general/170417_handwriting.jsp?orderClick=zbu"><img
										src="https://simage.kyobobook.co.kr/ink/images/prom/2017/banner/170424/bnV_w04.png"
										alt="제3회 교보손글쓰기대회" /></a></li>
								<li><a
									href="http://www.kyobobook.co.kr/culture/cultureClassicDetail.laf?serviceGb=KAS&serviceCd=15&orderClick=zbu"><img
										src="https://simage.kyobobook.co.kr/ink/images/prom/2017/banner/170330/bn_01.jpg"
										alt="[교보아트스페이스] 4-5월 기획전 &#034;색色 피어 오르다&#034;" /></a></li>
								<li><a href="http://seoulforum.org/2017/?orderClick=zbu"
									target="_blank"><img
										src="https://simage.kyobobook.co.kr/ink/images/prom/2017/banner/170508/bn03.jpg"
										alt="2017 SIFL 서울국제문학포럼" /></a></li>
							</ul>
							<button type="button" class="btn_prev">이전 내용</button>
							<button type="button" class="btn_next">다음 내용</button>
						</div>
						<script type="text/javascript">
(function($){
	var total = $('.wing_banner_2 li').size();
	var random = Math.floor(Math.random() * total);
	$('.wing_banner_2 li').hide().eq(random).show();
	$('.wing_banner_2 .btn_next').click(function(e){
		e.preventDefault();
		if ( $('.wing_banner_2 li:visible').next().size() ){
			$('.wing_banner_2 li:visible').hide().next().show();
		} else {
			$('.wing_banner_2 li').hide().filter(':first').show();
		}
	});
	$('.wing_banner_2 .btn_prev').click(function(e){
		e.preventDefault();
		if ( $('.wing_banner_2 li:visible').prev().size() ){
			$('.wing_banner_2 li:visible').hide().prev().show();
		} else {
			$('.wing_banner_2 li').hide().filter(':last').show();
		}
	});
})(jQuery);
</script>
						<!-- //좌측 날개 배너 -->

						<!-- #####wel_LeftBottomBanner_END##### -->
						<!-- *** //e:(자동화)좌측 문화행사 배너 *** -->

						<div class="wing_sns">
							<a href="https://www.facebook.com/inkkyobobook/" target="_blank"
								class="facebook">교보문고 페이스북</a>
							<!-- <a href="https://story.kakao.com/ch/kyobobook/feed" target="_blank" class="kakaostory">교보문고 카카오스토리</a> -->
						</div>

					</div>
					<!-- .wing_content -->
				</div>
				<!-- #wing_ad -->
				<!-- //좌측 날개 배너 -->



				<script type="text/javascript">
function clickForce(cd) { 
	var formname = document.FormFav;
	formname.target = "iframefav";
	formname.action = "http://www.kyobobook.co.kr/indexfav1.jsp?orderClick" + cd;
	formname.method = "post";
	formname.submit();
} 

function goSmallCategory(url, selectedLargeCategory, selectedMiddleCategory, selectedSmallCategory){
	top.location.href="/digital/ebook/ebookList.ink?selectedLargeCategory=" + selectedLargeCategory + "&selectedMiddleCategory=" +  selectedMiddleCategory + "&selectedSmallCategory=" + selectedSmallCategory;
}

(function($){
	
	function fixNavLayer(){
		var $layer = $('.navigation .gnbGroup.on .navigation_layer');
		if($layer.is(':visible') && $layer.width() == 704){
			var w = 0;
			$layer.find('.column_1, .column_2, .column_3').each(function(){w+=$(this).outerWidth();});
			$layer.width(w);
		}
	}

	
	$('#gnb_category, .navigation_bar .navigation').hover(function(){
		$('.navigation_bar .navigation').show();
		$('#gnb_category').addClass('gnb_on');
		fixNavLayer();
	},function(){
		$('.navigation_bar .navigation').hide();
		$('#gnb_category').removeClass('gnb_on');
	});
	$('#gnb_category>a').click(function(e){
		e.preventDefault();
		$('.navigation_bar .navigation').toggle();
		$('#gnb_category').toggleClass('gnb_on');
		// if( $('.navigation_bar').is(':visible') ) clickForce('c0c');
		fixNavLayer();
	});
	
	var hover_value1, hover_value2;
	var focus_value1, focus_value2;
	$('.top_content_gnb .list .store, #storeList').hover( function(){hover_value1=1;},function(){hover_value1=0;} );
	$('#gnb_category, .navigation_bar .navigation').hover( function(){hover_value2=1;},function(){hover_value2=0;} );
	$('.top_content_gnb .list .store a').focus( function(){focus_value1=1;} ).blur( function(){focus_value1=0;} );
	$('#gnb_category a').focus( function(){focus_value2=1;} ).blur( function(){focus_value2=0;} );
	$('body').click(function(){
		if( !hover_value1 && !focus_value1 ){ $('#storeList').hide();$('.top_content_gnb .list .store a').removeClass('on'); }
		if( !hover_value2 && !focus_value2 ){ $('.navigation_bar .navigation').hide(); }
	});

	$('.navigation_bar .navigation_layer').append('<div class="layer_shadow"></div>');
	$('.navigation_bar .navigation_title a[href="#"]').click(function(e){e.preventDefault();});
	$('.navigation_bar .gnbGroup').each(function(){
		var timer;
		$(this).hover(function(){
			$(this).addClass('on').find('.navigation_layer').show();
			fixNavLayer();
		},function(){
			$(this).removeClass('on').find('.navigation_layer').hide();
		}).find('a').focus(function(){
			$(this).addClass('focus').closest('.gnbGroup').addClass('on').find('.navigation_layer').show();
			fixNavLayer();
		}).blur(function(){
			$(this).removeClass('focus');
			var $parent = $(this).closest('.gnbGroup');
			if(timer) clearTimeout(timer);
			timer = setTimeout(function(){
				if(!$parent.find('.focus').size()){
					$parent.removeClass('on').find('.navigation_layer').hide();
				}
			},10);
		})
	});
	
	// 바로콘
	$('.barocon a').each(function(){
		var timer;
		$(this).focus(function(){
			$(this).addClass('focus').closest('li').find('.cooper_layer').show();
		}).blur(function(){
			$(this).removeClass('focus');
			var $parent = $(this).closest('li');
			if(timer) clearTimeout(timer);
			timer = setTimeout(function(){
				if(!$parent.find('.focus').size()){
					$parent.find('.cooper_layer').hide();
				}
			},10);
		})
	});

	/* 웹접근성 포커스 이동 */
	$('#storeList .btn_close a').click(function(){ $('.top_content_gnb .list .store a').focus(); });
	
	// 상단 고정 메뉴
	$(document).ready(function(){
		if($('.sticky_header').size() && !$('#detailFixedTab').size() && !$('#eventNav').size()){
			var $header = $('#wrap > #header').size()?$('#header'):$('#header_gnb');
			var timer, sl0;
			$(window).scroll(function(){
				var t1 = $header.offset().top + 140 + 50;
				//var t2 = t1 + ($('body').is('.welcome')?710 - 50 - 15:0);
				var st = $(this).scrollTop();
				var sl = $(this).scrollLeft();
				var isNarrow = $(this).width()<1010 && $header.is('.fixed');
				$header.toggleClass('fixed',st>t1); //.toggleClass('fixed2',st>t2);
				if(sl0==null || sl0!=sl){
					$('.sticky_header, .navigation_bar, .top_header').css('margin-left',isNarrow?-sl:0);
					sl0 = sl;
				}
			});
		}
	});

	// 탑 메뉴, 메인 메뉴
	$('.top_content_gnb .list, .navigation_bar .gnb_main').find('.parent').each(function(){
		var timer;
		$(this).hover(function(){
			$(this).addClass('on');
		},function(){
			$(this).removeClass('on');
		}).find('a').focus(function(){
			$(this).addClass('focus').closest('.parent').addClass('on');
		}).blur(function(){
			$(this).removeClass('focus');
			var $parent = $(this).closest('.parent');
			if(timer) clearTimeout(timer);
			timer = setTimeout(function(){
				if(!$parent.find('.focus').size()){
					$parent.removeClass('on');
				}
			},10);
		})
	}).find('.parent_title a[href="#"]').click(function(e){
		e.preventDefault();
		$(this).closest('.parent').toggleClass('on');
	});
	
	
	/* EBOOK전용 */
	$('#total_category, #layer_category .layer_title a').click(function(e){
		e.preventDefault();
		$('#layer_category').toggle();
	});
	$('#layer_category .btn_close_layer a').click(function(e){
		e.preventDefault();
		$('#layer_category').hide();
	});

	$('#layer_category .list_category>li').hover(function(){
		$(this).addClass('on').siblings().removeClass('on');
	}).find('.list_title a').focus(function(){
		$(this).closest('li').addClass('on').siblings().removeClass('on');
	});

	$('.guide_list .guide_first').hover(function(){
		$('#layer_first').show();
	},function(){
		$('#layer_first').hide();
	});
	$('.guide_list a[href="#layer_first"]').click(function(e){
		e.preventDefault();
		$('#layer_first').toggle();
	});

	$('.guide_list .guide_viewer').hover(function(){
		$('#layer_viewer').show();
	},function(){
		$('#layer_viewer').hide();
	})
	$('.guide_list a[href="#layer_viewer"]').click(function(e){
		e.preventDefault();
		$('#layer_viewer').toggle();
	});


	// 퀵메뉴 eBook 톡소다 (임시)
	$(function(){
		if( $('#header_gnb .top_header .kyobo:eq(0)').is('.ebook') ){
			var $link = $('#quick_menu2 #quick_banner li:eq(0) a');
			var src = $link.find('img').attr('src');
			src = src.replace(/(^https?:\/\/s?image\.kyobobook\.co\.kr).+/,'$1/dwas/images/prom/banner/2017/01/06/sample_banner_tocsoda.jpg');
			$link.attr('href','http://www.tocsoda.co.kr').attr('target','_blank').find('img').attr('src',src);
		}
	});


})(jQuery);
</script>







				<script type="text/javascript">
		
		var start = '2016092002' ;
		var end = '2016092006';		
		var today = new Date();
		var year = today.getFullYear();
		var mon = ""+(today.getMonth()+1);
		var day = ""+today.getDate();
		var hour = ""+today.getHours();
		if (mon.length == 1) mon = "0"+mon;
		if (day.length == 1) day = "0"+day; 
		if (hour.length == 1) hour = "0"+hour;
		var current = ""+year+mon+day+hour;
		
		if(current >= start && current < end){
				var Notice 
				= "핫트랙스 시스템 점검으로 인하여  \n\n"
				+ start.substring(0,4)+"년 "+start.substring(4,6)+"월 "+start.substring(6,8)+"일 "+start.substring(8,10)+":00부터 "+ end.substring(0,4)+"년 "+end.substring(4,6)+"월 "+end.substring(6,8)+"일 "+end.substring(8,10)+":00까지  \n"
				+ "핫트랙스 웹페이지 접근이 불가합니다.  \n\n"
				+ "불편을 드려 대단히 죄송합니다.  \n";
				jQuery('#gnb_menu06 a, #gnb_menu07 a, .gnb_main .item_4 a').click(function(e){
					e.preventDefault();
					alert(Notice);
				});
		}
</script>

				<script type="text/javascript">
		
		var start = '2017032302' ;
		var end = '2017032307';		
		var today = new Date();
		var year = today.getFullYear();
		var mon = ""+(today.getMonth()+1);
		var day = ""+today.getDate();
		var hour = ""+today.getHours();
		if (mon.length == 1) mon = "0"+mon;
		if (day.length == 1) day = "0"+day; 
		if (hour.length == 1) hour = "0"+hour;
		var current = ""+year+mon+day+hour;
		
		if(current >= start && current < end){
				var Notice 
				= "eBook 시스템 점검으로 인하여  \n\n"
				+ start.substring(0,4)+"년 "+start.substring(4,6)+"월 "+start.substring(6,8)+"일 "+start.substring(8,10)+":00부터 "+ end.substring(0,4)+"년 "+end.substring(4,6)+"월 "+end.substring(6,8)+"일 "+end.substring(8,10)+":00까지  \n"
				+ "eBook 웹페이지 접근이 불가합니다.  \n\n"
				+ "불편을 드려 대단히 죄송합니다.  \n";
				/*
				jQuery('#gnb_menu03 a, .gnb_main .item_3 a').click(function(e){
					e.preventDefault();
					alert(Notice);
				});
				*/
		}
</script>









				<iframe name="HiddenActionFrame" id="HiddenActionFrame"
					frameborder="0" width="0" height="0" style="display: none;"
					title="빈프레임"></iframe>


				<!--html -->
				<script type="text/javascript">
<!--
function openLoginTop(retURL) {   
    var LoginURL = "/login/login.laf";
    if( escape(retURL).indexOf(LoginURL) >-1 ) return;

    if(typeof(retURL) == "undefined")        {
              window.location = LoginURL;
	} else if (retURL == sslDomain+"/order/orderStep1.laf" ){
		window.location = domain+"/login/login.laf?retURL=" + domain+"/cart/cartList.laf";	
    } else if (retURL.indexOf("/member/joinDoneResult.laf" ) > -1){ // 회원가입완료 페이지
		window.location = domain+"/login/login.laf?retURL=" + domain+"/index.laf";	
    } else { 
    	window.location = domain+LoginURL+"?Kc=GNHHNOlogin&orderClick=c03&retURL=" + escape(retURL);              
    }
}
// 자동완성 로그인 체크
function autoSrcloginChk() {
	var mem_id = 'g5hn2dck';
	if(mem_id == null || mem_id == '') {
		if(confirm('로그인이 필요한 상품입니다. 로그인하시겠습니까?')){
			openLogin(location.href);
		}
		return 'N';
	}else{
		return 'Y';
	}
}	

// byte 길이를 리턴해주는 함수
function getMsgSize(thisStrvalue){
	var strLen = 0;
	for(i = 0; i < thisStrvalue.length;i++){
		if(escape(thisStrvalue.charAt(i)).length >= 4){
			strLen +=2;
		}
		else{
			if(escape(thisStrvalue.charAt(i)) !="%0D")
				strLen++;
		}
	}
		return strLen;
}


function setCookie(name,value,expires,path,domain,secure) {
	document.cookie = name + '=' + escape(value) + ';'
	+ ((expires) ? ' expires=' + expires.toGMTString() + ';' : '')
	+ ((path) ? ' path=' + path + ';' : '')
	+ ((domain) ? ' domain=' + domain + ';' : '')
	+ ((secure) ? ' secure' + ';' : '');
}

function viewMyKyobo(obj){
	if(document.getElementById(obj).style.display == "block"){
		document.getElementById(obj).style.display = "none";
	}else{
		document.getElementById(obj).style.display = "block";
	}
}

function setInputFocus(){
	//검색바 포커스
	var srcKeyword = document.getElementById("searchKeyword");			
	srcKeyword.style.imeMode="active";
	srcKeyword.focus();
}
function setOutFocus(){
	var srcKeyword = document.getElementById("searchKeyword");
	srcKeyword.style.imeMode="auto";
}
// 검색창 포커스 설정
setInputFocus();

try{document.onkeydown = setFocusSearchKeyword;}catch(e){}

function search_strip(key) {	
	var query = document.searchTop.searchKeyword;
	
	if (key) {
		if ( (key == "K" && query.value != "") || (key == "M") ) {
		query.style.backgroundImage = '';
		document.searchTop.eventurl.value = '';
		document.searchTop.eventurlFlag.value = '0';
		document.searchTop.eventurlDelFlag.value = '1';
		} 
	} else {
		query.style.backgroundImage = '';
		document.searchTop.eventurl.value = '';
		document.searchTop.eventurlFlag.value = '0';
		document.searchTop.eventurlDelFlag.value = '1';
	}
}

//검색
function goSearch(val){
	var eventurlFlag = document.getElementById("eventurlFlag").value;
	var eventurlDelFlag = document.getElementById("eventurlDelFlag").value;
	var sExeFrm = document.getElementById("searchCategory").value; 
	var sKeyword = document.getElementById("searchKeyword").value; 
	var sMainUrl = "";

	if(sExeFrm == "KOR") {		
		sMainUrl = "/search/SearchKorbookMain.jsp"; // 국내
	}else if (sExeFrm == "ENG") {
		sMainUrl = "/search/SearchEngbookMain.jsp"; // 외서
	}else if (sExeFrm == "MUC") {
		sMainUrl = "/search/SearchMusicMain.jsp"; // 음반
	}else if (sExeFrm == "DVD") {
		sMainUrl = "/search/SearchDvdMain.jsp"; // DVD
	}else if (sExeFrm == "GFT") {
		sMainUrl = "/search/SearchGiftMain.jsp"; // GIFT
	}else if (sExeFrm == "DIG") {
		sMainUrl = "/search/SearchDigitoryMain.jsp"; // 디지털북
	}else if (sExeFrm == "SAM") {
		sMainUrl = "/search/SearchDigitSamMain.jsp"; 
	}else if (sExeFrm == "USE") {
		sMainUrl = "/search/SearchUsedBookMain.jsp"; // 중고장터
	}else {
		sMainUrl = "/search/SearchCommonMain.jsp"; // 통합
	}
	// 검색창 이벤트
	if(eventurlFlag == "1" && eventurlDelFlag == "0"){
		document.location.href = document.searchTop.eventurl.value ;
	}else {         
		if (sKeyword == ""){   
			alert("검색어를 입력하세요.");			
			document.searchTop.searchKeyword.focus();
			return;
		}
		// 검색어 바이트 체크
		var thisStrLen = getMsgSize(sKeyword);
		if( 2 > thisStrLen){			
			if( sKeyword >= "0" && sKeyword <= "9"){
				alert("숫자는 2글자 이상 입력하세요!");
			}else if( sKeyword >= "A" && sKeyword <= "z"){
				alert("영문은 2글자 이상 입력하세요!");
			}else{
				alert("특수문자는 2글자 이상 입력하세요!");
			}
			document.searchTop.searchKeyword.focus();
			return;
		}
		//entity code 변환
		sKeyword = sKeyword.replace(/&/g, "&amp;");
		sKeyword = sKeyword.replace(/</g, "&lt;");
		sKeyword = sKeyword.replace(/>/g, "&gt;");
		sKeyword = sKeyword.replace(/\"/g, "&quot;");
		sKeyword = sKeyword.replace(/\'/g, "&#39;");
		//sKeyword = sKeyword.replace(/ /g, "&nbsp;");			
		
		// 검색어 저장
		if(isShow){
			addRcentSchList(sKeyword); 
		} 
		
		if(sKeyword != "" )
		{	 		
			sKeyword= html_encode(sKeyword);			
		
		}		
		
		searchMain = document.searchTop;
		searchMain.vPstrKeyWord.value = sKeyword;
		searchMain.vPstrCategory.value = sExeFrm;
		searchMain.vPplace.value = "top";	
		
		var mainHttp = location.href;
		if ( mainHttp.indexOf("https://") != -1 ){
			sMainUrl = "http://www.kyobobook.co.kr" + sMainUrl;
		}else{
			sMainUrl = sMainUrl;
		}
		
		searchMain.action = sMainUrl;
		searchMain.submit();
	}
}
if (!String.prototype.codePointAt) {
    String.prototype.codePointAt = function (pos) {
        pos = isNaN(pos) ? 0 : pos;
        var str = String(this),
            code = str.charCodeAt(pos),
            next = str.charCodeAt(pos + 1);
        // If a surrogate pair
        if (0xD800 <= code && code <= 0xDBFF && 0xDC00 <= next && next <= 0xDFFF) {
            return ((code - 0xD800) * 0x400) + (next - 0xDC00) + 0x10000;
        }
        return code;
    };
}
//인코딩 홍지애 2105.11.03
function html_encode(string) {
	
    var ret_val = '';    
    for (var i = 0; i < string.length; i++) {    	
		if (string.codePointAt(i) > 127) {
			ret_val += '&#' + string.codePointAt(i) + ';';
        } else {
			ret_val += string.charAt(i);
        }
    }
    return ret_val;
}


	/* 검색개편으로 홍지애 씨 요청으로 추가(2016. 10. 13) */
	var keyfix = new beta.fix("searchKeyword");
	var preEventKey = "";
	var preKeyword = "";
	var frsFlag = true;
	var ie11Flag = false;
	
	if(navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1){
		ie11Flag = true;
	}
	
	function setPreKeyword(keyword){
		preKeyword = keyword;
	}
	function getPreKeyword(){
		return preKeyword;
	}
	jQuery(document).ready(function(){             
		var searchKeyword = document.getElementById("searchKeyword");                     
		searchKeyword.onkeyup = function(event) {
			
			search_strip('K');	
			
			var key ;
			
			if(window.event){
				key = window.event.keyCode;
			}else{
				key = event.which;
			}
			
			if(ie11Flag){
				if( key == "40" && frsFlag && searchKeyword.value != ""){
					var e = jQuery.Event( "keyup", { keyCode: 39 } );
					jQuery(this).trigger(e);
					
					frsFlag = false;
					return;
				}
			}
			
			if(!isAvailableKeyCode(key)) {
			    frsFlag = false;
				return;
			}else{			
				if(!isArk && curCursorPos == -1 && searchKeyword.value != ""){
					closeIfrm();
					isShowMode = false;
				}	
				if(key == "8" && searchKeyword.value == ""){  
					if(isShow){
						openRcentSchList();
						isShowMode = true;	
					}else{
					   closeIfrm();
					}					
				}									
				if(key == "38" || key == "40"){  			   
					if(isArk){
						if(searchKeyword.value !="" || (searchKeyword.value =="" && isShow && isShowMode)){  
							var hFrame = document.getElementById("hFrame");
							var hFrameDoc = hFrame .contentWindow || hFrame .contentDocument;								
							hFrameDoc.moveFocusEvent(key);
						}					
					}else{						
						if((searchKeyword.value =="" && isShow && isShowMode)){  
							isShowMode = true;
							var hFrame = document.getElementById("hFrame");
							var hFrameDoc = hFrame .contentWindow || hFrame .contentDocument;								
							hFrameDoc.moveFocusEvent(key);							
						}else if (searchKeyword.value !="" && isShowMode){
							var hFrame = document.getElementById("hFrame");
							var hFrameDoc = hFrame .contentWindow || hFrame .contentDocument;								
							hFrameDoc.moveFocusEvent(key);
						}
					}
				}else{
					if(jQuery.browser.mozilla){
						if( preEventKey != "38" && preEventKey != "40" && key !="13" ){
							keyupSrhInput(searchKeyword);
							frsFlag = true;
						}
					}else{
						if(typeof key != "undefined" && key !="13"){
							keyupSrhInput(searchKeyword);
							frsFlag = true;
						}
					}
				}					
			}
	
			if(jQuery.browser.mozilla){
				preEventKey = key;
			}
		};		
	
		searchKeyword.onmousedown = function() {
			
			search_strip('M');
			
			if(searchKeyword.value == "" && isShow){		 			
				openRcentSchList();
				isShowMode = true;
			}else{			
				keyupSrhInput(searchKeyword);      
			}           
		};
	});


-->
</script>



			</div>



			<!-- s:#Container -->
			<div id="container">
				<!-- s:.content_middle -->
				<div class="content_middle">
					<!-- s:웰컴 자동화 컨텐츠 시작 -->

					<!-- s:#main_snb -->
					<div id="main_snb">
						<!-- *** s:좌측 카테고리 메뉴 *** -->










						<!-- s:국내도서 메인 LeftMenu -->
						<!--
	<ul>
		<li class="first"><a href="/bestseller/bestSeller.laf?mallGb=KOR&range=0&kind=0&orderClick=s01&Kc=KMTLBEbest"><img src="http://image.kyobobook.co.kr/ink/images/korean/txt_best.gif" alt="베스트"/></a></li>
		<li><a href="/newproduct/newProductKorList.laf?mallGb=KOR&ejkGb=KOR&orderClick=s02&Kc=KMTLNEnew"><img src="http://image.kyobobook.co.kr/ink/images/korean/txt_newproduct.gif" alt="신상품"/></a></li>
		<li><a href="http://www.kyobobook.co.kr/recommpage/recommBookMain.laf?orderClick=s03&Kc=KMTLBKrecommend"><img src="http://image.kyobobook.co.kr/ink/images/korean/txt_recom2.gif" alt="추천"/></a></li>
	</ul>
-->
						<!-- s:.nav_category -->
						<!-- 2014.12.17 상품전략 이정은 -->
						<div class="nav_category">
							<h2 class="nav_title">
								<a
									href="http://www.kyobobook.co.kr/indexKor.laf?mallGb=KOR&amp;orderClick=sg">국내도서</a>
							</h2>
							<ul>
								<li><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=01&amp;mallGb=KOR&amp;orderClick=sga"><em>소설</em></a>

									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0101&amp;mallGb=KOR&amp;orderClick=sga">한국소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0103&amp;mallGb=KOR&amp;orderClick=sga">영미소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0105&amp;mallGb=KOR&amp;orderClick=sga">일본소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0107&amp;mallGb=KOR&amp;orderClick=sga">중국소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0109&amp;mallGb=KOR&amp;orderClick=sga">러시아소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0111&amp;mallGb=KOR&amp;orderClick=sga">프랑스소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0112&amp;mallGb=KOR&amp;orderClick=sga">독일소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0113&amp;mallGb=KOR&amp;orderClick=sga">기타나라소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0114&amp;mallGb=KOR&amp;orderClick=sga">라이트
												노벨</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0115&amp;mallGb=KOR&amp;orderClick=sga">장르소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0117&amp;mallGb=KOR&amp;orderClick=sga">테마소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0118&amp;mallGb=KOR&amp;orderClick=sga">청소년소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0119&amp;mallGb=KOR&amp;orderClick=sga">한국고전소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0121&amp;mallGb=KOR&amp;orderClick=sga">세계문학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0123&amp;mallGb=KOR&amp;orderClick=sga">세계고전</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0127&amp;mallGb=KOR&amp;orderClick=sga">소설문고/시리즈</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=03&amp;mallGb=KOR&amp;orderClick=sgb"><em>시/에세이</em></a>

									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0301&amp;mallGb=KOR&amp;orderClick=sgb">나라별
												시</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0303&amp;mallGb=KOR&amp;orderClick=sgb">장르시</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0305&amp;mallGb=KOR&amp;orderClick=sgb">시와
												이야기</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0307&amp;mallGb=KOR&amp;orderClick=sgb">나라별
												에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0309&amp;mallGb=KOR&amp;orderClick=sgb">테마에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0311&amp;mallGb=KOR&amp;orderClick=sgb">인물/자전적에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0313&amp;mallGb=KOR&amp;orderClick=sgb">지혜/상식</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0315&amp;mallGb=KOR&amp;orderClick=sgb">연하도서/카드도서</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0317&amp;mallGb=KOR&amp;orderClick=sgb">청소년
												시/에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0319&amp;mallGb=KOR&amp;orderClick=sgb">시/에세이문고</a></li>
									</ul></li>


								<li><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=13&amp;mallGb=KOR&amp;orderClick=sgh">경제/경영</a>

									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1301&amp;mallGb=KOR&amp;orderClick=sgh">경영일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1303&amp;mallGb=KOR&amp;orderClick=sgh">경영이론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1305&amp;mallGb=KOR&amp;orderClick=sgh">경영관리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1307&amp;mallGb=KOR&amp;orderClick=sgh">경영전략</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1309&amp;mallGb=KOR&amp;orderClick=sgh">경제일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1311&amp;mallGb=KOR&amp;orderClick=sgh">경제이론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1313&amp;mallGb=KOR&amp;orderClick=sgh">기업경제</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1315&amp;mallGb=KOR&amp;orderClick=sgh">각국경제</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1317&amp;mallGb=KOR&amp;orderClick=sgh">기업실무관리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1319&amp;mallGb=KOR&amp;orderClick=sgh">마케팅/세일즈</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1321&amp;mallGb=KOR&amp;orderClick=sgh">유통/창업</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1323&amp;mallGb=KOR&amp;orderClick=sgh">재테크/금융</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1325&amp;mallGb=KOR&amp;orderClick=sgh">무역/운송</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1327&amp;mallGb=KOR&amp;orderClick=sgh">관광/호텔</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1329&amp;mallGb=KOR&amp;orderClick=sgh">경제/경영문고</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1331&amp;mallGb=KOR&amp;orderClick=sgh">대학교재</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=15&amp;mallGb=KOR&amp;orderClick=sgi"><em>자기계발</em></a>

									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1501&amp;mallGb=KOR&amp;orderClick=sgi">성공/처세</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1503&amp;mallGb=KOR&amp;orderClick=sgi">자기능력계발</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1505&amp;mallGb=KOR&amp;orderClick=sgi">비즈니스능력계발</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1506&amp;mallGb=KOR&amp;orderClick=sgi">인간관계</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1507&amp;mallGb=KOR&amp;orderClick=sgi">화술/협상</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1508&amp;mallGb=KOR&amp;orderClick=sgi">청소년자기계발</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1509&amp;mallGb=KOR&amp;orderClick=sgi">오디오북</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1519&amp;mallGb=KOR&amp;orderClick=sgi">전자책단말기</a></li>
									</ul></li>
							</ul>

							<ul>
								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=05&amp;mallGb=KOR&amp;orderClick=sgc"><em>인문</em></a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0501&amp;mallGb=KOR&amp;orderClick=sgc">인문학일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0503&amp;mallGb=KOR&amp;orderClick=sgc">심리학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0505&amp;mallGb=KOR&amp;orderClick=sgc">교육학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0507&amp;mallGb=KOR&amp;orderClick=sgc">유아교육</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0509&amp;mallGb=KOR&amp;orderClick=sgc">특수교육</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0511&amp;mallGb=KOR&amp;orderClick=sgc">임용고시</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0513&amp;mallGb=KOR&amp;orderClick=sgc">철학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0515&amp;mallGb=KOR&amp;orderClick=sgc">문학이론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0517&amp;mallGb=KOR&amp;orderClick=sgc">한국문학론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0519&amp;mallGb=KOR&amp;orderClick=sgc">영미문학론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0520&amp;mallGb=KOR&amp;orderClick=sgc">중국문학론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0521&amp;mallGb=KOR&amp;orderClick=sgc">세계문학론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0523&amp;mallGb=KOR&amp;orderClick=sgc">언어학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0525&amp;mallGb=KOR&amp;orderClick=sgc">독서/글쓰기</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0527&amp;mallGb=KOR&amp;orderClick=sgc">문헌정보학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0529&amp;mallGb=KOR&amp;orderClick=sgc">역학/사주</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0532&amp;mallGb=KOR&amp;orderClick=sgc">대학교재</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0533&amp;mallGb=KOR&amp;orderClick=sgc">인문교양문고</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0535&amp;mallGb=KOR&amp;orderClick=sgc">인문고전문고</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=19&amp;mallGb=KOR&amp;orderClick=sgd">역사/문화</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1901&amp;mallGb=KOR&amp;orderClick=sgd">역사일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1903&amp;mallGb=KOR&amp;orderClick=sgd">세계사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1905&amp;mallGb=KOR&amp;orderClick=sgd">서양사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1907&amp;mallGb=KOR&amp;orderClick=sgd">동양사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1909&amp;mallGb=KOR&amp;orderClick=sgd">한국사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1911&amp;mallGb=KOR&amp;orderClick=sgd">신화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1912&amp;mallGb=KOR&amp;orderClick=sgd">민속학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1913&amp;mallGb=KOR&amp;orderClick=sgd">문화일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1915&amp;mallGb=KOR&amp;orderClick=sgd">문화사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1917&amp;mallGb=KOR&amp;orderClick=sgd">역사인물</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1918&amp;mallGb=KOR&amp;orderClick=sgd">역사기행</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1919&amp;mallGb=KOR&amp;orderClick=sgd">청소년
												역사</a></li>

										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1920&amp;mallGb=KOR&amp;orderClick=sgd">지리학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1921&amp;mallGb=KOR&amp;orderClick=sgd">대학교재</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=21&amp;mallGb=KOR&amp;orderClick=sgf">종교</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2101&amp;mallGb=KOR&amp;orderClick=sgf">종교일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2103&amp;mallGb=KOR&amp;orderClick=sgf">기독교(개신교)</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2105&amp;mallGb=KOR&amp;orderClick=sgf">가톨릭</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2107&amp;mallGb=KOR&amp;orderClick=sgf">불교</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2109&amp;mallGb=KOR&amp;orderClick=sgf">그외종교</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2111&amp;mallGb=KOR&amp;orderClick=sgf">CD/TAPE/악보</a></li>
									</ul></li>

								<li><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=17&amp;mallGb=KOR&amp;orderClick=sgg">정치/사회</a>

									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1701&amp;mallGb=KOR&amp;orderClick=sgg">정치/외교</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1703&amp;mallGb=KOR&amp;orderClick=sgg">행정/정책</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1705&amp;mallGb=KOR&amp;orderClick=sgg">국방/군사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1707&amp;mallGb=KOR&amp;orderClick=sgg">법학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1709&amp;mallGb=KOR&amp;orderClick=sgg">사회학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1711&amp;mallGb=KOR&amp;orderClick=sgg">사회복지</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1713&amp;mallGb=KOR&amp;orderClick=sgg">언론/신문/방송</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1715&amp;mallGb=KOR&amp;orderClick=sgg">정치/사회문고</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1717&amp;mallGb=KOR&amp;orderClick=sgg">대학교재</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1718&amp;mallGb=KOR&amp;orderClick=sgg">대학보충교재</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=23&amp;mallGb=KOR&amp;orderClick=sgq">예술/대중문화</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2301&amp;mallGb=KOR&amp;orderClick=sgq">예술일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2303&amp;mallGb=KOR&amp;orderClick=sgq">미술</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2305&amp;mallGb=KOR&amp;orderClick=sgq">만화/애니메이션</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2307&amp;mallGb=KOR&amp;orderClick=sgq">디자인/색채</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2309&amp;mallGb=KOR&amp;orderClick=sgq">패션/의류</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2313&amp;mallGb=KOR&amp;orderClick=sgq">음악</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2315&amp;mallGb=KOR&amp;orderClick=sgq">사진/영상</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2317&amp;mallGb=KOR&amp;orderClick=sgq">연극</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2319&amp;mallGb=KOR&amp;orderClick=sgq">영화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2320&amp;mallGb=KOR&amp;orderClick=sgq">예술기행</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2321&amp;mallGb=KOR&amp;orderClick=sgq">예술문고</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2325&amp;mallGb=KOR&amp;orderClick=sgq">청소년예술</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2327&amp;mallGb=KOR&amp;orderClick=sgq">대학교재</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=29&amp;mallGb=KOR&amp;orderClick=sgB">과학</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2901&amp;mallGb=KOR&amp;orderClick=sgB">과학이론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2903&amp;mallGb=KOR&amp;orderClick=sgB">도감</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2905&amp;mallGb=KOR&amp;orderClick=sgB">교양과학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2907&amp;mallGb=KOR&amp;orderClick=sgB">수학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2909&amp;mallGb=KOR&amp;orderClick=sgB">물리학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2911&amp;mallGb=KOR&amp;orderClick=sgB">화학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2913&amp;mallGb=KOR&amp;orderClick=sgB">생물학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2915&amp;mallGb=KOR&amp;orderClick=sgB">지구과학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2917&amp;mallGb=KOR&amp;orderClick=sgB">천문학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2918&amp;mallGb=KOR&amp;orderClick=sgB">청소년
												교양과학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2919&amp;mallGb=KOR&amp;orderClick=sgB">과학문고</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2921&amp;mallGb=KOR&amp;orderClick=sgB">대학교재</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2923&amp;mallGb=KOR&amp;orderClick=sgB">초과학</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=26&amp;mallGb=KOR&amp;orderClick=sgt">기술/공학</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2601&amp;mallGb=KOR&amp;orderClick=sgt">건축/인테리어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2603&amp;mallGb=KOR&amp;orderClick=sgt">토목/건설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2605&amp;mallGb=KOR&amp;orderClick=sgt">환경/소방/도시/조경</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2607&amp;mallGb=KOR&amp;orderClick=sgt">자동차/운전</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2608&amp;mallGb=KOR&amp;orderClick=sgt">운전면허</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2609&amp;mallGb=KOR&amp;orderClick=sgt">공학일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2611&amp;mallGb=KOR&amp;orderClick=sgt">금속/재료</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2613&amp;mallGb=KOR&amp;orderClick=sgt">기계/역학/항공</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2615&amp;mallGb=KOR&amp;orderClick=sgt">전기/전자</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2617&amp;mallGb=KOR&amp;orderClick=sgt">농수산/축산</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2619&amp;mallGb=KOR&amp;orderClick=sgt">생활과학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2621&amp;mallGb=KOR&amp;orderClick=sgt">의학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2623&amp;mallGb=KOR&amp;orderClick=sgt">대학교재</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=33&amp;mallGb=KOR&amp;orderClick=sgx">컴퓨터/IT</a>
									<ul class="layer" style="display: none; opacity: 1;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3301&amp;mallGb=KOR&amp;orderClick=sgx"
											class="">컴퓨터공학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3302&amp;mallGb=KOR&amp;orderClick=sgx"
											class="">IT에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3303&amp;mallGb=KOR&amp;orderClick=sgx">컴퓨터입문/활용</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3305&amp;mallGb=KOR&amp;orderClick=sgx">전산통계/해석</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3307&amp;mallGb=KOR&amp;orderClick=sgx">OS</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3309&amp;mallGb=KOR&amp;orderClick=sgx">네트워크</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3310&amp;mallGb=KOR&amp;orderClick=sgx">보안/해킹</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3311&amp;mallGb=KOR&amp;orderClick=sgx">데이터베이스</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3312&amp;mallGb=KOR&amp;orderClick=sgx">개발방법론</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3313&amp;mallGb=KOR&amp;orderClick=sgx">게임</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3314&amp;mallGb=KOR&amp;orderClick=sgx">웹프로그래밍</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3315&amp;mallGb=KOR&amp;orderClick=sgx">프로그래밍/언어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3316&amp;mallGb=KOR&amp;orderClick=sgx">모바일프로그래밍</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3317&amp;mallGb=KOR&amp;orderClick=sgx">OA/사무자동화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3319&amp;mallGb=KOR&amp;orderClick=sgx">웹사이트</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3321&amp;mallGb=KOR&amp;orderClick=sgx">그래픽</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3323&amp;mallGb=KOR&amp;orderClick=sgx">멀티미디어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3325&amp;mallGb=KOR&amp;orderClick=sgx">CAD</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3328&amp;mallGb=KOR&amp;orderClick=sgx">자격증/수험서</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3329&amp;mallGb=KOR&amp;orderClick=sgx">대학교재</a></li>
									</ul></li>
							</ul>

							<ul>
								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=41&amp;mallGb=KOR&amp;orderClick=sgl">유아(0~7세)</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4101&amp;mallGb=KOR&amp;orderClick=sgl">0~3세</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4103&amp;mallGb=KOR&amp;orderClick=sgl">4~7세</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4105&amp;mallGb=KOR&amp;orderClick=sgl">0~7세(유아공통)</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4107&amp;mallGb=KOR&amp;orderClick=sgl">유아놀이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4109&amp;mallGb=KOR&amp;orderClick=sgl">그림책일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4111&amp;mallGb=KOR&amp;orderClick=sgl">유아교양</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4113&amp;mallGb=KOR&amp;orderClick=sgl">유아과학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4115&amp;mallGb=KOR&amp;orderClick=sgl">유아학습</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4117&amp;mallGb=KOR&amp;orderClick=sgl">DVD,
												VIDEO</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=42&amp;mallGb=KOR&amp;orderClick=sgj"><em>어린이(초등)</em></a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4201&amp;mallGb=KOR&amp;orderClick=sgj">초등1~2학년</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4203&amp;mallGb=KOR&amp;orderClick=sgj">초등3~4학년</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4205&amp;mallGb=KOR&amp;orderClick=sgj">초등5~6학년</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4207&amp;mallGb=KOR&amp;orderClick=sgj">초등1~6학년공통</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4209&amp;mallGb=KOR&amp;orderClick=sgj">어린이동화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4211&amp;mallGb=KOR&amp;orderClick=sgj">문학/고전</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4213&amp;mallGb=KOR&amp;orderClick=sgj">아동학습만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4215&amp;mallGb=KOR&amp;orderClick=sgj">자기계발</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4217&amp;mallGb=KOR&amp;orderClick=sgj">어린이교양</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4218&amp;mallGb=KOR&amp;orderClick=sgj">논술/한글/한자</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4219&amp;mallGb=KOR&amp;orderClick=sgj">과학/수학/우주</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4221&amp;mallGb=KOR&amp;orderClick=sgj">역사/문화/인물</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4223&amp;mallGb=KOR&amp;orderClick=sgj">예술/취미</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4225&amp;mallGb=KOR&amp;orderClick=sgj">아동만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4227&amp;mallGb=KOR&amp;orderClick=sgj">초등학교
												입학준비</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4229&amp;mallGb=KOR&amp;orderClick=sgj">어린이종교</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4231&amp;mallGb=KOR&amp;orderClick=sgj">아동문고
												(앗시리즈)</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4233&amp;mallGb=KOR&amp;orderClick=sgj">전집</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=51&amp;mallGb=KOR&amp;orderClick=sgz">어린이전집</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5101&amp;mallGb=KOR&amp;orderClick=sgz">유아</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5103&amp;mallGb=KOR&amp;orderClick=sgz">아동</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5105&amp;mallGb=KOR&amp;orderClick=sgz">외서전집</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=45&amp;mallGb=KOR&amp;orderClick=sgk&amp;vPstrCategory=TOT"
									class="">어린이영어</a>
									<ul class="layer" style="display: none; opacity: 1;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4501&amp;mallGb=KOR&amp;orderClick=sgk"
											class="">유아영어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4502&amp;mallGb=KOR&amp;orderClick=sgk">교과영어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4504&amp;mallGb=KOR&amp;orderClick=sgk">영어시험대비</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4506&amp;mallGb=KOR&amp;orderClick=sgk">영역별영어학습</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4508&amp;mallGb=KOR&amp;orderClick=sgk">코스북</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4509&amp;mallGb=KOR&amp;orderClick=sgk">동화/그림책/리더스북</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4513&amp;mallGb=KOR&amp;orderClick=sgk">미국교과서</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4515&amp;mallGb=KOR&amp;orderClick=sgk">CD/DVD/복합상품</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4517&amp;mallGb=KOR&amp;orderClick=sgk">영어사전</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4519&amp;mallGb=KOR&amp;orderClick=sgk">게임으로
												배우기</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4520&amp;mallGb=KOR&amp;orderClick=sgk">어린이중국어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4523&amp;mallGb=KOR&amp;orderClick=sgk">어린이일본어</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=38&amp;mallGb=KOR&amp;orderClick=sgn">청소년</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3801&amp;mallGb=KOR&amp;orderClick=sgn">논술(단행본)</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3802&amp;mallGb=KOR&amp;orderClick=sgn">공부방법</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3803&amp;mallGb=KOR&amp;orderClick=sgn">진로</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3804&amp;mallGb=KOR&amp;orderClick=sgn">명문대진학가이드</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3805&amp;mallGb=KOR&amp;orderClick=sgn">성교육</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3809&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												자기계발</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3811&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3813&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												소설</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3815&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												시</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3817&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												고전</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3819&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												문학기타</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3821&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												철학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3823&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												역사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3825&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												예술</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3827&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												인문교양</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3829&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												경제</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3831&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												정치사회</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3833&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												교양과학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3835&amp;mallGb=KOR&amp;orderClick=sgn">청소년
												교양공학</a></li>
									</ul></li>

							</ul>

							<ul>
								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=39&amp;mallGb=KOR&amp;orderClick=sgA"
									class="">초등참고서</a>
									<ul class="layer" style="display: none;">
										<!-- 160310 초등참고서 분야가 변경 -->
										<!--<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3901&amp;mallGb=KOR&amp;orderClick=sgA">초등학교 학년별</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3902&amp;mallGb=KOR&amp;orderClick=sgA">예비중학</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3905&amp;mallGb=KOR&amp;orderClick=sgA">전과</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3907&amp;mallGb=KOR&amp;orderClick=sgA">경시대회</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3909&amp;mallGb=KOR&amp;orderClick=sgA">단계별시리즈</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3911&amp;mallGb=KOR&amp;orderClick=sgA">영재학습지</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3913&amp;mallGb=KOR&amp;orderClick=sgA">학습교구</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3919&amp;mallGb=KOR&amp;orderClick=sgA">출판사별</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3921&amp;mallGb=KOR&amp;orderClick=sgA">논술</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3923&amp;mallGb=KOR&amp;orderClick=sgA">한자</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3931&amp;mallGb=KOR&amp;orderClick=sgA">미취학아동</a></li>-->
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3901&mallGb=KOR&orderClick=sgA"
											class="">학년별 개념/문제</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3903&mallGb=KOR&orderClick=sgA">전과</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3904&mallGb=KOR&orderClick=sgA">학교시험
												기출문제</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3906&mallGb=KOR&orderClick=sgA">월간
												학습지</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3909&mallGb=KOR&orderClick=sgA">단계별시리즈</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3910&mallGb=KOR&orderClick=sgA">미취학아동</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3911&mallGb=KOR&orderClick=sgA">영재학습지</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3914&mallGb=KOR&orderClick=sgA">경시대회/올림피아드</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3915&mallGb=KOR&orderClick=sgA">예비중학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3921&mallGb=KOR&orderClick=sgA">논술</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3923&mallGb=KOR&orderClick=sgA">한자</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3925&mallGb=KOR&orderClick=sgA">출판사별</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3927&mallGb=KOR&orderClick=sgA">학습교구</a></li>
										<!-- //160310 초등참고서 분야가 변경 -->
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=25&amp;mallGb=KOR&amp;orderClick=sgo"><em>중/고등참고서</em></a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2501&amp;mallGb=KOR&amp;orderClick=sgo">고등학교
												출판사별</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2503&amp;mallGb=KOR&amp;orderClick=sgo">고등학교
												과목별</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2505&amp;mallGb=KOR&amp;orderClick=sgo">중학교
												출판사별</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2509&amp;mallGb=KOR&amp;orderClick=sgo">중학교
												학년별</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2513&amp;mallGb=KOR&amp;orderClick=sgo">예비중학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2515&amp;mallGb=KOR&amp;orderClick=sgo">중간고사(중등)</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2517&amp;mallGb=KOR&amp;orderClick=sgo">기말고사(중등)</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2521&amp;mallGb=KOR&amp;orderClick=sgo">EBS
												중학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2522&amp;mallGb=KOR&amp;orderClick=sgo">EBS
												고등</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2523&amp;mallGb=KOR&amp;orderClick=sgo">강남구청
												인터넷교재</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2524&amp;mallGb=KOR&amp;orderClick=sgo">중고등경시/올림피아드</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2525&amp;mallGb=KOR&amp;orderClick=sgo">특목고대비교재</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2526&amp;mallGb=KOR&amp;orderClick=sgo">NEAT(국가영어능력평가)</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2527&amp;mallGb=KOR&amp;orderClick=sgo">영어/수학일반/한자</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2529&amp;mallGb=KOR&amp;orderClick=sgo">논술/면접대비</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2531&amp;mallGb=KOR&amp;orderClick=sgo">중고학습문학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2533&amp;mallGb=KOR&amp;orderClick=sgo">검정고시</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2535&amp;mallGb=KOR&amp;orderClick=sgo">공부방법/진학</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=50&amp;mallGb=KOR&amp;orderClick=sgF">대학교재</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5001&amp;mallGb=KOR&amp;orderClick=sgF">인문</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5003&amp;mallGb=KOR&amp;orderClick=sgF">정치/사회/법</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5005&amp;mallGb=KOR&amp;orderClick=sgF">경제/경영</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5007&amp;mallGb=KOR&amp;orderClick=sgF">자연과학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5009&amp;mallGb=KOR&amp;orderClick=sgF">기술공학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5011&amp;mallGb=KOR&amp;orderClick=sgF">컴퓨터</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5013&amp;mallGb=KOR&amp;orderClick=sgF">예술</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5015&amp;mallGb=KOR&amp;orderClick=sgF">외국어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5021&amp;mallGb=KOR&amp;orderClick=sgF">한국판
												원서교재</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5031&amp;mallGb=KOR&amp;orderClick=sgF">전문사전</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=31&amp;mallGb=KOR&amp;orderClick=sgw"
									class=""><em>취업/수험서</em></a>
									<ul class="layer" style="opacity: 1; display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3101&amp;mallGb=KOR&amp;orderClick=sgw"
											class="">취업</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3102&amp;mallGb=KOR&amp;orderClick=sgw">공무원
												과목별</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3104&amp;mallGb=KOR&amp;orderClick=sgw">공무원
												직군별</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3106&amp;mallGb=KOR&amp;orderClick=sgw">공인중개사/주택관리사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3108&amp;mallGb=KOR&amp;orderClick=sgw">고시</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3110&amp;mallGb=KOR&amp;orderClick=sgw">전문직자격증</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3112&amp;mallGb=KOR&amp;orderClick=sgw">국가자격증</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3114&amp;mallGb=KOR&amp;orderClick=sgw">경제/금융/회계자격증</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3116&amp;mallGb=KOR&amp;orderClick=sgw">편입/독학사</a></li>

										<!--<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3103&amp;mallGb=KOR&amp;orderClick=sgw">9급공무원</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3105&amp;mallGb=KOR&amp;orderClick=sgw">7급공무원</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3107&amp;mallGb=KOR&amp;orderClick=sgw">경찰직</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3109&amp;mallGb=KOR&amp;orderClick=sgw">기타공무원수험서</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3113&amp;mallGb=KOR&amp;orderClick=sgw">편입/대학원</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3114&amp;mallGb=KOR&amp;orderClick=sgw">고시/수험영어</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3115&amp;mallGb=KOR&amp;orderClick=sgw">금융수험서</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3117&amp;mallGb=KOR&amp;orderClick=sgw">부동산수험서</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3119&amp;mallGb=KOR&amp;orderClick=sgw">공인중개사</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3121&amp;mallGb=KOR&amp;orderClick=sgw">회계수험서</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3123&amp;mallGb=KOR&amp;orderClick=sgw">고시</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3125&amp;mallGb=KOR&amp;orderClick=sgw">법무사</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3127&amp;mallGb=KOR&amp;orderClick=sgw">변리사</a></li>
				<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3129&amp;mallGb=KOR&amp;orderClick=sgw">기타수험서</a></li>-->
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3130&amp;mallGb=KOR&amp;orderClick=sgw">한자능력시험</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=27&amp;mallGb=KOR&amp;orderClick=sgv">외국어</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2701&amp;mallGb=KOR&amp;orderClick=sgv">영어일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2703&amp;mallGb=KOR&amp;orderClick=sgv">영어회화/청취</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2705&amp;mallGb=KOR&amp;orderClick=sgv">비즈니스영어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2707&amp;mallGb=KOR&amp;orderClick=sgv">영어문법/독해/작문</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2709&amp;mallGb=KOR&amp;orderClick=sgv">영어문고</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2711&amp;mallGb=KOR&amp;orderClick=sgv">영어수입교재</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2715&amp;mallGb=KOR&amp;orderClick=sgv">방송영어교재</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2717&amp;mallGb=KOR&amp;orderClick=sgv">수험영어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2719&amp;mallGb=KOR&amp;orderClick=sgv">유학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2721&amp;mallGb=KOR&amp;orderClick=sgv">번역/통역</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2723&amp;mallGb=KOR&amp;orderClick=sgv">일본어일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2725&amp;mallGb=KOR&amp;orderClick=sgv">일본어회화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2727&amp;mallGb=KOR&amp;orderClick=sgv">일본어문법/작문</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2729&amp;mallGb=KOR&amp;orderClick=sgv">일본어능력시험/JPT</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2733&amp;mallGb=KOR&amp;orderClick=sgv">중국어일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2735&amp;mallGb=KOR&amp;orderClick=sgv">중국어회화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2737&amp;mallGb=KOR&amp;orderClick=sgv">중국어문법/독해</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2739&amp;mallGb=KOR&amp;orderClick=sgv">HSK/중국어시험</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2740&amp;mallGb=KOR&amp;orderClick=sgv">중국원서</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2741&amp;mallGb=KOR&amp;orderClick=sgv">독일어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2743&amp;mallGb=KOR&amp;orderClick=sgv">프랑스어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2745&amp;mallGb=KOR&amp;orderClick=sgv">기타외국어</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2747&amp;mallGb=KOR&amp;orderClick=sgv">어학사전</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=2750&amp;mallGb=KOR&amp;orderClick=sgv">대학교재</a></li>
									</ul></li>

							</ul>

							<ul>
								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=07&amp;mallGb=KOR&amp;orderClick=sgm">가정/육아</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0701&amp;mallGb=KOR&amp;orderClick=sgm">결혼/가정</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0703&amp;mallGb=KOR&amp;orderClick=sgm">임신/출산</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0704&amp;mallGb=KOR&amp;orderClick=sgm">육아</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0705&amp;mallGb=KOR&amp;orderClick=sgm">자녀교육</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0707&amp;mallGb=KOR&amp;orderClick=sgm">살림의지혜</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0709&amp;mallGb=KOR&amp;orderClick=sgm">홈인테리어</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=09&amp;mallGb=KOR&amp;orderClick=sgu">건강</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0901&amp;mallGb=KOR&amp;orderClick=sgu">건강일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0903&amp;mallGb=KOR&amp;orderClick=sgu">뇌건강</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0905&amp;mallGb=KOR&amp;orderClick=sgu">한방치료</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0907&amp;mallGb=KOR&amp;orderClick=sgu">자연건강</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0908&amp;mallGb=KOR&amp;orderClick=sgu">건강식사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0909&amp;mallGb=KOR&amp;orderClick=sgu">질병치료/예방</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0911&amp;mallGb=KOR&amp;orderClick=sgu">다이어트</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0913&amp;mallGb=KOR&amp;orderClick=sgu">운동/트레이닝</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0915&amp;mallGb=KOR&amp;orderClick=sgu">피부관리/메이크업</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0920&amp;mallGb=KOR&amp;orderClick=sgu">건강문고</a></li>
									</ul></li>

								<li class=""><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=32&amp;mallGb=KOR&amp;orderClick=sgp">여행</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3201&amp;mallGb=KOR&amp;orderClick=sgp">국내여행</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3203&amp;mallGb=KOR&amp;orderClick=sgp">해외여행</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3204&amp;mallGb=KOR&amp;orderClick=sgp">여행에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3205&amp;mallGb=KOR&amp;orderClick=sgp">테마여행</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3206&amp;mallGb=KOR&amp;orderClick=sgp">인기지역</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3214&amp;mallGb=KOR&amp;orderClick=sgp">지도</a></li>
									</ul></li>

								<li><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=08&amp;mallGb=KOR&amp;orderClick=sgD">요리</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0801&amp;mallGb=KOR&amp;orderClick=sgD">요리일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0802&amp;mallGb=KOR&amp;orderClick=sgD">요리에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0803&amp;mallGb=KOR&amp;orderClick=sgD">테마별요리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0805&amp;mallGb=KOR&amp;orderClick=sgD">베이킹/간식</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0807&amp;mallGb=KOR&amp;orderClick=sgD">계절요리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0809&amp;mallGb=KOR&amp;orderClick=sgD">재료별요리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0811&amp;mallGb=KOR&amp;orderClick=sgD">나라별요리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0813&amp;mallGb=KOR&amp;orderClick=sgD">생활요리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0815&amp;mallGb=KOR&amp;orderClick=sgD">전문요리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0817&amp;mallGb=KOR&amp;orderClick=sgD">와인/커피/음료</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=0819&amp;mallGb=KOR&amp;orderClick=sgD">요리수험서</a></li>
									</ul></li>

								<li><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=11&amp;mallGb=KOR&amp;orderClick=sgC">취미/실용/스포츠</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1101&amp;mallGb=KOR&amp;orderClick=sgC">가정원예</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1102&amp;mallGb=KOR&amp;orderClick=sgC">홈인테리어/수납</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1103&amp;mallGb=KOR&amp;orderClick=sgC">생활공예/DIY</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1104&amp;mallGb=KOR&amp;orderClick=sgC">살림의지혜</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1105&amp;mallGb=KOR&amp;orderClick=sgC">애완동물</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1107&amp;mallGb=KOR&amp;orderClick=sgC">등산/낚시</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1109&amp;mallGb=KOR&amp;orderClick=sgC">바둑</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1111&amp;mallGb=KOR&amp;orderClick=sgC">골프</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1113&amp;mallGb=KOR&amp;orderClick=sgC">무술</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1115&amp;mallGb=KOR&amp;orderClick=sgC">스포츠</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1117&amp;mallGb=KOR&amp;orderClick=sgC">레크레이션/게임</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1118&amp;mallGb=KOR&amp;orderClick=sgC">퀴즈/퍼즐/스도쿠</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1119&amp;mallGb=KOR&amp;orderClick=sgC">무용</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1121&amp;mallGb=KOR&amp;orderClick=sgC">체육</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1124&amp;mallGb=KOR&amp;orderClick=sgC">취미일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1125&amp;mallGb=KOR&amp;orderClick=sgC">취미관련상품</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=1130&amp;mallGb=KOR&amp;orderClick=sgC">대학교재</a></li>
									</ul></li>
							</ul>

							<ul>
								<li><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=35&amp;mallGb=KOR&amp;orderClick=sgs">잡지</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3501&amp;mallGb=KOR&amp;orderClick=sgs">여성/패션</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3503&amp;mallGb=KOR&amp;orderClick=sgs">인문/사회/종교</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3505&amp;mallGb=KOR&amp;orderClick=sgs">자연/공학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3507&amp;mallGb=KOR&amp;orderClick=sgs">문학/교양</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3509&amp;mallGb=KOR&amp;orderClick=sgs">어학/교육</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3511&amp;mallGb=KOR&amp;orderClick=sgs">예술/대중문화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3513&amp;mallGb=KOR&amp;orderClick=sgs">취미/레포츠</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3515&amp;mallGb=KOR&amp;orderClick=sgs">컴퓨터/게임</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3516&amp;mallGb=KOR&amp;orderClick=sgs">기타
												국내잡지</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3517&amp;mallGb=KOR&amp;orderClick=sgs">외국잡지</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=3519&amp;mallGb=KOR&amp;orderClick=sgs">주간/월간/계간
												잡지</a></li>
									</ul></li>

								<li><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=47&amp;mallGb=KOR&amp;orderClick=sgr">만화</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4701&amp;mallGb=KOR&amp;orderClick=sgr">교양만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4702&amp;mallGb=KOR&amp;orderClick=sgr">역사만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4703&amp;mallGb=KOR&amp;orderClick=sgr">직업만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4704&amp;mallGb=KOR&amp;orderClick=sgr">일상생활만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4705&amp;mallGb=KOR&amp;orderClick=sgr">동물등장만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4706&amp;mallGb=KOR&amp;orderClick=sgr">요리만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4707&amp;mallGb=KOR&amp;orderClick=sgr">취미/도박만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4708&amp;mallGb=KOR&amp;orderClick=sgr">고전/문학작품만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4709&amp;mallGb=KOR&amp;orderClick=sgr">드라마</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4711&amp;mallGb=KOR&amp;orderClick=sgr">성인만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4712&amp;mallGb=KOR&amp;orderClick=sgr">BL만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4713&amp;mallGb=KOR&amp;orderClick=sgr">순정만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4715&amp;mallGb=KOR&amp;orderClick=sgr">스포츠만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4717&amp;mallGb=KOR&amp;orderClick=sgr">SF/판타지</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4718&amp;mallGb=KOR&amp;orderClick=sgr">액션/무협만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4719&amp;mallGb=KOR&amp;orderClick=sgr">명랑/코믹만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4720&amp;mallGb=KOR&amp;orderClick=sgr">탐정/추리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4721&amp;mallGb=KOR&amp;orderClick=sgr">공포/스릴러</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4722&amp;mallGb=KOR&amp;orderClick=sgr">학원만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4723&amp;mallGb=KOR&amp;orderClick=sgr">기타만화</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4724&amp;mallGb=KOR&amp;orderClick=sgr">웹툰/카툰에세이</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4726&amp;mallGb=KOR&amp;orderClick=sgr">그래픽노블</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4728&amp;mallGb=KOR&amp;orderClick=sgr">만화다이어리/캘린더</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4730&amp;mallGb=KOR&amp;orderClick=sgr">일러스트/작법</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=4732&amp;mallGb=KOR&amp;orderClick=sgr">만화잡지</a></li>
									</ul></li>

							</ul>

							<ul>
								<li><a
									href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=53&amp;mallGb=KOR&amp;orderClick=sgE">한국소개도서</a>
									<ul class="layer" style="display: none;">
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5301&amp;mallGb=KOR&amp;orderClick=sgE">한국일반</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5303&amp;mallGb=KOR&amp;orderClick=sgE">한국문학</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5305&amp;mallGb=KOR&amp;orderClick=sgE">한국역사</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5307&amp;mallGb=KOR&amp;orderClick=sgE">한국문화예술</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5309&amp;mallGb=KOR&amp;orderClick=sgE">한국어학습</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5311&amp;mallGb=KOR&amp;orderClick=sgE">한국요리</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=5313&amp;mallGb=KOR&amp;orderClick=sgE">한국판
												원서교재</a></li>
									</ul></li>
								<!--
		<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=37&mallGb=KOR&orderClick=sgy">사전</a></li>
		<li><a href="http://www.kyobobook.co.kr/category/categoryKor.laf?linkClass=18&mallGb=KOR&orderClick=sgG">정부간행물</a></li>
-->
							</ul>
						</div>
						<!-- 2014.12.17 상품전략 이정은 -->
						<!-- //e:.nav_category -->

						<script type="text/javascript">
(function($){
	$('.nav_category ul.layer').closest('li').hover(
		function(){$(this).addClass('active').find('ul').show();},
		function(){$(this).removeClass('active').find('ul').hide();}
	).find('a').focus(function(){
		$(this).addClass('focus').closest('li:has(ul)').addClass('active');
		$(this).closest('li:has(ul)').find('ul').stop().css('opacity',1).show();
	}).blur(function(){
		$(this).removeClass('focus');
		if (!$(this).closest('li:has(ul)').find('.focus').size())
			$(this).closest('li:has(ul)').removeClass('active').find('ul').fadeOut(10);
	});
})(jQuery);
</script>
						<!-- //e:국내도서 메인 LeftMenu -->
						<!-- *** //e:#좌측 카테고리 메뉴 *** -->

						<!-- *** s:(자동화)LNB 하단 배너 *** -->
						<!-- #####korwel_LnbBanner_START##### -->
						<!-- *** s:LNB 하단 배너 *** -->
						<div class="box_main_shortcut">
							<ul>
								<li><a
									href="http://www.kyobobook.co.kr/prom/2016/book/161129_SchoolOfLife.jsp?orderClick=s09"
									alt="365 인생학교"> <img
										src="http://image.kyobobook.co.kr/ink/images/prom/2016/general/schoollife/160623/bnN_11.jpg"
										onerror="javascript:noImage(this,'M','');" alt="365 인생학교" />
								</a></li>
								<li><a
									href="http://kyobobook.co.kr/prom/2016/book/select_k_vol5.jsp?orderClick=s09"
									alt="편집샵: K 새로운 제안의 발견"> <img
										src="http://image.kyobobook.co.kr/ink/images/prom/2016/book/160314_multi_k/bnL_03.jpg"
										onerror="javascript:noImage(this,'M','');"
										alt="편집샵: K 새로운 제안의 발견" />
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/prom/2015/book/wallpaper.jsp?orderClick=s09"
									alt="월페이퍼-소소한 즐거움 기억이 되는상상"> <img
										src="http://image.kyobobook.co.kr/ink/images/prom/2015/main/kor/150108/an_kor_shortcut_00.gif"
										onerror="javascript:noImage(this,'M','');"
										alt="월페이퍼-소소한 즐거움 기억이 되는상상" />
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/prom/2017/general/monthlybook.jsp?orderClick=s09"
									alt="이달의 책-중앙일보와 함께하는 지식도서"> <img
										src="http://image.kyobobook.co.kr/ink/images/prom/2014/main/kor/140612/ban_kor_shortcut_01.gif"
										onerror="javascript:noImage(this,'M','');"
										alt="이달의 책-중앙일보와 함께하는 지식도서" />
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/prom/2016/general/160322_monthlybook.jsp?orderClick=s09"
									alt="이달의 선택-책을아끼고 사랑하는 교보애서"> <img
										src="http://image.kyobobook.co.kr/ink/images/prom/2015/main/kor/150730/ban_kor_shortcut_02.gif"
										onerror="javascript:noImage(this,'M','');"
										alt="이달의 선택-책을아끼고 사랑하는 교보애서" />
								</a></li>
								<li><a
									href="http://www.kyobobook.co.kr/readIT/readITColumnList.laf?orderClick=s09"
									alt="READ IT-편집자, 저자와 함께 IT를 읽다"> <img
										src="http://image.kyobobook.co.kr/ink/images/prom/2015/banner/150427/bnE_00.gif"
										onerror="javascript:noImage(this,'M','');"
										alt="READ IT-편집자, 저자와 함께 IT를 읽다" />
								</a></li>
							</ul>
						</div>
						<!-- *** s:LNB 하단 배너 *** -->

						<!-- *** //e:(자동화)LNB 하단 배너 *** -->
					</div>
					<!-- //e:#main_snb -->

					<!-- s:#main_contents -->
					<div id="main_contents">

						<!-- *** s:(자동화)메인이벤트 *** -->
						<!-- #####korwel_MainEventManage_START##### -->
						<!-- *** s:메인이벤트 *** -->
						<div id="mainEventDiv" class="box_main_event">
							<h2>메인 이벤트</h2>
							<ul class="section_list">
								<!-- *** s:.section - 문학/인문 *** -->
								<li class="section">
									<div class="section_title">
										<a href="#">문학/인문</a>
									</div>
									<ul class="event_list">
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/prom/2017/book/170508_president.jsp?orderClick=s20">
													대통령님 읽어주세요 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/prom/2017/book/170508_president.jsp?orderClick=s20">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr/ink/images/prom/2017/general/170508_president/bnF_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="대통령님 읽어주세요" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/prom/2017/book/170426_coverstory.jsp?orderClick=s21">
													문학 커버스토리 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/prom/2017/book/170426_coverstory.jsp?orderClick=s21">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr/ink/images/prom/2017/book/170426_coverstory/bnF_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="문학 커버스토리" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32494&classGb=KOR&PRE=Y&orderClick=s22">
													젊은작가 특별전 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32494&classGb=KOR&PRE=Y&orderClick=s22">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr//ink/images/prom/2017/book/170407_young/bnN_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="젊은작가 특별전" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/prom/2017/book/170515_365Otvn.jsp?orderClick=s23">
													인문학살롱 심리학 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/prom/2017/book/170515_365Otvn.jsp?orderClick=s23">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr/ink/images/prom/2017/book/170515_365Otvn/bnN_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="인문학살롱 심리학" />
												</a>
											</div>
										</li>
									</ul>
								</li>
								<!-- *** //e:.section - 문학/인문 *** -->
								<!-- *** s:.section - 경제/교양 *** -->
								<li class="section">
									<div class="section_title">
										<a href="#">경제/교양</a>
									</div>
									<ul class="event_list">
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=70517&orderClick=s30">
													이 달의 출판사 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=70517&orderClick=s30">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr/ink/images/prom/2017/book/170504_nulwa/bnN_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="이 달의 출판사" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32607&classGb=KOR&PRE=Y&orderClick=s31">
													비즈앤굿즈 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32607&classGb=KOR&PRE=Y&orderClick=s31">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr/ink/images/prom/2017/book/170425_biz/bnN_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="비즈앤굿즈" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32475&classGb=KOR&PRE=Y&orderClick=s32">
													21세기 성공학개론 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32475&classGb=KOR&PRE=Y&orderClick=s32">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr//ink/images/prom/2017/book/170331_success/bnN_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="21세기 성공학개론" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/prom/2017/book/170413_estate.jsp?orderClick=s33">
													아주 친절한 부동산 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/prom/2017/book/170413_estate.jsp?orderClick=s33">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr//ink/images/prom/2017/banner/170413/bnF_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="아주 친절한 부동산" />
												</a>
											</div>
										</li>
									</ul>
								</li>
								<!-- *** //e:.section - 경제/교양 *** -->
								<!-- *** s:.section - 유아동/실용 *** -->
								<li class="section">
									<div class="section_title">
										<a href="#">유아동/실용</a>
									</div>
									<ul class="event_list">
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/prom/2017/book/170419_bear.jsp?orderClick=s40">
													위베어베어스 크로스백 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/prom/2017/book/170419_bear.jsp?orderClick=s40">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr/ink/images/prom/2017/book/170419_bear/bnV_01.jpg"
													onerror="javascript:noImage(this,'L','');"
													alt="위베어베어스 크로스백" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32481&orderClick=s41">
													알사탕 햇빛가리개 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32481&orderClick=s41">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr//ink/images/prom/2017/book/170404_candy/bnN_01.jpg"
													onerror="javascript:noImage(this,'L','');" alt="알사탕 햇빛가리개" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/prom/2017/book/170516_pickme.jsp?orderClick=s42">
													픽미 여행 필수사은품4종 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/prom/2017/book/170516_pickme.jsp?orderClick=s42">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr/ink/images/prom/2017/book/170516_pickme/bnF_01.jpg"
													onerror="javascript:noImage(this,'L','');"
													alt="픽미 여행 필수사은품4종" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/prom/2017/book/170417_recover3.jsp?orderClick=s43">
													[리커버:K]색다른 여행 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/prom/2017/book/170417_recover3.jsp?orderClick=s43">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr//ink/images/prom/2017/book/170417_recover/bnD_01.jpg"
													onerror="javascript:noImage(this,'L','');"
													alt="[리커버:K]색다른 여행" />
												</a>
											</div>
										</li>
									</ul>
								</li>
								<!-- *** //e:.section - 유아동/실용 *** -->
								<!-- *** s:.section - 어학/학습 *** -->
								<li class="section">
									<div class="section_title">
										<a href="#">어학/학습</a>
									</div>
									<ul class="event_list">
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=70475&orderClick=s50">
													공무원교재 GUIDE </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=70475&orderClick=s50">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr/ink/images/prom/2017/book/170428_bestseller/bnD_01.jpg"
													onerror="javascript:noImage(this,'L','');"
													alt="공무원교재 GUIDE" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/prom/2017/book/170427_secret.jsp?orderClick=s51">
													정촉매 시크릿 테스트! </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/prom/2017/book/170427_secret.jsp?orderClick=s51">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr//ink/images/prom/2017/book/170427_secret/bnF_01.jpg"
													onerror="javascript:noImage(this,'L','');"
													alt="정촉매 시크릿 테스트!" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32392&classGb=KOR&PRE=Y&orderClick=s52">
													1학기 중간고사 만점행사 </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32392&classGb=KOR&PRE=Y&orderClick=s52">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr//ink/images/prom/2017/book/170317_event/bnG_01.jpg"
													onerror="javascript:noImage(this,'L','');"
													alt="1학기 중간고사 만점행사" />
												</a>
											</div>
										</li>
										<li>
											<div class="event_title">
												<a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32600&classGb=KOR&orderClick=s53">
													외국어Start Over </a>
											</div>
											<div class="event_banner ">
												<a class=""
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32600&classGb=KOR&orderClick=s53">
													<img
													src="http://image.kyobobook.co.kr/ink/images/welcome/blank.gif"
													data-original="http://image.kyobobook.co.kr//ink/images/prom/2017/book/170424_startover/bnV_01.jpg"
													onerror="javascript:noImage(this,'L','');"
													alt="외국어Start Over" />
												</a>
											</div>
										</li>
									</ul>
								</li>
								<!-- *** //e:.section - 어학/학습 *** -->
							</ul>
							<button type="button" class="btn_pause">정지</button>
							<button type="button" class="btn_prev">이전 내용</button>
							<button type="button" class="btn_next">다음 내용</button>
						</div>
						<!-- *** //e:메인이벤트 *** -->
						<!-- *** s:메인이벤트 script *** -->
						<script type="text/javascript">
(function($){
	// 레이아웃 기본 셋팅
	var width = $('#mainEventDiv').width();
	var share = parseInt( width / $('#mainEventDiv .section').size() );
	var remain = parseInt( width % share );
	$('#mainEventDiv .section_list').width( width );
	$('#mainEventDiv .section').each(function(idx){
		$(this).find('.event_banner').css('left',-share*idx)
		if( $(this).is(':last-child') ) share = share + remain;
		$(this).width(share);
		$(this).prepend('<div class="arrow"></div>');
	});
	// 랜덤
	var sum = 0;
	var total = $('#mainEventDiv .event_list>li').size();
	var random = Math.floor(Math.random()*total);
	$('#mainEventDiv .event_list>li').removeClass('on').eq(random).addClass('on').closest('.section').addClass('on').siblings().removeClass('on');
	$('#mainEventDiv .section_list>li.on .event_list>li.on .event_banner').find('img').each(function(){
		if( $(this).attr('data-original') && $(this).attr('src') != $(this).attr('data-original') ){
			$(this).attr('src', $(this).attr('data-original') );
		}
	});
	// 탭 선택
	function thisEventTab(idx){
		var now = $('#mainEventDiv .section_list>li.on').index();
		if ( idx != now ){
			var total = $('#mainEventDiv .event_list').eq(idx).children('li').size();
			var random = Math.floor(Math.random()*total);
			$('#mainEventDiv .section_list>li').removeClass('on').eq(idx).addClass('on').find('.event_list>li').removeClass('on').eq(random).addClass('on');
			$('#mainEventDiv .section_list>li.on .event_list>li.on .event_banner img').each(function(){
				if( $(this).attr('data-original') && $(this).attr('src') != $(this).attr('data-original') ){
					$(this).attr('src', $(this).attr('data-original') );
				}
			});
		}
	}
	// 자동 롤링
	function nextEventTab(){
		var idx = 0;
		if( $('#mainEventDiv .section_list>li.on').next().size() ){
			var idx = $('#mainEventDiv .section_list>li.on').next().index();
		}
		thisEventTab(idx);
	}
	var eventItv;
	var autoPlay = true;
	var outerHover = false;
	function startEventTab(){
		if(autoPlay&&!outerHover){
			if(eventItv) window.clearInterval(eventItv);
			eventItv = window.setInterval(nextEventTab, 4000);
		}
	}
	function stopEventTab(){
		window.clearInterval(eventItv);
	}
	startEventTab();
	$('#mainEventDiv').hover(function(){
		outerHover = true;
		stopEventTab();
	},function(){
		outerHover = false;
		startEventTab();
	}).find('a, button').focus(stopEventTab).blur(startEventTab).click(stopEventTab);
	$('#mainEventDiv .btn_pause').click(function(){
		$(this).toggleClass('btn_play');
		if( autoPlay ){
			stopEventTab();
			autoPlay = false;
		} else {
			startEventTab();
			autoPlay = true;
		}
	});
	// 네비게이션
	function nextEventBanner(){
		if( $('#mainEventDiv .section_list>li.on .event_list>li.on').next().size() ){
			$('#mainEventDiv .section_list>li.on .event_list>li.on').removeClass('on').next().addClass('on');
		} else if( $('#mainEventDiv .section_list>li.on').next().size() ){
			$('#mainEventDiv .section_list>li.on').removeClass('on').next().addClass('on').find('.event_list>li').removeClass('on').first().addClass('on');
		} else {
			$('#mainEventDiv .section_list>li').removeClass('on').first().addClass('on').find('.event_list>li').removeClass('on').first().addClass('on');
		}
		$('#mainEventDiv .section_list>li.on .event_list>li.on .event_banner img').each(function(){
			if( $(this).attr('data-original') && $(this).attr('src') != $(this).attr('data-original') ){
				$(this).attr('src', $(this).attr('data-original') );
			}
		});
	}
	function prevEventBanner(){
		if( $('#mainEventDiv .section_list>li.on .event_list>li.on').prev().size() ){
			$('#mainEventDiv .section_list>li.on .event_list>li.on').removeClass('on').prev().addClass('on');
		} else if ( $('#mainEventDiv .section_list>li.on').prev().size() ){
			$('#mainEventDiv .section_list>li.on').removeClass('on').prev().addClass('on').find('.event_list>li').removeClass('on').last().addClass('on');
		} else {
			$('#mainEventDiv .section_list>li').removeClass('on').last().addClass('on').find('.event_list>li').removeClass('on').last().addClass('on');
		}
		$('#mainEventDiv .section_list>li.on .event_list>li.on .event_banner img').each(function(){
			if( $(this).attr('data-original') && $(this).attr('src') != $(this).attr('data-original') ){
				$(this).attr('src', $(this).attr('data-original') );
			}
		});
	}
	$('#mainEventDiv .btn_next').click(function(){
		nextEventBanner();
	});
	$('#mainEventDiv .btn_prev').click(function(){
		prevEventBanner();
	});
	$('#mainEventDiv').find('.btn_next, .btn_prev').bind('mouseout blur',function(){
		$('#mainEventDiv .section_list').removeClass('active');
	});
	// UX
	$('#mainEventDiv .section_title a').bind('mouseover focus click',function(e){
		e.preventDefault();
		var idx = $(this).closest('li').index();
		thisEventTab(idx);
	});
	$('#mainEventDiv .section_title a').hover(function(){
		$('#mainEventDiv .section_list').addClass('active');
	});
	var innerHover = false;
	$('#mainEventDiv .event_banner').hover(function(){
		innerHover = true;
		$('#mainEventDiv .section_list').removeClass('active');
	},function(){
		innerHover = false;
	});
	$('#mainEventDiv .section_list').hover(function(){
		if( !innerHover ) $(this).addClass('active');
	},function(){
		$(this).removeClass('active');
	});
	$('#mainEventDiv').find('.event_banner, .btn_next, .btn_prev').hover(function(){
		$('#mainEventDiv').find('.btn_next, .btn_prev').css('z-index',10);
	},function(){
		$('#mainEventDiv').find('.btn_next, .btn_prev').css('z-index',-1);
	});
	$('#mainEventDiv').find('.btn_next, .btn_prev').focus(function(){
		$(this).css('z-index',10);
	}).blur(function(){
		if(!outerHover) $(this).css('z-index',-1);
	});
	$('#mainEventDiv a').focus(function(){
		$('#mainEventDiv .section_list').addClass('active');
	}).blur(function(){
		$('#mainEventDiv .section_list').removeClass('active');
	});
	$('#mainEventDiv .event_title a').bind('mouseover focus click',function(e){
		$(this).closest('li').addClass('on').siblings().removeClass('on');
		$(this).closest('li').find('.event_banner img').each(function(){
			if( $(this).attr('data-original') && $(this).attr('src') != $(this).attr('data-original') ){
				$(this).attr('src', $(this).attr('data-original') );
			}
		});
	});
})(jQuery);
</script>
						<!-- *** //e:메인이벤트 script *** -->

						<!-- *** //e:(자동화)메인이벤트 *** -->
						<!-- 배너광고 -->
						<div class="box_main_ad">
							<div class="ad_main04">
								<!-- 국내 우상단메인배너 -->

								<iframe
									src="http://imac.kyobobook.co.kr/html/INK/ink_kuk_2016/ink_kuk_2016@kuk_01"
									width="255" height="118" title="배너광고" frameborder="0"
									scrolling="no" topmargin="0" leftmargin="0" marginwidth="0"
									marginheight="0"></iframe>
							</div>
							<div class="ad_main05">
								<!-- 국내 우중단메인배너 -->

								<iframe
									src="http://imac.kyobobook.co.kr/html/INK/ink_kuk_2016/ink_kuk_2016@kuk_02"
									width="255" height="118" title="배너광고" frameborder="0"
									scrolling="no" topmargin="0" leftmargin="0" marginwidth="0"
									marginheight="0"></iframe>
							</div>
							<div class="ad_main06">
								<!-- 북맨의 서재 -->

								<iframe
									src="http://imac.kyobobook.co.kr/html/INK/ink_kuk_2016/ink_kuk_2016@kuk_03"
									width="255" height="118" title="배너광고" frameborder="0"
									scrolling="no" topmargin="0" leftmargin="0" marginwidth="0"
									marginheight="0"></iframe>
							</div>
						</div>
						<!-- .box_welcome_ad -->
						<!-- // 배너광고 -->



						<form name="frmList" method="get" action=""
							onsubmit="return false;">
							<!-- s:.main_both -->
							<div class="main_both">
								<!-- *** s:(자동화)오늘의 책 *** -->
								<!-- #####korwel_TodayBookList_START##### -->
								<!-- 오늘의 책 -->
								<!-- #####KyoboSelect_START##### -->
								<input type="hidden" name="loginYN" value="N" />
								<script>var cartCount = 0;</script>
								<div class="box_main_kyobo2 type_2" id="todayBook2">
									<h2 class="title_main_basic">
										<a href="/todaybook/todaybook.laf?category=KOR&orderClick=4aa">오늘의
											책</a>
										<!-- <small>교보문고가 선정했습니다.</small> -->
									</h2>
									<div class="section on first">
										<div class="content">
											<ul class="tab_main_kyobo">
												<li class="on"><a href="#"
													onclick="javascript:likeCount('9791187295020', 'KOR');"><img
														src="http://image.kyobobook.co.kr/images/book/large/020/l9791187295020.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="어쩌면 좋아 " /></a></li>
												<li><a href="#"
													onclick="javascript:likeCount('9791159311154', 'KOR');"><img
														src="http://image.kyobobook.co.kr/images/book/large/154/l9791159311154.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="아무것도 아닌 것들에 대하여 " /></a></li>
												<li><a href="#"
													onclick="javascript:likeCount('9791157800919', 'KOR');"><img
														src="http://image.kyobobook.co.kr/images/book/large/919/l9791157800919.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="모타운(Motown) " /></a></li>
												<li><a href="#"
													onclick="javascript:likeCount('9791157060856', 'KOR');"><img
														src="http://image.kyobobook.co.kr/images/book/large/856/l9791157060856.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="절반의 중국사 " /></a></li>
												<li><a href="#"
													onclick="javascript:likeCount('9788967354251', 'KOR');"><img
														src="http://image.kyobobook.co.kr/images/book/large/251/l9788967354251.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="오로지 일본의 맛 " /></a></li>
											</ul>
											<ul class="list_main_kyobo">
												<li class="on">
													<div class="cover">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187295020">
															<img
															src="http://image.kyobobook.co.kr/images/book/large/020/l9791187295020.jpg"
															onerror="javascript:noImage(this,'L','KOR');"
															alt="어쩌면 좋아" />
														</a>
													</div>
													<div class="title">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187295020"
															title="어쩌면 좋아"> 어쩌면 좋아 </a>
													</div>
													<div class="author">
														사노 요코 <span class="line">|</span> 서커스(서커스출판상회)
													</div>
													<div class="button">
														<input id="book_amount1" name="qty" type="hidden"
															value="1" /> <input type="hidden" name="barcode"
															value="9791187295020" /> <input type="hidden"
															name="ejkGb" value="KOR" /> <input type="hidden"
															name="notAge" value="0                             " />
														<input type="hidden" name="cartType" value="addMast" /> <input
															type="checkbox" id="cartCheck1" title="이 상품을 선택"
															name="indexCnt" value="1" style="display: none;" />
														<script>cartCount++;</script>
														<button type="button"
															onclick="cartCheck(1); javascript:mainAddCart('9791187295020', 'KOR');">장바구니</button>
														<button type="button"
															onclick="cartCheck(1); goAddWishList(document.frmList);">보관함
															담기</button>
													</div>
													<div class="card_news">
														<!-- cardnews type cnt -->
														<!-- 카드형 -->
														<table>
															<tr>
																<td
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791187295020_1.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791187295020_2.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791187295020_3.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791187295020_4.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791187295020_5.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791187295020_6.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791187295020_7.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791187295020_8.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
															</tr>
														</table>
														<div class="list_nav">
															<button type="button" class="btn_prev">이전 내용</button>
															<span class="page"><strong class="current">1</strong>/8</span>
															<button type="button" class="btn_next">다음 내용</button>
														</div>
														<div class="list_nav2">
															<button type="button" class="btn_prev2">이전 내용</button>
															<button type="button" class="btn_next2">다음 내용</button>
														</div>
														<div class="option">
															<a href="javascript:;"
																onclick="likeUpdate('9791187295020', 'KOR');"
																class="btn_like" data-barcode="9791187295020"
																data-ejkgb="KOR">좋아요 <span class="count"
																id="like_9791187295020">0</span></a>
															<script type="text/javascript">
									</script>
															<span class="share"> <a href="#" class="btn_share">공유</a>
																<span class="layer"> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187295020', 'copy', '어쩌면 좋아');"
																	class="icon_1">카카오톡</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187295020', 'kakaoStory', '어쩌면 좋아');"
																	class="icon_2">카카오스토리</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187295020', 'facebook', '어쩌면 좋아');"
																	class="icon_3">페이스북</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187295020', 'twitter', '어쩌면 좋아');"
																	class="icon_4">트위터</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187295020', 'copy', '어쩌면 좋아');"
																	class="icon_5">라인</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187295020', 'band', '어쩌면 좋아');"
																	class="icon_6">밴드</a> <a href="javascript:;"
																	class="btn_close">닫기</a> <span class="arrow"></span>
															</span>
															</span>
														</div>
													</div>
												</li>
												<li>
													<div class="cover">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791159311154">
															<img
															src="http://image.kyobobook.co.kr/images/book/large/154/l9791159311154.jpg"
															onerror="javascript:noImage(this,'L','KOR');"
															alt="아무것도 아닌 것들에 대하여" />
														</a>
													</div>
													<div class="title">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791159311154"
															title="아무것도 아닌 것들에 대하여"> 아무것도 아닌 것들에 대하여 </a>
													</div>
													<div class="author">
														윌리엄 데이비스 킹 <span class="line">|</span> 책세상
													</div>
													<div class="button">
														<input id="book_amount2" name="qty" type="hidden"
															value="1" /> <input type="hidden" name="barcode"
															value="9791159311154" /> <input type="hidden"
															name="ejkGb" value="KOR" /> <input type="hidden"
															name="notAge" value="0                             " />
														<input type="hidden" name="cartType" value="addMast" /> <input
															type="checkbox" id="cartCheck2" title="이 상품을 선택"
															name="indexCnt" value="2" style="display: none;" />
														<script>cartCount++;</script>
														<button type="button"
															onclick="cartCheck(2); javascript:mainAddCart('9791159311154', 'KOR');">장바구니</button>
														<button type="button"
															onclick="cartCheck(2); goAddWishList(document.frmList);">보관함
															담기</button>
													</div>
													<div class="card_news">
														<!-- cardnews type cnt -->
														<!-- 카드형 -->
														<table>
															<tr>
																<td
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791159311154_1.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791159311154_2.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791159311154_3.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791159311154_4.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791159311154_5.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791159311154_6.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791159311154_7.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791159311154_8.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
															</tr>
														</table>
														<div class="list_nav">
															<button type="button" class="btn_prev">이전 내용</button>
															<span class="page"><strong class="current">1</strong>/8</span>
															<button type="button" class="btn_next">다음 내용</button>
														</div>
														<div class="list_nav2">
															<button type="button" class="btn_prev2">이전 내용</button>
															<button type="button" class="btn_next2">다음 내용</button>
														</div>
														<div class="option">
															<a href="javascript:;"
																onclick="likeUpdate('9791159311154', 'KOR');"
																class="btn_like" data-barcode="9791159311154"
																data-ejkgb="KOR">좋아요 <span class="count"
																id="like_9791159311154">0</span></a>
															<script type="text/javascript">
									</script>
															<span class="share"> <a href="#" class="btn_share">공유</a>
																<span class="layer"> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791159311154', 'copy', '아무것도 아닌 것들에 대하여');"
																	class="icon_1">카카오톡</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791159311154', 'kakaoStory', '아무것도 아닌 것들에 대하여');"
																	class="icon_2">카카오스토리</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791159311154', 'facebook', '아무것도 아닌 것들에 대하여');"
																	class="icon_3">페이스북</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791159311154', 'twitter', '아무것도 아닌 것들에 대하여');"
																	class="icon_4">트위터</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791159311154', 'copy', '아무것도 아닌 것들에 대하여');"
																	class="icon_5">라인</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791159311154', 'band', '아무것도 아닌 것들에 대하여');"
																	class="icon_6">밴드</a> <a href="javascript:;"
																	class="btn_close">닫기</a> <span class="arrow"></span>
															</span>
															</span>
														</div>
													</div>
												</li>
												<li>
													<div class="cover">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919">
															<img
															src="http://image.kyobobook.co.kr/images/book/large/919/l9791157800919.jpg"
															onerror="javascript:noImage(this,'L','KOR');"
															alt="모타운(Motown)" />
														</a>
													</div>
													<div class="title">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919"
															title="모타운(Motown)"> 모타운(Motown) </a>
													</div>
													<div class="author">
														애덤 화이트 <span class="line">|</span> 스코어(score)
													</div>
													<div class="button">
														<input id="book_amount3" name="qty" type="hidden"
															value="1" /> <input type="hidden" name="barcode"
															value="9791157800919" /> <input type="hidden"
															name="ejkGb" value="KOR" /> <input type="hidden"
															name="notAge" value="0                             " />
														<input type="hidden" name="cartType" value="addMast" /> <input
															type="checkbox" id="cartCheck3" title="이 상품을 선택"
															name="indexCnt" value="3" style="display: none;" />
														<script>cartCount++;</script>
														<button type="button"
															onclick="cartCheck(3); javascript:mainAddCart('9791157800919', 'KOR');">장바구니</button>
														<button type="button"
															onclick="cartCheck(3); goAddWishList(document.frmList);">보관함
															담기</button>
													</div>
													<div class="card_news">
														<!-- cardnews type cnt -->
														<!-- 카드형 -->
														<table>
															<tr>
																<td
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_1.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_2.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_3.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_4.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_5.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_6.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_7.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_8.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157800919_9.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
															</tr>
														</table>
														<div class="list_nav">
															<button type="button" class="btn_prev">이전 내용</button>
															<span class="page"><strong class="current">1</strong>/9</span>
															<button type="button" class="btn_next">다음 내용</button>
														</div>
														<div class="list_nav2">
															<button type="button" class="btn_prev2">이전 내용</button>
															<button type="button" class="btn_next2">다음 내용</button>
														</div>
														<div class="option">
															<a href="javascript:;"
																onclick="likeUpdate('9791157800919', 'KOR');"
																class="btn_like" data-barcode="9791157800919"
																data-ejkgb="KOR">좋아요 <span class="count"
																id="like_9791157800919">0</span></a>
															<script type="text/javascript">
									</script>
															<span class="share"> <a href="#" class="btn_share">공유</a>
																<span class="layer"> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919', 'copy', '모타운(Motown)');"
																	class="icon_1">카카오톡</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919', 'kakaoStory', '모타운(Motown)');"
																	class="icon_2">카카오스토리</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919', 'facebook', '모타운(Motown)');"
																	class="icon_3">페이스북</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919', 'twitter', '모타운(Motown)');"
																	class="icon_4">트위터</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919', 'copy', '모타운(Motown)');"
																	class="icon_5">라인</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919', 'band', '모타운(Motown)');"
																	class="icon_6">밴드</a> <a href="javascript:;"
																	class="btn_close">닫기</a> <span class="arrow"></span>
															</span>
															</span>
														</div>
													</div>
												</li>
												<li>
													<div class="cover">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060856">
															<img
															src="http://image.kyobobook.co.kr/images/book/large/856/l9791157060856.jpg"
															onerror="javascript:noImage(this,'L','KOR');"
															alt="절반의 중국사" />
														</a>
													</div>
													<div class="title">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060856"
															title="절반의 중국사"> 절반의 중국사 </a>
													</div>
													<div class="author">
														가오훙레이 <span class="line">|</span> 메디치미디어
													</div>
													<div class="button">
														<input id="book_amount4" name="qty" type="hidden"
															value="1" /> <input type="hidden" name="barcode"
															value="9791157060856" /> <input type="hidden"
															name="ejkGb" value="KOR" /> <input type="hidden"
															name="notAge" value="0                             " />
														<input type="hidden" name="cartType" value="addMast" /> <input
															type="checkbox" id="cartCheck4" title="이 상품을 선택"
															name="indexCnt" value="4" style="display: none;" />
														<script>cartCount++;</script>
														<button type="button"
															onclick="cartCheck(4); javascript:mainAddCart('9791157060856', 'KOR');">장바구니</button>
														<button type="button"
															onclick="cartCheck(4); goAddWishList(document.frmList);">보관함
															담기</button>
													</div>
													<div class="card_news">
														<!-- cardnews type cnt -->
														<!-- 카드형 -->
														<table>
															<tr>
																<td
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_1.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_2.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_3.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_4.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_5.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_6.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_7.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_8.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_9.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9791157060856_10.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
															</tr>
														</table>
														<div class="list_nav">
															<button type="button" class="btn_prev">이전 내용</button>
															<span class="page"><strong class="current">1</strong>/10</span>
															<button type="button" class="btn_next">다음 내용</button>
														</div>
														<div class="list_nav2">
															<button type="button" class="btn_prev2">이전 내용</button>
															<button type="button" class="btn_next2">다음 내용</button>
														</div>
														<div class="option">
															<a href="javascript:;"
																onclick="likeUpdate('9791157060856', 'KOR');"
																class="btn_like" data-barcode="9791157060856"
																data-ejkgb="KOR">좋아요 <span class="count"
																id="like_9791157060856">0</span></a>
															<script type="text/javascript">
									</script>
															<span class="share"> <a href="#" class="btn_share">공유</a>
																<span class="layer"> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060856', 'copy', '절반의 중국사');"
																	class="icon_1">카카오톡</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060856', 'kakaoStory', '절반의 중국사');"
																	class="icon_2">카카오스토리</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060856', 'facebook', '절반의 중국사');"
																	class="icon_3">페이스북</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060856', 'twitter', '절반의 중국사');"
																	class="icon_4">트위터</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060856', 'copy', '절반의 중국사');"
																	class="icon_5">라인</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060856', 'band', '절반의 중국사');"
																	class="icon_6">밴드</a> <a href="javascript:;"
																	class="btn_close">닫기</a> <span class="arrow"></span>
															</span>
															</span>
														</div>
													</div>
												</li>
												<li>
													<div class="cover">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354251">
															<img
															src="http://image.kyobobook.co.kr/images/book/large/251/l9788967354251.jpg"
															onerror="javascript:noImage(this,'L','KOR');"
															alt="오로지 일본의 맛" />
														</a>
													</div>
													<div class="title">
														<a
															href="/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354251"
															title="오로지 일본의 맛"> 오로지 일본의 맛 </a>
													</div>
													<div class="author">
														마이클 부스 <span class="line">|</span> 글항아리
													</div>
													<div class="button">
														<input id="book_amount5" name="qty" type="hidden"
															value="1" /> <input type="hidden" name="barcode"
															value="9788967354251" /> <input type="hidden"
															name="ejkGb" value="KOR" /> <input type="hidden"
															name="notAge" value="0                             " />
														<input type="hidden" name="cartType" value="addMast" /> <input
															type="checkbox" id="cartCheck5" title="이 상품을 선택"
															name="indexCnt" value="5" style="display: none;" />
														<script>cartCount++;</script>
														<button type="button"
															onclick="cartCheck(5); javascript:mainAddCart('9788967354251', 'KOR');">장바구니</button>
														<button type="button"
															onclick="cartCheck(5); goAddWishList(document.frmList);">보관함
															담기</button>
													</div>
													<div class="card_news">
														<!-- cardnews type cnt -->
														<!-- 카드형 -->
														<table>
															<tr>
																<td
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9788967354251_1.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9788967354251_2.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9788967354251_3.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9788967354251_4.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9788967354251_5.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9788967354251_6.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
																<td style="display: none"
																	data-image="http://image.kyobobook.co.kr/images/cardnews/9788967354251_7.jpg">
																	<b></b> <!-- 이미지만 출력할 경우 대체 텍스트 -->
																</td>
															</tr>
														</table>
														<div class="list_nav">
															<button type="button" class="btn_prev">이전 내용</button>
															<span class="page"><strong class="current">1</strong>/7</span>
															<button type="button" class="btn_next">다음 내용</button>
														</div>
														<div class="list_nav2">
															<button type="button" class="btn_prev2">이전 내용</button>
															<button type="button" class="btn_next2">다음 내용</button>
														</div>
														<div class="option">
															<a href="javascript:;"
																onclick="likeUpdate('9788967354251', 'KOR');"
																class="btn_like" data-barcode="9788967354251"
																data-ejkgb="KOR">좋아요 <span class="count"
																id="like_9788967354251">0</span></a>
															<script type="text/javascript">
									</script>
															<span class="share"> <a href="#" class="btn_share">공유</a>
																<span class="layer"> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354251', 'copy', '오로지 일본의 맛');"
																	class="icon_1">카카오톡</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354251', 'kakaoStory', '오로지 일본의 맛');"
																	class="icon_2">카카오스토리</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354251', 'facebook', '오로지 일본의 맛');"
																	class="icon_3">페이스북</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354251', 'twitter', '오로지 일본의 맛');"
																	class="icon_4">트위터</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354251', 'copy', '오로지 일본의 맛');"
																	class="icon_5">라인</a> <a href="javascript:;"
																	onclick="snsClick('http://www.kyobobook.co.kr', '/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354251', 'band', '오로지 일본의 맛');"
																	class="icon_6">밴드</a> <a href="javascript:;"
																	class="btn_close">닫기</a> <span class="arrow"></span>
															</span>
															</span>
														</div>
													</div>
												</li>
											</ul>
											<div class="btn_more">
												<a href="javascript:;" onclick="todayBtnMore();"><img
													src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
													alt="더보기" /></a>
											</div>
										</div>
									</div>
									<!-- .section -->
								</div>
								<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
								<script type="text/javascript">
function todayBookList(sectionCount) {
	if (sectionCount == 0) { // 국내도서
		todayLink = "http://www.kyobobook.co.kr/todaybook/todaybook.laf?category=KOR&orderClick=4ab";
	} else if (sectionCount == 1) { // 외국도서
		todayLink = "http://www.kyobobook.co.kr/todaybook/todaybook.laf?category=EBK&orderClick=4ac";
	} else if (sectionCount == 2) { // eBook
		todayLink = "http://sam.kyobobook.co.kr/sbweb/recommend/recommendMain.ink?themeTypeSeq=0&orderClick=4ad";
	}
	location.href = todayLink;
}
function todayBtnMore() {
	(function($){
		var sectionCount = 0;
		var todayLink = "";
		$(".box_welcome_kyobo .section").each(function(index) {
			if ($(this).attr("class") == "section first on" || $(this).attr("class") == "section on") {
				sectionCount = index
			}
		});
		if (sectionCount == 0) { // 국내도서
			todayLink = "http://www.kyobobook.co.kr/todaybook/todaybook.laf?category=KOR&orderClick=4ab";
		} else if (sectionCount == 1) { // 외국도서
			todayLink = "http://www.kyobobook.co.kr/todaybook/todaybook.laf?category=EBK&orderClick=4ac";
		} else if (sectionCount == 2) { // eBook
			todayLink = "http://sam.kyobobook.co.kr/sbweb/recommend/recommendMain.ink?themeTypeSeq=0&orderClick=4ad";
		}
		location.href = todayLink;
	})(jQuery);
}
function cartCheck(num) {
	(function($){
		for (var i = 0; i < cartCount; i++) {
			$("#cartCheck"+(i+1)).attr("checked", false);
		}
		$("#cartCheck"+num).attr("checked", true);
	})(jQuery);
}
(function($){
	var timer;
	function todayBookCover(){
		$cover = $('#todayBook2 .section.on');
		$cover.addClass('animate');
		if(timer) clearTimeout(timer);
		timer = setTimeout(function(){
			$cover.removeClass('animate');
		},200);
	}
	function todayBookCenter(){
		var $tab = $('#todayBook2 .section.on .tab_main_kyobo li');
		var total = $tab.size();
		for(var i=0;i<total;i++){
			$tab.removeClass('book_'+(i+1));
		}
		var $obj = $tab.filter('.on');
		$obj.addClass('book_1');
		$obj.next().addClass('book_2');
		$obj.prev().addClass('book_'+(total>2?3:2));
		if(total==3){
			$obj.next().next().addClass('book_3');
			$obj.prev().prev().addClass('book_2');
		}else if(total==4){
			$obj.next().next().addClass('book_4').next().addClass('book_3');
			$obj.prev().prev().addClass('book_4').prev().addClass('book_2');
		}else if(total==5){
			$obj.next().next().addClass('book_4').next().addClass('book_5').next().addClass('book_3');
			$obj.prev().prev().addClass('book_5').prev().addClass('book_4').prev().addClass('book_2');
		}
		cardNewsView();
		//cardNewsLike();
	}
	$('#todayBook2 .content').each(function(){
		var total = $(this).find('.tab_main_kyobo li').size();
		var random = Math.floor(Math.random() * total);
		$(this).find('.tab_main_kyobo li').removeClass('on').eq(random).addClass('on');
		$(this).find('.list_main_kyobo li').removeClass('on').eq(random).addClass('on');
	});
	$('#todayBook2 .tab_main_kyobo li a').click(function(e){
		e.preventDefault();
		var is_4 = $(this).parent().is('.book_4');
		var is_5 = $(this).parent().is('.book_5');
		if(is_4||is_5){
			var no = is_4?2:3;
			$('#todayBook2 .section.on').addClass('animate').find('.tab_main_kyobo li').removeClass('on').filter('.book_'+no).addClass('on');
			todayBookCenter();
			setTimeout(function(){
				$('.book_'+no+' a').trigger('click');
			},280);
			return false;
		}
		var idx = $(this).parent().index();
		$(this).closest('.content').find('.tab_main_kyobo li').removeClass('on').eq(idx).addClass('on');
		$(this).closest('.content').find('.list_main_kyobo li').removeClass('on').eq(idx).addClass('on');
		todayBookCenter();
		todayBookCover();
	});
	$('#todayBook2 h3 a').bind('click mouseover focus',function(e){
		e.preventDefault();
		$(this).closest('div').addClass('on').siblings().removeClass('on');
		todayBookCenter();
	});
	todayBookCenter();
	// 카드뉴스
	function cardNewsView(obj){
		var $card = obj?obj:$('#todayBook2 .section.on .list_main_kyobo li.on .card_news table');
		if($card.data('color')) $card.css('background-color', $card.data('color') );
		if($card.data('image')) $card.css('background-image', 'url(' + $card.data('image') + ')' );
		var $page = $card.find('td:visible');
		if($page.data('color')) $page.css('background-color', $page.data('color') );
		if($page.data('image')) $page.css('background-image', 'url(' + $page.data('image') + ')' );
	}
	$('.card_news .btn_prev').click(function(){
		var $card = $(this).closest('.card_news').find('table');
		var $page = $card.find('td:visible');
		if( $page.prev().size() )
			$page.hide().prev().show();
		var idx = $card.find('td:visible').index();
		$(this).closest('.list_nav').find('.current').text( idx +1 );
		cardNewsView($card);
	});
	$('.card_news .btn_next').click(function(){
		var $card = $(this).closest('.card_news').find('table');
		var $page = $card.find('td:visible');
		if( $page.next().size() )
			$page.hide().next().show();
		var idx = $card.find('td:visible').index();
		$(this).closest('.list_nav').find('.current').text( idx +1 );
		cardNewsView($card);
	});
	$('.card_news .share .btn_share').click(function(e){
		e.preventDefault();
		$(this).closest('.share').toggleClass('on');
	});
	$('.card_news .share .btn_close').click(function(e){
		e.preventDefault();
		$(this).closest('.share').removeClass('on');
	});
	$('.card_news').each(function(){
		$(this).find('.btn_next2').click(function(){
			$(this).closest('.card_news').find('.btn_next').trigger('click');
		});
		$(this).find('.btn_prev2').click(function(){
			$(this).closest('.card_news').find('.btn_prev').trigger('click');
		});
		$(this).mouseenter(function(){
			$(this).addClass('active');
		}).mouseleave(function(){
			$(this).removeClass('active');
		});
		// 카드뉴스 여러개 보여줄 때
		//cardNewsView( $(this).find('table') );
		//cardNewsLike( $(this).find('.btn_like') );
	});
	// 오늘의 책 type 2
	if($('#todayBook2').is('.type_2')){
		$('#todayBook2 .tab_main_kyobo').each(function(){
			var total =  $(this).find('li').size();
			var idx = $(this).find('li.on').index();
			var html = '<a href="#" class="on">1</a>';
			for(var i=1;i<total;i++) html += ' <a href="#">'+(i+1)+'</a>';
			$(this).after('<div class="tab_main_round"></div>');
			$(this).closest('.content').find('.tab_main_round').append(html);
			$(this).closest('.content').find('.tab_main_round a').removeClass('on').eq(idx).addClass('on');
		});
		$('#todayBook2 .tab_main_kyobo li a').click(function(e){
			e.preventDefault();
			var idx = $(this).parent().index();
			$(this).closest('.content').find('.tab_main_round a').removeClass('on').eq(idx).addClass('on');
		});
		$('#todayBook2 .tab_main_round a').click(function(e){
			e.preventDefault();
			var idx = $(this).index();
			$(this).addClass('on').siblings().removeClass('on');
			$(this).closest('.content').find('.list_main_kyobo li').removeClass('on').eq(idx).addClass('on');
			$(this).closest('.content').find('.tab_main_kyobo li').removeClass('on').eq(idx).addClass('on');
			todayBookCenter();
			todayBookCover();
		});
		$('#todayBook2 .card_news').each(function(){
			$(this).prepend('<div class="layer"></div>');
			$(this).find('.layer').append( $(this).closest('li').find('.title') );
			$(this).find('.layer').append( $(this).closest('li').find('.author') );
		});
	}	
})(jQuery);
	//Kakao.init('156f850bb4a5ede5a88a5a075ee6714a'); // 본인 앱 키임!
	Kakao.init('94f31613efea825e014b857330f05bbb');
// sns 전송
function sendSnsForEvent(target, title, url, thumbnail, seq){
	var link_url = url;
	switch(target){
		case "facebook":
			send_url = "http://www.facebook.com/sharer.php?u="+encodeURIComponent(link_url)+"&t="+encodeURIComponent(title);
			window.open(send_url, "SendSNS", "");
			break;
		case "twitter":
			send_url = "http://twitter.com/home?status="+encodeURIComponent(title) + ":" + encodeURIComponent(link_url);
			window.open(send_url, "SendSNS", "");
			break;
		case "kakaoStory":
			url = url.replace("http://", "");
			Kakao.Story.share({
	          url: url,
	          text: title
	        });
	        break;
		case "band":
			send_url = "http://www.band.us/plugin/share?body="+encodeURIComponent(title) + "&route="+ encodeURIComponent(link_url)
			window.open(send_url, "SendSNS", "");
			break;
	}
}
function snsClick(urlDomain, url, str, strTitle){
	var title = strTitle;
	if (url.indexOf("http://") == -1 || url.indexOf("https://") == -1) {
		url = urlDomain + url;
	}
	if(str == "copy"){
		var agent = navigator.userAgent.toLowerCase();
		if (agent.indexOf("msie") != -1) {
			if(confirm("이 글의 트랙백 주소를 클립보드에 복사하시겠습니까?")){
				window.clipboardData.setData("Text", url);
			}
		}else{
			prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);
		}
	}else{
		sendSnsForEvent(str,title,url,"","");
	}
}
</script>
								<!-- // 오늘의 책 -->

								<!-- *** s:(자동화)오늘의 책 *** -->

							</div>
							<!-- //e:.main_both -->
						</form>


						<!-- s:.main_both -->

						<!-- //e:.main_both -->

						<!-- s:.main_left -->
						<div class="main_left">
							<!-- *** s:(자동화)이슈 & 트랜드 *** -->
							<!-- #####korwel_IssueTrend_START##### -->
							<!-- *** s:이슈 & 트렌드 *** -->
							<div class="box_main_issue fixed">
								<h3 class="title_main_basic">이슈 & 트렌드</h3>
								<div class="list_main_issue">
									<ul>
										<li><a
											href="http://www.kyobobook.co.kr/prom/2017/pube/05/170515_only.jsp?orderClick=s05"
											alt="[김영하 신작] 김영하 신작 &lt;오직 두 사람&gt; 예약판매!">[김영하 신작] 김영하
												신작 &lt;오직 두 사람&gt; 예약판매!</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=70517&classGb=KOR&orderClick=s05"
											alt="[이달의 출판사] 느리지만, 오래 가는 책을 만드는 눌와">[이달의 출판사] 느리지만, 오래
												가는 책을 만드는 눌와</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32645&classGb=KOR&PRE=Y&orderClick=s05"
											alt="[82년생 김지영] 흥행 역주행 소설 베스트셀러 1위!">[82년생 김지영] 흥행 역주행 소설
												베스트셀러 1위!</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791158360375&Kc=&orderClick=s05"
											alt="[백희나 신작] &lt;알사탕&gt; 출간! 대일밴드 + 옥스포드 사은품 증정!">[백희나
												신작] &lt;알사탕&gt; 출간! 대일밴드 + 옥스포드 사은품 증정!</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/product/detailViewPackage.laf?ejkGb=KOR&mallGb=PKG&barcode=2909100690807&Kc=&orderClick=s05"
											alt="[목소리의 형태] 제 2의 &lt;너의 이름은.&gt;! 애니 &lt;목소리의 형태&gt; 개봉">[목소리의
												형태] 제 2의 &lt;너의 이름은.&gt;! 애니 &lt;목소리의 형태&gt; 개봉</a></li>
									</ul>
								</div>
							</div>
							<!-- *** //e:이슈 & 트렌드 *** -->

							<!-- *** //e:(자동화)이슈 & 트랜드 *** -->
						</div>
						<!-- //e:.main_left -->

						<!-- s:.main_right -->
						<div class="main_right">
							<!-- s:(고정)이슈 & 트랜드 우측 배너 -->
							<div class="ad_main02">
								<!-- 북맨의 서재 -->

								<iframe
									src="http://imac.kyobobook.co.kr/html/INK/ink_kuk_2016/ink_kuk_2016@kuk_04"
									width=193 height="340" title="배너광고" frameborder="0"
									scrolling="no" topmargin="0" leftmargin="0" marginwidth="0"
									marginheight="0"></iframe>
							</div>
							<!-- //e:(고정)이슈 & 트랜드 우측 배너 -->
						</div>
						<!-- //e:.main_right -->

						<!-- s:.main_left -->
						<div class="main_left">
							<!-- *** s:(자동화)새로나온 책 *** -->
							<!-- #####korwel_NewBook_START##### -->
							<!-- *** s:오늘의 책 *** -->
							<div class="box_main_best" id="newBook">
								<h2 class="title_main_basic">
									<a
										href="http://www.kyobobook.co.kr/newproduct/newTopicKorList.laf?mallGb=KOR&ejkGb=KOR&orderClick=rvk">새로나온
										책</a>
								</h2>
								<!-- *** s:.section - 문학/인문 *** -->
								<div class="section first on">
									<h3>
										<a href="#">문학/인문</a>
									</h3>
									<div class="content">
										<ul class="list_main_best">
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791186661222&orderClick=sbb">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/222/l9791186661222.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="한 권으로 읽는 베블런" />
													</a>
												</div>
												<div class="category">[소설]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791186661222&orderClick=sbb"
														title="한 권으로 읽는 베블런"> <strong>한 권으로 읽는 베블런</strong>
													</a>
												</div>
												<div class="summary">사랑과 연대에 관한 따듯한 울림</div>
												<div class="price">
													<strong>13,320원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791188047062&orderClick=sbb">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/062/l9791188047062.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="길이 아니면 가지 말라" />
													</a>
												</div>
												<div class="category">[시/에세이]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791188047062&orderClick=sbb"
														title="길이 아니면 가지 말라"> <strong>길이 아니면 가지 말라</strong>
													</a>
												</div>
												<div class="summary">법정 스님과 함께한 60번의 계절</div>
												<div class="price">
													<strong>12,600원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187438106&orderClick=sbb">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/106/l9791187438106.jpg"
														onerror="javascript:noImage(this,'L','KOR');" alt="어른의 교양" />
													</a>
												</div>
												<div class="category">[인문]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187438106&orderClick=sbb"
														title="어른의 교양"> <strong>어른의 교양</strong>
													</a>
												</div>
												<div class="summary">손석춘의 한국식 리버럴 아츠</div>
												<div class="price">
													<strong>12,600원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791196075705&orderClick=sbb">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/705/l9791196075705.jpg"
														onerror="javascript:noImage(this,'L','KOR');" alt="투명정부" />
													</a>
												</div>
												<div class="category">[정치/사회]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791196075705&orderClick=sbb"
														title="투명정부"> <strong>투명정부</strong>
													</a>
												</div>
												<div class="summary">우리는 투명정부를 원한다</div>
												<div class="price">
													<strong>14,400원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
										</ul>
										<div class="btn_more">
											<a
												href="/newproduct/newTopicKorList.laf?mallGb=KOR&ejkGb=KOR&orderClick=sba"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
												alt="더보기" /></a>
										</div>
									</div>
								</div>
								<!-- *** //e:.section - 문학/인문 *** -->
								<!-- *** s:.section - 경제/교양 *** -->
								<div class="section ">
									<h3>
										<a href="#">경제/교양</a>
									</h3>
									<div class="content">
										<ul class="list_main_best">
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791188039012&orderClick=sbc">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/012/l9791188039012.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="왜 자꾸 그녀에게 시선이 갈까?" />
													</a>
												</div>
												<div class="category">[자기계발]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791188039012&orderClick=sbc"
														title="왜 자꾸 그녀에게 시선이 갈까?"> <strong>왜 자꾸 그녀에게
															시선이 갈까?</strong>
													</a>
												</div>
												<div class="summary">분위기가 만드는 아름다움</div>
												<div class="price">
													<strong>12,600원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187962229&orderClick=sbc">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/229/l9791187962229.jpg"
														onerror="javascript:noImage(this,'L','KOR');" alt="취직의 기술" />
													</a>
												</div>
												<div class="category">[자기계발]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791187962229&orderClick=sbc"
														title="취직의 기술"> <strong>취직의 기술</strong>
													</a>
												</div>
												<div class="summary">당신을 뽑지않고선 못견디게 만드는</div>
												<div class="price">
													<strong>11,700원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919&orderClick=sbc">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/919/l9791157800919.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="모타운(Motown)" />
													</a>
												</div>
												<div class="category">[예술/대중문화]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157800919&orderClick=sbc"
														title="모타운(Motown)"> <strong>모타운(Motown)</strong>
													</a>
												</div>
												<div class="summary">대중음악의 중심인 모타운의 역사</div>
												<div class="price">
													<strong>38,700원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788983718235&orderClick=sbc">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/235/l9788983718235.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="김명호의 과학 뉴스" />
													</a>
												</div>
												<div class="category">[과학]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788983718235&orderClick=sbc"
														title="김명호의 과학 뉴스"> <strong>김명호의 과학 뉴스</strong>
													</a>
												</div>
												<div class="summary">과학의 맥락을 짚는 그래픽 노블</div>
												<div class="price">
													<strong>15,750원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
										</ul>
										<div class="btn_more">
											<a
												href="/newproduct/newTopicKorList.laf?mallGb=KOR&ejkGb=KOR&orderClick=sba"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
												alt="더보기" /></a>
										</div>
									</div>
								</div>
								<!-- *** //e:.section - 경제/교양 *** -->
								<!-- *** s:.section - 유아동/실용 *** -->
								<div class="section ">
									<h3>
										<a href="#">유아동/실용</a>
									</h3>
									<div class="content">
										<ul class="list_main_best">
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788963057347&orderClick=sbd">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/347/l9788963057347.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="맷돌, 어이가 없네!" />
													</a>
												</div>
												<div class="category">[유아(0~7세)]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788963057347&orderClick=sbd"
														title="맷돌, 어이가 없네!"> <strong>맷돌, 어이가 없네!</strong>
													</a>
												</div>
												<div class="summary">전통문화를 그림책으로 만나다!</div>
												<div class="price">
													<strong>10,620원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788958204510&orderClick=sbd">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/510/l9788958204510.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="정원생활자(오경아의 정원학교 시리즈)" />
													</a>
												</div>
												<div class="category">[취미/실용/스포츠]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788958204510&orderClick=sbd"
														title="정원생활자(오경아의 정원학교 시리즈)"> <strong>정원생활자(오경아의
															정원학교 시리즈)</strong>
													</a>
												</div>
												<div class="summary">사계절을 아우르는 정원 이야기</div>
												<div class="price">
													<strong>16,200원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788926366028&orderClick=sbd">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/028/l9788926366028.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="백종원이 추천하는 집밥 메뉴 55" />
													</a>
												</div>
												<div class="category">[요리]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788926366028&orderClick=sbd"
														title="백종원이 추천하는 집밥 메뉴 55"> <strong>백종원이 추천하는
															집밥 메뉴 55</strong>
													</a>
												</div>
												<div class="summary">요리 초보자도 근사하게 집밥을!</div>
												<div class="price">
													<strong>8,910원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788952778437&orderClick=sbd">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/437/l9788952778437.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="스스로 마음을 지키는 아이" />
													</a>
												</div>
												<div class="category">[가정/육아]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788952778437&orderClick=sbd"
														title="스스로 마음을 지키는 아이"> <strong>스스로 마음을 지키는
															아이</strong>
													</a>
												</div>
												<div class="summary">100만 엄마들이 공감한 육아법</div>
												<div class="price">
													<strong>13,050원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
										</ul>
										<div class="btn_more">
											<a
												href="/newproduct/newTopicKorList.laf?mallGb=KOR&ejkGb=KOR&orderClick=sba"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
												alt="더보기" /></a>
										</div>
									</div>
								</div>
								<!-- *** //e:.section - 유아동/실용 *** -->
								<!-- *** s:.section - 어학/학습 *** -->
								<div class="section ">
									<h3>
										<a href="#">어학/학습</a>
									</h3>
									<div class="content">
										<ul class="list_main_best">
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791186656464&orderClick=sbe">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/464/l9791186656464.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="Smart 여행영어" />
													</a>
												</div>
												<div class="category">[외국어]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791186656464&orderClick=sbe"
														title="Smart 여행영어"> <strong>Smart 여행영어</strong>
													</a>
												</div>
												<div class="summary">여행지에서의 영어울렁증은 그만</div>
												<div class="price">
													<strong>10,800원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788959269600&orderClick=sbe">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/600/l9788959269600.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="형상기억 수학공식집 고1 수학(자이스토리)" />
													</a>
												</div>
												<div class="category">[중/고등참고서]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788959269600&orderClick=sbe"
														title="형상기억 수학공식집 고1 수학(자이스토리)"> <strong>형상기억
															수학공식집 고1 수학(자이스토리)</strong>
													</a>
												</div>
												<div class="summary">문제 + 정답 및 해설</div>
												<div class="price">
													<strong>7,200원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791161311579&orderClick=sbe">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/579/l9791161311579.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="전한길 한국사 포켓 암기노트" />
													</a>
												</div>
												<div class="category">[취업/수험서]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791161311579&orderClick=sbe"
														title="전한길 한국사 포켓 암기노트"> <strong>전한길 한국사 포켓
															암기노트</strong>
													</a>
												</div>
												<div class="summary">공무원 한국사 고득점 필독서!</div>
												<div class="price">
													<strong>7,000원</strong> <span>[0%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+0%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354237&orderClick=sbe">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/237/l9788967354237.jpg"
														onerror="javascript:noImage(this,'L','KOR');" alt="건축의 표정" />
													</a>
												</div>
												<div class="category">[기술/공학]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788967354237&orderClick=sbe"
														title="건축의 표정"> <strong>건축의 표정</strong>
													</a>
												</div>
												<div class="summary">영국의 우아한 도시 풍경</div>
												<div class="price">
													<strong>16,650원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
										</ul>
										<div class="btn_more">
											<a
												href="/newproduct/newTopicKorList.laf?mallGb=KOR&ejkGb=KOR&orderClick=sba"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
												alt="더보기" /></a>
										</div>
									</div>
								</div>
								<!-- *** //e:.section - 어학/학습 *** -->
							</div>
							<!-- *** //e:오늘의 책 *** -->
							<!-- *** s:오늘의 책 script *** -->
							<script type="text/javascript">
(function($){
	$('#newBook h3 a').bind('mouseover focus click',function(e){
		e.preventDefault();
		$(this).closest('.section').addClass('on').siblings().removeClass('on');
	});
	function newBookNext(){
		if( $('#newBook .section.on li:visible').last().next().size() )
			$('#newBook .section.on li:visible').hide().last().nextAll().slice(0,4).show();
		else
			$('#newBook .section.on li').hide().slice(0,4).show();
	}
	function newBookPrev(){
		var lastItem = parseInt( ( $('#newBook .section.on li').size() -1 ) /4 ) *4;
		if( $('#newBook .section.on li:visible').first().prev().size() )
			$('#newBook .section.on li:visible').hide().first().prevAll().slice(0,4).show();
		else
			$('#newBook .section.on li').hide().slice(lastItem,lastItem+4).show();
	}
	$('#newBook .btn_next').click(newBookNext);
	$('#newBook .btn_prev').click(newBookPrev);
})(jQuery);
</script>
							<!-- *** //e:오늘의 책 script *** -->

							<!-- *** //e:(자동화)새로나온 책 *** -->
						</div>
						<!-- //e:.main_left -->

						<!-- s:.main_right -->
						<div class="main_right">
							<!-- s:(고정)새로나온 책 우측 배너 -->
							<div class="ad_main03">
								<!-- 북맨의 서재 -->

								<iframe
									src="http://imac.kyobobook.co.kr/html/INK/ink_kuk_2016/ink_kuk_2016@kuk_05"
									width=193 height="340" title="배너광고" frameborder="0"
									scrolling="no" topmargin="0" leftmargin="0" marginwidth="0"
									marginheight="0"></iframe>
							</div>
							<!-- //e:(고정)새로나온 책 우측 배너 -->
						</div>
						<!-- //e:.main_right -->

						<!-- s:.main_left -->
						<div class="main_left">
							<!-- *** s:(자동화)예약판매 *** -->
							<!-- #####korwel_ReservationSale_START##### -->
							<!-- *** s:예약판매 *** -->
							<div class="box_main_advance" id="advanceSale">
								<h2 class="title_main_basic">
									<a
										href="http://www.kyobobook.co.kr/search/SearchKorbookMain.jsp?vPstrCategory=KOR&vPoutSearch=1&vPstrKeyWord=예약판매&orderClick=scg">예약판매</a>
								</h2>
								<div class="content">
									<ul class="list_main_advance">
										<li>
											<div class="cover">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788988388792&orderClick=scf">
													<img
													src="http://image.kyobobook.co.kr/images/book/large/792/l9788988388792.jpg"
													onerror="javascript:noImage(this,'L','KOR');"
													alt="1205일, 길바닥 여행" />
												</a>
											</div>
											<div class="category">[여행]</div>
											<div class="title">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788988388792&orderClick=scf">
													<strong>1205일, 길바닥 여행</strong>
												</a>
											</div>
											<div class="author">박수</div>
											<div class="price">
												<strong>14,400원</strong> <span>[10%<img
													src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
													alt="할인" />+5%<b title="적립">P</b>]
												</span>
											</div>
											<div class="info">
												이벤트 기간 : 2017.05.08~2017.05.19<br /> <a
													href="http://www.kyobobook.co.kr/prom/2017/pube/05/170512_trip.jsp">
													에코백 증정 </a>
											</div>
										</li>
										<li>
											<div class="cover">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788954645614&orderClick=scf">
													<img
													src="http://image.kyobobook.co.kr/images/book/large/614/l9788954645614.jpg"
													onerror="javascript:noImage(this,'L','KOR');" alt="오직 두 사람" />
												</a>
											</div>
											<div class="category">[소설]</div>
											<div class="title">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788954645614&orderClick=scf">
													<strong>오직 두 사람</strong>
												</a>
											</div>
											<div class="author">김영하</div>
											<div class="price">
												<strong>11,700원</strong> <span>[10%<img
													src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
													alt="할인" />+5%<b title="적립">P</b>]
												</span>
											</div>
											<div class="info">
												이벤트 기간 : 2017.05.16~2017.05.23<br /> <a
													href="http://www.kyobobook.co.kr/prom/2017/pube/05/170515_only.jsp">
													[김영하 A-Z] 책자 증정 </a>
											</div>
										</li>
									</ul>
									<div class="btn_more">
										<a
											href="http://www.kyobobook.co.kr/booktrend/booktrendMain.laf?orderClick=scg"><img
											src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
											alt="더보기" /></a>
									</div>
								</div>
							</div>
							<!-- *** //e:예약판매 *** -->
							<!-- *** s:예약판매 script *** -->
							<script type="text/javascript">
(function($){
	$('#advanceSale .list_main_advance li:even').addClass('odd');
	function advanceSaleNext(){
		if( $('#advanceSale .content li:visible').last().next().size() )
			$('#advanceSale .content li:visible').hide().last().nextAll().slice(0,2).show();
		else
			$('#advanceSale .content li').hide().slice(0,2).show();
	}
	function advanceSalePrev(){
		var lastItem = parseInt( ( $('#advanceSale .content li').size() -1 ) /2 ) *2;
		if( $('#advanceSale .content li:visible').first().prev().size() )
			$('#advanceSale .content li:visible').hide().first().prevAll().slice(0,2).show();
		else
			$('#advanceSale .content li').hide().slice(lastItem,lastItem+2).show();
	}
	$('#advanceSale .btn_next').click(advanceSaleNext);
	$('#advanceSale .btn_prev').click(advanceSalePrev);
})(jQuery);
</script>
							<!-- *** //e:예약판매 script *** -->

							<!-- *** //e:(자동화)예약판매 *** -->
						</div>
						<!-- //e:.main_left -->

						<!-- s:.main_right -->
						<div class="main_right">
							<!-- *** s:(자동화)전집 공동구매 *** -->
							<!-- #####korwel_GroupPurchase_START##### -->
							<!-- *** s:전집 공동구매 *** -->
							<div class="box_main_group" id="groupPurchase">
								<h2 class="title_main_basic">전집 정가인하</h2>
								<div class="content">
									<ul class="list_main_group">
										<li>
											<div class="cover">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788949109671&orderClick=s06">
													<img
													src="http://image.kyobobook.co.kr/images/book/large/671/l9788949109671.jpg"
													onerror="javascript:noImage(this,'L','KOR');"
													alt="비룡소 그림동화 베스트 세트(전50권)" />
												</a>
											</div>
											<div class="title">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788949109671&orderClick=s06">
													<strong>비룡소 그림동화 베스트 세트(전50권)</strong>
												</a>
											</div>
											<div class="price">
												<del>438,500원</del>
												→350,800원<br /> <strong>315,720원</strong>
											</div>
										</li>
										<li style="display: none;">
											<div class="cover">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788949124186&orderClick=s06">
													<img
													src="http://image.kyobobook.co.kr/images/book/large/186/l9788949124186.jpg"
													onerror="javascript:noImage(this,'L','KOR');"
													alt="셜록홈즈 1~7권 재정가 세트(전7권)" />
												</a>
											</div>
											<div class="title">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788949124186&orderClick=s06">
													<strong>셜록홈즈 1~7권 재정가 세트(전7권)</strong>
												</a>
											</div>
											<div class="price">
												<del>0원</del>
												→47,200원<br /> <strong>42,480원</strong>
											</div>
										</li>
										<li style="display: none;">
											<div class="cover">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=8809331290867&orderClick=s06">
													<img
													src="http://image.kyobobook.co.kr/images/book/large/867/l8809331290867.jpg"
													onerror="javascript:noImage(this,'L','KOR');"
													alt="돌잡이 명화 세트" />
												</a>
											</div>
											<div class="title">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=8809331290867&orderClick=s06">
													<strong>돌잡이 명화 세트</strong>
												</a>
											</div>
											<div class="price">
												<del>0원</del>
												→120,000원<br /> <strong>84,000원</strong>
											</div>
										</li>
									</ul>
									<div class="list_nav">
										<a href="#" class="btn_prev"><img
											src="http://image.kyobobook.co.kr/ink/images/welcome/btn_prev4.gif"
											alt="이전 상품" /></a> <strong class="this">1</strong>/<span
											class="total">3</span> <a href="#" class="btn_next"><img
											src="http://image.kyobobook.co.kr/ink/images/welcome/btn_next4.gif"
											alt="다음 상품" /></a>
									</div>
								</div>
							</div>
							<!-- *** //e:전집 공동구매 *** -->
							<!-- *** s:전집 공동구매 script *** -->
							<script type="text/javascript">
(function($){
	$('#groupPurchase .content').each(function(){
		$(this).find('.list_nav .btn_prev').click(function(e){
			e.preventDefault();
			if( $(this).closest('.content').find('li:visible').prev().size() )
				$(this).closest('.content').find('li:visible').hide().prev().show();
			else
				$(this).closest('.content').find('li').hide().last().show();
			$(this).closest('.content').find('.list_nav .this').text( $(this).closest('.content').find('li:visible').index() + 1 );
		});
		$(this).find('.list_nav .btn_next').click(function(e){
			e.preventDefault();
			if( $(this).closest('.content').find('li:visible').next().size() )
				$(this).closest('.content').find('li:visible').hide().next().show();
			else
				$(this).closest('.content').find('li').hide().first().show();
			$(this).closest('.content').find('.list_nav .this').text( $(this).closest('.content').find('li:visible').index() + 1 );
		});
		var total = $(this).find('li').size();
		var random = Math.floor(Math.random() * total);
		$(this).find('li').hide().eq(random).show();
		$(this).find('.list_nav .this').text( random + 1 );
	});
})(jQuery);
</script>
							<!-- *** //e:전집 공동구매 script *** -->

							<!-- *** //e:(자동화)전집 공동구매 *** -->
						</div>
						<!-- //e:.main_right -->

						<!-- s:.main_left -->
						<div class="main_left">
							<!-- *** s:(자동화)베스트셀러 *** -->
							<!-- #####korwel_BestSeller_START##### -->
							<!-- *** s:베스트셀러 *** -->
							<div class="box_main_best" id="bestSeller">
								<h2 class="title_main_basic">
									<a
										href="http://www.kyobobook.co.kr/bestseller/bestSeller.laf?mallGb=KOR&range=0&kind=1&orderClick=s11">베스트셀러</a>
								</h2>
								<!-- *** s:.section - 문학/인문 *** -->
								<div class="section first on">
									<h3>
										<a href="#">문학/인문</a>
									</h3>
									<div class="content">
										<ul class="list_main_best">
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788933870747&orderClick=s1a">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/747/l9788933870747.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="오두막(100쇄 특별판)(개정판)" />
													</a>
												</div>
												<div class="category">[소설]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788933870747&orderClick=s1a"
														title="오두막(100쇄 특별판)(개정판)"> <strong>오두막(100쇄
															특별판)(개정판)</strong>
													</a>
												</div>
												<div class="author">윌리엄 폴 영</div>
												<div class="price">
													<strong>12,420원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791195522125&orderClick=s1a">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/125/l9791195522125.jpg"
														onerror="javascript:noImage(this,'L','KOR');" alt="언어의 온도" />
													</a>
												</div>
												<div class="category">[시/에세이]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791195522125&orderClick=s1a"
														title="언어의 온도"> <strong>언어의 온도</strong>
													</a>
												</div>
												<div class="author">이기주</div>
												<div class="price">
													<strong>12,420원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788970655635&orderClick=s1a">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/635/l9788970655635.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="나는 뻔뻔하게 살기로 했다" />
													</a>
												</div>
												<div class="category">[인문]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788970655635&orderClick=s1a"
														title="나는 뻔뻔하게 살기로 했다"> <strong>나는 뻔뻔하게 살기로
															했다</strong>
													</a>
												</div>
												<div class="author">데이비드 시버리</div>
												<div class="price">
													<strong>12,420원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791161565873&orderClick=s1a">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/873/l9791161565873.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="문재인의 운명" />
													</a>
												</div>
												<div class="category">[정치/사회]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791161565873&orderClick=s1a"
														title="문재인의 운명"> <strong>문재인의 운명</strong>
													</a>
												</div>
												<div class="author">문재인</div>
												<div class="price">
													<strong>13,500원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
										</ul>
										<div class="btn_more">
											<a
												href="http://www.kyobobook.co.kr/bestseller/bestSeller.laf?mallGb=KOR&range=0&kind=0&orderClick=s11"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
												alt="더보기" /></a>
										</div>
									</div>
								</div>
								<!-- *** //e:.section - 문학/인문 *** -->
								<!-- *** s:.section - 경제/교양 *** -->
								<div class="section ">
									<h3>
										<a href="#">경제/교양</a>
									</h3>
									<div class="content">
										<ul class="list_main_best">
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060849&orderClick=s1b">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/849/l9791157060849.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="경제, 알아야 바꾼다" />
													</a>
												</div>
												<div class="category">[경제/경영]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157060849&orderClick=s1b"
														title="경제, 알아야 바꾼다"> <strong>경제, 알아야 바꾼다</strong>
													</a>
												</div>
												<div class="author">주진형</div>
												<div class="price">
													<strong>13,500원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791158510619&orderClick=s1b">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/619/l9791158510619.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="타이탄의 도구들" />
													</a>
												</div>
												<div class="category">[자기계발]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791158510619&orderClick=s1b"
														title="타이탄의 도구들"> <strong>타이탄의 도구들</strong>
													</a>
												</div>
												<div class="author">팀 페리스</div>
												<div class="price">
													<strong>13,500원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791160800272&orderClick=s1b">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/272/l9791160800272.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="주경철의 유럽인 이야기. 1" />
													</a>
												</div>
												<div class="category">[역사/문화]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791160800272&orderClick=s1b"
														title="주경철의 유럽인 이야기. 1"> <strong>주경철의 유럽인
															이야기. 1</strong>
													</a>
												</div>
												<div class="author">주경철</div>
												<div class="price">
													<strong>16,200원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788925561493&orderClick=s1b">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/493/l9788925561493.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="우주, 시간, 그 너머" />
													</a>
												</div>
												<div class="category">[과학]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788925561493&orderClick=s1b"
														title="우주, 시간, 그 너머"> <strong>우주, 시간, 그 너머</strong>
													</a>
												</div>
												<div class="author">크리스토프 갈파르</div>
												<div class="price">
													<strong>16,200원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
										</ul>
										<div class="btn_more">
											<a
												href="http://www.kyobobook.co.kr/bestseller/bestSeller.laf?mallGb=KOR&range=0&kind=0&orderClick=s11"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
												alt="더보기" /></a>
										</div>
									</div>
								</div>
								<!-- *** //e:.section - 경제/교양 *** -->
								<!-- *** s:.section - 유아동/실용 *** -->
								<div class="section ">
									<h3>
										<a href="#">유아동/실용</a>
									</h3>
									<div class="content">
										<ul class="list_main_best">
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788936447014&orderClick=s1c">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/014/l9788936447014.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="아홉 살 마음 사전" />
													</a>
												</div>
												<div class="category">[어린이(초등)]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788936447014&orderClick=s1c"
														title="아홉 살 마음 사전"> <strong>아홉 살 마음 사전</strong>
													</a>
												</div>
												<div class="author">박성우</div>
												<div class="price">
													<strong>9,900원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791158360375&orderClick=s1c">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/375/l9791158360375.jpg"
														onerror="javascript:noImage(this,'L','KOR');" alt="알사탕" />
													</a>
												</div>
												<div class="category">[유아(0~7세)]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791158360375&orderClick=s1c"
														title="알사탕"> <strong>알사탕</strong>
													</a>
												</div>
												<div class="author">백희나</div>
												<div class="price">
													<strong>10,800원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791196082000&orderClick=s1c">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/000/l9791196082000.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="근막 스트레칭(도어북 녹색건강 시리즈 6)" />
													</a>
												</div>
												<div class="category">[건강]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791196082000&orderClick=s1c"
														title="근막 스트레칭(도어북 녹색건강 시리즈 6)"> <strong>근막
															스트레칭(도어북 녹색건강 시리즈 6)</strong>
													</a>
												</div>
												<div class="author">코이데 토모히로</div>
												<div class="price">
													<strong>11,700원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788915102019&orderClick=s1c">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/019/l9788915102019.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="임신 출산 육아 대백과(2017)" />
													</a>
												</div>
												<div class="category">[가정/육아]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788915102019&orderClick=s1c"
														title="임신 출산 육아 대백과(2017)"> <strong>임신 출산 육아
															대백과(2017)</strong>
													</a>
												</div>
												<div class="author">삼성출판사 편집부</div>
												<div class="price">
													<strong>16,650원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li style="display: none">
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791133444670&orderClick=s1c">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/670/l9791133444670.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="프로야구 스카우팅 리포트 2017(한정판)" />
													</a>
												</div>
												<div class="category">[취미/실용/스포츠]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791133444670&orderClick=s1c"
														title="프로야구 스카우팅 리포트 2017(한정판)"> <strong>프로야구
															스카우팅 리포트 2017(한정판)</strong>
													</a>
												</div>
												<div class="author">유효상</div>
												<div class="price">
													<strong>24,300원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li style="display: none">
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788972219804&orderClick=s1c">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/804/l9788972219804.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="5분 강아지, 고양이 스케치 세트(전2권)" />
													</a>
												</div>
												<div class="category">[예술/대중문화]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788972219804&orderClick=s1c"
														title="5분 강아지, 고양이 스케치 세트(전2권)"> <strong>5분
															강아지, 고양이 스케치 세트(전2권)</strong>
													</a>
												</div>
												<div class="author">김충원</div>
												<div class="price">
													<strong>16,200원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li style="display: none">
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791186978665&orderClick=s1c">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/665/l9791186978665.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="소유진의 엄마도 아이도 즐거운 이유식" />
													</a>
												</div>
												<div class="category">[요리]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791186978665&orderClick=s1c"
														title="소유진의 엄마도 아이도 즐거운 이유식"> <strong>소유진의
															엄마도 아이도 즐거운 이유식</strong>
													</a>
												</div>
												<div class="author">소유진</div>
												<div class="price">
													<strong>15,750원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li style="display: none">
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791188008018&orderClick=s1c">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/018/l9791188008018.jpg"
														onerror="javascript:noImage(this,'L','KOR');" alt="라면의 정수" />
													</a>
												</div>
												<div class="category">[만화]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791188008018&orderClick=s1c"
														title="라면의 정수"> <strong>라면의 정수</strong>
													</a>
												</div>
												<div class="author">최보윤</div>
												<div class="price">
													<strong>11,250원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
										</ul>
										<button type="button" class="btn_prev">
											<img
												src="http://image.kyobobook.co.kr/ink/images/welcome/btn_prev.gif"
												alt="이전 상품" />
										</button>
										<button type="button" class="btn_next">
											<img
												src="http://image.kyobobook.co.kr/ink/images/welcome/btn_next.gif"
												alt="다음 상품" />
										</button>
										<div class="btn_more">
											<a
												href="http://www.kyobobook.co.kr/bestseller/bestSeller.laf?mallGb=KOR&range=0&kind=0&orderClick=s11"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
												alt="더보기" /></a>
										</div>
									</div>
								</div>
								<!-- *** //e:.section - 유아동/실용 *** -->
								<!-- *** s:.section - 어학/학습 *** -->
								<div class="section ">
									<h3>
										<a href="#">어학/학습</a>
									</h3>
									<div class="content">
										<ul class="list_main_best">
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157523399&orderClick=s1d">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/399/l9791157523399.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="영어회화 100일의 기적" />
													</a>
												</div>
												<div class="category">[외국어]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157523399&orderClick=s1d"
														title="영어회화 100일의 기적"> <strong>영어회화 100일의 기적</strong>
													</a>
												</div>
												<div class="author">문성현</div>
												<div class="price">
													<strong>12,150원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788954741637&orderClick=s1d">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/637/l9788954741637.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="고등 영어영역 영어(2018 수능)(EBS 수능특강)" />
													</a>
												</div>
												<div class="category">[중/고등참고서]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788954741637&orderClick=s1d"
														title="고등 영어영역 영어(2018 수능)(EBS 수능특강)"> <strong>고등
															영어영역 영어(2018 수능)(EBS 수능특강)</strong>
													</a>
												</div>
												<div class="author">EBS한국교육방송공사 편집부</div>
												<div class="price">
													<strong>6,750원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+1%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791161310442&orderClick=s1d">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/442/l9791161310442.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="선재국어 나침판 실전모의고사 vol. 2(2017)(4판)" />
													</a>
												</div>
												<div class="category">[취업/수험서]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791161310442&orderClick=s1d"
														title="선재국어 나침판 실전모의고사 vol. 2(2017)(4판)"> <strong>선재국어
															나침판 실전모의고사 vol. 2(2017)(4판)</strong>
													</a>
												</div>
												<div class="author">이선재</div>
												<div class="price">
													<strong>19,000원</strong> <span>[0%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+0%<b title="적립">P</b>]
													</span>
												</div>
											</li>
											<li>
												<div class="cover">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788926152669&orderClick=s1d">
														<img
														src="http://image.kyobobook.co.kr/images/book/large/669/l9788926152669.jpg"
														onerror="javascript:noImage(this,'L','KOR');"
														alt="초등 수학 6-2(2017)(최상위)" />
													</a>
												</div>
												<div class="category">[초등참고서]</div>
												<div class="title">
													<a
														href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788926152669&orderClick=s1d"
														title="초등 수학 6-2(2017)(최상위)"> <strong>초등 수학
															6-2(2017)(최상위)</strong>
													</a>
												</div>
												<div class="author">디딤돌 편집부</div>
												<div class="price">
													<strong>12,600원</strong> <span>[10%<img
														src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
														alt="할인" />+5%<b title="적립">P</b>]
													</span>
												</div>
											</li>
										</ul>
										<div class="btn_more">
											<a
												href="http://www.kyobobook.co.kr/bestseller/bestSeller.laf?mallGb=KOR&range=0&kind=0&orderClick=s11"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
												alt="더보기" /></a>
										</div>
									</div>
								</div>
								<!-- *** //e:.section - 어학/학습 *** -->
							</div>
							<!-- *** //e:베스트셀러 *** -->
							<!-- *** s:베스트셀러 script *** -->
							<script type="text/javascript">
(function($){
	$('#bestSeller h3 a').bind('mouseover focus click',function(e){
		e.preventDefault();
		$(this).closest('.section').addClass('on').siblings().removeClass('on');
	});
	function bestSellerNext(){
		if( $('#bestSeller .section.on li:visible').last().next().size() )
			$('#bestSeller .section.on li:visible').hide().last().nextAll().slice(0,4).show();
		else
			$('#bestSeller .section.on li').hide().slice(0,4).show();
	}
	function bestSellerPrev(){
		var lastItem = parseInt( ( $('#bestSeller .section.on li').size() -1 ) /4 ) *4;
		if( $('#bestSeller .section.on li:visible').first().prev().size() )
			$('#bestSeller .section.on li:visible').hide().first().prevAll().slice(0,4).show();
		else
			$('#bestSeller .section.on li').hide().slice(lastItem,lastItem+4).show();
	}
	$('#bestSeller .btn_next').click(bestSellerNext);
	$('#bestSeller .btn_prev').click(bestSellerPrev);
})(jQuery);
</script>
							<!-- *** //e:베스트셀러 script *** -->

							<!-- *** //e:(자동화)베스트셀러 *** -->
						</div>
						<!-- //e:.main_left -->

						<!-- s:.main_right -->
						<div class="main_right">
							<!-- *** s:(자동화)더드림 *** -->
							<!-- #####korwel_FreeGift_START##### -->
							<!-- *** s:이벤트 *** -->
							<div class="box_main_gift" id="freeGift">
								<h2 class="title_main_basic">이벤트</h2>
								<div class="content">
									<ul class="list_main_gift">
										<li>
											<div class="cover">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788933870747&orderClick=s13">
													<img
													src="http://image.kyobobook.co.kr/images/book/large/747/l9788933870747.jpg"
													onerror="javascript:noImage(this,'L','KOR');"
													alt="오두막(100쇄 특별판)(개정판)" />
												</a>
											</div>
											<div class="category">[소설]</div>
											<div class="title">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788933870747&orderClick=s13">
													<strong>오두막(100쇄 특별판)(개정판)</strong>
												</a>
											</div>
											<div class="price">
												<strong>12,420원</strong> <span>[10%<img
													src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
													alt="할인" />+5%<b title="적립">P</b>]
												</span>
											</div>
											<div class="info">
												2017년 06월 15일 까지<br /> <a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=70561">
													마이 보틀 증정 </a>
											</div>
										</li>
										<li style="display: none;">
											<div class="cover">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791195677313&orderClick=s13">
													<img
													src="http://image.kyobobook.co.kr/images/book/large/313/l9791195677313.jpg"
													onerror="javascript:noImage(this,'L','KOR');" alt="콧물끼리" />
												</a>
											</div>
											<div class="category">[유아(0~7세)]</div>
											<div class="title">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791195677313&orderClick=s13">
													<strong>콧물끼리</strong>
												</a>
											</div>
											<div class="price">
												<strong>10,800원</strong> <span>[10%<img
													src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
													alt="할인" />+5%<b title="적립">P</b>]
												</span>
											</div>
											<div class="info">
												2017년 06월 14일 까지<br /> <a
													href="http://www.kyobobook.co.kr/prom/2017/pube/05/170512_snot.jsp">
													키재기자 증정 </a>
											</div>
										</li>
										<li style="display: none;">
											<div class="cover">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157523399&orderClick=s13">
													<img
													src="http://image.kyobobook.co.kr/images/book/large/399/l9791157523399.jpg"
													onerror="javascript:noImage(this,'L','KOR');"
													alt="영어회화 100일의 기적" />
												</a>
											</div>
											<div class="category">[외국어]</div>
											<div class="title">
												<a
													href="http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791157523399&orderClick=s13">
													<strong>영어회화 100일의 기적</strong>
												</a>
											</div>
											<div class="price">
												<strong>12,150원</strong> <span>[10%<img
													src="http://image.kyobobook.co.kr/ink/images/common/icon_down04.gif"
													alt="할인" />+5%<b title="적립">P</b>]
												</span>
											</div>
											<div class="info">
												2017년 05월 31일 까지<br /> <a
													href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32623&classGb=KOR">
													펜슬 케이스 증정 </a>
											</div>
										</li>
									</ul>
									<div class="list_nav">
										<a href="#" class="btn_prev"><img
											src="http://image.kyobobook.co.kr/ink/images/welcome/btn_prev4.gif"
											alt="이전 상품" /></a> <strong class="this">1</strong>/<span
											class="total">3</span> <a href="#" class="btn_next"><img
											src="http://image.kyobobook.co.kr/ink/images/welcome/btn_next4.gif"
											alt="다음 상품" /></a>
									</div>
								</div>
							</div>
							<!-- *** //e:이벤트 *** -->
							<!-- *** s:이벤트 script *** -->
							<script type="text/javascript">
(function($){
	$('#freeGift .content').each(function(){
		$(this).find('.list_nav .btn_prev').click(function(e){
			e.preventDefault();
			if( $(this).closest('.content').find('li:visible').prev().size() )
				$(this).closest('.content').find('li:visible').hide().prev().show();
			else
				$(this).closest('.content').find('li').hide().last().show();
			$(this).closest('.content').find('.list_nav .this').text( $(this).closest('.content').find('li:visible').index() + 1 );
		});
		$(this).find('.list_nav .btn_next').click(function(e){
			e.preventDefault();
			if( $(this).closest('.content').find('li:visible').next().size() )
				$(this).closest('.content').find('li:visible').hide().next().show();
			else
				$(this).closest('.content').find('li').hide().first().show();
			$(this).closest('.content').find('.list_nav .this').text( $(this).closest('.content').find('li:visible').index() + 1 );
		});
		var total = $(this).find('li').size();
		var random = Math.floor(Math.random() * total);
		$(this).find('li').hide().eq(random).show();
		$(this).find('.list_nav .this').text( random + 1 );
	});
})(jQuery)
</script>
							<!-- *** //e:이벤트 script *** -->

							<!-- *** //e:(자동화)더드림 *** -->
						</div>
						<!-- //e:.main_right -->




						<!-- s:.main_both -->
						<div class="main_both">
							<!-- *** s:(자동화)이벤트 *** -->
							<!-- #####korwel_ShoppingChance_START##### -->
							<!-- *** s:이벤트 *** -->
							<div class="box_main_banner">
								<h2 class="title_main_basic">
									<a
										href="http://www.kyobobook.co.kr/event/eventMain.laf?orderClick=s15">이벤트</a>
								</h2>
								<div class="content">
									<ul class="list_main_banner">
										<li><a
											href="http://www.kyobobook.co.kr/prom/2017/pube/05/170515_only.jsp?orderClick=s14"
											alt="김영하 예약 판매"> <img
												src="http://image.kyobobook.co.kr//ink/images/prom/2017/banner/showcase/170515/bnEB_35.jpg"
												onerror="javascript:noImage(this,'M','');" alt="김영하 예약 판매" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/prom/2017/pube/03/170307_usual.jsp?orderClick=s14"
											alt="보통의 존재 블랙에디션"> <img
												src="http://image.kyobobook.co.kr//ink/images/prom/2017/banner/showcase/170307/bnEB_01.jpg"
												onerror="javascript:noImage(this,'M','');"
												alt="보통의 존재 블랙에디션" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=70466&orderClick=s14"
											alt="호모 데우스"> <img
												src="http://image.kyobobook.co.kr//ink/images/prom/2017/banner/showcase/170428/bnEB_14.jpg"
												onerror="javascript:noImage(this,'M','');" alt="호모 데우스" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventPid=32398&classGb=KOR&PRE=Y&orderClick=s14"
											alt="이달의 신간"> <img
												src="http://image.kyobobook.co.kr//ink/images/prom/2017/book/170317_new/bnD_04.jpg"
												onerror="javascript:noImage(this,'M','');" alt="이달의 신간" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/prom/2017/book/170427_SchoolOfLife.jsp?orderClick=s14"
											alt="인생학교 365 합정"> <img
												src="http://image.kyobobook.co.kr/ink/images/prom/2017/general/schoollife/170427/bnN_04.jpg"
												onerror="javascript:noImage(this,'M','');" alt="인생학교 365 합정" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr//prom/2016/book/160721_kinfolk.jsp?orderClick=s14"
											alt="킨포크"> <img
												src="http://image.kyobobook.co.kr/ink/images/prom/2016/book/160721_kinfolk/bnF_05.jpg"
												onerror="javascript:noImage(this,'M','');" alt="킨포크" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/prom/2017/pube/05/170508_kingdom.jsp?orderClick=s14"
											alt="찾아라 동물왕국 출간이벤트"> <img
												src="http://image.kyobobook.co.kr/ink/images/prom/2017/banner/showcase/170508/bnEB_06.jpg"
												onerror="javascript:noImage(this,'M','');"
												alt="찾아라 동물왕국 출간이벤트" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/prom/2017/pube/02/170209_danang.jsp?orderClick=s14"
											alt="다낭 홀리데이"> <img
												src="http://image.kyobobook.co.kr/ink/images/prom/2017/banner/170214/bnL_27.jpg"
												onerror="javascript:noImage(this,'M','');" alt="다낭 홀리데이" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=69387&classGb=KOR&orderClick=s14"
											alt="ETS TOEIC VOCA(토익 보카)"> <img
												src="http://image.kyobobook.co.kr/ink/images/prom/2017/banner/showcase/170222/bnEB_15.jpg"
												onerror="javascript:noImage(this,'M','');"
												alt="ETS TOEIC VOCA(토익 보카)" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/event/eventEngViewByPid.laf?eventPid=22930&classGb=JAP&PRE=Y&orderClick=s14"
											alt="[일서]번역서VS원서"> <img
												src="http://image.kyobobook.co.kr/ink/images/prom/2017/banner/170214/bnL_03.gif"
												onerror="javascript:noImage(this,'M','');" alt="[일서]번역서VS원서" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/eventRenewal/eventViewByPid.laf?eventId=70475&classGb=KOR&orderClick=s14"
											alt="공무원 교재선택 GUIDE"> <img
												src="http://image.kyobobook.co.kr/ink/images/prom/2017/book/170428_bestseller/bnD_04.jpg"
												onerror="javascript:noImage(this,'M','');"
												alt="공무원 교재선택 GUIDE" />
										</a></li>
										<li><a
											href="http://www.kyobobook.co.kr/prom/2017/book/170209_event.jsp?orderClick=s14"
											alt="초중고 학습서 신학기 이벤트"> <img
												src="http://image.kyobobook.co.kr/ink/images/prom/2017/banner/170214/bnL_30.jpg"
												onerror="javascript:noImage(this,'M','');"
												alt="초중고 학습서 신학기 이벤트" />
										</a></li>
									</ul>
									<div class="btn_more">
										<a
											href="http://www.kyobobook.co.kr/event/eventKorMain.laf?linkClass=all&orderClick=s15"><img
											src="http://image.kyobobook.co.kr/ink/images/common/btn_more.gif"
											alt="더보기" /></a>
									</div>
								</div>
							</div>
							<!-- *** //e:이벤트 *** -->

							<!-- *** //e:(자동화)이벤트 *** -->
						</div>
						<!-- //e:.main_both -->

					</div>
					<!-- //e:#main_contents -->

					<!-- //e:웰컴 자동화 컨텐츠 끝 -->
				</div>
				<!-- //e:.content_middle -->
			</div>
			<!-- //e:#Container -->


		</div>









































		<script type="text/javascript">
(function($){
	// 닫기태그 오류 대안
	if( $('#wrap #footer').size() ){
		document.write('</div></div>');
		$('#wrap #footer').remove();
	}
	// 웹접근성: LNB 있는 페이지 본문바로가기
	if( $('#myroom_contents').size() )
		$('#skip_to_content a').eq(0).attr('href','#myroom_contents');
	if( $('#recommend_contents').size() )
		$('#skip_to_content a').eq(0).attr('href','#recommend_contents');
	if( $('#pubevent_contents').size() )
		$('#skip_to_content a').eq(0).attr('href','#pubevent_contents');
})(jQuery);
</script>

		<style type="text/css">
html {
	background: none !important;
}

#footer {
	margin-top: 70px;
	background: #f5f5f5
		url('http://image.kyobobook.co.kr/ink/images/common/bg_footer3.gif') 0
		0 repeat-x;
	*position: relative;
}

#footer .footer_con {
	width: 950px;
	margin: 0 auto;
	padding: 0 30px 30px;
	background:
		url('http://image.kyobobook.co.kr/ink/images/common/bg_footer3.gif') 0
		0 repeat-x;
	color: #666;
	*zoom: 1;
}

#footer .footer_con:after {
	content: '';
	display: block;
	clear: both;
}

#footer .footer_con .logo_area {
	clear: both;
	padding-top: 21px;
}

#footer .footer_con .shortcut_list {
	float: right;
	width: 150px;
	height: 44px;
}

#footer .footer_con .shortcut_list .btn_open {
	padding-top: 15px;
	padding-bottom: 13px;
	border: 1px solid #6d6d6d;
	background: #6d6d6d
		url('http://image.kyobobook.co.kr/ink/images/common/arr_shortcut2.png')
		no-repeat right 0;
	color: #fff;
	font-weight: bold;
	padding-right: 27px;
	text-align: center;
	text-transform: uppercase;
}

#footer .footer_con .shortcut_list ul {
	bottom: 43px;
}

#footer .footer_con .shortcut_open .btn_open {
	background-position: right -44px;
}

#footer .footer_con .member_area {
	float: left;
	height: 44px;
	width: 800px;
	background-color: #8b8b8b;
	line-height: 15px;
}

#footer .footer_con .member_area li {
	float: left;
	padding: 16px 14px 0 15px;
	height: 28px;
	text-align: center;
	background:
		url('http://image.kyobobook.co.kr/ink/images/common/line_footer.gif')
		no-repeat left center;
}

#footer .footer_con .member_area li:first-child {
	background-image: none;
	padding-left: 14px;
}

#footer .footer_con .member_area a {
	text-decoration: none;
	color: #f1f0f0;
}

#footer .footer_con .member_area a:hover {
	text-decoration: underline;
	color: #fff;
}

#footer .footer_con .click_footer {
	float: left;
	width: 460px;
	margin: 18px 0 0 0;
}

#footer .footer_con .click_footer address {
	font-size: 11px;
	line-height: 18px;
}

#footer .footer_con .click_footer address a {
	text-decoration: underline;
	color: #666;
}

#footer .footer_con .click_footer address a:hover {
	text-decoration: underline;
	color: #3c5fe1;
}

#footer .footer_con .click_footer address .copy {
	margin-top: 10px;
}

#footer .footer_con .lg_area {
	float: right;
	width: 460px;
	font-size: 11px;
	line-height: 18px;
	margin: 18px 0 0 20px;
}

#footer .footer_con .lg_area p {
	font-size: 11px;
	line-height: 18px;
	color: #666;
}

#footer .footer_con .lg_area a:link {
	text-decoration: underline;
	color: #666;
}

#footer .footer_con .lg_area a:hover {
	text-decoration: underline;
	color: #3c5fe1;
}

#footer .footer_con .mark_isms {
	float: right;
	width: 460px;
	margin-top: 10px;
}

#footer .footer_con .mark_isms a {
	display: inline-block;
	padding: 10px 0 0 52px;
	height: 38px;
	font-size: 11px;
	line-height: 15px;
	color: #666;
	background:
		url('http://image.kyobobook.co.kr/ink/images/common/mark_isms.png')
		no-repeat 0 0;
}

/* 기프트 */
#footer .footer_con .click_footer address {
	float: none;
	padding-left: 0;
}
/* PubPle */
#footer {
	height: auto;
}
</style>

		<div id="footer">
			<div class="footer_con">
				<ul class="member_area">
					<li><a
						href="http://www.kyobobook.co.kr/company/intro.laf?orderClick=rXa">회사소개</a></li>
					<li><a
						href="http://www.kyobobook.co.kr/contents/provision.laf?orderClick=rXc">이용약관</a></li>
					<li><a
						href="http://www.kyobobook.co.kr/contents/privacyPolicy.laf?orderClick=rXd"><strong>개인정보처리방침</strong></a></li>
					<li><a
						href="http://www.kyobobook.co.kr/guidePublisher/intro.laf?orderClick=rXf">협력사여러분</a></li>
					<li><a
						href="http://www.kyobobook.co.kr/cooper/cooperInfoRegistration.laf?orderClick=rXi">제휴</a>&middot;<a
						href="http://www.kyobobook.co.kr/cooper/bookInfoRegistration.laf?orderClick=rXh">도서홍보</a></li>
					<li><a href="http://adcenter.kyobobook.co.kr/?orderClick=rXg">광고센터</a></li>
					<li><a
						href="https://ehr.kyobobook.co.kr/recr/recruit_system_1.jsp?orderClick=rXb"
						target="_blank">채용정보</a></li>
					<li><a
						href="http://www.kyobobook.co.kr/contents/sitemap.jsp?orderClick=rXm">서비스
							전체보기</a></li>
					<!--
				<li><a href="http://www.kyobobook.co.kr/event/memberBenefit.laf?orderClick=rXe">회원혜택</a></li>
				<li><a href="http://www.kyobobook.co.kr/contents/refusalEmail.laf?orderClick=rXl">이메일무단수집거부</a></li>
-->
				</ul>










				<style type="text/css">
.shortcut_list {
	position: relative;
	width: 133px;
	height: 20px;
	text-align: left;
}

.shortcut_list .btn_open {
	border: 1px solid #707070;
	background: #fff
		url('http://image.kyobobook.co.kr/ink/images/common/arr_shortcut.png')
		no-repeat right 0;
}

.shortcut_list a {
	display: block;
	height: 14px;
	padding: 3px 4px 1px;
	font: 12px/14px / dotum;
	color: #666;
	background-color: #fff;
	text-decoration: none;
}

.shortcut_list a:hover {
	color: #666;
}

.shortcut_list ul {
	display: none;
	position: absolute;
	z-index: 1000;
	left: 0;
	right: 0;
	bottom: 19px;
	_width: 131px;
	border: 1px solid #707070;
	background-color: #fff;
}

.shortcut_list ul li {
	
}

.shortcut_list ul li.on a, .shortcut_list ul li a:hover, .shortcut_list ul li a:active,
	.shortcut_list ul li a:focus {
	background-color: #dedede;
	color: #212121;
}

.shortcut_top ul {
	top: 0;
	bottom: auto;
}

.shortcut_top .btn_open {
	background-position: right -20px;
}

.shortcut_top ul {
	top: 19px;
	bottom: auto;
}

.shortcut_top.shortcut_open .btn_open {
	background-position: right 0;
}

.shortcut_open .btn_open {
	background-position: right -20px;
}

.shortcut_open ul {
	display: block;
}

.shortcut_auto {
	display: inline-block;
	width: auto;
	*display: inline;
	*zoom: 1;
}

.shortcut_auto .btn_open {
	padding-right: 20px;
}

#footer .footer_con .shortcut_list { /*margin-top:15px;*/
	
}

#comp_footer .con_footer .shortcut_list, #store_footer .con_footer .shortcut_list
	{
	position: absolute;
	right: 0;
	top: 34px;
}

.ink-search #footer .shortcut_list .btn_open {
	width: 116px;
}
</style>

				<div class="shortcut_list">
					<a href="#" class="btn_open">Family Site</a>
					<ul>
						<li><a href="http://www.kyobo.co.kr" target="_blank"
							title="새 창 열림">교보생명</a></li>
						<li><a href="http://www.kyobotrade.com" target="_blank"
							title="새 창 열림">교보증권</a></li>
						<li><a href="http://www.kico.co.kr" target="_blank"
							title="새 창 열림">교보정보통신</a></li>
						<li><a href="http://www.kyobobldg.co.kr" target="_blank"
							title="새 창 열림">교보리얼코</a></li>
						<li><a href="http://www.kyoboitm.co.kr" target="_blank"
							title="새 창 열림">교보악사자산운용</a></li>
						<li><a href="http://www.lifeplanet.co.kr" target="_blank"
							title="새 창 열림">교보라이프플래닛생명</a></li>
						<li><a href="http://www.kcasonsa.co.kr" target="_blank"
							title="새 창 열림">KCA 손해사정</a></li>
						<li><a href="http://www.sbnet.co.kr" target="_blank"
							title="새 창 열림">생보부동산신탁</a></li>
						<li><a href="http://www.daesan.or.kr" target="_blank"
							title="새 창 열림">대산문화재단</a></li>
						<li><a href="http://www.kbedu.or.kr" target="_blank"
							title="새 창 열림">교보교육재단</a></li>
						<li><a href="http://www.dsa.or.kr" target="_blank"
							title="새 창 열림">대산농촌문화재단</a></li>
						<li><a href="http://info.hottracks.co.kr/company/main"
							target="_blank" title="새 창 열림">핫트랙스</a></li>
						<li><a href="http://www.kyoboacademy.co.kr" target="_blank"
							title="새 창 열림">교보아카데미</a></li>

						<!-- <li><a href="http://www.andamc.com" target="_blank" title="새 창 열림">A&amp;D신용정보</a></li> -->
						<!-- <li><a href="http://www.readingcoach.co.kr" target="_blank" title="새 창 열림">독서코칭센터</a></li> -->
					</ul>
				</div>

				<script type="text/javascript">
(function($){
	$('.shortcut_list .btn_open').click(function(e){
		e.preventDefault();
		$(this).parent().toggleClass('shortcut_open');
	});
	$('.shortcut_list a').hover(
		function(){$(this).addClass('hover');},
		function(){$(this).removeClass('hover');}
	).focus(
		function(){$(this).addClass('focus');}
	).blur(
		function(){$(this).removeClass('focus');}
	);
	$('.shortcut_list ul a').click(
		function(){$(this).closest('.shortcut_list').removeClass('shortcut_open');}
	);
	$('body').click(function(){
		$('.shortcut_list').each(function(){
			if( !$(this).find('.focus').size() && !$(this).find('.hover').size() ){
				$(this).removeClass('shortcut_open');
			}
		});
	});
})(jQuery);
</script>


				<div class="logo_area">
					<img
						src="http://image.kyobobook.co.kr/ink/images/common/logo_footer.png"
						alt="KYOBO 교보문고" />
				</div>
				<div class="click_footer">
					<address>
						㈜ 교보문고 &nbsp; 서울시 종로구 종로 1 &nbsp; 대표이사 : 이한우<br /> 사업자등록번호 :
						102-81-11670<br /> 대표전화 : 1544-1900 (발신자 부담전화) &nbsp; 팩스 :
						0502-987-5711 (지역번호공통)<br /> 서울특별시 통신판매업신고번호 : 제 653호 ▶<a
							href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp"
							target="_blank" title="새 창 열림">사업자정보확인</a><br /> 개인정보보호최고책임자 :
						한상훈 <a href="mailto:privacy@kyobobook.co.kr">privacy@kyobobook.co.kr</a><br />
						<div class="copy">
							COPYRIGHT(C) <strong>KYOBO BOOK CENTRE</strong> ALL RIGHTS
							RESERVED.
						</div>
					</address>
				</div>
				<div class="lg_area">
					<p>
						LG U+ 구매안전서비스 &nbsp; ▶<a
							href="http://www.kyobobook.co.kr/prom/EscrowJoinConfirm.jsp?orderClick=rXn"
							onclick="window.open(this.href,'lguplus','scrollbars=yes,width=358,height=278');return false;"
							title="새 창 열림">서비스 가입 확인</a><br /> 고객님은 안전거래를 위해 현금 등으로 결제시 저희
						쇼핑몰에서 가입한 LG유플러스의 구매안전서비스를 이용하실 수 있습니다.
					</p>
				</div>
				<div class="mark_isms">
					<a href="http://www.kyobobook.co.kr/prom/markISMS.jsp"
						onclick="window.open(this.href,'mark_isms','width=600,height=855');return false;">정보보호관리체계<br />
						ISMS 인증획득
					</a>
				</div>
			</div>
		</div>
		<script type="text/javascript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
	window.open(theURL,winName,features);
}
</script>



		<!-- s:퀵메뉴 영역 -->

































		<!-- 퀵메뉴 -->
		<style type="text/css">
#quick_menu2 {
	position: absolute;
	left: 0;
	right: 0;
	top: 268px;
	z-index: 9999;
	min-width: 1010px;
	height: 0;
	background-color: transparent;
}

#quick_menu2 .quick_label {
	font-size: 0;
	color: transparent;
	position: absolute;
	visibility: hidden;
}

#quick_menu2 .quick_contents {
	position: absolute;
	top: 0;
	left: 50%;
	margin-left: 500px;
	width: 63px;
}

#quick_menu2 .btn_quick_open {
	
}

#quick_menu2 .btn_quick_open a {
	position: relative;
	display: block;
	height: 50px;
	font-size: 0;
	color: transparent;
	background: #5e6b9e
		url('http://image.kyobobook.co.kr/ink/images/gnb/nav6_btn_sprite.png')
		no-repeat -103px 13px;
	border: 1px solid #5e6b9e;
	border-width: 0 1px;
	transition: all 0.2s;
}

#quick_menu2 .btn_quick_open a small {
	position: absolute;
	left: 34px;
	top: 11px;
	font-weight: bold;
	display: inline-block;
	font-size: 11px;
	line-height: 12px;
	background:
		url('http://image.kyobobook.co.kr/ink/images/gnb/nav6_btn_sprite.png')
		no-repeat 0 -200px;
	color: #fff;
}

#quick_menu2 .btn_quick_open a small span {
	display: inline-block;
	position: relative;
	left: 5px;
	background:
		url('http://image.kyobobook.co.kr/ink/images/gnb/nav6_btn_sprite.png')
		no-repeat right -200px;
	padding: 3px 5px 0 0;
}

#quick_menu2 .btn_quick_open a .btn_open {
	display: block;
	visibility: hidden;
	opacity: 0;
	transform: translate(10px, 0);
	width: 20px;
	height: 50px;
	font-size: 0;
	color: transparent;
	position: absolute;
	right: 65px;
	top: 0;
	background: #44528a
		url('http://image.kyobobook.co.kr/ink/images/gnb/nav6_btn_sprite.png')
		no-repeat 7px -21px;
	transition: all 0.2s;
	*cursor: pointer;
}

#quick_menu2 .btn_quick_open:hover {
	padding-left: 3px;
	margin-left: -3px;
	*zoom: 1;
}

#quick_menu2 .btn_quick_open a:hover {
	background-color: #44528a;
}

#quick_menu2 .btn_quick_open:hover .btn_open, #quick_menu2 .btn_quick_open a:hover .btn_open
	{
	visibility: visible;
	opacity: 1;
	transform: translate(0, 0);
	background-color: #353f67;
}

#quick_menu2 .btn_quick_top {
	margin-bottom: 2px;
}

#quick_menu2 .btn_quick_top a {
	display: block;
	height: 34px;
	font-size: 0;
	color: transparent;
	border: 1px solid #d2d2d2;
	background: #f9f9f9
		url('http://image.kyobobook.co.kr/ink/images/gnb/nav6_btn_sprite.png')
		no-repeat 22px -108px;
	transition: all 0.2s;
}

#quick_menu2 .btn_quick_top a:hover {
	border-color: #999;
}

#quick_menu2 .btn_quick_down {
	margin-bottom: 2px;
}

#quick_menu2 .btn_quick_down a {
	display: block;
	height: 34px;
	font-size: 0;
	color: transparent;
	border: 1px solid #d2d2d2;
	background: #f9f9f9
		url('http://image.kyobobook.co.kr/ink/images/gnb/nav6_btn_sprite.png')
		no-repeat -18px -108px;
	transition: all 0.2s;
}

#quick_menu2 .btn_quick_down a:hover {
	border-color: #999;
}

#quick_menu2.opened {
	
}

#quick_menu2.opened .quick_goods {
	visibility: visible;
	opacity: 1;
	*display: block;
}

#quick_menu2.opened .btn_quick_open a {
	border-color: #8592bc;
}

#quick_menu2.opened .btn_quick_open a .btn_open {
	visibility: hidden;
	opacity: 0;
	transform: translate(-100px, 0);
}

#quick_menu2.fixed {
	position: fixed;
	top: auto !important;
	bottom: 0;
	transition: all 0.2s;
}

#quick_menu2.fixed .quick_contents {
	top: auto;
	bottom: 0;
}

#quick_menu2.fixed .quick_goods {
	background-color: transparent;
	transform: translate(0, 50px);
}

#quick_menu2.fixed.opened {
	height: 50px;
	background-color: #5e6b9e;
}

#quick_menu2.fixed.opened .quick_goods {
	transform: translate(0, 0);
}

body.welcome #quick_menu2 {
	top: 888px;
}

body.welcome #quick_menu2.fixed {
	top: auto;
	bottom: 0;
}

/* #quick_menu2.opened.fixed {background-color:transparent;height:0;}
#quick_menu2.opened.fixed .quick_goods {visibility:hidden;opacity:1;transform:translate(0,50px);}
#quick_menu2.opened.fixed .btn_quick_open a {border-color:#5e6b9e;} */
.quick_contents {
	line-height: 16px;
}

.quick_contents h2 {
	text-align: center;
	margin: 10px 0;
	color: #103a74;
	font-size: 12px;
	font-family: dotum;
	line-height: 16px;
}

.quick_contents a {
	color: #777;
	text-decoration: none;
	line-height: 16px !important;
}

.quick_contents a:visited {
	color: #777;
}

.quick_contents a:hover {
	color: #555;
	text-decoration: none;
}

.quick_contents .quick_banner {
	
}

.quick_contents .quick_banner li {
	border: 1px solid #d2d2d2;
	margin-bottom: 2px;
	transition: all 0.2s;
}

.quick_contents .quick_banner li:hover {
	border-color: #aaa;
}

.quick_contents .quick_banner li img {
	max-width: 100%;
}

.quick_contents .quick_banner li.popup {
	
}

.quick_contents .quick_banner li.popup .layer {
	visibility: hidden;
	opacity: 0;
	transform: scale(0.7, 0.7);
	transition: all 0.3s;
	position: absolute;
	right: 218px;
	width: 720px;
	bottom: 60px;
	text-align: right;
	box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.3);
}

.quick_contents .quick_banner li.popup .layer .btn_close {
	position: absolute;
	right: -56px;
	top: 0;
}

.quick_contents .quick_banner li.popup.on .layer {
	visibility: visible;
	opacity: 1;
	transform: scale(1, 1);
}

.quick_contents .btn_prev {
	position: absolute;
	left: 534px;
	bottom: 6px;
	width: 15px;
	height: 14px;
	padding: 0;
	border: 0;
	background: transparent
		url('http://image.kyobobook.co.kr/ink/images/gnb/btn_left.gif')
		no-repeat;
	cursor: pointer;
	overflow: hidden;
	text-indent: -500px;
}

.quick_contents .btn_next {
	position: absolute;
	left: 548px;
	bottom: 6px;
	width: 15px;
	height: 14px;
	padding: 0;
	border: 0;
	background: transparent
		url('http://image.kyobobook.co.kr/ink/images/gnb/btn_right.gif')
		no-repeat;
	cursor: pointer;
	overflow: hidden;
	text-indent: -500px;
}

.quick_contents .quick_goods {
	visibility: hidden;
	opacity: 0;
	*visibility: visible;
	*display: none;
	position: absolute;
	right: 63px;
	bottom: 0;
	width: 930px;
	height: 50px;
	padding-left: 20px;
	padding-right: 25px;
	background-color: #5e6b9e;
	transition: all 0.2s;
}

.quick_contents .quick_goods .btn_close {
	position: absolute;
	left: 0;
	top: 0;
}

.quick_contents .quick_goods .btn_close a {
	display: block;
	width: 20px;
	height: 50px;
	font-size: 0;
	color: transparent;
	background: #44528a
		url('http://image.kyobobook.co.kr/ink/images/gnb/nav6_btn_sprite.png')
		no-repeat -33px -21px;
	transition: all 0.2s;
}

.quick_contents .quick_goods .btn_close a:hover {
	background-color: #353f67;
}

.quick_contents .quick_goods h3 {
	position: absolute;
	visibility: hidden;
}

.quick_contents .quick_goods_list {
	position: relative;
	padding: 6px 20px 5px;
	color: #fff;
}

.quick_contents .quick_goods_list ul {
	*zoom: 1;
}

.quick_contents .quick_goods_list ul:after {
	content: '';
	display: block;
	clear: both;
}

.quick_contents .quick_goods_list ul li {
	float: left;
	width: 37px;
	margin-right: 13px;
	position: relative;
}

.quick_contents .quick_goods_list ul li img {
	width: 27px;
	height: 39px;
	vertical-align: top;
}

.quick_contents .quick_goods_list ul li .btn_delete {
	position: absolute;
	left: 30px;
	top: 0;
}

.quick_contents .quick_goods_list ul li .btn_delete img {
	width: 7px;
	height: 7px;
	border: none;
}

.quick_contents .quick_goods .quick_ad {
	position: absolute;
	right: 25px;
	bottom: 0;
}

.quick_contents .quick_goods .quick_ad img {
	width: 240px;
	height: 84px;
}

/*
@media print{
#quick_menu2 {display:none;}
}
*/
</style>








		<!-- 우측퀵메뉴 -->
		<div id="quick_menu2">
			<h2 class="quick_label">바로가기</h2>
			<div class="quick_contents">

				<!-- *** s:(자동화)퀵메뉴 상단배너 *** -->
				<!-- #####wel_RightBanner_START##### -->
				<!-- #####wel_RightBanner_START##### -->
				<!-- 출판사 캐스트 -->
				<ul class="quick_banner" id="quick_banner">
					<li><a
						href="http://www.kyobobook.co.kr/prom/2016/general/160323_nonstop.jsp?orderClick=dot"
						target="_blank"><img
							src="https://simage.kyobobook.co.kr/ink/images/welcome/sample/sample_banner_15.jpg"
							alt="우측 확장형 배너 2" /></a></li>
				</ul>

				<!-- #####wel_RightBanner_END##### -->
				<!-- *** //e:(자동화)퀵메뉴 상단배너 *** -->

				<div class="btn_quick_top">
					<a href="#Top">TOP</a>
				</div>
				<div class="btn_quick_down">
					<a href="#Down">DOWN</a>
				</div>

				<!-- s:(고정)최근 본 상품 -->




























				<div class="btn_quick_open">
					<a href="#" title="최근 본 상품">최근 본 상품 <small><span
							id="nowseeTotCnt">0</span></small> <span class="btn_open">열기</span></a>
				</div>
				<div class="quick_goods">
					<h3 class="on">최근 본 상품</h3>
					<div class="quick_goods_list">
						<ul>

						</ul>

					</div>
					<!-- s:(고정)퀵메뉴배너 -->
					<!--웰컴 메인배너 -->

					<div class="quick_ad">
						<iframe
							src="http://imac.kyobobook.co.kr/html/INK/ink_wel_2016/ink_wel_2016@wel_12"
							title="배너광고" width="200" height="81" frameborder="0"
							scrolling="no" topmargin="0" leftmargin="0" marginwidth="0"
							marginheight="0" allowtransparency="true"></iframe>
					</div>
					<!-- //e:(고정)퀵메뉴배너-->
					<div class="btn_close">
						<a href="#">닫기</a>
					</div>
				</div>
				<script type="text/javascript">
(function($){
	$(document).ready(function(){
		/* 최근 본 상품 삭제 스크립트 참고용 */
		$('.quick_goods_list .btn_delete').click(function(e){
			e.preventDefault();
			if( $(this).closest('.quick_goods_list').find('li:visible').length == 1 ){
				$(this).closest('.quick_goods_list').find('li').prevAll().slice(0,2).show();
			} else {
				$(this).closest('.quick_goods_list').find('li:visible:last').next().show();
			}
			$(this).closest('li').remove();
			//checkNextQuick( $('#quick_menu2 .quick_goods .quick_goods_list:visible') );
	
			/* 최근 본 상품 목록 쿠키값 제어 */
			document.deleteForm.target="deleteNowSeeFrm";
			document.deleteForm.action="http://www.kyobobook.co.kr/common/deleteNowSee.laf";
			document.deleteForm.barcode.value=jQuery(this).attr("barcode");
			document.deleteForm.ejkGb.value=jQuery(this).attr("ejkGb");
			
			document.deleteForm.submit();
			/* 최근 본 상품 목록 쿠키값 제어 */
	
		});
		/* 최근본 상품 삭제 스크립트 참고용 */
	});
})(jQuery);
</script>
				<!-- //e:(고정)최근 본 상품 -->

				<!-- *** s:(자동화)퀵메뉴 상단배너 *** -->

				<!-- *** //e:(자동화)퀵메뉴 상단배너 *** -->

			</div>

		</div>
		<!-- //우측퀵메뉴 -->

		<script type="text/javascript">
(function($){

	/* 상품목록 탐색 */
	/*
	function checkNextQuick(target){
		if( target.find('li:visible:last').next().size() ){
			target.find('.btn_next').fadeTo(0,1);
		} else {
			target.find('.btn_next').fadeTo(0,.3);
		}
		if( target.find('li:visible:first').prev().size() ){
			target.find('.btn_prev').fadeTo(0,1);
		} else {
			target.find('.btn_prev').fadeTo(0,.3);
		}
	}
	$('.quick_goods_list .btn_next').click(
		function(){
			if( $(this).closest('.quick_goods_list').find('li:visible:last').next().size() )
			$(this).closest('.quick_goods_list').find('li:visible').hide().filter(':last').nextAll().slice(0,10).show();
			checkNextQuick( $(this).closest('.quick_goods_list') );
		}
	);
	$('.quick_goods_list .btn_prev').click(
		function(){
			if( $(this).closest('.quick_goods_list').find('li:visible:first').prev().size() )
			$(this).closest('.quick_goods_list').find('li:visible').hide().filter(':first').prevAll().slice(0,10).show();
			checkNextQuick( $(this).closest('.quick_goods_list') );
		}
	);
	$(function(){
		checkNextQuick( $('#quick_menu2 .quick_goods .quick_goods_list:visible') );
	});
	*/

	/* 최근 본 상품 */
	$('.quick_goods_list').each(function(){
		if ( $(this).find('li').size() == 0 )
			$(this).append('<div style="padding-top:14px;">최근 본 상품이 없습니다.</div>');
	});
	$('#quick_menu2 .btn_quick_open a, #quick_menu2 .quick_goods .btn_close a').click(function(e){
		e.preventDefault();
		$('#quick_menu2').toggleClass('opened');
	});


	// Top/Down 버튼
	$('#quick_menu2 .btn_quick_top').click(function(e){
		e.preventDefault();
		$('body, html').animate({ scrollTop: 0 }, 200);
	});
	$('#quick_menu2 .btn_quick_down').click(function(e){
		e.preventDefault();
		$('body, html').animate({ scrollTop: $(document).height() - $(window).height() }, 200);
	});

	// 레이어 팝업
	$('.quick_banner .popup .btn_open').click(function(e){
		e.preventDefault();
		$(this).closest('.popup').toggleClass('on').siblings('.popup').removeClass('on');
		$('.quick_banner .popup .layer img').each(function(){
			if( $(this).attr('data-original') && $(this).attr('src') != $(this).attr('data-original') ){
				$(this).attr('src', $(this).attr('data-original') ).removeAttr('data-original');
			}
		});
	});
	$('.quick_banner .popup .btn_close').click(function(e){
		e.preventDefault();
		$(this).closest('.popup').toggleClass('on');
	});

	// 헤더와 겹침 방지
	var $header = $('#header_gnb').size()?$('#header_gnb'):$('#header');
	var $wrapper = $('#quick_menu2').parent();
	$(window).bind('load scroll resize',function(){
		var st = $(this).scrollTop();
		var wh = $(this).height();
		var qh = $('#quick_menu2 .quick_contents').height();
		var ht = $header.offset().top;
		var hh = $header.outerHeight();
		var fix = $wrapper.css('position') == 'relative' ? $wrapper.offset().top : 0;
		var t1 = ht + hh + 15 - fix;
		var t2 = st + wh - qh - fix;
		t1 = $('body').is('.welcome')||$('#wing_ad2').size()?t1+683:t1; // 웰컴 메인배너, 검색 날개배너와 겹침 방지
		if($('body').is('.bookcast')) t1 += 299; // 북캐스트
		if($('body').is('.bookcast.home')) t1 += 1319 - 299; // 북캐스트 홈
		var isTop = t2 < t1;
		if($(this).width()<1126){
			$('#quick_menu2').removeClass('fixed').css('top',isTop?t1:t2);
		}else{
			$('#quick_menu2').toggleClass('fixed',!isTop).css('top',isTop?t1:'auto');
		}
	});

})(jQuery);
</script>

		<form name="deleteForm" method="post">
			<input type="hidden" name="barcode" /> <input type="hidden"
				name="ejkGb" />
		</form>
		<iframe name="deleteNowSeeFrm" frameborder="0" width="0" height="0"
			title="최근본상품 삭제"></iframe>

		<!-- //e:퀵메뉴 영역 -->









		<!-- AceCounter Log Gathering Script V.71.20120712 -->
		<script type="text/javascript">
if(typeof _GUL == 'undefined'){
var _GUL = 'kyobobook.loginside.co.kr';var _GPT='8080'; var _SGPT='8443';var _AIMG = new Image(); var _bn=navigator.appName; var _PR = location.protocol=="https:"?"https://"+_GUL+":"+_SGPT:"http://"+_GUL+":"+_GPT;if( _bn.indexOf("Netscape") > -1 || _bn=="Mozilla"){ setTimeout("_AIMG.src = _PR+'/?cookie';",1); } else{ _AIMG.src = _PR+'/?cookie'; };
document.writeln("<scr"+"ipt language='javascript' src='http://image.kyobobook.co.kr/ink/js/acecounter_V70.js'></scr"+"ipt>");
}
</script>
		<noscript>
			<img src='http://kyobobook.loginside.co.kr:8080/?uid=1&je=n&'
				border="0" width="0" height="0" alt="" />
		</noscript>
		<!-- AceCounter Log Gathering Script End -->




		<!-- naver keword analyzer 201402-->
		<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_453f4415ebcb";
if (!_nasa) var _nasa={};
wcs_do(_nasa);
</script>
		<!-- naver keword analyzer 201402-->





	</div>

	<form name="proCartOneForm" method="post" target="_parent">
		<input type="hidden" name="barcode" value="" /> <input type="hidden"
			name="ejkGb" value="KOR" /> <input type="hidden" name="qty"
			value="1" /> <input type="hidden" name="eventId" /> <input
			type="hidden" name="eventPid" /> <input type="hidden" name="notAge" />
	</form>

	<!--  오늘의 책 전용 스크립트! -->
	<script type="text/javascript">
var todayBookBarcodeAr = new Array();
var todayBookEjkgbAr = new Array();
(function($){
	
	$(".list_main_kyobo li").each(function(){
		if($(this).attr("class") == "on") {
			//alert($(this).find('.card_news .option a').attr('data-barcode'));
			todayBookBarcodeAr[todayBookBarcodeAr.length++] = $(this).find('.card_news .option a').attr('data-barcode');
			todayBookEjkgbAr[todayBookEjkgbAr.length++] = $(this).find('.card_news .option a').attr('data-ejkgb');
		}
	});
	
	console.log(todayBookBarcodeAr.length);
	
	for (var i = 0; i < todayBookBarcodeAr.length; i++) {
		likeCount(todayBookBarcodeAr[i], todayBookEjkgbAr[i]);
	}
	
})(jQuery);

function likeCount(barcode, ejkGb) {
	(function($){
		$.ajax({
			type: "GET",
			url: "/MainTodayBookLikeCount.laf",
			data: "barcode="+barcode+"&ejkGb="+ejkGb,
			dataType: "json",
			success: function(msg){
				$("#like_"+barcode).html(msg.totalCount)
			}
		});
	})(jQuery);
}



	
	
		var loginYN = "Y";
	


function likeUpdate(barcode, ejkGb) {
	if (loginYN == "N") {
		if (confirm("로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?")) {
			openLogin("/index.laf");
		}
	} else {
		(function($){
		$.ajax({
			type: "GET",
			url: "/MainTodayBookLikeUpdate.laf",
			data: "barcode="+barcode+"&ejkGb="+ejkGb,
			dataType: "json",
			success: function(msg){
				if (msg.likeYn == "Y") {
					alert("이미 좋아요를 등록하였습니다.");
				} else {
					alert("좋아요를 등록하였습니다.");
					$("#like_"+barcode).html(msg.totalCount)
				}
			}
		});
		})(jQuery);
	
	}
}
</script>
	<script type="text/javascript">
function mainAddCart(barcode, ejkGb) {
	
	switch( goAddCartCheckDigital(document.proCartOneForm.ejkGb.value))
	{
		case 'L':
			return;
			break;
		case 'D':
			//document.proCartOneForm.cartType.value = (typeof(formname.cartType[nowIndex-1]) == "undefined") ? formname.cartType.value : formname.cartType[nowIndex-1].value;
			break;
	}
	document.proCartOneForm.ejkGb.value=ejkGb;
	document.proCartOneForm.barcode.value=barcode;
	document.proCartOneForm.target="HiddenActionFrame";
	document.proCartOneForm.action="http://order.kyobobook.co.kr"+"/cart/addCart?spbk_dvsn_code=002";
	document.proCartOneForm.submit();
}
</script>

</body>


</html>
</body>
</html>

<%-- 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="jumbotron" style="height: 100%;">
  <center>
  <p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p>
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
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
</div>

</body>
</html> --%>

