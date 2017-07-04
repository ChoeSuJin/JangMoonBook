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
<title>쪽지함</title>
</head>

<body>

<jsp:include page="adminNav.jsp"/>
<!-- header -->
<div class="container">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#recvBox">받은 쪽지함</a></li>
		<li><a data-toggle="tab" href="#sentBox">보낸 쪽지함</a></li>
		<li><a data-toggle="tab" href="#sendNote">쪽지 보내기</a></li>
	</ul>
	
	<div class="tab-content" style="margin-left:5%;">
		<div id="recvBox" class="tab-pane fade in active">
			<table class="table table-striped">
				<th>보낸사람</th>
				<th>제목</th>
				<th>받은날짜</th>
				<th>삭제</th>
				<c:if test="${ recvListSize == 0 }">
					<tr>
						<td colspan="3">받은 쪽지가 업습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ recvListSize != 0 }">
				<c:forEach items="${ recvList }" var="list">
				<tr>
					<td>${ list.sent_id }</td>
					<td>
						<a data-toggle="modal" data-target="#recvNote${ list.noteNo }">${ list.title }</a>
						<div class="modal fade" id="recvNote${ list.noteNo }" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">받은 메세지</h4>
								</div>
								<div class="modal-body">
								
									<!-- 직원 정보 수정 -->
									<div class="recvNote">
											<div class="form-group">
									             <label>보낸사람</label>
									             <input readonly="readonly" class="form-control" name="sent_id" value="${ list.sent_id }">				  
									        </div>
											<div class="form-group">
									             <label>제목</label>
									             <input type="text" class="form-control" name="title" id="msg" value="${ list.title }">				  
									           </div>
											<div class="form-group">
									             <label>내용</label><br>
									             <textarea class="form-control" rows="5" name="content" readonly="readonly">${ list.content }</textarea>
									        </div>
											
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" value="닫기" data-dismiss="modal" class="btn btn-default" style="float:right;">
      							</div>
							</div>
						</div>
					</div>
					</td>
					<td>${ list.date_sent }</td>
					<td>
						<form action="recvMsgDel.do" method="post">
							<input type="hidden" name="noteNo" value="${ list.noteNo }">
							<input type="submit" value="삭제">
						</form>
					</td>
				</tr>
				</c:forEach>
				</c:if>
			</table>
			
		</div>
		<div id="sentBox" class="tab-pane fade">
			<table class="table table-striped">
				<th>받는사람</th>
				<th>제목</th>
				<th>보낸날짜</th>
				<th>삭제</th>
				<c:if test="${ sendListSize == 0 }">
					<tr>
						<td colspan="3">보낸 쪽지가 업습니다.</td>
					</tr>
				</c:if>
				<c:if test="${ sendListSize != 0 }">
				<c:forEach items="${ sendList }" var="list">
				<tr>
					<td>${ list.recv_id }</td>
					<td><a data-toggle="modal" data-target="#sentNote${ list.noteNo }">${ list.title }</a>
					<div class="modal fade" id="sentNote${ list.noteNo }" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">받은 메세지</h4>
								</div>
								<div class="modal-body">
								
									<!-- 직원 정보 수정 -->
									<div class="recvNote">
											<div class="form-group">
									             <label>받는사람</label>
									             <input readonly="readonly" class="form-control" name="sent_id" value="${ list.recv_id }">				  
									        </div>
											<div class="form-group">
									             <label>제목</label>
									             <input type="text" class="form-control" name="title" id="msg" value="${ list.title }">				  
									           </div>
											<div class="form-group">
									             <label>내용</label><br>
									             <textarea class="form-control" rows="5" name="content" readonly="readonly">${ list.content }</textarea>
									        </div>
											
									</div>
								</div>
								<div class="modal-footer">
									<input type="submit" value="닫기" data-dismiss="modal" class="btn btn-default" style="float:right;">
      							</div>
							</div>
						</div>
					</div>
					</td>
					<td>${ list.date_sent }</td>
					<td>
						<form action="sentMsgDel.do" method="post">
							<input type="hidden" name="noteNo" value="${ list.noteNo }">
							<input type="submit" value="삭제">
						</form>
					</td>
				</tr>
				</c:forEach>
				</c:if>
			</table>
		</div>
		<div id="sendNote" class="tab-pane fade">
		
			<table class="table table-striped">
			<form action="sendNote.do" method="post" name="sendNoteForm">
				<tr>
					<td>받는사람</td>
					<td><input type="text" name="recv_id"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="100" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<button onclick="checkNote();">보내기</button>
						<button id="cancelNote">취소</button>
					</td>
				</tr>
			</form>
			</table>
		
		</div>
	</div>
	
	
	
</div>

</body>
<script type="text/javascript">

	function checkNote() {
		
		var test = $("sendNoteForm recv_id").value;
		alert(test);
		
		if ($("sendNoteForm recv_id").value == "") {
			alert("받는 사람을 입력해주세요.");
			alert($("sendNoteForm recv_id").value);
			$("sendNoteForm recv_id").focus;
			return false;
		}
		if ($("sendNoteForm title").value == """) {
			alert("제목을 입력해주세요.");
			return false;
		}
		if $("sendNoteForm content").value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}
		
		$("#sendNoteForm").submit();
		
		
	}

</script>
</html>