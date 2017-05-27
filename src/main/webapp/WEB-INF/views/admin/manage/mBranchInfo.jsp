<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>지 점 정 보</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript">
	function button_event() {
		// 지점정보 수정 유효성 검사.
		var form = document.updateForm;
		if(form.master.value==""){
			alert("지점장을 입력하세요.");
			form.master.focus();
			return false;
		}
		if(form.phone.value==""){
			alert("연락처를 입력하세요.");
			form.phone.focus();
			return false;
		}
		if(form.time.value==""){
			alert("영업시간을 입력하세요.");
			form.time.focus();
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
		
		if (confirm("수정 하시겠습니까 ?")) { //확인
			$('#updateForm').submit();
		} else { //취소
			return false;
		}
	}
	function sample6_execDaumPostcode() {
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

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
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
    <li class="active"><a data-toggle="tab" href="#home">지점정보</a></li>
    <li><a data-toggle="tab" href="#menu1">지점정보 수정</a></li>
  </ul>
  
  <div class="tab-content" style="margin-left:5%;">
    <div id="home" class="tab-pane fade in active">
      <h3>지점정보</h3><br>
		<c:forEach var="branch" items="${ branchInfo }">
			<table class="table table-condensed">
				<tr><td>지점 명</td><td>${ branch.name }</td></tr>
				<tr><td>지점 장</td><td>${ branch.master}</td></tr>
				<tr><td>지점 연락처</td><td>${ branch.phone }</td></tr>
				<tr><td>지점 주소</td><td>${ branch.address1 } - ${ branch.address2 }</td></tr>
				<tr><td>직원 수</td><td>${ empCount }</td></tr>
				<tr><td>매출</td><td>${ branch.sales }</td></tr>
				<tr><td>영업 시간</td><td>${ branch.time }</td></tr>
			</table>
			<hr>
		</c:forEach>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>지점정보 수정</h3><br>
      	<c:forEach var="branch" items="${ branchInfo }">
	        <div class="col-md-6 col-md-offset-3">
	          <form action="mBranchInfoUpdate.do" method="post" id="updateForm" name="updateForm">
	            <div class="form-group">
	              <label for="master">지점장</label>
	              <input type="text" class="form-control" name="master" id="msg" value="${ branch.master }">				  
	            </div>
	            <div class="form-group">
	              <label for="phone">연락처</label>
	              <input type="text" class="form-control" name="phone" id="msg" value="${ branch.phone }">
	            </div>
	            <div class="form-group">
	              <label for="time">영업시간</label>
	              <input type="text" class="form-control" name="time"  id="InputPassword2" value="${ branch.time }">	           
	            </div>
	            <div class="form-group">
	              <label for="address">
	              	<input type="button" class="btn btn-default" onclick="sample6_execDaumPostcode()" value="주소 검색">
	              </label>
	              <input type="text" name="address1" class="form-control" id="sample6_address" value="${ brnach.address1 }">
	              <input type="text" name="address2" class="form-control" id="sample6_address2" value="${ brnach.address2 }">
	            </div>
	            <input type="hidden" name="name" value="${ branch.name }">
	            <div class="form-group text-center">
	              <input type="button" class="btn btn-default" value="수정" 
	              		 onclick="button_event();" style="float:right;width:80px;">
	            </div>
	          </form>
	        </div>
	    </c:forEach>
    </div>
  </div>
</div>
</body>
</html>