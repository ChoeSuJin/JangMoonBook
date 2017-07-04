<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>사내공지사항관리</title>
</head>
<body>

<jsp:include page="../adminNav.jsp"/>
<!-- header -->
	<div class="container" >
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#viewNotice">공지사항보기</a></li>
			<li><a data-toggle="tab" href="#regNotice">공지사항등록</a></li>
		</ul>
		<br>
		<div class="tab-content" style="margin-left:5%;">

			<div id="viewNotice" class="tab-pane fade in active">
<<<<<<< HEAD
				<div class="panel-group" id="accordion">
				<table id="viewNoticeTable" class="table table-condensed">
					<th>num</th>
					<th>writer</th>
					<th>title</th>
					<th>regDate</th>
					<th>삭제하기</th>
					<c:forEach items="${ list }" var="list">
					<div class="panel panel-default">
							<tr class="panel panel-heading" class="panel-title">
								<form action="deleteAdminNotice.do" method="post">
								<input type="hidden" name="num" value="${ list.num }">						
								<td>${ list.num }</td>
								<td>${ list.writer }</td>
								<td><a data-toggle="collapse" data-parent="#accordion" href="#notice${ list.num }">${ list.title }</a></td>
								<td>${ list.regDate }</td>
								<td><input type="submit" value="삭제"></td>
								</form>
							</tr>
					
						<tr id="notice${ list.num }" class="panel-collapse collapse">
					        <div class="panel-body">
								<td colspan="5">${ list.content }</td>
							</div>
							</tr>
						<%-- <div id="notice${ list.num }" class="panel-collapse collapse">
					        <tr id="notice${ list.num }" class="panel-collapse collapse">
					        <div class="panel-body">
								<td colspan="5">${ list.content }</td>
							</div>
							</tr>
					    </div> --%>
					</div>
					</c:forEach>
				</table>	
				</div>
=======
				<h3>본사 공지사항</h3>
					<div id="viewNotice">
						<div class="panel-group" id="accordion">
						<table id="viewNoticeTable" class="table table-striped">
							<tr class="info">
							<th>num</th>
							<th>writer</th>
							<th>title</th>
							<th>regDate</th>
							<th>삭제하기</th>
							</tr>
							<c:forEach items="${ list }" var="list">
								<tr class="panel panel-default panel-heading panel-title">						
									<form action="deleteAdminNotice.do" method="post">
									<input type="hidden" name="num" value="${ list.num }">						
									<td>${ list.num }</td>
									<td>${ list.writer }</td>
									<td><a data-toggle="collapse" data-parent="#accordion" href="#notice${ list.num }">${ list.title }</a></td>
									<td><fmt:formatDate value="${ list.regDate }" type="date"/></td>
									<td><input type="submit" value="삭제"></td>
									</form>
								</tr>
							
								<tr id="notice${ list.num }" class="panel-collapse collapse">
									<td colspan="5"class="panel-body">${ list.content }</td>
			
								</tr>
							</c:forEach>
						</table>	
						</div>
					</div>
>>>>>>> branch 'newMaster' of https://github.com/ChoeSuJin/JangMoonBook.git
				
			</div>		
		
			<div id="regNotice" class="tab-pane fade">
				<div class="container">
				  <form action="regAdminNotice.do" method="post">
				    <div class="form-group">
				      <label for="title">제목</label>
				      <input type="text" class="form-control" id="title" name="title">
				    </div>
				    <div class="form-group">
				      <label for="content">내용</label>
				      <textarea class="form-control" rows="5" id="content" name="content"></textarea>
				    </div>
				    <input type="hidden" value="${ sessionScope.user.name }" name="writer">
				    <input type="submit" class="btn btn-default">
				  </form>
				</div>

			</div>

			
		</div>
	</div>

</body>
</html>