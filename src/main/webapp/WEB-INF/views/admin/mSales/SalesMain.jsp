<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매출관리 메인</title>
</head>

<script type="text/javascript">

	
	
	
	$(document).ready(function () {
		var sumNew = $('#sumNew').val();
		var sumUsed = $('#sumUsed').val();
		 var option = {
				    responsive: true,
				    };
				   
				    // Get the context of the canvas element we want to select
				    var ctx = document.getElementById("myChart").getContext('2d');
		var myPieChart = new Chart(ctx).Pie(data,option);
		var data = [
		    {
		        value: sumNew,
		        color:"#F7464A",
		        highlight: "#FF5A5E",
		        label: "Red"
		    },
		    {
		        value: sumUsed,
		        color: "#46BFBD",
		        highlight: "#5AD3D1",
		        label: "Green"
		    }
		]
	});

	
</script>

<body>
<h3></h3>
<br><br>
<input type="hidden" id="sumNew" value=${ sumNew }>
<input type="hidden" id="sumUsed" value=${ sumUsed }>


<div class="container">
		<h3>SalesMain</h3>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#saleNewBook">신책</a></li>
			<li><a data-toggle="tab" href="#saleUsedBook">중고</a></li>
		</ul>
		<br>
		
		<div id="saleNewBook" class="tab-pane fade in active">
				<h3>신책 판매</h3>
				<table class="table table-condensed" style="width: 50%;">
					<th>saleNumber</th>
					<th>isbn</th>
					<th>title</th>
					<th>id</th>
					<th>dPrice</th>
					<th>branchName</th>
					<th>quantity</th>
					<th>s_date</th>
					<c:forEach items="${ list1 }" var="list">
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
						<td colspan="8">총 = ${ sumNew }원</td>
					</tr>
				</table>

			</div>
			
			<div id="saleUsedBook" class="tab-pane fade">
				<h3>중고책 판매</h3>
				<table class="table table-condensed" style="width: 50%;">
					<th>saleNumber</th>
					<th>isbn</th>
					<th>title</th>
					<th>id</th>
					<th>dPrice</th>
					<th>branchName</th>
					<th>quantity</th>
					<th>s_date</th>
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
			<canvas id="myChart" style="width: 300px; height: 300px;"></canvas>
</div>


</body>
</html>