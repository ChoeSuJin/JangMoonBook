/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});

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

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}

$('#modify_user').click(function(){
	alert("수정할 정보를 입력하세요");
	$('#modify_user').hide();
	$('#pwd').show();
	$('#ok').show();
	$('#cancel').show();
	$('#address').show();
	$('#sample6_postcode').attr("disabled", false);
	$('#email').attr("disabled", false);
	$('#phone').attr("disabled", false);
	$('#sample6_address').attr("disabled", false);
	$('#sample6_address2').attr("disabled", false);
	document.myPage.id.focus()
});

function check_modify(){
	
	//아이디 입력여부 검사
	if(document.myPage.id.value=="")
	{
	 alert("아이디를 입력하지 않았습니다.")
	 document.myPage.id.focus()
	 return false;
	}
	//아이디 유효성 검사 (영문소문자, 숫자만 허용)
	for (i=0;i<document.myPage.id.value.length ;i++ )
	{
	 ch=document.myPage.id.value.charAt(i)
	  if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z'))
	  {
	  alert ("아이디는 소문자, 숫자만 입력가능합니다.")
	  document.myPage.id.focus()
	  return false;
	  }
	}
	//아이디에 공백 사용하지 않기
	if (document.myPage.id.value.indexOf(" ")>=0)
	{
	 alert("아이디에 공백을 사용할 수 없습니다.")
	 document.myPage.id.focus()
	 return false;
	}
	//아이디 길이 체크 (6~12자)
	if (document.myPage.id.value.length<6 || document.myPage.id.value.length>12)
	{
	 alert ("아이디를 6~12자까지 입력해주세요.")
	 document.myPage.id.focus()
	 return false;
	}
	//비밀번호 입력여부 체크
	if(document.myPage.pwd.value=="")
	{
	 alert("비밀번호를 입력하지 않았습니다.")
	 document.myPage.pwd.focus()
	 return false;
	}
	//비밀번호 길이 체크(4~8자 까지 허용)
	if (document.myPage.pwd.value.length<4 || document.myPage.pwd.value.length>8)
	{
	 alert ("비밀번호를 4~8자까지 입력해주세요.")
	 document.myPage.pwd.focus()
	 return false;
	}
	
	//이메일 입력 여부와 형식 체크
	var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
	var email = document.myPage.email.value;
	
	if(email==""){
		alert("이메일을 입력하지 않았습니다.")
		document.myPage.email.focus()
		return false;
	}
	if(!regEmail.test(email)){
		alert("이메일 형식이 올바르지 않습니다.")
		document.myPage.email.focus()
		return false;
	}
	
	//연락처 입력 여부와 형식 체크
	var regPhone = /^[0-9]+$/;
	var phone = document.myPage.phone.value;
	
	if(phone.length>11){
		alert("연락처를 확인하세요.")
		document.myPage.phone.focus()	
		return false;
	}
	if(!regPhone.test(phone)){
		alert("연락처는 숫자만 입력가능합니다.")
		document.myPage.phone.focus()	
		return false;
	}
	
	//주소 입력 여부 확인
	if(document.myPage.zipcode.value==""){
		alert("주소검색으로 우편번호를 입력하세요.")
		document.myPage.zipcode.focus()	
		return false;
	}
	if(document.myPage.address1.value==""){
		alert("주소를 검색하세요.")
		document.myPage.address1.focus()		
		return false;
	}
	if(document.myPage.address2.value==""){
		alert("상세주소를 입력하세요.")
		document.myPage.address2.focus()		
		return false;
	}
	
	$.ajax({
	    type : "POST",
	    url  : "checkPwd.do",
	    data : {"id" : $('#d_id').val(),
	          	"pwd" : $('#pwd').val()},
	    dataType : "JSON",
	    
	    error : function(){
	        alert('error ajax!');
	    },
	    success : function(data){
			if(data.result==0){
				alert('비밀번호가 일치하지 않습니다. 다시 입력하세요');
				return false;
			}
	    }
	})
	
	if (confirm("개인정보를 수정하시겠습니까 ?")) { //확인
		return true;
	} else { //취소
		return false;
	}
}//e myPage_check

