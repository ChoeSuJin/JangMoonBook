<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<title>재 고 관 리</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function button_event() {
			if (confirm("등록 하시겠습니까 ?")) { //확인
				$('#insert').submit();
			} else { //취소
				return false;
			}
		}
  </script>
</head>
<body>
<!-- header -->
<jsp:include page="../adminNav.jsp"/>
<!-- header -->
	<div class="container" >
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#emergency">주문요망</a></li>
			<li><a data-toggle="tab" href="#normal">재고확인</a></li>
			<li><a data-toggle="tab" href="#orderList">주문확인</a></li>
			<li><a data-toggle="tab" href="#newBookInsert">신책 등록</a></li>
		</ul>
		<br>
		<div class="tab-content" style="margin-left:5%;">
			<div id="emergency" class="tab-pane fade in active">
				<table class="table table-condensed">
					<tr>
						<th>ISBN</th>
						<th>제목</th>
						<th>작가</th>
						<th>수량</th>
						<th>지점</th>
						<th>추가 주문</th>
					</tr>
					<c:set var="tag" value="${ '#' }" />
					<c:forEach items="${ list }" var="list">
						<tr>

							<td>${ list.isbn }</td>
							<td>${ list.title }</td>
							<td>${ list.author }</td>
							<td>${ list.quantity }</td>
							<td>${ list.branch }</td>
							<c:if test="${(list.quantity <= 3)}">
								<td><button type="button" class="btn btn-default"
										data-toggle="modal" data-target="${ tag }${ list.isbn }">추가주문하기</button></td>
								<!-- Modal -->
								<div class="modal fade" id="${ list.isbn }" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">추가 주문하기</h4>
											</div>
											
											<form action="orderInven.do" method="post">
												<div class="modal-body">
													<p style="font-size:1.3em;float:left;">${ list.isbn }</p>
													<p style="font-size:1.3em;margin-left:40px;float:left;">${ list.title }</p>
													<p style="font-size:1.3em;margin-left:40px;float:left;">${ list.author }</p>
													<p style="font-size:1.3em;margin-left:40px;float:left;">${ list.branch }</p><br><br>
												</div>
												<div class="modal-footer">
													<h3 style="float:left;">주문수량</h3>
													<input type="number" class="form-control"
													id="quantity" name="quantity"><br>
													<input type="hidden" name="title" value="${ list.title }">
													<input type="hidden" name="isbn" value="${ list.isbn }">
													<input type="hidden" name="branch" value="${ list.branch }">											
													<input type="hidden" name="author" value="${ list.author }">											
													<input type="submit" value="주문하기" class="btn btn-success">
													<button type="button" class="btn btn-default"
														data-dismiss="modal" style="width:80px;">주문취소</button>
												</div>
											</form> 
											
											</div>
										</div>
									</div>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="normal" class="tab-pane fade">
				<table class="table table-condensed">
				<tr>
					<th>ISBN</th>
					<th>제목</th>
					<th>수량</th>
					<th>지점</th>
				</tr>
					<c:forEach items="${ list2 }" var="list">
						<tr>
							<td>${ list.isbn }</td>
							<td>${ list.title }</td>
							<td>${ list.quantity }</td>
							<td>${ list.branch }</td>
						</tr>
					</c:forEach>
				</table>

			</div>
			
			<div id="orderList" class="tab-pane fade">
				<h3>주문내역확인</h3>
				<br>
				<form action="orderConfirm.do" method="post">
				<table class="table table-condensed">
					<tr>
						<th>주문번호</th>
						<th>ISBN</th>
						<th>제목</th>
						<th>작가</th>
						<th>수량</th>
						<th>지점</th>
						<th>가격</th>
						<th>주문일</th>
						<th>입고 확인</th>
					</tr>
					<c:forEach items="${ list3 }" var="list">
					<tr>
						<td>${ list.orderNumber }</td>
						<td>${ list.isbn }</td>
						<td>${ list.title }</td>
						<td>${ list.publisher }</td>
						<td>${ list.quantity }</td>
						<td>${ list.branch }</td>
						<td>${ list.cost }</td>
						<td>${ list.o_date }</td>
						<input type="hidden" value="${ list.orderNumber }" name="orderNumber">
						<input type="hidden" value="${ list.isbn }" name="isbn">
						<input type="hidden" value="${ list.title }" name="title">
						<input type="hidden" value="${ list.publisher }" name="publisher">
						<input type="hidden" value="${ list.quantity }" name="quantity">
						<input type="hidden" value="${ list.branch }" name="branch">
						<input type="hidden" value="${ list.cost }" name="cost">
						<input type="hidden" value="${ list.o_date }" name="o_date">
						<td><input type="submit" class="btn btn-default" value="입고확인"> </td>
					</tr>

					</c:forEach>
				</table>
				</form>

			</div>
			
			<div id="newBookInsert" class="tab-pane fade">
				<h3>신책 등록</h3>
				<br>
				<form action="insertNewBook.do" method="post" id="insert" enctype="multipart/form-data">
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">책 이름</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="title" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">가격</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="price" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">저자</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="author" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">출판사</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="publisher" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">구분</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="type" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">ISBN</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="isbn" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">카테고리</span> 
						<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
							   name="category" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">이미지등록</span> 
						<input style="height:40px;width:300px;" id="msg" type="file" class="form-control" 
							   name="file" placeholder="Additional Info">
					</div>
					<input class="btn btn-default" style="width:400px;" type="submit" value="등록하기" onclick="button_event();">
				</form>
			</div>
		
		</div>
	</div>

</body>
</html>