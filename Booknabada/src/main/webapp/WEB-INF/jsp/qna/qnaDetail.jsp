<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>게시판 디테일</title>
<link href="css/reset.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/boardDetail.css" rel="stylesheet">
</head>
<body>
	<div class="top_navi">

		<div class="top_content">
			<div id="box01" style="background: #BCB0FE; color: white;">공지사항</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">이벤트</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">FAQ</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">QNA</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">자유게시판</div>
		</div>
	</div>



	<div class="boardDetailPart">
		<div id="list" style="height: 60px;">
			<div id="listbox" style="width: 10%;">글번호</div>
			<div id="listbox" style="width: 50%;">글쓴이</div>
			<div id="listbox" style="width: 30%;">날짜</div>
			<div id="listbox" style="width: 10%;">카운트</div>

		</div>

		<div id="list" style="height: 90px;">
			<div id="title" style="">제목</div>
			<div id="listbox" style="width: 100%">제목은 여기에 나타납니다</div>
		</div>
		<div id="list" style="height: 60px;">
			<div id="title" style="">내용</div>
			<div id="listbox" style="width: 100%; height: 500px;">내용은 여기에
				나타납니다</div>
		</div>
	</div>

	<div class="commentPart">
		<div id="commentWriteFill">
			<div id="commentWritebox">
				<textarea style="width: 800px; height: 100px"></textarea>
			</div>
			<button id="commentWritebutton">작성</button>

		</div>
		<div id="commentBox" style="border: 1px solid #E7E2FF; box-sizing: border-box;">
			<div style="height: 35px; border-bottom: 2px solid #E7E2FF; margin-bottom:10px">
				<p id="commentTitle" style="width: 20%; ">글번호</p>
				<p id="commentTitle" style="width: 50%; ">글쓴이</p>
				<p id="commentTitle" style="width: 30%; ">날짜</p>
			</div>
				<p style="width: 960px; height: 30px;">여기가 댓글 작성</p>
		</div>
	</div>
	
	<div class="buttonPart">
		<button id="button" style="background-color: #E8E8E8;">수정</button>
		<div id="bin2"></div>
		<button id="button" style="background-color: #E8E8E8;">삭제</button>
		<div id="bin2"></div>
		<button id="button" style="background-color: #BCB0FE; color: white">목록</button>
	</div>
	<style type="text/css"></style>
	<script src="boardDetail_files/217acdb12f517958f1.js"></script>
</body>
</html>