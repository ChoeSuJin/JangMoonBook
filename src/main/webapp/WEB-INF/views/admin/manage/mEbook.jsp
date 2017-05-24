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
            	 
            	$("#organBookList").html("");
            	$("#organBookList").append("<th>isbn</th><th>title</th><th>company</th>");

            	for(var i = 0; i< newVal.length; i++) {
        			$("#organBookList").append("<tr><td>"+ newVal[i].isbn +"</td><td>" + newVal[i].title + "</td><td>" + newVal[i].ono + "</td></tr>");
        		}


            	
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
				<table class="table table-condensed" style="width : 40%; float: left;">

					<th>ono</th>
					<th>oname</th>
					<th>deadline</th>
					<th>type</th>				
					<c:forEach var="list" items="${ organList }">
					
					<tr>
						<td>${ list.ono }</td>
						<td><a onclick="getOrgList(${ list.ono });">${ list.oname }</a></td>
						<td>${ list.deadline }</td>
						<td>${ list.type }</td>

					</tr>

					</c:forEach>
					
				</table>
				
				<table id="organBookList" class="table table-condensed" style="width : 40%; margin-left:10%; float: right;">
					<c:set var="currentPage" value="${ currentPage }"/>
					<c:set var="currentBlock" value="${ currentBlock }" />
					<c:set var="allPage" value="${ allPage }" />
					<c:set var="allBlock" value="${ allBlock }"/>

				<c:if test="${ data.ebookList ne null }">
					<th>isbn</th>
					<th>title</th>
					<th>company</th>
					<div id="list1">
						<c:forEach var="list" items="${ data.ebookList }" step="1" begin="${ (currentPage - 1) * 3 }" end="${ currentPage * 3  - 1}">
							<tr>
								<td>${ list.isbn }</td>
								<td>${ list.title }</td>
								<td>${ list.com }</td>
							</tr>
					
						</c:forEach>
					</div>				
					
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