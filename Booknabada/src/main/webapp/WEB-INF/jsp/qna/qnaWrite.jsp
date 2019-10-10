<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link rel="stylesheet" href="../css/boardWrite.css">
<link rel="stylesheet" href="../css/boardDetail.css">
</head>
<body>

	<div class="top_navi">

		<div class="top_content">
			<div id="box01" style="color: #BCB0FE;">공지사항</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">이벤트</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;" onclick="location.href='../fqa.do'">FAQ</div>
			<div id="bin"></div>
			<div id="box01" style="background: #BCB0FE; color: white;" onclick="location.href='../qnaBoard.do'">QNA</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">자유게시판</div>
		</div>
	</div>


		<form action="qnaWriteAction.do" method="post" enctype="multipart/form-data">
	<div id="writebox">
			<h3>제목</h3>
			<input id="title" type="text" name="title">
			<h4>내용</h4>
			<textarea id="content" name="content"></textarea>
			<input id="imgUp" type="file" accept="image/*" name="file">
	</div>
	
	<div id="button">
		<button type="button" onclick="location.href='qnaBoard.do'">취소</button>
		<button type="submit">완료</button>
	</div>
		</form>
	
</body>
</html>