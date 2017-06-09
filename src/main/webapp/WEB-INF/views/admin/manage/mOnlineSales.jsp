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
	var currentOnlinePage = <c:out value="${currentOnlinePage}" />;
	var currentOnlineBlock = <c:out value="${currentOnlineBlock}" />;
	for(var i = (currentOnlinePage - 1) * 10; i < (currentOnlinePage) * 10; i++) {
		$("#new"+ (i+1) + "").show();
	}
	for(var i = (currentOnlineBlock - 1) * 5; i < (currentOnlineBlock) * 5; i++) {
		$("#newPg" + (i+1) + "").show();
	}
	
	$("#next2").show();
		var sumDomestic = ${ sumDomestic };
		var sumForeign = ${ sumForeign };
		var options = {
			'dataset':{
				title: '온라인 판매량',
				values:[sumDomestic, sumForeign],
				colorset: ['#2EB400', '#2BC8C9'],
				fields: ['국내도서', '외국도서'],
			},
			'donut_width' : 35,
			'core_circle_radius':50,
			'chartDiv': 'Nwagon',
			'chartType': 'donut',
			'chartSize': {width:700, height:400}
		};
		Nwagon.chart(options);
	
});
function moveOnlinePage(block, page) {
	var branch = '<c:out value="${sessionScope.user.branch}" />';
	$.ajax({
        type : "POST",
        url : "moveOnlinePage.do",
        data : {"currentOnlinePage" : page,
        		"currentOnlineBlock" : block,
        		"branch" : branch},
        dataType : "JSON",
        error : function(){
            alert('에러발생');
        },
        success : function(data){

        	var currentOnlinePage = data.page;
        	var currentOnlineBlock = data.block;
        	var getList = data.list;
        	

        	$(".newList").hide();
        	
        	for(var i = (currentOnlinePage - 1) * 10; i < (currentOnlinePage) * 10; i++) {
        		$("#new"+ (i+1) + "").show();
        		
        	}

        }
         
    })
}

function moveOnlineBlock(block) {
	var branch = '<c:out value="${sessionScope.user.branch}" />';
	$.ajax({
	    type : "POST",
	    url : "moveOnlineBlock.do",
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
	    	var currentOnlinePage = data.page;
	    	var currentOnlineBlock = data.block;
	    	var contentPerPage = 10;
	    	var getList = data.list;
	    	var allOnlineBlock = <c:out value="${ allOnlineBlock }" />;
			var allOnlinePage = <c:out value="${ allOnlinePage }" />;
			
			
			/* String->int 형변환 */
			currentOnlineBlock *= 1;
			currentOnlinePage *= 1;
			allOnlineBlock *= 1;
			allOnlinePage *= 1;
			
			if (allOnlineBlock > currentOnlineBlock) {
				$("#newNext"+ (currentOnlineBlock+1) + "").show();
			}
			if (org_currentBlock > 1) {
				$("#newPrevious"+ (currentOnlineBlock-1) + "").show();
			}
			
			for(var i = (currentOnlinePage - 1) * 10; i < (currentOnlinePage) * 10; i++) {
	    		$("#new"+ (i+1) + "").show();
	    	}
			for(var i = (allOnlineBlock - 1) * 5; i < (allOnlineBlock) * 5; i++) {
				$("#newPg" + (i+1) + "").show();
			}
	
	    }
	     
	})
}
</script>


<body>
	<!-- header -->
	<jsp:include page="../adminNav.jsp" />

	<div class="container">
		<ul class="nav nav-tabs" style="margin-left:1%;">
			<li class="active"><a data-toggle="tab" href="#saleNewBook">온라인판매</a></li>
		</ul>

		<div class="tab-content" style="margin-left:5%;">
			<div id="saleNewBook" class="tab-pane fade in active">
				<h3>온라인판매 판매</h3>
				<c:set var="currentOnlinePage" value="${ currentOnlinePage }"/>
				<c:set var="currentOnlineBlock" value="${ currentOnlineBlock }" />
				<c:set var="allOnlineCount" value="${ allOnlineCount }" />
				<c:set var="allOnlineBlock" value="${ allOnlineBlock }" />
				<c:set var="allOnlinePage" value="${ allOnlinePage }" />
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
					<c:forEach items="${ list }" var="list" varStatus="status">
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
						<td colspan="8">총 = ${ sumDomestic + sumForeign }원</td>
					</tr>
					<!-- 페이징처리할고얌 -->
					<tr>
						<!-- 이전 -->
						<td colspan="2">
							<ul class="pager">
							<c:forEach var="i" begin="2" end="${ allOnlineBlock }">
								 <li class="newPrevious" id="newPrevious${i -1 }"><a onclick ="moveOnlineBlock(${ i - 1 })">Previous</a></li>
							</c:forEach>
							</ul>
						</td>
						<!-- 페이지번호 -->
						<td colspan="4">
						<ul class="pagination" style="text-align: center;">
						
							<c:if test="${ allOnlineCount < contentPerPage }">
								<li><a href="mOnlineSale.do">1</a></li>
							</c:if>
							
							<c:if test="${ allOnlineCount >= contentPerPage }">
								<c:forEach var="i" varStatus="status" begin="1" end="${allOnlinePage }">
									<li class="newPage" id="newPg${ i }"><a onclick="moveOnlinePage(${ currentOnlineBlock }, ${ (currentOnlineBlock - 1) * pagePerBlock  + i })">${ (currentOnlineBlock - 1) * pagePerBlock + i }</a></li>
								</c:forEach>
							</c:if>
						</ul>
						</td>
						<!-- 이후 -->
						<td colspan="2">
							<ul class="pager">
							<c:forEach var="i" begin="1" end="${ allOnlineBlock - 1}">
								 <li class="newNext" id="newNext${ i+1 }"><a onclick="moveOnlineBlock(${ i + 1 })">Next</a></li>
							</c:forEach>
							</ul>
						</td>
					</tr>
				</table>
				<div id="Nwagon"></div>
				
			</div>
			
		</div>
	</div>
	</div>

</body>
</html>