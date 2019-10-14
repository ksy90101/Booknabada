<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="./css/header.css">
<style type="text/css">

body{
	background-color:#D6C9FC;
	
}
.findid_wrap{
	margin: auto;
	
}

.image{
	text-align: center;
	padding-top:130px;
	padding-bottom: 40px;
}

.form_wrap{
	text-align: center;	
}



input{
	background-color:#D0C8FF;
	color: white;
	height:45px;
	width:358px;
	border:1px solid;
	border-color:#FFFFFF;
	border-radius:10px;
	margin-bottom:5px;
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
	margin-top:5px;
}


.link{
	margin-top:40px;
	color:#A695FF;
	text-align: center;
}

#link_{
	color:white;
	
}

</style>
</head>
<body>
	<div class="findpw_wrap">

		<div class="image">
			<h2>
				<img src="icon/logo.png" align="middle">
			</h2>
		</div>

		<div class="form_wrap">
			<form action="" method="">
				<div class="inp">
					<ul>
						<li><input type="text" placeholder="아이디를 입력해주세요."></li>
						<li><input type="password" placeholder="새 비밀번호를 입력해주세요."></li>
						<li><input type="password" placeholder="새 비밀번호를 다시 입력해주세요."></li>
						
						
					</ul>
				</div>
				<br>
				<button type="submit" value="전송">비밀번호 변경</button>
			</form>
		</div>
		
		<div class="link">
			<a id="link_" href="findid.jsp">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
			<a id="link_" href="newuser.jsp">회원가입</a>
		</div>
	</div>
</body>
</html>