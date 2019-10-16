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
<!-- <style type="text/css">
</style> -->
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- 카테고리 -->
	<jsp:include page="../include/boardMenu.jsp"></jsp:include>
	
	<!-- 글박스 -->
	<form action="freeWriteAction.do" method="post" enctype="multipart/form-data">
		
	<div id="writebox">
		
			<h3>제목</h3>
			<input  id="title" type="text" name="title">
			<h4>내용</h4>
			<textarea name="content" id="content"></textarea>
			<script type="text/javascript">
			CKEDITOR.replace('content',{width:980, height:340})
			</script>
			<input id="imgUp" type="file" accept="image/*" name="file">
	</div>
	
	<!-- 버튼박스 -->
	<div class="BoardbuttonPart">
		<button id="Boardbutton" style="background-color: #E8E8E8;" type="button" onclick="history.back(-1);">취소</button>
		<div id="bin2"></div>
		<button id="Boardbutton" style="background-color: #BCB0FE; color: white" type="submit">완료</button>
	</div>
	
	</form>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
</body>
</html>