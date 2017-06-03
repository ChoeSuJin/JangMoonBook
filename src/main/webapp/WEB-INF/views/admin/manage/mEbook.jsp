<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<!DOCTYPE html>
<html>
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EbookManageMain</title>
</head>
<script type="text/javascript">

	$(document).ready(function() {

		var pagePerBlock = 3;
		var contentPerPage = 10;
		
		$(".orgList").hide();
		$(".org_page").hide();
		$(".next").hide();
		$(".previous").hide();
		var org_currentPage = <c:out value="${org_currentPage}" />;
		var org_currentBlock = <c:out value="${org_currentBlock}" />;
		for(var i = (org_currentPage - 1) * contentPerPage; i < (org_currentPage) * contentPerPage; i++) {
    		$("#"+ (i+1) + "").show(500);

    	}
		for(var i = (org_currentBlock - 1) * pagePerBlock; i < (org_currentBlock) * pagePerBlock; i++) {
			$("#pg" + (i+1) + "").show(500);
		}
		
		$("#next2").show(500);
		
	});

	function getOrgList(ono) {
		
		$.ajax({
            type : "POST",
            url : "getOrgList.do",
            data : {"ono" : ono},
            dataType : "JSON",
            error : function(){
                alert('에러발생');
            },
            success : function(data){
            	
            	 var values = data.ebookList;
            	 values=JSON.stringify(values);
            	 var newVal = JSON.parse(values);
            	 var allPage = newVal.length;
            	 
            	$("#list1").html("");
            	var html = '<table class="table table-condensed" style="width : 45%; float: right;">'
            				+ '<th>isbn</th><th>title</th>';
            	if (newVal.length == 0) {
            		html += '<tr><td colsapn=2>대여한 책이 없습니당</td></tr>';
            	} else{
	            	for(var i = 0; i< newVal.length; i++) {
	            		html += '<tr><td>'+ newVal[i].isbn +'</td><td>' + newVal[i].title + '</td><td>';
	                }
            	}
            	html += '</table>';
            	$("#list1").prepend(html);

            }
             
        })
	}
	
function movePage(block, page) {
	
	var pagePerBlock = 3;
	var contentPerPage = 10;
		
		$.ajax({
            type : "POST",
            url : "movePage.do",
            data : {"org_currentPage" : page,
            		"org_currentBlock" : block },
            dataType : "JSON",
            error : function(){
                alert('에러발생');
            },
            success : function(data){

            	var org_currentPage = data.page;
            	var org_currentBlock = data.block;
            	var getList = data.list;
            	

            	$(".orgList").hide();
            	
            	for(var i = (org_currentPage - 1) * contentPerPage; i < (org_currentPage) * contentPerPage; i++) {
            		$("#"+ (i+1) + "").show(500);
            		
            	}

            }
             
        })
	}
	
