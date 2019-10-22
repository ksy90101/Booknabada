<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<title>이벤트 글 작성</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
<link href="../css/write_css.css" rel="stylesheet">
<link rel="stylesheet" href="../css/reset.css" type="text/css"/>
<link rel="stylesheet" href="../css/style.css" type="text/css"/>
<link rel="stylesheet" href="../css/eventWrite.css">
<link rel="stylesheet" href="../css/boardDetail.css">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

</head>
<script>

function cancel(){
	if(confirm("글쓰기를 취소하시겠습니까?")){
		window.history.back()	
	}else{
		return false;
	}
}

function check(){
	if(document.frm.title.value == ""){
		alert("제목을 입력해주세요");
		document.frm.title.focus();
		return false;
	}
	if(CKEDITOR.instances.content.getData() == ""){
		alert("내용을 입력해주세요");
		document.frm.content.focus();
		return false;
	}
	
}


</script>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>	
	<jsp:include page="../include/boardMenu.jsp"></jsp:include>

	<div id="writebox">
		<form action="eventWriteAction.do" name="frm" method="post" enctype="multipart/form-data">
			<h3 id="writetitle">제목</h3>
			<input type="text" name="title" />
			<h3 id="writetitle">내용</h3>
			<textarea name="content" id="content"></textarea>
			<script type="text/javascript">
			CKEDITOR.replace('content', {width:980, height:340});
			</script>
			<h3 id="writetitle">사진</h3>
			<input type="file" name="file" accept="image/*" />
			<div id="button">
				<button type="button" onclick="cancel()">취소</button>
				<button type="submit" onclick="return check()">완료</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	

</body>
</html>