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
  	<style type="text/css">
  		.board_title, .board_writer, .board_date, .board_count{
  			float:left;
  			border-right:1px solid;
  			padding-right:10px;
  			border-color:#93B658;
  		}
  		.board_writer{
  			border-left:1px solid;
  			padding-left:10px;
  			border-color:#93B658;
  		}
  		.board_title, .board_date, .board_count{
  			margin-left:15px;
  		}
  		.board_button{
  			float:right;
  		}
  		.board_content{
  			margin-top:30px;	
  		}
  		.board_content{
  			margin-top:30px;	
  		}
  		.board_reply{
  			margin-top:20px;
  			border-top:1px solid;
  			border-color:#93B658;
  			text-align:center;
  		}
  		.board_no_reply{
  			text-align:center;
  		}
  		.board_no_reply p{
  			margin-top:20px;
  			font-size:1.5em;
  		}
  		.board_reply{
  			text-align:left;
  		}
  		.board_reply p{
  			margin-top:20px;
  			font-size:1.5em;
  		}
  		.listBtn hover{
  			color:#93B658;
  		}
  		#form1{
  			margin-top:40px;
  		}
  		#btnList{
  			margin-bottom:-40px;
  		}
  	</style>
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
						<div class="board_button">
							<button type="button" id="btnList" class="btn btn-default">목록으로</button>
						</div>
						<form id="form1" name="form1">
							<div class="board_writer"> 
								작성자 : ${dto.writer}
							</div>
								
							<div class="board_title">
								제목 : ${dto.title}
							</div>
							
							<div class="board_date">
								작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd"/>
							</div>
							
							<div class="board_count">
								조회수 : ${dto.viewcnt}
							</div>
							<br>
							<div class="board_content"> 
								<textarea name="content" rows="10" cols="50" disabled="disabled">${dto.content}</textarea>	
							</div>
							
							<div style="width:300px; text-align:center">
								<!-- 게시물 번호가 있어야 수정, 삭제 가능(hidden으로 처리) -->
								<input type = "hidden" name = "bno" value= "${dto.bno}">
								<c:if test="${sesionScope.id eq dto.writer}">
									<button type="button" id="btnUpdate">수정하기</button>
									<button type="button" id="btnDelete">삭제하기</button>
								</c:if>
							</div>
								
							<div class="board_reply">
							  <div class="board_no_reply">
								<c:if test="${ reply ==  null }">
									<p>관리자의 답변이 등록되지않았습니다.</p>
								</c:if>
							  </div>
							  <div class="board_reply_con">
								<c:if test="${ reply != null }">
									<p>Answer<p> ${ reply.replytext }
								</c:if>
							  </div>
							</div>		
						</form>
					</div>
				</div><!--/category-tab-->
			</div>
		</div>
	</section><!--/form-->
	
	<!-- footer -->
	<jsp:include page="../customer/customerFooter.jsp" />
	<!-- footer -->
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#btnList").click(function(){
			location.href=
				"boardList.do?curPage=${curPage}"
				+"&searchOption=${searchOption}"
				+"&keyword=${keyword}";
		});
		$("#btnWrite").click(function(){
			location.href="boardWrite.do"
		});
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
			document.form1.action="boardDelete.do";
			document.form1.submit();
			}
		});
		$("#btnUpdate").click(function(){
			
			var content=document.form1.content.value;
			var title=document.form1.title.value;
			
			if(content==""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			if(title==""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}		
			document.form1.action="boardUpdate.do"
			document.form1.submit();
		});
		$("#btnReply").click(function(){
			var replytext=document.form1.replytext.value;
			
			if(replytext==""){
				alert("답변을 입력하세요.")
				document.form1.replytext.focus();
				return;
			}
			
			alert("답변이 등록되었습니다.")
			document.form1.action="replyInsert.do"
			document.form1.submit();
	
		});	
		$("#btnReplyDelete").click(function(){
			if(confirm("답변을 삭제하시겠습니까?")){
			document.form1.action="replyDelete.do";
			document.form1.submit();
			}
		});
		$("#btnReplyUpdate").click(function(){
			
			var replytext=document.form1.replytext.value;
			
			if(replytext==""){
				alert("답변을 입력하세요.")
				document.form1.replytext.focus();
				return;
			}
			document.form1.action="replyUpdate.do"
			document.form1.submit();
		});
		
	});
	</script>
	
    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
</body>
</html>