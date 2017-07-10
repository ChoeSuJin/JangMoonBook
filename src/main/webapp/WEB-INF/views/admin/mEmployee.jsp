<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
  <c:set value="${pageContext.request.contextPath}/resources" var="resources" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>StarBooks | Manage Emp</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${resources}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${resources}/plugins/datatables/dataTables.bootstrap.css">
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
  <jsp:include page="tool_header.jsp"></jsp:include>
  <!-- Header -->
  
  <!-- sideBar -->
  <jsp:include page="tool_sideBar.jsp"></jsp:include>
  <!-- sideBar -->
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
                직원관리
        <small>${branch}</small>
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Home</li>
        <li>Employee</li>
        <li>직원관리</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">직원목록</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>직원번호(아이디)</th>
                  <th>이름</th>
                  <th>연락처</th>
                  <th>주소</th>
                  <th>직급</th>
                  <th>지점</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="emp" items="${employeeList}">                
	                <tr>
	                  <td><a data-toggle="modal" data-target="#empModal_${emp.empno}">${emp.empno}</a></td>
	                  <div class="modal fade" tabindex="-1" id="empModal_${emp.empno}" role="dialog" aria-labelledby="gridSystemModalLabel">
						  <div class="modal-dialog" role="document">
							<form action="mEmployeeUD.do" method="post" id="empModifyForm${emp.empno}">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="exampleModalLabel">직원정보 수정</h4>
						      </div>
						      <div class="modal-body">
						          <div class="form-group">
						            <label for="recipient-name" class="control-label">이름</label>
						            <input readonly="readonly" class="form-control" name="name" value="${emp.name}">
						          </div>
						          <div class="form-group">
						            <label for="message-text" class="control-label">연락처</label>
						            <input type="text" class="form-control"name="phone" value="${emp.phone}">
						          </div>
						          <div class="form-group">
						            <label for="message-text" class="control-label">주소</label>
						            <input type="button" class="btn btn-primary btn-block" onclick="execDaumPostcode(${emp.empno})" value="주소검색">
						            <input type="text" class="form-control" name="address1" value="${emp.address1}">
						            <input type="text" class="form-control" name="address2" value="${emp.address2}">
						          </div>
						          <div class="form-group">
						            <label for="message-text" class="control-label">생년월일</label>
						            <input type="text" class="form-control" name="birth" value="${emp.birth}">
						          </div>
						      </div>
						      <div class="modal-footer">
						        <input type="hidden" value="${emp.empno}" name="empno">
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						        <input type="button" onclick="return empModify_ch(${emp.empno})" class="btn btn-primary" value="수정하기">
						      </div>
						    </div>
							</form>
						  </div>
					  </div>
	                  <td>${emp.name}</td>
	                  <td>${emp.phone}</td>
	                  <td>${emp.address1} - ${emp.address2}</td>
	                  <td>${emp.empclass}</td>
	                  <td>${emp.branch}</td>
	                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <th>직원번호</th>
                  <th>이름</th>
                  <th>연락처</th>
                  <th>주소</th>
                  <th>직급</th>
                  <th>지점</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
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

<!-- Post Code -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- jQuery 2.2.3 -->
<script src="${resources}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${resources}/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${resources}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${resources}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${resources}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${resources}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${resources}/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${resources}/dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
  //직원정보 수정 유효성검사
  function empModify_ch(empno){
	  var form = document.getElementById("empModifyForm"+empno);
	  if(form.name.value == ""){
		  alert('이름을 입력해주세요.');
		  form.name.focus();
		  return false;
	  }
	  if(form.phone.value == ""){
		  alert('연락처를 입력해주세요.');
		  form.phone.focus();
		  return false;
	  }
	  if(form.phone.value.length != 11){
		  alert('연락처는 11자 입니다. 다시 입력해주세요.');
		  form.phone.focus();
		  return false;
	  }
	  if(form.address1.value == ""){
		  alert('주소가 입력되지 않았습니다. 입력해주세요.');
		  form.address1.focus();
		  return false;
	  }
	  if(form.address2.value == ""){
		  alert('상세주소가 입력되지 않았습니다. 입력해주세요.');
		  form.address2.focus();
		  return false;
	  }
	  if (confirm("직원정보를 수정 하시겠습니까 ?")) { //확인
			form.submit();
		} else { //취소
			return false;
	  }
  }
  function execDaumPostcode(empno) {
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

              var form = document.getElementById("empModifyForm"+empno);
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              form.address1.value = fullAddr;
              form.address2.focus();
              /* document.getElementById('address1').value = fullAddr;
              document.getElementById('address2').focus(); */
          }
      }).open();
   }
</script>
</body>
</html>