function moveBlock(block) {
	var pagePerBlock = 3;
	var contentPerPage = 10;

	
	$.ajax({
        type : "POST",
        url : "moveBlock.do",
        data : {"Block" : block },
        dataType : "JSON",
        error : function(){
            alert('에러발생');
        },
        success : function(data){
        	
        	$(".orgList").hide();
    		$(".org_page").hide();
    		$(".next").hide();
    		$(".previous").hide();
        	var org_currentPage = data.page;
        	var org_currentBlock = data.block;
        	var contentPerPage = 3;
        	var getList = data.list;
        	var allOrganBlock = <c:out value="${ allOrganBlock }" />;
			var allOrganPage = <c:out value="${ allOrganPage }" />;
			
			
			/* String->int 형변환 */
			org_currentBlock *= 1;
			org_currentPage *= 1;
			allOrganBlock *= 1;
			allOrganPage *= 1;
			
			if (allOrganBlock > org_currentBlock) {
				$("#next"+ (org_currentBlock+1) + "").show(500);
			}
			if (org_currentBlock > 1) {
				$("#previous"+ (org_currentBlock-1) + "").show(500);
			}
			
			for(var i = (org_currentPage - 1) * contentPerPage; i < (org_currentPage) * contentPerPage; i++) {
	    		$("#"+ (i+1) + "").show(500);
	    	}
			for(var i = (org_currentBlock - 1) * pagePerBlock; i < (org_currentBlock) * pagePerBlock; i++) {
				$("#pg" + (i+1) + "").show(500);
			}

        }
         
    })
}
	
	
</script>
<body>
<!-- header -->
<jsp:include page="../adminNav.jsp"/>
<!-- header -->
	<div class="container" >
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#BookList">대여목록</a></li>
			<li><a data-toggle="tab" href="#EbookPermit">대여허가요청</a></li>
			<li><a data-toggle="tab" href="#ExtendPermit">기간연장요청</a></li>
			<li><a data-toggle="tab" href="#insertNewOrg">새로운기업등록</a></li>
		</ul>
		<br>
		<div class="tab-content" style="margin-left:5%;">

			<div id="BookList" class="tab-pane fade in active">
					<c:set var="org_currentPage" value="${ org_currentPage }"/>
					<c:set var="org_currentBlock" value="${ org_currentBlock }" />
					<c:set var="org_allCount" value="${ allOrganCount }" />
					<c:set var="allOrganBlock" value="${ allOrganBlock }" />
					<c:set var="allOrganPage" value="${ allOrganPage }" />
					<c:set var="pagePerBlock" value="3" />
					<c:set var="contentPerPage" value="10" />
				<table id="OrganListTable" class="table table-condensed" style="width : 40%; float: left;">
					
					
					<div id="organList">
					
					<thead>

					<th>ono</th>
					<th>oname</th>
					<th>deadline</th>
					<th>type</th>
					
					</thead>

					<tbody>
					<c:forEach var="list" varStatus="status" items="${ organList }">
				
					<tr class="orgList" id="${ status.index + 1 }">
						<td>${ list.ono }</td>
						<td><a onclick="getOrgList(${ list.ono  })">${ list.oname }</a></td>
						<td>${ list.deadline }</td>
						<td>${ list.type }</td>
					</tr>

					</c:forEach>
					
					</tbody>

					</div>
					<!-- 기업목록 페이징 처리 -->
					<div id="organListPaging">

					<tr>
						<td style="text-align: center;">
						
						<ul class="pager">
						<c:forEach var="i" begin="2" end="${ allOrganBlock }">
							 <li class="previous" id="previous${ i -1 }"><a onclick ="moveBlock(${ i - 1 })">Previous</a></li>
						</c:forEach>
						</ul>
						</td>
						<td colspan="2" style="text-align: center;">
						<ul class="pagination">
						
						<c:if test="${ org_allCount < contentPerPage }">
							<li><a href="mEbook.do">1</a></li>
							  
						</c:if>
						
						<c:if test="${ org_allCount >= contentPerPage }">

						<c:forEach var="i" varStatus="status" begin="1" end="${allOrganPage }">
							<li class="org_page" id="pg${ i }"><a onclick="movePage(${ org_currentBlock }, ${ (org_currentBlock - 1) * 3 + i })">${ (org_currentBlock - 1) * 3 + i }</a></li>
						</c:forEach>
						</c:if>
						
						</ul>
						</td>
						
						<td>
						<ul class="pager">
							<c:forEach var="i" begin="1" end="${ allOrganBlock - 1}">
								 <li class="next" id="next${ i+1 }"><a onclick="moveBlock(${ i + 1 })">Next</a></li>
							</c:forEach>
	 		
						</ul>
						</td>
					</tr>
					</div>
					
				</table>
				
				<table id="organBookList" class="table table-condensed" style="width : 40%; margin-left:10%; float: right;">
					
					<!-- 가맹점별 대여된 ebook 목록을 ajax 메소드로 불러옴 -->
					<div id="list1">
						
					</div>				
					

				<c:if test="${ data.ebookList ne null }">
					
					
					<tr>
						<td colspan="4" style="text-align: center;">
						<ul class="pager">
						<c:if test="${ currentBlock ne 1 }">
						  <li class="previous"><a href="#">Previous</a></li>
						</c:if>
						
						<ul class="pagination">

						<c:forEach var="block" begin="1" end="3">
							
							  <li><a href="mEbook.do" onclick="movePage(${ block })">${ block }</a></li>
						</c:forEach>
						</ul>
						<ul class="pager">
							<c:if test="${ currentBlock eq allBlock }">
						  <li class="next"><a onclick="">Next</a></li>
						  	</c:if>
						</ul>
						</td>
					</tr>
				
				</c:if>
				</table>
				
			</div>		
		
			<div id="EbookPermit" class="tab-pane fade">

				<table class="table table-condensed">
					<th>reqNo</th>
					<th>isbn</th>
					<th>title</th>
					<th>company</th>			
					<th></th>	
					<c:forEach var="list" items="${ permitList }">
					<form action="permitEbook.do" method="post">
					<tr>
						<td>${ list.reqNo }</td>
						<td>${ list.isbn }</td>
						<td>${ list.title }</td>
						<td>${ list.ono }</td>
						<td>
						<input type="hidden" name="reqNo" value="${list.reqNo }">
						<input type="hidden" name="isbn" value="${ list.isbn }">
						<input type="hidden" name="title" value="${ list.title }">
						<input type="hidden" name="ono" value="${ list.ono }">

						<input type="submit" value="대여승인"></td>
					</tr>
					</form>
					</c:forEach>
				
				</table>


			</div>

			<div id="ExtendPermit" class="tab-pane fade">
				<table class="table table-condensed">
					<th>ono</th>
					<th>extendDate</th>		
					<c:forEach var="list" items="${ extendList }">
					<form action="extendPermit.do" method="post">
					<tr>
						<td>${ list.ono }</td>
						<td>${ list.extendDate }</td>
						<td><input type="hidden" value="${ list.ono }" name="ono">
							<input type="hidden" value="${ list.extendDate }" name="extendDate">
							<input type="submit" value="연장승인">
						</td>
					</tr>
					</form>
					</c:forEach>
				
				</table>

			</div>
			
			<div id="insertNewOrg" class="tab-pane fade">
				<h3>가맹점 등록</h3>
				<br>
				<form action="insertNewCom.do" method="post">
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">가맹점이름</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="oname" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">비밀번호</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="opwd" placeholder="Additional Info" >
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">만료날짜</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="deadline" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">가맹점유형</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="type" placeholder="Additional Info">
					</div>
					
					<input class="btn btn-default" style="width:400px;" type="submit" value="등록하기">
				</form>
			</div>
		
		</div>
	</div>





</body>
</html>