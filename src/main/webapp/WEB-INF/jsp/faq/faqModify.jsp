<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 글 작성</title>
<link rel="stylesheet" href="../css/boardWrite.css">
<link rel="stylesheet" href="../css/boardDetail.css">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/boardMenu.jsp"></jsp:include>

	<!-- 글박스 -->
	<form action="faqModifyAction.do" method="post">
		<div id="writebox">
			<h3 id="writetitle">제목</h3>
			<select name="cate">
				<option value="1">주문/결제</option>
				<option value="2">배송/반품</option>
				<option value="3">홈페이지이용</option>
			</select> 
			<input id="title" type="text" name="title" value=${modify.faq_qustion }>
			<h4 id="writetitle">내용</h4>
			<textarea id="content" name="content">
			${modify.faq_answer }
			</textarea>
			<script type="text/javascript">
				CKEDITOR.replace('content', {width:980, height:340});
			</script>
		</div>

		<!-- 버튼박스 -->
		<div class="BoardbuttonPart">
			<button id="Boardbutton" style="background-color: #E8E8E8;"
				type="button" onclick="history.back(-1);">취소</button>
			<div id="bin2"></div>
			<button id="Boardbutton"
				style="background-color: #BCB0FE; color: white" type="submit">완료</button>
			<input type="hidden" name="faq_no" value="${modify.faq_no }">
		</div>
	</form>
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>