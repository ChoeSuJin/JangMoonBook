<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
  <c:set value="${pageContext.request.contextPath}/resources" var="resources" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>StarBooks| Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${resources}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${resources}/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${resources}/plugins/iCheck/square/blue.css">
  
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="#"><b>Star</b>Books</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">직원 등록</p>

    <form action="" method="post" name="registForm">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="name" placeholder="이름">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="pwd" placeholder="암호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="pwd_ch" placeholder="암호 확인">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="phone" placeholder="연락처">
        <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="birth" placeholder="생년월일">
        <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="button" class="btn btn-primary btn-block btn-flat" onclick="execDaumPostcode()" value="주소검색">
        <input type="text" class="form-control" name="address1" id="address1" placeholder="주소">
        <input type="text" class="form-control" name="address2" id="address2" placeholder="상세주소">
        <span class="glyphicon glyphicon-home form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
	    <select class="form-control" name="empclass">
		  <option value="ROLE_BRONZE">직원</option>
		  <option value="ROLE_GOLD">매니저</option>
		  <option value="ROLE_PLATINUM">점장</option>
        </select>
      </div>
      <div class="form-group has-feedback">
	    <select class="form-control" name="gender">
		  <option value="M">남</option>
		  <option value="F">여</option>
        </select>
      </div>
      <div class="row">
        <div class="col-xs-8">
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="button" onclick="return button_event()" class="btn btn-primary btn-block btn-flat">등록하기</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- post code -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- jQuery 2.2.3 -->
<script src="${resources}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${resources}/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${resources}/plugins/iCheck/icheck.min.js"></script>
	<script>
	  $(function () {
	    $('input').iCheck({
	      checkboxClass: 'icheckbox_square-blue',
	      radioClass: 'iradio_square-blue',
	      increaseArea: '20%' // optional
	    });
	  });
	  
		// 직원등록 폼 유효성 검사
		function button_event() {
			var form = document.registForm;
			if (form.name.value == "") {
				alert("이름을 입력하세요.");
				form.name.focus();
				return false;
			}
			if (form.pwd.value == "") {
				alert("암호를 입력하세요.");
				form.pwd.focus();
				return false;
			}
			if (form.pwd_ch.value == "") {
				alert("암호 확인을 입력하세요.");
				form.pwd.focus();
				return false;
			}
			if (form.phone.value == "") {
				alert("연락처를 입력하세요.");
				form.phone.focus();
				return false;
			}
			if (form.birth.value == "") {
				alert("주민번호 앞자리를 입력하세요.");
				form.birth.focus();
				return false;
			}
			if (form.address1.value == "") {
				alert("주소를 입력하세요.");
				form.address1.focus();
				return false;
			}
			if (form.address2.value == "") {
				alert("상세주소를 입력하세요.");
				form.address2.focus();
				return false;
			}
			if (confirm("직원을 등록 하시겠습니까 ?")) { //확인
				form.submit();
			} else { //취소
				return false;
			}
		}
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
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
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('address1').value = fullAddr;
					document.getElementById('address2').focus();
				}
			}).open();
		}
	</script>
</body>
</html>
