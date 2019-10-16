<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 글 작성</title>
<link href="../css/write_css.css" rel="stylesheet">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
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
			<div id="box01" style="background: #BCB0FE; color: white;"
				onclick="location.href='../qnaBoard.do'">QNA</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">자유게시판</div>
		</div>
	</div>

	<!-- 글박스 -->
	<form action="faqWriteAction.do" method="post">
		<div id="writebox">
			<h3>제목</h3>
			<select name="cate">
				<option value="1">주문/결제</option>
				<option value="2">배송/반품</option>
				<option value="3">홈페이지이용</option>
			</select> <input id="title" type="text" name="title">
			<h4>내용</h4>
			<textarea id="content" name="content"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('content', {height:800});
			</script>
		</div>

		<!-- 버튼박스 -->
		<div class="BoardbuttonPart">
			<button id="Boardbutton" style="background-color: #E8E8E8;"
				type="button" onclick="history.back(-1);">취소</button>
			<div id="bin2"></div>
			<button id="Boardbutton"
				style="background-color: #BCB0FE; color: white" type="submit">완료</button>
		</div>
	</form>
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>