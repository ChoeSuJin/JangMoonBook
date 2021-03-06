<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
  	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script>
  	function openEbook(index, title) {
  		var path = '<c:out value="${ resources }"/>';
  		var title = title;
  		
  		var options = {
  			pdfOpenParams : {
  				navpanes: 1,
  				toolbar: 0,
  				statusbar: 1
  			}
  		};
  		
  		PDFObject.embed(""+ path +"/ebook/test.pdf", "#viewBook" + index + "", options);
  		$("#openEbook" + index + "").show();
  	}
  </script>
  <style type="text/css">
  .modal-dialog { width: 80%; height: 1000px; margin: 0; padding: 0; }
  .modal-body{ height: 700px; }
  </style>
</head><!--/head-->

<body>
	<!-- img 랜덤으로 가져오기 위한 것 -->
	<jsp:useBean id="random" class="java.util.Random" scope="application"/>
	<!-- img 랜덤으로 가져오기 위한 것 -->
	
	<!-- header -->
	<jsp:include page="customerHeader.jsp"/>
	<!-- header -->
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#myPage" data-toggle="tab">계정정보</a></li>
								<li><a href="#reviews" data-toggle="tab">구매목록</a></li>
								<li><a href="#My-E_book" data-toggle="tab">보유 E-Book</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="myPage">
								<div>
									<div class="login-form"><!--login form-->
										<c:set var="cm" value="${customer}"/>
										<form class="myPage-form" name="myPage" action="starBooks.do?cmd=modify" method="post" style="width:600px;margin:0 auto;">
											아이디 <input type="text" name="d_id" id="d_id" disabled="disabled" value="${cm.id}">
											<input type="hidden" name="id" id="id" value="${cm.id}">
											<div id="pwd" style="display:none;">암호 <input type="password" name="pwd" placeholder="기존의 암호를 입력하세요."></div>
											CLASS <input type="text" name="customerClass" id="customerclass" disabled="disabled" value="${cm.customerClass}">
											이메일 <input type="text" name="email" id="email" disabled="disabled" value="${cm.email}">
											연락처 <input type="text" name="phone" id="phone" disabled="disabled" value="${cm.phone}">
											
											<input type="button" style="display:none" id="address" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
											
											우편번호 <input type="text" name="zipcode" id="sample6_postcode" disabled="disabled" value="${cm.zipcode}">
											주소 <input type="text" name="address1" id="sample6_address" disabled="disabled" value="${cm.address1}">
											상세주소 <input type="text" name="address2" id="sample6_address2" disabled="disabled" value="${cm.address2}">
											<input type="button" id="modify_user" value="개인정보 수정">
											<input type="submit" id="ok" value="수정완료" onclick="return check_modify()" style="display:none">
											<input type="button" id="cancel" value="취소" onclick="modify_cancle()"  style="display:none">
											<input type="hidden" id="error" value="${error}"><!-- 암호에러 -->
										</form>
									</div><!--/login form-->
								</div>
							</div>
							
							<div class="tab-pane fade" id="reviews" >
							  <div style="margin:0 auto;">
								<c:forEach var="p" items="${purchase}">
									<ul>
										<li><a href="#"><i class="fa fa-user"></i>${p.id}</a></li>
										<li><a href="#"><i class="fa fa-clock-o"></i>${p.s_date}</a></li>
									</ul>
									<p style="margin-left:20px;margin-top:-5px;margin-bottom:20px;">책 이름 : ${p.title} &nbsp;&nbsp;&nbsp; 구입권수 : ${p.quantity} 권</p>										
								</c:forEach>
							  </div>
							</div>

							<div class="tab-pane fade" id="My-E_book">
								<div style="margin: 0 auto;">
									<div class="container">
										<div class="row">
											<div class="col-sm-9 padding-right" style="margin-left:30px;">
												<div class="features_items">
													<c:forEach var="ebook" items="${myEbook}" varStatus="status">
														<!-- Modal -->
														  <div class="modal fade" id="openEbook${ status.index }" role="dialog">
														    <div class="modal-dialog">
														    
														      <!-- Modal content-->
														      <div class="modal-content">
														        <div class="modal-header">
														          <button type="button" class="close" data-dismiss="modal">&times;</button>
														          <h4 class="modal-title">${ ebook.title }</h4>
														        </div>
														        <div class="modal-body" id="viewBook${ status.index }">
														          
														        </div>
														        <div class="modal-footer">
														          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
														        </div>
														      </div>
														      
														    </div>
														  </div>
														<div class="col-sm-4">
															<div class="product-image-wrapper">
																<div class="single-products">
																	<div class="productinfo text-center">
																		<a onclick="openEbook('${ status.index }','${ ebook.title }')" data-toggle="modal" data-target="#openEbook${ status.index }">
																			<img style="width:200px;height:250px;"src="${resources}/images/book/${random.nextInt(147)+8}.jpg" alt="" />
																			<br>${ebook.title}
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div><!--/category-tab-->
				</div>
			</div>
		</section><!--/form-->
		
	
	<!-- footer -->
	<jsp:include page="customerFooter.jsp" />
	<!-- footer -->

    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
    <script src="${resources}/js/pdfobject.js"></script>
</body>
</html>
