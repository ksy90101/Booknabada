<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
			<c:forEach items="${sbl }" var="i">
				<li class="book">
				<a href="bookDetail.do?book_no=${i.book_no }">
						<div class="bookimg">
							<img src="../upimg/${i.book_picture }" class="bookimage">
						</div>
						<ul class="bookinfo">
							<li class="booktitle">${i.book_title }</li>
							<li class="bookwriter">${i.book_author }/ ${i.book_publisher }</li>
							<li>${i.book_recommend }</li>
							<li>${i.book_count }</li>
							<li>${i.book_price }</li>
							<li>${i.user_name }</li>
						</ul>
				</a></li>
			</c:forEach>
		</ul>

		<!--  페이징 박스 -->
		<div class="paginbox">
			<div class="paging">
				<%@include file="../include/bookpaging.jsp"%>
				<!-- gt == > / page가 10보다 크다면 -->
				<c:if test="${page gt 10 }">
					<!-- ${page-10 } 이전을 생성하고, 이전을 누르면 현재 페이지보다 10페이지 전으로 간다. -->
					<button onclick="location.href='booklist.do?page=${page-10}'">이전</button>
				</c:if>
				<!-- page가 1보다 크다면 -->
				<c:if test="${page gt 1 }">
					<!-- 바로 전 단계로 갈수 있는 버튼을 생성 -->
					<button onclick="location.href='booklist.do?page=${page-1 }'">◀</button>
				</c:if>
				<!-- 시작페이지 / 종료페이지 -->
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<!-- 만약 i가 현재 페이지와 같다면 -->
					<c:if test="${i eq page }">
						<button
							style="background-color: #A797FE; , boarder: none; color: white; font-weight: bold;"
							onclick="location.href='booklist.do?page=${i }'">${i }</button>
					</c:if>
					<!--  만약 i가 현재페이지가 아니라면 -->
					<c:if test="${i ne page }">
						<button onclick="location.href='booklist.do?page=${i }'">${i }</button>
					</c:if>
				</c:forEach>
				<!-- lt : < 측, 총 페이지보다 페이지가 작다면, -->
				<c:if test="${page lt totalPage }">
					<button onclick="location.href='booklist.do?page=${page+1 }'">▶</button>
				</c:if>
				<!-- 현재 페이지가 총 페이지 -9한것 보다 작다면 -->
				<c:if test="${page lt totalPage-9 }">
					<button onclick="location.href='booklist.do?page=${page + 10}'">다음</button>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>