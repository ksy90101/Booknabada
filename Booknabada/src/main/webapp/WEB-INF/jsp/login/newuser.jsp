<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/newuser.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function email3(userinput) {
		var email3 = userinput.m_email3.value;
		if (email3 == "0") {
			userinput.email2.value = '';
			userinput.email2.readOnly = false;
		} else {
			userinput.email2.value = email3;
			userinput.email2.readOnly = true;
		}
	}
	function checkID() {
		var id = $('#insertID').val();
		//alert(id);
		if ($('#insertID').val() == "") {
			alert("아이디를 입력하세요.");
			$('#insertID').focus();
			return false;
		}
		$.ajax({
			type : 'post',
			data : "id=" + id,
			dataType : 'text',
			url : 'checkID.do',
			success : function(rData, textStatus, xhr) {
				var check = rData;
				if (check == 1) {
					alert("이미 가입된 ID입니다.");
					$('#resulttext').css('color', 'red');
					$('#resulttext').text('이미 등록된 ID입니다.');
					$('#checkit').prop('disabled', true);
				} else {
					alert("등록 가능한 ID입니다.\n계속 진행하세요.");
					$('#checkit').prop('disabled', false);
					$('#resulttext').css('color', 'blue');
					$('#resulttext').text('등록가능합니다. 계속 진행하세요.');
				}
			},
			error : function(xhr, status, e) {
				alert("error : " + e);
			}
		});
		return false;
	}
	function check() {
		if (document.join.id.value == "") {
			alert("ID를 입력하세요.");
			document.join.id.focus();
			return false;
		}
		if (document.join.name.value == "") {
			alert("이름을 입력하세요.");
			document.join.name.focus();
			return false;
		}
		//alert("작동합니다.");
		if (document.join.pw1.value == "") {
			alert("암호를 입력하세요.");
			document.join.pw1.focus();
			return false;
		}
		if (document.join.pw2.value == "") {
			alert("암호를 입력하세요.");
			document.join.pw2.focus();
			return false;
		}
		if (document.join.pw1.value != document.join.pw2.value) {
			alert("암호가 일치 하지 않습니다.");
			document.getElementByName('pw1').value = "";
			document.getElementByName('pw2').value = "";
			document.join.pw1.focus();
			return false;
		}
		document.join.submit();
	}
</script>
<script type="text/javascript">
$(function(){
	/* 이메일 인증 버튼 클릭시 발생하는 이벤트 */
	$("#emailBtn").on("click", function(){
		/* 이메일 중복 체크 후 메일 방송 비동기 처리 */
		$.ajax({
			beforeSend: function(){ // HTTP Request를 하기전에 호출
			},
			type:"get",
			url:"createEmailCheck.do", // createEmailCheck.do를 실행
			data : "userEmail=" + ($("#email").val() + "@" + $("#email2").val()) + "&random=" + $("#random").val(), // userEmail에는 userEmail(id)에 들어온 값이 들어가고, random에는 random(id)에 들어간 값이 들어간다.
			success : function(data) { // 성공한다면 위에서 지정한 data(userEmail, random)을 받는 함수 생성
				alert("사용가능한 이메일 입니다. 인증번호를 입력해 주세요"); // 성공 메시지
			}, // 성공 닫기
			error:function(data){
				alert("에러가 발생했습니다."); //에러 메시지
				return false;
			}
		})
		/* 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트 */
		$(document).on("click", "#emailAuthBtn", function(){
			$.ajax({
				beforeSend:function(){
					
				},
				type:"get",
				url:"emailAuth.do",
				data:"authCode=" + $("#authCode").val() + "&random=" + $("#random").val(),
				success:function(data){
					if(data == "complete"){
						alert("인증이 완료되었습니다.");
						document.getElementById("checkit").disabled = false; // 인증되면 가입버튼 활성화
					}else if(data =="false"){
						alert("인증번호를 잘못 입력하셨습니다.");
					}
				},
				complete: function(){
					
				},
				error:function(data){
					alert("에러가 발생했습니다.");
				}
			
			})
		});
	});
});
</script>
</head>
<body>
	<div class="newuser_wrap">

		<div class="image">
			<h2>
				<img src="../images/logo.png" align="middle">
			</h2>
		</div>

		<div class="form_wrap">
			<form name="join" action="joinAction.do" method="post">
				<ul>
					<li class="insID"><input type="text" id="insertID" placeholder="아이디" name="id">
						<button type="button" id="checkID" onclick="return checkID();">ID확인</button></li>
					<li><input type="password" name="pw1" placeholder="비밀번호"></li>
					<li><input type="password" name="pw2" placeholder="비밀번호 확인"></li>	
					<li><input type="text" placeholder="이름" name="name"></li>
					<li><input type="date" class="birth" name="birth"></li>
					<li><input type="radio" id="rb1" name="gender" value="man">
					<label for="rb1">남자</label>
					<input type="radio" id="rb2" name="gender" value="woman">
					<label for="rb2">여자</label>
					</li>

					<li><input class="email" type="text" name="email1"
						placeholder="이메일" id="email"> @ <input class="email" type="text"
						name="email2" readonly="readonly" id="email2"> <select class="sel"
						name="m_email3" onchange="email3(this.form)">
							<option value="sel" selected="selected" disabled="disabled">선택해주세요.</option>
							<option value="0">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="korea.com">korea.com</option>
					</select>
						<input type="hidden" path="random" id="random" value="${random }" name="random"/>
						<button type="button" id="emailBtn"><span>이메일발송</span></button></li>
					<li><input type="text" id="authCode" name="authCode" path="authCode" placeholder="인증 번호">
						<button type="button" id="emailAuthBtn"><span>이메일인증</span></button></li>
					<li><input type="text" placeholder="핸드폰 번호" name="tel"></li>
					<br>
					<li><button type="button" id="checkit"
							onclick="return check();" disabled="disabled">가입하기</button></li>
				</ul>


			</form>
		</div>
		<div class="link">
			<a id="link_" href="">이용약관</a>&nbsp;&nbsp;|&nbsp; <a id="link_"
				href="">개인정보 취급방침</a>&nbsp;&nbsp;|&nbsp; <a id="link_" href="">책임의
				한계와 법적고지</a>&nbsp;&nbsp;|&nbsp; <a id="link_" href="">고객센터</a>
		</div>
	</div>
</body>
</html>