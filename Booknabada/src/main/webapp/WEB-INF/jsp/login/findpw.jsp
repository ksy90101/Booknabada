<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

.email{
	width: 100px;
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

#emailWrap{
	display:none;
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
<script>
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

$(function(){
	
	$("#check").on("click",function(){
		var id = $("#insertId").val();
		var name = $("#insertName").val();
		var email = $("#email").val()+"@"+$("#email2").val();
				
		$.ajax({
			type : "get",
			data : {"id":id, "name":name, "email":email},
			dataType : 'text',
			url : 'infoCheck.do',
			success : function(data) {
				if(data=="true"){
					$("#emailWrap").show();

				}else{
					alert("거짓!")
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}

		})
		
	})
	/* 이메일 인증 버튼 클릭시 발생하는 이벤트 */
	$("#emailBtn").on("click", function(){
		alert("메일보내기!")
		var id = $("#insertId").val();
		var email = $("#email").val()+"@"+$("#email2").val();
		/* 이메일 중복 체크 후 메일 방송 비동기 처리 */
		$.ajax({
			beforeSend: function(){ // HTTP Request를 하기전에 호출
			},
			type:"get",
			url:"findpwCheck.do", // createEmailCheck.do를 실행
			data : "userEmail=" +email + "&pageNum=" + $("#pageNum").val()+"&id="+id, 
			// userEmail에는 userEmail(id)에 들어온 값이 들어가고, random에는 random(id)에 들어간 값이 들어간다.
			success : function(data) { // 성공한다면 위에서 지정한 data(userEmail, random)을 받는 함수 생성
				alert("메일 전송이 완료되었습니다. 새로운 비밀번호로 로그인해주세요"); // 성공 메시지
			}, // 성공 닫기
			error:function(data){
				alert("에러가 발생했습니다."); //에러 메시지
				return false;
			}
		})
		/* 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트 
		$(document).on("click", "#emailAuthBtn", function(){
			$.ajax({
				beforeSend:function(){
					
				},
				type:"get",
				url:"findpwAuth.do",
				data:"authCode=" + $("#authCode").val() + "&pageNum=" + $("#pageNum").val(),
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
		}); */
	});
});
</script>
</head>
<body>
	<div class="findpw_wrap">

		<div class="image">
			<h2>
				<img src="../images/logo.png" align="middle">
			</h2>
		</div>

		<div class="form_wrap">
			<form action="" method="">
				<div class="inp">
					<ul>
						<li><input type="text" name="insertId" id="insertId" placeholder="아이디를 입력해주세요."></li>
						<li><input type="text" name="insertName" id="insertName" placeholder="이름을 입력해주세요."></li>
						
						<li>
							<p>인증받으셨던 이메일을 입력해주세요</p>
							<input class="email" type="text" name="email1" placeholder="이메일" id="email"> @ <input class="email" type="text"
						name="email2" readonly="readonly" id="email2"> 
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
							</select>
						</li>
						<li>
							<button type="button" id="check">확인</button></li>
					</ul>
					<ul id="emailWrap">
						<li>
							<input type="hidden" path="pageNum" id="pageNum" value="${pageNum }" name="pageNum"/>
							<button type="button" id="emailBtn">비밀번호 변경 이메일발송</button>
							</li>
					</ul>
				</div>
				<br>
			</form>
		</div>
		
		<div class="link">
			<a id="link_" href="findid.jsp">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
			<a id="link_" href="newuser.jsp">회원가입</a>
		</div>
	</div>
</body>
</html>