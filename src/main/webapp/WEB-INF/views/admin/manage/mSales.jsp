<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>매 출 관 리</title>
	<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="${resources}/css/Nwagon.css" rel="stylesheet">
	
	<script src="${resources}/js/Nwagon.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script>
$(document).ready(function() {
	$(".newList").hide();
	$(".newPage").hide();
	$(".newNext").hide();
	$(".newPrevious").hide();
	var currentNewPage = <c:out value="${currentNewPage}" />;
	var currentNewBlock = <c:out value="${currentNewBlock}" />;
	for(var i = (currentNewPage - 1) * 10; i < (currentNewPage) * 10; i++) {
		$("#new"+ (i+1) + "").show();
	}
	for(var i = (currentNewBlock - 1) * 5; i < (currentNewBlock) * 5; i++) {
		$("#newPg" + (i+1) + "").show();
	}
	
	$("#next2").show();
		var sumUsed = ${ sumUsed };
		var sumNew = ${ sumNew };
		var options = {
			'dataset':{
				title: 'Web accessibility status',
				values:[sumNew, sumUsed],
				colorset: ['#2EB400', '#2BC8C9'],
				fields: ['신책', '중고'],
			},
			'donut_width' : 35,
			'core_circle_radius':50,
			'chartDiv': 'Nwagon',
			'chartType': 'donut',
			'chartSize': {width:700, height:400}
		};
		Nwagon.chart(options);
	
});
function moveNewPage(block, page) {
	var branch = '<c:out value="${sessionScope.user.branch}" />';
	$.ajax({
        type : "POST",
        url : "moveNewPage.do",
        data : {"currentNewPage" : page,
        		"currentNewBlock" : block,
        		"branch" : branch},
        dataType : "JSON",
        error : function(){
            alert('에러발생');
        },
        success : function(data){

        	var currentNewPage = data.page;
        	var currentNewBlock = data.block;
        	var getList = data.list;
        	

        	$(".newList").hide();
        	
        	for(var i = (currentNewPage - 1) * 10; i < (currentNewPage) * 10; i++) {
        		$("#new"+ (i+1) + "").show();
        		
        	}

        }
         
    })
}

function moveNewBlock(block) {
	var branch = '<c:out value="${sessionScope.user.branch}" />';
	$.ajax({
	    type : "POST",
	    url : "moveNewBlock.do",
	    data : {"Block" : block,
	    		"branch" : branch},
	    dataType : "JSON",
	    error : function(){
	        alert('에러발생');
	    },
	    success : function(data){
	    	
	    	$(".newList").hide();
	    	$(".newPage").hide();
	    	$(".newNext").hide();
	    	$(".newPrevious").hide();
	    	var currentNewPage = data.page;
	    	var currentNewBlock = data.block;
	    	var contentPerPage = 10;
	    	var getList = data.list;
	    	var allNewBlock = <c:out value="${ allNewBlock }" />;
			var allNewPage = <c:out value="${ allNewPage }" />;
			
			
			/* String->int 형변환 */
			currentNewBlock *= 1;
			currentNewPage *= 1;
			allNewBlock *= 1;
			allNewPage *= 1;
			
			if (allNewBlock > currentNewBlock) {
				$("#newNext"+ (currentNewBlock+1) + "").show();
			}
			if (org_currentBlock > 1) {
				$("#newPrevious"+ (currentNewBlock-1) + "").show();
			}
			
			for(var i = (currentNewPage - 1) * 10; i < (currentNewPage) * 10; i++) {
	    		$("#new"+ (i+1) + "").show();
	    	}
			for(var i = (allNewBlock - 1) * 5; i < (allNewBlock) * 5; i++) {
				$("#newPg" + (i+1) + "").show();
			}
	
	    }
	     
	})
}
</script>


