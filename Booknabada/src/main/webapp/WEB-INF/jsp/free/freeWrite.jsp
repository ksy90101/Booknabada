<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link href="../css/boardWrite.css" rel="stylesheet">
<!-- <style type="text/css">
</style> -->
</head>
<body>

	<div id="writebox">
		<form action="writeAction.do" method="post">
			<h3>제목</h3>
			<input type="text" name="title">
			<h4>내용</h4>
			<textarea name="content"></textarea>
		</form>
	</div>
	<div id="button">
		<button type="submit">취소</button>
		<button type="submit">완료</button>
	</div>
</body>
</html>