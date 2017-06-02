<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<title>직 원 관 리</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		// 직원등록 폼 유효성 검사
		function button_event() {
			var form = document.empInsertForm;
			if(form.name.value==""){
				alert("이름을 입력하세요.");
				form.name.focus();
				return false;
			}
			if(form.pwd.value==""){
				alert("암호를 입력하세요.");
				form.pwd.focus();
				return false;
			}
			if(form.phone.value==""){
				alert("연락처를 입력하세요.");
				form.phone.focus();
				return false;
			}
			if(form.birth.value==""){
				alert("주민번호 앞자리를 입력하세요.");
				form.birth.focus();
				return false;
			}
			if(form.address1.value==""){
				alert("주소를 입력하세요.");
				form.address1.focus();
				return false;
			}
			if(form.address2.value==""){
				alert("상세주소를 입력하세요.");
				form.address2.focus();
				return false;
			}
			if (confirm("직원을 등록 하시겠습니까 ?")) { //확인
				$('#empInsertForm').submit();
			} else { //취소
				return false;
			}
		}
		function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('address1').value = fullAddr;
	                document.getElementById('address2').focus();
	            }
	        }).open();
	    }
	</script>
</head>
<body>
<!-- header -->
<jsp:include page="../adminNav.jsp"/>
<!-- header -->
<div class="container">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">목록</a></li>
		<li><a data-toggle="tab" href="#menu1">직원등록</a></li>
	</ul>
		<div class="tab-content" style="margin-left: 5%;">
		<!-- 직원 목록, 수정, 삭제 -->
		<div id="home" class="tab-pane fade in active">
			<h3>직원목록</h3><br>
			<!-- 이름으로 직원 검색 -->
			<form action="mEmployee.do" method="post">
				<div class="input-group" style="float:left;">
					<span class="input-group-addon" style="width:100px;">이름</span>
					<input id="search" type="text" name="name" class="form-control" placeholder="이름 입력">
				</div>
				<div style="float:left;">
					<input type="submit" class="btn btn-default" value="검색">
				</div>
			</form>
			<!-- 이름으로 직원 검색 -->
			
			<!-- 직원목록 전체 출력 버튼 -->
			<div style="float:right;margin-top:-15px;">
				<form action="mEmployee.do" method="post">
					<input type="submit" class="btn btn-default" value="전체보기">
				</form>
			</div>
			<!-- 직원목록 전체 출력 버튼 -->
			<br><br>
			
			<!-- 직원 목록 출력 -->
			<table class="table table-condensed">
				<tr>
					<th>직원번호</th>
					<th>이름</th>
					<th>직급</th>
					<th>주소</th>
					<th>연락처</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>지점</th>
				</tr>
				<c:forEach var="employee" items="${ employeeList }"
					varStatus="status">
					<tbody id="tbody">
					<tr name="${ employee.name }">
						<td>
							<button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#myModal${ employee.empno }">${ employee.empno }</button>
						</td>
						<td>${ employee.name }</td>
						<td>${ employee.empclass }</td>
						<td>${ employee.address1 }-${ employee.address2 }</td>
						<td>${ employee.phone }</td>
						<td>${ employee.gender }</td>
						<td>${ employee.birth }</td>
						<td>${ employee.branch }</td>
					</tr>
					</tbody>
			<!-- 직원 목록 출력 -->
			
			<!-- 직원 목록, 수정, 삭제 -->
					<div class="modal fade" id="myModal${ employee.empno }"	role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">직원관리</h4>
								</div>
								<div class="modal-body">
								
									<!-- 직원 정보 수정 -->
									<div class="empInfo">
										<form action="mEmployeeUD.do" method="post" name="empUpdateForm">
											<div class="form-group">
									             <label for="name">직원번호</label>
									             <input readonly="readonly" class="form-control" name="empno" id="msg" value="${ employee.empno }">				  
									        </div>
											<div class="form-group">
									             <label for="password">비밀번호</label>
									             <input type="password" class="form-control" name="pwd" id="msg" value="${ employee.pwd }">				  
									           </div>
											<div class="form-group">
									             <label for="phone">연락처</label>
									             <input type="text" class="form-control" name="phone" id="msg" value="${ employee.phone }">				  
									        </div>
											<input type="submit" value="수정완료" class="btn btn-default" style="float:right;">
										</form>
									</div>
									<!-- 직원 정보 수정 -->
									
									<!-- 직원 삭제 -->
									<form action="mEmployeeUD.do" method="post" id="delete">
										<input type="hidden" value="${employee.empno}" name="empno">
										<input type="submit" class="btn btn-default" value="삭제">
									</form>
									<!-- 직원 삭제 -->
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</table><hr>
		</div>
		<!-- 직원 목록, 수정, 삭제 -->
		
		<!-- 직원 추가 탭 -->
		<div id="menu1" class="tab-pane">
			<h3>직원등록</h3><br>
				<form role="form" action="mEmployeeIn.do" method="post" id="empInsertForm" name="empInsertForm">
					<div class="form-group">
			             <label for="name">이름</label>
			             <input type="text" class="form-control" name="name" id="msg" placeholder="Additional Info">				  
			           </div>
					<div class="form-group">
			             <label for="password">비밀번호</label>
			             <input type="password" class="form-control" name="pwd" id="msg" placeholder="Additional Info">				  
			           </div>
					<div class="form-group">
			             <label for="phone">연락처</label>
			             <input type="text" class="form-control" name="phone" id="msg" placeholder="Additional Info without -">				  
			           </div>
					<div class="form-group">
			           <label for="empclass">직급</label>
			           <select name="empclass" class="form-control" id="sel1">
					 	   <option value="ROLE_BRONZE">직원</option> 
						   <option value="ROLE_GOLD">매니저</option> 
					   </select>				  
			        </div>
					<div class="form-group">
			             <label for="gender">성별</label>
			             <select name="gender" class="form-control" id="sel2">
							  <option value="M">M</option> 
							  <option value="F">F</option> 
					  	 </select>			  
			        </div>
			        <div class="form-group">
			          <label for="birth">생년월일</label>
			          <input type="text" class="form-control" name="birth" id="msg" placeholder="Additional Info">				  
			        </div>
					
					<!-- 주소 -->
					<div class="form-group">
						<label for="address">
							<input type="button" class="btn btn-default" onclick="execDaumPostcode()" value="주소 검색">
						</label>
						<input type="text" name="address1" class="form-control" id="address1" placeholder="주소를 검색하세요">
						<input type="text" name="address2" class="form-control" id="address2" placeholder="상세주소를 입력하세요">
					</div>
					<!-- 주소 -->
					
					<c:forEach var="emp" items="${ employeeList }" begin="0" end="0">
					<input type="hidden" name="branch" value="${ emp.branch }">
					<input type="hidden" name="cmd" value="insert">					
					</c:forEach>
					<input style="float:right;width:100px;" type="button" 
						   class="btn btn-info" value="추가" onclick="button_event()">
				</form>
		</div>
	</div>
</div>
</body>
</html>