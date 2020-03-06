<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>검색결과가 없습니다.</title>
<style type="text/css">
.caution{
	display: table;
	text-align: center;
	margin: 300px auto 20px;
}
.caution img{
	width: 20%;
	height: 20%;
}
.caution #title{
	font-size: 36px;
	font-weight: bold;
	color: #917EFD;
	margin:20px auto;
}
.caution #txt{
	font-size: 20px;
	font-weight: bold;
	color: #535353;
	margin:10px auto;
}
.buttonPart{
	display: table;
	margin: 0 auto;
}
.buttonPart button{
	height:40px;
	width:100px;
	border-radius:5px;
	border-style: none;
	float: left;
	font-weight: bold;
	color: #535353;
}
#bin2 {
  width: 10px;
  height: 10px;
  margin: auto;
  float: left;
}

</style>
</head>
<body>
<div class="caution">
<img src="/images/caution.png">
<p id=title>OOPS! 검색결과가 존재하지 않습니다.</p>
<p id=txt>검색어를 다시 확인하시고 이용해 주시기 바랍니다.</p>
<p id=txt>이용에 불편을 드려 대단히 죄송합니다.</p>
</div>

<div class="buttonPart">
	<button style="background-color: #E8E8E8;" onclick="history.back(-1);">뒤로</button>
	<div id="bin2"></div>
	<button style="background-color: #BCB0FE; color: white" onclick="location.href='index.do'">메인으로</button>
</div>

</body>
</html>