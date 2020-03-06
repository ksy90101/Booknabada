<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/modifyuser.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function check(){	
	if (document.join.pw1.value == "" && document.join.pw2.value == ""){
		alert("암호를 입력해주세요.");
		document.join.pw1.focus();
		return false
	}
	if (document.join.pw1.value != document.join.pw2.value) {
		alert("암호가 일치 하지 않습니다.");
		document.join.pw1.value = "";
		document.join.pw2.value = "";
		document.join.pw1.focus();
		return false
	}
	document.join.submit();
}
</script>
<script type="text/javascript">
	$(function() {
		/* 이메일 인증 버튼 클릭시 발생하는 이벤트 */
		$("#emailBtn")
				.on(
						"click",
						function() {
							/* 이메일 중복 체크 후 메일 방송 비동기 처리 */
							$.ajax({
								beforeSend : function() { // HTTP Request를 하기전에 호출
								},
								type : "get",
								url : "../login/createEmailCheck.do", // createEmailCheck.do를 실행
								data : "userEmail=" + ($("#email").val())
										+ "&random=" + $("#random").val(), // userEmail에는 userEmail(id)에 들어온 값이 들어가고, random에는 random(id)에 들어간 값이 들어간다.
								success : function(data) { // 성공한다면 위에서 지정한 data(userEmail, random)을 받는 함수 생성
									alert("사용가능한 이메일 입니다. 인증번호를 입력해 주세요"); // 성공 메시지
								}, // 성공 닫기
								error : function(data) {
									alert("에러가 발생했습니다."); //에러 메시지
									return false;
								}
							})
							/* 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트 */
							$(document)
									.on(
											"click",
											"#emailAuthBtn",
											function() {
												$
														.ajax({
															beforeSend : function() {

															},
															type : "get",
															url : "../login/emailAuth.do",
															data : "authCode="
																	+ $(
																			"#authCode")
																			.val()
																	+ "&random="
																	+ $(
																			"#random")
																			.val(),
															success : function(
																	data) {
																if (data == "complete") {
																	alert("인증이 완료되었습니다.");
																	document
																			.getElementById("checkit").disabled = false; // 인증되면 가입버튼 활성화
																} else if (data == "false") {
																	alert("인증번호를 잘못 입력하셨습니다.");
																}
															},
															complete : function() {

															},
															error : function(
																	data) {
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
			<form name="join" action="modifyuserAction.do" method="post">
				<ul>
					<li class="insID"><input type="text" id="insertID"
						placeholder="${modifyuser.user_id }" name="id" disabled="disabled">
					<li><input type="password" name="pw1" placeholder="비밀번호"></li>
					<li><input type="password" name="pw2" placeholder="비밀번호 확인"></li>
					<li><input type="text" placeholder="${modifyuser.user_name }"
						name="name" disabled="disabled"></li>
					<li><input type="text" placeholder="${modifyuser.user_birth }"
						class="birth" name="birth" disabled="disabled"></li>
					<li><input type="radio" id="rb1" name="gender" value="man">
						<label for="rb1">남자</label> <input type="radio" id="rb2"
						name="gender" value="woman"> <label for="rb2">여자</label></li>
					<li><input class="email" type="text" name="email1"
						value="${modifyuser.user_email }" id="email"> <input
						type="hidden" path="random" id="random" value="${random }"
						name="random" />
						<button type="button" id="emailBtn" onclick="emailmodify()">
							<span>이메일발송</span>
						</button></li>
					<li><input type="text" id="authCode" name="authCode"
						path="authCode" placeholder="인증 번호">
						<button type="button" id="emailAuthBtn">
							<span>이메일인증</span>
						</button></li>
					<li><input type="text" value="${modifyuser.user_tel }"
						name="tel"></li>
					<li>
						<button type="button" id=btn1 onclick="history.back(-1)">뒤로가기</button>
						<button type="button" id="checkit" onclick="return check();">수정하기</button>
					</li>
				</ul>
			</form>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
<!-- 성별 체크 -->
<script type="text/javascript">
	if ('${modifyuser.user_gender}' == 'man') {
		document.getElementById('rb1').setAttribute('checked', 'checked');
		document.getElementById('rb2').setAttribute('disabled', 'disabled');
	} else if ('${modifyuser.user_gender}' == 'women') {
		document.getElementById('rb2').setAttribute('checked', 'checked');
		document.getElementById('rb1').setAttribute('disabled', 'disabled');
	}
</script>
<!-- 이메일 변경 시 수정하기 버튼 잠그기 -->
<script type="text/javascript">
function emailmodify(){
	document.getElementById('checkit').setAttribute('disabled', 'disalbed');	
}
</script>
</html>