<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>게시판 디테일</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/header.css" rel="stylesheet">
<link href="../css/boardDetail.css" rel="stylesheet">
<script type="text/javascript">
function modify(num){
	//alert("수정하기 숫자: " + num);
	var check = confirm("수정하시겠습니까?");
	
	if (check) {
		location.href= 'freeModify.do?board_no='+num;
	}
}

function del(num){
	//alert("삭제하기 숫자: " + num);
	var check = confirm("삭제하시겠습니까?");
	
	if (check) {
		location.href= 'detailDelete.do?board_no='+num; 
	}
}
	
</script>
</head>
<body>
	<!-- 카테고리 -->
	<div class="top_navi">
		<div class="top_content">
			<div id="box01" style="color: #BCB0FE;">공지사항</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">이벤트</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;"
				onclick="location.href='../fqa.do'">FAQ</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;"
				onclick="location.href='../qnaBoard.do'">QNA</div>
			<div id="bin"></div>
			<div id="box01" style="background: #BCB0FE; color: white;"
				onclick="location.href='../freeBoard.do'">자유게시판</div>
		</div>
	</div>

	<!-- 글박스 -->
	<div class="boardDetailPart">
		<div id="list" style="height: 60px;">
			<div id="listbox" style="width: 10%; font-weight: bold">글번호 :
				${freeDetail.board_no }</div>
			<div id="listbox" style="width: 40%; font-weight: bold">글쓴이 :
				${freeDetail.user_name }</div>
			<div id="listbox" style="width: 30%; font-weight: bold">날짜 :
				${freeDetail.board_date }</div>
			<div id="listbox" style="width: 20%; font-weight: bold">카운트 :
				${freeDetail.board_count }</div>

		</div>

		<div id="list" style="height: 90px;">
			<div id="title">제목</div>
			<div id="listbox" style="width: 100%; height: 60px; font-weight: bold; text-align: left;">
			<p style="padding:0 20px;">${freeDetail.board_title }</p>
			</div>
		</div>
		<div id="list" style="height: 60px;">
			<div id="title">내용</div>
			<div id="listbox" style="width: 100%; height: 400px; text-align: left;">
			<p style="padding:0 20px;">${freeDetail.board_content }</p>
			</div>
		</div>
	</div>

	<div class="BoardbuttonPart">
		<button id="Boardbutton" style="background-color: #E8E8E8;"
			onclick="modify(${freeDetail.board_no})">수정</button>
		<div id="bin2"></div>
		<button id="Boardbutton" style="background-color: #E8E8E8;"
			onclick="del(${freeDetail.board_no})">삭제</button>
		<div id="bin2"></div>
		<button id="Boardbutton"
			style="background-color: #BCB0FE; color: white"
			onclick="location.href='freeBoard.do'">목록</button>
	</div>
	
<!-- 댓글박스 -->
	<div class="commentPart">
		<div id="commentWriteFill">
			<div id="commentWritebox">
				<textarea style="width: 800px; height: 100px; border:1px solid #D0C8FF; box-sizing: border-box;"></textarea>
			</div>
			<button id="commentWritebutton">작성</button>

		</div>
		<div id="commentBox"
			style="border: 1px solid #E7E2FF; box-sizing: border-box;">
			<div
				style="height: 35px; border-bottom: 2px solid #E7E2FF; margin-bottom: 10px">
				<p id="commentTitle" style="width: 20%;">글번호</p>
				<p id="commentTitle" style="width: 50%;">글쓴이</p>
				<p id="commentTitle" style="width: 30%;">날짜</p>
			</div>
			<p style="width: 960px; height: 30px;">여기가 댓글 작성</p>
		</div>
	</div>


</body>
</html>