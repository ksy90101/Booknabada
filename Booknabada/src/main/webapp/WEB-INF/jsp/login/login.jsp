<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="./css/header.css">
<style type="text/css">

body{
	background-color:#D6C9FC;
	
}
.login_wrap{
	margin: auto;
	
}

.image{
	text-align: center;
	padding-top:130px;
	padding-bottom: 50px;
}

.form_wrap{
	text-align: center;	
}

li{
	color:white;
}
input[type='text'],input[type='password']{
	width:358px;
}

input{
	background-color:#D0C8FF;
	color: white;
	height:45px;
	border:1px solid;
	border-color:#FFFFFF;
	border-radius:10px;
	margin-bottom:15px;
	padding-left: 20px;
}

button{
	height:48px;
	width:380px;
	background-color: #A695FF;
	border-color: #A695FF;
	border-style: none;
	border-radius:10px;
	color: white;
}

.link{
	margin-top:20px;
	color:#BCB0FE;
	text-align: center;
}

#link_{
	color:white;
	
}

</style>
</head>
<body>

	<div class="login_wrap">
	
		<div class="image">
			<h2>
				<img src="../images/logo.png" align="middle">
			</h2>
		</div>
		
		<div class="form_wrap">
			<form action="loginAction.do" method="POST">
				<div class="inp">
					<ul>
						<li><input type="text" placeholder="아이디를 입력하세요" name = "id"></li>
						<li><input type="password" placeholder="*******" name="pw"></li>
					</ul>
				</div>
				<div class="check">
					<ul>
						<li><input type="checkbox">로그인 상태 유지</li>
					</ul>
				</div>
				<br>
				<br>
				<button type="submit" value="로그인">로그인</button>
			</form>
		</div>
		<div class="link">
			<a id="link_" href="findid.do">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;
			<a id="link_" href="findpw.do">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;
			<a id="link_" href="newuser.do">회원가입</a>
		</div>
	</div>

</body>
</html>