<body>
	<!-- header -->
	<jsp:include page="../adminNav.jsp" />
	<!-- header -->
	<input type="hidden" id="sumNew" value=${ sumNew }>
	<input type="hidden" id="sumUsed" value=${ sumUsed }>

	<div class="container">
		<ul class="nav nav-tabs" style="margin-left:1%;">
			<li class="active"><a data-toggle="tab" href="#saleNewBook">신책</a></li>
			<li><a data-toggle="tab" href="#saleUsedBook">중고</a></li>
		</ul>

		<div class="tab-content" style="margin-left:5%;">
			<div id="saleNewBook" class="tab-pane fade in active">
				<h3>신책 판매</h3>
				<c:set var="currentNewPage" value="${ currentNewPage }"/>
				<c:set var="currentNewBlock" value="${ currentNewBlock }" />
				<c:set var="allNewCount" value="${ allNewCount }" />
				<c:set var="allNewBlock" value="${ allNewBlock }" />
				<c:set var="allNewPage" value="${ allNewPage }" />
				<c:set var="pagePerBlock" value="5" />
				<c:set var="contentPerPage" value="10" />
				<table class="table table-condensed">
					<tr>
						<th>판매번호</th>
						<th>ISBN</th>
						<th>제목</th>
						<th>아이디</th>
						<th>dPrice</th>
						<th>지점</th>
						<th>수량</th>
						<th>판매일</th>
					</tr>
					<c:forEach items="${ list1 }" var="list" varStatus="status">
						<tr class="newList" id="new${ status.index + 1 }">
							<td>${ list.saleNumber }</td>
							<td>${ list.isbn }</td>
							<td>${ list.title }</td>
							<td>${ list.id }</td>
							<td>${ list.dPrice }</td>
							<td>${ list.branchName }</td>
							<td>${ list.quantity }</td>
							<td>${ list.s_date }</td>

						</tr>
					</c:forEach>
					<tr>
						<td colspan="8">총 = ${ sumNew }원</td>
					</tr>
					<!-- 페이징처리할고얌 -->
					<tr>
						<!-- 이전 -->
						<td colspan="2">
							<ul class="pager">
							<c:forEach var="i" begin="2" end="${ allNewBlock }">
								 <li class="newPrevious" id="newPrevious${i -1 }"><a onclick ="moveNewBlock(${ i - 1 })">Previous</a></li>
							</c:forEach>
							</ul>
						</td>
						<!-- 페이지번호 -->
						<td colspan="4">
						<ul class="pagination" style="text-align: center;">
						
							<c:if test="${ allNewCount < contentPerPage }">
								<li><a href="mSales.do">1</a></li>
							</c:if>
							
							<c:if test="${ allNewCount >= contentPerPage }">
								<c:forEach var="i" varStatus="status" begin="1" end="${allNewPage }">
									<li class="newPage" id="newPg${ i }"><a onclick="moveNewPage(${ currentNewBlock }, ${ (currentNewBlock - 1) * pagePerBlock  + i })">${ (currentNewBlock - 1) * pagePerBlock + i }</a></li>
								</c:forEach>
							</c:if>
						</ul>
						</td>
						<!-- 이후 -->
						<td colspan="2">
							<ul class="pager">
							<c:forEach var="i" begin="1" end="${ allNewBlock - 1}">
								 <li class="newNext" id="newNext${ i+1 }"><a onclick="moveNewBlock(${ i + 1 })">Next</a></li>
							</c:forEach>
							</ul>
						</td>
					</tr>
				</table>
				<div id="Nwagon"></div>
				
			</div>

			<div id="saleUsedBook" class="tab-pane fade">
				<h3>중고책 판매</h3>
				<table class="table table-condensed">
					<tr>
						<th>판매번호</th>
						<th>ISBN</th>
						<th>제목</th>
						<th>아이디</th>
						<th>dPrice</th>
						<th>지점</th>
						<th>수량</th>
						<th>판매일</th>
					</tr>
					<c:forEach items="${ list2 }" var="list">
						<tr>
							<td>${ list.saleNumber }</td>
							<td>${ list.isbn }</td>
							<td>${ list.title }</td>
							<td>${ list.id }</td>
							<td>${ list.dPrice }</td>
							<td>${ list.branchName }</td>
							<td>${ list.quantity }</td>
							<td>${ list.s_date }</td>

						</tr>
					</c:forEach>
					<tr>
						<td colspan="8">총 = ${ sumUsed }원</td>
					</tr>
				</table>
			</div>
			
		</div>
	</div>
	</div>

</body>
</html>