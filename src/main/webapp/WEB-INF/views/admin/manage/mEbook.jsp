<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<!DOCTYPE html>
<html>
<head>
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
		$(".orgList").hide();
		var org_currentPage = <c:out value="${org_currentPage}" />;
		for(var i = (org_currentPage - 1) * 3; i < (org_currentPage) * 3; i++) {
    		$("#"+ (i+1) + "").show();
    	}
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
            	$("#list1").append("<th>isbn</th><th>title</th><th>company</th>");

            	for(var i = 0; i< newVal.length; i++) {
        			$("#list1").append("<tr><td>"+ newVal[i].isbn +"</td><td>" + newVal[i].title + "</td><td>" + newVal[i].ono + "</td></tr>");
        		}

            }
             
        })
	}
	
function movePage(block, page) {
	
		
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

            	$("#organList").trigger("create");
            	
            	var org_currentPage = data.page;
            	var org_currentBlock = data.block;
            	var getList = data.list;
            	
            	alert("org_currentPage = " + org_currentPage);
            	alert("org_currentBlock = " + org_currentBlock);

            	$(".orgList").hide();
            	
            	for(var i = (org_currentPage - 1) * 3; i < (org_currentPage) * 3; i++) {
            		$("#"+ (i+1) + "").show();
            		alert(i);
            	}

            }
             
        })
	}
	
function moveBlock(block) {
	
	$.ajax({
        type : "POST",
        url : "moveBlock.do",
        data : {"Block" : block },
        dataType : "JSON",
        error : function(){
            alert('에러발생');
        },
        success : function(data){
        	
        	var org_currentPage = data.page;
        	var org_currentBlock = data.block;
        	var contentPerPage = 3;
        	var getList = data.list;

        }
         
    })
}
	
	
</script>
<body>
<!-- header -->
<jsp:include page="../adminMain.jsp"/>
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
					<c:set var="contentPerPage" value="3" />
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
						<td colspan="4" style="text-align: center;">
						<ul class="pager">
						<c:if test="${ org_currentBlock > 1 }">
						  <li class="previous"><a onclick ="moveBlock(${ org_currentBlock - 1 })">Previous</a></li>
						</c:if>
						</ul>
						
						<ul class="pagination">
						
						<c:if test="${ org_allCount < contentPerPage }">
							<li><a href="mEbook.do">1</a></li>
							  
						</c:if>
						
						<c:if test="${ org_allCount >= contentPerPage }">
							<c:forEach var="page" begin="1" end="3">
							
							  <li><a onclick="movePage(${ org_currentBlock }, ${ (org_currentBlock - 1) * 3 + page })">${ (org_currentBlock - 1) * 3 + page }</a></li>
						</c:forEach>
						</c:if>
						
						</ul>
						<ul class="pager">
							<c:if test="${ org_currentBlock < allOrganBlock }">
						 		 <li class="next"><a onclick="moveBlock(${ org_currentBlock + 1 })">Next</a></li>
						  	</c:if>
						</ul>
						</td>
					</tr>
					</div>
					
				</table>
				
				<table id="organBookList" class="table table-condensed" style="width : 40%; margin-left:10%; float: right;">
					
					<!-- 가맹점별 대여된 ebook 목록을 ajax 메소드로 불러옴 -->
					<!-- 부트스트랩을 끌어올 필요가있음 -->
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
						  <li class="next"><a href="#">Next</a></li>
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
						<td>${ list.com }</td>
						<td>
						<input type="hidden" name="reqNo" value="${list.reqNo }">
						<input type="hidden" name="isbn" value="${ list.isbn }">
						<input type="hidden" name="title" value="${ list.title }">
						<input type="hidden" name="com" value="${ list.com }">

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