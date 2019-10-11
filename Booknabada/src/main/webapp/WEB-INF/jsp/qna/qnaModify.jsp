<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
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
			<div id="box01" style="background: #BCB0FE; color: white;">QNA</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">자유게시판</div>
		</div>
	</div>


		<form action="modifyAction.do" method="post" enctype="multipart/form-data">
	<div id="writebox">
			<h3>제목</h3>
			<input id="title" type="text" name="title" value="${modify.board_title }">
			<h4>내용</h4>
			<textarea id="content" name="content">${modify.board_content }</textarea>
			<input id="imgUp" type="file" accept="image/*" name="file">
	</div>
	
	<!-- 버튼박스 -->
	<div class="BoardbuttonPart">
		<button id="Boardbutton" style="background-color: #E8E8E8;" type="button" onclick="history.back(-1);">취소</button>
		<div id="bin2"></div>
		<button id="Boardbutton" style="background-color: #BCB0FE; color: white" type="submit">완료</button>
		<input type="hidden" name="board_no" value="${modify.board_no }">
	</div>
		</form>
	
</body>
</html>