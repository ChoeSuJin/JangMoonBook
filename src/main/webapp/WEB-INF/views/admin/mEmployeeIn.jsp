<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
  <c:set value="${pageContext.request.contextPath}/resources" var="resources" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Advanced form elements</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${resources}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="${resources}/plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="${resources}/plugins/datepicker/datepicker3.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="${resources}/plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="${resources}/plugins/colorpicker/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${resources}/plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="${resources}/plugins/select2/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${resources}/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${resources}/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Header -->
  <jsp:include page="tool_header.jsp" />
  <!-- Header -->
  
  <!-- sideBar -->
  <jsp:include page="tool_sideBar.jsp" />
  <!-- sideBar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
                직원등록
        <small>${branch}</small>
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Home</li>
        <li>직원관리</li>
        <li>직원등록</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="register-box" style="margin-top:30px;">
            <div class="box-header">
              <p style="font-size:0.7em;margin-left:13px;">아이디는 자동으로 생성됩니다.</p>
            </div>
            <!-- /.box-header -->
            <div class="register-box-body" style="background-color:#ecf0f5;">
               <form action="mEmployeeIn.do" method="post" name="registForm">
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
			         <input type="text" class="form-control" name="phone" data-inputmask='"mask": "99999999999"' data-mask placeholder="연락처">
			        <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
			      </div>
			      <div class="form-group has-feedback">
			         <input type="text" class="form-control" name="birth" data-inputmask="'mask': '999999'" data-mask placeholder="생년월일">
			        <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
			      </div>
			      <div class="form-group has-feedback">
			        <input type="button" class="btn btn-primary btn-block" onclick="execDaumPostcode()" value="주소검색">
			      </div>
			      <div class="form-group has-feedback">
			        <input type="text" class="form-control" name="address1" id="address1" placeholder="주소">
			        <span class="glyphicon glyphicon-home form-control-feedback"></span>
			      </div>
			      <div class="form-group has-feedback">
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
			          <button type="button" onclick="return RegistEmp_ch()" class="btn btn-primary btn-block">등록하기</button>
			        </div>
			        <!-- /.col -->
			      </div>
			   </form>
            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <jsp:include page="tool_controlSidebar.jsp" />
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- post code -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- jQuery 2.2.3 -->
<script src="${resources}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${resources}/bootstrap/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="${resources}/plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="${resources}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${resources}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${resources}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${resources}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="${resources}/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="${resources}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${resources}/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${resources}/dist/js/demo.js"></script>
<!-- Page script -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });
    //직원등록 폼 유효성 검사
	function RegistEmp_ch() {
		var form = document.registForm;
		
		if(form.name.value==""){
			alert("이름을 입력해주세요.");
			form.name.focus();
			return false;
		}
		if(form.pwd.value==""){
			alert("암호를 입력해주세요.");
			form.pwd.focus();
			return false;
		}
		//비밀번호 길이 체크(4~8자 까지 허용)
		if (form.pwd.value.length<8 || form.pwd.value.length>16){
			alert("암호를 8~16자까지 입력해주세요.");
			form.pwd.focus();
			return false;
		}
		if (form.pwd.value != form.pwd_ch.value){
			alert("암호가 일치하지 않습니다. 다시 입력해주세요.");
			form.pwd_ch.focus();
			return false;
		}
		if(form.phone.value.length != 11){
			alert("연락처를 입력해주세요.");
			form.phone.focus();
			return false;
		}
		if(form.birth.value.length != 6){
			alert("주민번호 앞자리 6자리를 입력해주세요.");
			form.birth.focus();
			return false;
		}
		if(form.address1.value==""){
			alert("주소를 입력해주세요.");
			form.address1.focus();
			return false;
		}
		if(form.address2.value==""){
			alert("상세주소를 입력해주세요.");
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
</body>
</html>
