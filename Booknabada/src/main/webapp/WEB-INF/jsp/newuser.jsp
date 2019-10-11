<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/reset.css">
<style type="text/css">

body{
	background-color: #BCB0FE;
	
}
.newuser_wrap{
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
ul{
	list-style-type: none;
}
li{
	height:50px;
}
input{
	height:45px;
	width:330px;
	border: none;
	border-bottom:1px solid #BCB0FE;
	padding-left: 20px;
}
input[type='radio']{
	width:14px;
}

.year{
	width:190px;
}

.month{
	width:70px;

}

.day{
	width:40px;
}
select{
	height:48px;

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

.email{
	width:85px;
}

.sel{
	width:111px;
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
<script>
function email3(userinput){
	var email3=userinput.m_email3.value;
	if(email3=="0"){
		userinput.email2.value='';
		userinput.email2.readOnly=false;
	}else{
		userinput.email2.value=email3;
		userinput.email2.readOnly=true;
	}
	
}
</script>
</head>
<body>
	<div class="newuser_wrap">

		<div class="image">
			<h2>
				<img src="icon/logo.png" align="middle">
			</h2>
		</div>

		<div class="form_wrap">
			<form name="join" action="" method="">
				<ul>
					<li><input type="text" placeholder="아이디"></li>
					<li><input type="password" placeholder="비밀번호"></li>
					<li><input type="password" placeholder="비밀번호 확인"></li>
				</ul>
				<br>
				<ul>
					<li><input type="text" placeholder="이름"></li>
					<li><input type="radio" name="gender" value="man">남자<input
						type="radio" name="gender" value="woman">여자</li>
					<li><input type="text" class="year" placeholder="생년(4자)">
						<select class="month">
							<option value="월" selected="selected" disabled="disabled">월</option>
							<option value="select1">1</option>
							<option value="select2">2</option>
							<option value="select3">3</option>
							<option value="select4">4</option>
							<option value="select5">5</option>
							<option value="select6">6</option>
							<option value="select7">7</option>
							<option value="select8">8</option>
							<option value="select9">9</option>
							<option value="select10">10</option>
							<option value="select11">11</option>
							<option value="select12">12</option>
					</select> <input type="text" class="day" placeholder="일"></li>  
					<li><input class="email" type="text" name="email1" placeholder="이메일" >
						@ <input class="email" type="text" name="email2" readonly="readonly">
						<select class="sel" name="m_email3" onchange="email3(this.form)">
							<option value="sel" selected="selected" disabled="disabled">선택해주세요.</option>
							<option value="0">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="empal.com">empal.com</option>
							<option value="korea.com">korea.com</option>
							<option value="paran.com">paran.com</option>
							
					</select></li>
					<li><input type="text" placeholder="핸드폰 번호"></li>
				</ul>
				<br>
				<button type="submit" value="가입">가입하기</button>
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