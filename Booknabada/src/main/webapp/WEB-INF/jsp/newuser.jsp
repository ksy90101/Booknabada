<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="./css/header.css">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function checkID(){
	var id=$('#insertID').val()
	
	if( $('#insertID').val()==""){
		alert("아이디를 입력하세요.");
		 $('#insertID').focus();
		 return false;
	}
	$.ajax({
		type : 'post',
		data : "id="+ id,
		dataType : 'text',
		url : 'checkID.do',
		success : function(rData, textStatus, xhr){
			var check = rData;
			if(check == 1){
				alert("이미 가입된 ID입니다.");
				$('#resulttext').css('color', 'red');
				$('#resulttext').text('이미 등록된 ID입니다.');
				$('#checkit').prop('disabled', true);
			}else{
				alert("등록 가능한 ID입니다.\n계속 진행하세요.");
				$('#checkit').prop('disabled', false);
				$('#resulttext').css('color', 'blue');
				$('#resulttext').text('등록가능합니다. 계속 진행하세요.');
			}
		},
		error : function(xhr, status, e){
			alert("error : " + e);
		}
	});
	return false;
}

function check(){
	if(document.join.id.value == ""){
		alert("ID를 입력하세요.");
		document.join.id.focus();
		return false;
	}
	
	if(document.join.name.value == ""){
		alert("이름을 입력하세요.");
		document.join.name.focus();
		return false;
	}	
	//alert("작동합니다.");
	if(document.join.pw1.value == ""){
		alert("암호를 입력하세요.");
		document.join.pw1.focus();
		return false;
	}
	if(document.join.pw2.value == ""){
		alert("암호를 입력하세요.");
		document.join.pw2.focus();
		return false;
	}
	
	if(document.join.pw1.value != document.join.pw2.value){
		alert("암호가 일치 하지 않습니다.");
		//document.getElementByName('pw1').value = "";
		//document.getElementByName('pw2').value = "";
		document.join.pw1.focus();
		return false;
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
			<form name="join" action="joinAction.do" method="post">
				<ul>
					<li><input type="text" id="insertID" placeholder="아이디" name="id"></li>
					<li><br><p id="resulttext">아이디를 입력하세요. <br>아이디는 중복될 수 없습니다.</p></li>
					<li><input type="password" name="pw1" placeholder="비밀번호"></li>
					<li><input type="password" name="pw2" placeholder="비밀번호 확인"></li>
				</ul>
				<br>
				<ul>
					<li><input type="text" placeholder="이름" name="name"></li>
					<li><input type="radio" name="gender" value="man">남자<input
						type="radio" name="gender" value="woman">여자</li>
					<li><input type="date" class="year" placeholder="생년(4자)" name = "birth">
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
					<li><input type="text" placeholder="핸드폰 번호" name="tel"></li>
				</ul>
				<br>
				<button type="submit" id="checkit" value="가입">가입하기</button>
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