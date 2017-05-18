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
<title>InventoryMain</title>
</head>
<body>

<br><br><br>

	<div class="container">
		<h3>inventoryMain</h3>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#emergency">주문요망</a></li>
			<li><a data-toggle="tab" href="#normal">재고확인</a></li>
			<li><a data-toggle="tab" href="#orderList">주문확인</a></li>
			<li><a data-toggle="tab" href="#newBookInsert">신책 등록</a></li>
		</ul>
		<br>
		<div class="tab-content">
			<div id="emergency" class="tab-pane fade in active">
				<table class="table table-condensed">
					<th>isbn</th>
					<th>title</th>
					<th>quantity</th>
					<th>branch</th>
					<th>추가 주문 하기</th>
					<c:set var="tag" value="${ '#' }" />
					<c:forEach items="${ list }" var="list">
						<tr>

							<td>${ list.isbn }</td>
							<td>${ list.title }</td>
							<td>${ list.quantity }</td>
							<td>${ list.branch }</td>
							<c:if test="${(list.quantity <= 3)}">
								<td><button type="button" class="btn btn-info btn-sm"
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
											
												<p>책제목 ${ list.title }</p>
												<p>isbn ${ list.isbn }</p>
												<p>지점 ${ list.branch }</p>
												<p>
													주문수량 <input type="number" class="form-control"
														id="quantity" name="quantity">
												</p>

											</div>
											<div class="modal-footer">
											
												<input type="hidden" name="title" value="${ list.title }">
												<input type="hidden" name="isbn" value="${ list.isbn }">
												<input type="hidden" name="branch" value="${ list.branch }">											
												<input type="submit" value="주문하기" class="btn btn-success">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
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
					<th>isbn</th>
					<th>title</th>
					<th>quantity</th>
					<th>branch</th>
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
				<table class="table table-condensed">
					<th>orderNumber</th>
					<th>isbn</th>
					<th>title</th>
					<th>publisher</th>
					<th>quantity</th>
					<th>branch</th>
					<th>cost</th>
					<th>date</th>
					<th>입고 확인</th>
					<c:forEach items="${ list3 }" var="list">
						<tr>
						
						<form action="orderConfirm.do" method="post">
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
							<td><input type="submit" value="입고확인"> </td>
						</form>

						</tr>
					</c:forEach>
				</table>

			</div>
			
			<div id="newBookInsert" class="tab-pane fade">
				<h3>신책 등록</h3>
				<form action="insertNewBook.do" method="post">
				<table class="table table-condensed">
					<tr>
						<td>
							title : <input type="text" name="title">
						</td>
					</tr>
					<tr>
						<td>
							price : <input type="text" name="price">
						</td>
					</tr>
					<tr>
						<td>
							author : <input type="text" name="author">
						</td>
					</tr>
					<tr>
						<td>
							publisher : <input type="text" name="publisher">
						</td>
					</tr>
					<tr>
						<td>
							type : <input type="text" name="type">
						</td>
					</tr>
					<tr>
						<td>
							isbn : <input type="text" name="isbn">
						</td>
					</tr>
					<tr>
						<td>
							category : <input type="text" name="category">
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="등록하기">
						</td>
					</tr>
				</table>
				</form>

			</div>
			
		</div>
	</div>





</body>
</html>