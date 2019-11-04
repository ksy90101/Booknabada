<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/jquery-ui-1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>책 목록</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="styleshhet" href="../css/boardDetail">
<link rel="stylesheet" href="../css/booklist.css">

</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="booklist_wrap">
		<ul class="booklist">
			<c:forEach items="${booklist }" var="i">
				<li class="book"><a href="bookDetail.do?book_no=${i.book_no }">
						<div class="bookimg">
							<img src="../upimg/${i.book_picture }" class="bookimage">
						</div>
						<ul class="bookinfo">
							<li class="scrolling" data-bno="${i.book_no}"></li>
							<li class="booktitle">${i.book_title }</li>
							<li class="bookwriter">${i.book_author }/${i.book_publisher }</li>
							<li>${i.book_recommend }</li>
							<li>${i.book_count }</li>
							<li>${i.book_price }</li>
							<li>${i.user_name }</li>
						</ul>
				</a></li>
			</c:forEach>
		</ul>


		<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
<script>
	
</script>

</html>