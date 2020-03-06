<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/login.css">

<!-- 아이디와 패스워드를 입력하지 않았을때 처리 -->
<script type="text/javascript">
	function check() {
		if (document.loginfrm.id.value == "") {
			alert("아이디를 입력해주세요.");
			document.loginfrm.id.focus();
			return false;
		}
		if (document.loginfrm.pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			document.loginfrm.pw.focus();
			return false;
		}
		document.loginfrm.submit();
	}
</script>
</head>
<body>
	<div id="login">
		<div class="login_wrap">

			<div class="image">
				<h2>
					<img src="../images/logo.png" align="middle">
				</h2>
			</div>

			<div class="form_wrap">
				<form action="../login/loginAction.do" method="POST" name="loginfrm">
					<div class="inp">
						<ul>
							<li><input type="text" placeholder="아이디를 입력하세요" name="id"></li>
							<li><input type="password" placeholder="*******" name="pw"></li>
						</ul>
					</div>
					<div class="check">
						<ul>
							<li><input type="checkbox" id="logincontinue">로그인 상태
								유지</li>
						</ul>
					</div>
					<br> <br>
					<button type="button" value="로그인" onclick="check()">로그인</button>
				</form>
			</div>
			<div class="link">
				<a id="link_" href="../login/findid.do">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;
				<a id="link_" href="../login/findpw.do">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;
				<a id="link_" href="../login/newuser.do">회원가입</a>
			</div>
		</div>
	</div>
</body>
</html>