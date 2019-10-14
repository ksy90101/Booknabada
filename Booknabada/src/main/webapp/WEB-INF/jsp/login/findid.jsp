<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<style type="text/css">

body{
	background-color: #BCB0FE;
	
}
.findid_wrap{
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



input{
	height:45px;
	width:260px;
	border:1px solid;
	border-color:#FFFFFF;
	padding-left: 20px;
}


.birth{
	margin-top:2px;
	width:101px;
}
select{
	height:50px;
	width:95px;
	
}

button{
	height:48px;
	width:380px;
	background-color: #A695FF;
	border-color: #A695FF;
	border-style: none;
	border-radius:10px;
	color: white;
	margin-top:15px;
}

.link{
	margin-top:30px;
	color:#A695FF;
	text-align: center;
}

#link_{
	color:white;
	
}


</style>
</head>
<body>
	<div class="findid_wrap">

		<div class="image">
			<h2>
				<img src="icon/logo.png" align="middle">
			</h2>
		</div>

		<div class="form_wrap">
			<form action="" method="">
				<div class="inp">
					<ul>
						<li><input type="text" placeholder="이름을 입력해주세요.">
							<select>
								<option value="성별" selected="selected" disabled="disabled">성별</option>
							<option value="select1">여자</option>
							<option value="select2">남자</option>
							</select>
						</li>
						
						<li><input type="text" class="birth" placeholder="생년(4자)">
							<input type="text" class="birth" placeholder="월">
							<input type="text" class="birth" placeholder="일">
						
						</li>
					</ul>
				</div>
				<br>
				<button type="submit" value="전송">아이디 찾기</button>
			</form>
		</div>
		
		<div class="link">
			<a id="link_" href="findpw.jsp">비밀번호 변경</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
			<a id="link_" href="newuser.jsp">회원가입</a>
		</div>
	</div>
</body>
</html>