<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>
<link rel="stylesheet" href="../css/modifyuser.css">
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

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

function checkID(){
	var id = $('#insertID').val();
	//alert(id);
	if( $('#insertID').val() == ""){
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
		document.getElementByName('pw1').value = "";
		document.getElementByName('pw2').value = "";
		document.join.pw1.focus();
		return false;
	}
	
	document.join.submit();
}

</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="newuser_wrap">

		<div class="image">
			<h2>
				<img src="../images/logo.png" align="middle">
			</h2>
		</div>

		<div class="form_wrap">
			<form name="join" action="joinAction.do" method="post">
				<ul>
					<li><input type="text" id="insertID" placeholder="아이디" name="id" disabled="disabled"></li>
					<li><input type="password" name="pw1" placeholder="새 비밀번호"></li>
					<li><input type="password" name="pw2" placeholder="새 비밀번호 확인"></li>
				</ul>
				<br>
				<ul>
					<li><input type="text" placeholder="이름" name="name" disabled="disabled"></li>
					<li><input type="date" class="birth" name = "birth" disabled="disabled"></li>
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
					<br>
					<li><button type="button" id="checkit"  onclick="return check();">변경하기</button></li>
				</ul>
				
				
			</form>
		</div>

		<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>	
</body>
</html>