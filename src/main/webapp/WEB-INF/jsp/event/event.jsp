<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>이벤트</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="../css/reset.css" type="text/css" />
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<link rel="stylesheet" href="../css/boardDetail.css" type="text/css" />
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/boardMenu.jsp"></jsp:include>

	<div id="container" class="event">
		<div class="inner-wrap cf">
			<section id="eventWrap">
				<ul class="event-board cf">
					<c:forEach items="${eboard }" var="i">
						<li>
							<div class="img-wrap">
								<c:if test="${i.event_picture ne null }">
									<img src="../upimg/${i.event_picture }" />
								</c:if>
								<c:if test="${i.event_picture eq null }">
									<img src="../images/noimage.png" />
								</c:if>
							</div>
							<dl>
								<dt>
									<a href="eventDetail.do?bno=${i.event_no }">${i.event_title }</a>
								</dt>
								<dd>${i.event_content }</dd>
							</dl>
						</li>
					</c:forEach>
				</ul>


			<div class="paging-wrap">
				<div class="paging">
					<%@include file="../include/eventpaging.jsp"%>
					<c:if test="${page gt 10 }">
						<button onclick="location.href='event.do?page=${page-10 }'">이전</button>
					</c:if>
					<c:if test="${page gt 1 }">
						<button onclick="location.href='event.do?page=${page-1 }'">◀</button>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i eq page }">
							<button onclick="location.href='event.do?page=${i }'"
								style="background-color: pink; border: none">${i }</button>
						</c:if>
						<c:if test="${i ne page }">
							<button onclick="location.href='event.do?page=${i }'">${i }</button>
						</c:if>
					</c:forEach>
					<c:if test="${page lt totalPage }">
						<button onclick="location.href='event.do?page=${page+1 }'">▶</button>
					</c:if>
					<c:if test="${page lt totalPage-9 }">
						<button onclick="location.href='event.do?page=${page+10 }'">다음</button>
					</c:if>
					<!-- endPage -10보다 작으면  -->
				</div>
			</div>
			
			<div class="search-wrap">
				<form action="event.do" name="searchfrm" method="post" >
					<select name="search-opt">
						<option selected disabled>검색</option>
						<option value="title">제목</option>
						<option value="content">내용</option>						
					</select>
					<input type="text" name="search-txt" >
					<input type="hidden" name="search" value="1" />
					<button type="submit">검색</button>
				</form>
			</div>
				
			<c:if test="${sessionScope.level == 1 }">			
				<button onclick="location.href='eventWrite.do'">글쓰기</button>
			</c:if>
			</section>
			<!-- //eventWrap -->
		</div>
	</div>
	<!-- //container -->


	<jsp:include page="../include/footer.jsp"></jsp:include>



</body>
</html>