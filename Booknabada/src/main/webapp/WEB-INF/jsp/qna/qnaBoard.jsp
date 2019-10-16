<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="../css/reset.css" type="text/css"/>
<link rel="stylesheet" href="../css/boardDetail.css">
<link rel="stylesheet" href="../css/board.css">

</head>
<body>
	
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/boardMenu.jsp"></jsp:include>
	
<<<<<<< HEAD
	<div class="board">
=======
>>>>>>> refs/heads/Yehee
		<table>
			<tr id=board_tr>
				<th id="t1" style="font-weight: bold">No</th>
				<th id="t2" style="font-weight: bold">Title</th>
				<th id="t3" style="font-weight: bold">Nickname</th>
				<th id="t3" style="font-weight: bold">Date</th>
				<th id="t1" style="font-weight: bold">Count</th>
			</tr>
			<c:forEach items="${board }" var="i">
				<tr id=board_tr onclick="location.href='qnaDetail.do?board_no=${i.board_no }'">
					<td id="t1">${i.board_no }</td>
					<td id="t2" >
					${i.board_title }
					<%-- <c:if test="${i.commentcount > 0}"><small>(${i.commentcount })</small> </c:if> --%>
					</td>
					<td id="t3">${i.user_name }</td>
					<td id="t3">${i.board_date }</td>
					<td id="t1">${i.board_count }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 페이징박스 -->
	<div class="pagingbox">
				<div class="paging">
					<%@include file="../include/boardpaging.jsp"%>
					<c:if test="${page gt 10 }">
						<button style="width:50px;" onclick="location.href='qnaBoard.do?page=${page-10 }'">이전</button>
					</c:if>
					<c:if test="${page gt 1 }">
						<button onclick="location.href='qnaBoard.do?page=${page-1 }'">◀</button>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i eq page }">
							<button onclick="location.href='qnaBoard.do?page=${i }'"
								style="background-color: #A797FE; border: none; color:white; font-weight: bold;">${i }</button>
						</c:if>
						<c:if test="${i ne page }">
							<button onclick="location.href='qnaBoard.do?page=${i }'">${i }</button>
						</c:if>
					</c:forEach>
					<c:if test="${page lt totalPage }">
						<button onclick="location.href='qnaBoard.do?page=${page+1 }'">▶</button>
					</c:if>
					<c:if test="${page lt totalPage-9 }">
						<button style="width:50px;" onclick="location.href='qnaBoard.do?page=${page+10 }'">다음</button>
					</c:if>
				</div>
			</div>
	
	<!-- 검색바 -->
	<div id="search">
		<div id="underBar">
		<select name="search1">
			<option value="s1">제목</option>
			<option value="s2">내용</option>
			<option value="s3">아이디</option>
		</select>&nbsp; 
		<input type="text">&nbsp; 
		<button id=boardButton type="submit">검색</button>&nbsp;
		<c:if test="${sessionScope.name != null }">
		<button id=boardButton type="submit" onclick="location.href='qnaWrite.do'">글쓰기</button></c:if>
		</div>
	</div>


	<jsp:include page="../include/footer.jsp"></jsp:include>



</body>
</html>