function join_check(){
	//아이디 입력여부 검사
	if(document.joinForm.id.value=="")
	{
	 alert("아이디를 입력하지 않았습니다.")
	 document.joinForm.id.focus()
	 return
	}
	//아이디 유효성 검사 (영문소문자, 숫자만 허용)
	for (i=0;i<document.joinForm.id.value.length ;i++ )
	{
	 ch=document.joinForm.id.value.charAt(i)
	  if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z'))
	  {
	  alert ("아이디는 소문자, 숫자만 입력가능합니다.")
	  document.joinForm.id.focus()
	  return
	  }
	}
	//아이디에 공백 사용하지 않기
	if (document.joinForm.id.value.indexOf(" ")>=0)
	{
	 alert("아이디에 공백을 사용할 수 없습니다.")
	 document.joinForm.id.focus()
	 return
	}
	//아이디 길이 체크 (6~12자)
	if (document.joinForm.id.value.length<6 || document.joinForm.id.value.length>12)
	{
	 alert ("아이디를 6~12자까지 입력해주세요.")
	 document.joinForm.id.focus()
	 return
	}
	//비밀번호 입력여부 체크
	if(document.joinForm.pwd.value=="")
	{
	 alert("비밀번호를 입력하지 않았습니다.")
	 document.joinForm.pwd.focus()
	 return
	}
	//비밀번호 길이 체크(4~8자 까지 허용)
	if (document.joinForm.pwd.value.length<4 || document.joinForm.pwd.value.length>8)
	{
	 alert ("비밀번호를 4~8자까지 입력해주세요.")
	 document.joinForm.pwd.focus()
	 return
	}
	
	//비밀번호와 비밀번호 확인 일치여부 체크
	if (document.joinForm.pwd.value!=document.joinForm.pwd2.value)
	{
	 alert("비밀번호가 일치하지 않습니다")
	 document.joinForm.pwd2.focus()
	 return
	}
	
	//이메일 입력 여부와 형식 체크
	var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
	var email = document.joinForm.email.value;
	
	if(email==""){
		alert("이메일을 입력하지 않았습니다.")
		document.joinForm.email.focus()
		return
	}
	if(!regEmail.test(email)){
		alert("이메일 형식이 올바르지 않습니다.")
		document.joinForm.email.focus()
		return
	}
	
	//연락처 입력 여부와 형식 체크
	var regPhone = /^[0-9]+$/;
	var phone = document.joinForm.phone.value;
	
	if(phone.length>11){
		alert("연락처를 확인하세요.")
		document.joinForm.phone.focus()	
		return
	}
	if(!regPhone.test(phone)){
		alert("연락처는 숫자만 입력가능합니다.")
		document.joinForm.phone.focus()	
		return
	}
	
	//주소 입력 여부 확인
	if(document.joinForm.zipcode.value==""){
		alert("주소검색으로 우편번호를 입력하세요.")
		document.joinForm.zipcode.focus()	
		return
	}
	if(document.joinForm.address1.value==""){
		alert("주소를 검색하세요.")
		document.joinForm.address1.focus()		
		return
	}
	if(document.joinForm.address2.value==""){
		alert("상세주소를 입력하세요.")
		document.joinForm.address2.focus()		
		return
	}
	if (confirm("회원가입을 하시겠습니까 ?")) { //확인
		document.joinForm.submit();
	} else { //취소
		return;
	}
}//e JoinForm_check

$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="${path}/bookList.do"
	});
	var IMP = window.IMP; // 생략가능
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	$("#btnNowPay").hide();
	$("#btnGetPay").hide();
	
});

function sendCart() {
	var cartCount = $("#lengthOfList").val();
	for (var i = 0; i < cartCount; i++) {
		var string = $("form[name=deliveryCart" + i + "]").serialize();
		$.ajax( {
			type:'POST',
			url: '/book/pay/saleInsert.do',
			data: string,
			dataType : 'string',
			success: function(data) {
				alert(data);
			}
		})
	}
}

function insertDelivery() {
	var string = $("form[name=deliveryPay]").serialize();
	$.ajax( {
		type:'POST',
		url: '/book/pay/deliveryInsert.do',
		data: string,
		dataType : 'string',
		success: function(data) {
			alert(data);
		}
	})
}

function selectBranch() {
	var popupOption = 'directories=no, toolbar=no, location=no, menubar=no, status=no, scrollbars=no, resizable=no, left=400, top=200, width=440, height=550';
    var url = 'selectBranch.do';
    var name = '지점선택';
	window.open(url, name, popupOption);

}

function sendValue(name) {
	alert(name);
	$("#branchName").val(name);
	$("#branchName").text(name);
	$("branch").val(name);
}

function showNowPay() {
	$("#btnNowPay").show();
	$("#btnGetPay").hide();
	$("#nowPay").prop("checked", true);
	$("#getPay").prop("checked", false);
}

function showGetPay() {
	$("#btnNowPay").hide();
	$("#btnGetPay").show();
	$("#nowPay").prop("checked", false);
	$("#getPay").prop("checked", true);
}

function clickNowPay() {
	var date = $("#selectDate").val();
	var getPayData = $("#directCartLength").val();
	var branch = $("#branchName").val();
	
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	alert("rsp.success");
	    	jQuery.ajax({
	    		url: "/book/pay/directPayment.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		},
	    		success : function(data) {
	    			var rsp = data.rsp;
	    			rsp=JSON.stringify(rsp);
	            	var newVal = JSON.parse(rsp);
	    			var everythings_fine = data.everythings_fine;
	    			
	    			if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			
		    			
		    			for (var i = 0; i < getPayData; i++) {
		    				$("#date"+i+"").val(date);
		    				$("#branch"+i+"").val(branch);
		    				var string = $("form[name=directCart" + i + "]").serialize();
		    				$.ajax( {
		    					type:'POST',
		    					url: '/book/pay/insertNowPay.do',
		    					data: string,
		    					dataType : 'string',
		    					success: function(data) {
		    						alert(data);
		    					}
		    				})
		    			}
		    			alert(msg);
		    			/* 결제완료 이후 이동하는 창은 추후 수정 요망 */
		    			window.location.href="../main.do";
		    		} else {
		    			alert("아직 제대로 결제가 되지 않았습니다.");
		    		}
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
	IMP.request_pay(param, callback);
	
}

function clickGetPay() {
	var date = $("#selectDate").val();
	var getPayData = $("#directCartLength").val();
	var branch = $("#branchName").val();
	
	
	for (var i = 0; i < getPayData; i++) {
		$("#date"+i+"").val(date);
		$("#branch"+i+"").val(branch);
		var string = $("form[name=directCart" + i + "]").serialize();
		$.ajax( {
			type:'POST',
			url: '/book/pay/insertGetPay.do',
			data: string,
			dataType : 'string',
			success: function(data) {
				alert(data);
				window.location.href="../main.do";
			}
		})
	}
}

function check_cart() {
	var session = $("#session").val();
	  
	if (session == "") {
		alert("장바구니 기능을 이용하시려면 로그인을 하세요");
		return false;
	}
	
	if (confirm("장바구니에 담으시겠습니까?")) { //확인
		return true;
	} else { //취소
		return false;
	}
	
}


