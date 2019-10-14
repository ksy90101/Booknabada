<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="./css/reset.css" type="text/css"/>
<link rel="stylesheet" href="../css/boardDetail.css">
<link rel="stylesheet" href="../css/pasing.css">

<style type="text/css">
table {
	width: 1000px;
	height: auto;
	border-collapse: collapse;
}

th {
	background-color: #D0C8FF;
	color: white;
}

tr {
	border-bottom: 1px gray dotted;
	height: 50px;
}

tr:hover {
	background-color: #E7E2FF;
	color:white;
}

#t1 {
	width: 10%;
	text-align: center;
}

#t2 {
	width: 40%;
	padding-left:10px;
}
#t3{
	width: 20%;
	text-align: center;
}

#board {
	margin: 0 auto;
	width: 1000px;
	height: 600px;
	background-color: ;
}

#search {
	margin: 50px auto 300px auto;
	background-color: #D1C9FE;
	width: 1000px;
	height: 60px;
}

select{
	border-style: none;
	height:20px;
	border-radius: 3px;
}

input{
	width:500px;
	height:20px;
	border-style: none;
	border-radius: 3px;
}

button{
	height:30px;
	width:80px;
	background-color: #BCB0FE;
	border-color: #D1C9FE;
	border-radius:5px;
	color: white;
	border-style: none;
	
}
a{
	text-decoration:none;
	color: black;
}
a:hover{
	color:white;
}

#underBar{
	margin: 0 auto;
	width: 750px;
	line-height: 60px;
}
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
			<div id="box01" style="color: #BCB0FE;" onclick="location.href='../fqa.do'">FAQ</div>
			<div id="bin"></div>
			<div id="box01" style="background: #BCB0FE; color: white;">QNA</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;">자유게시판</div>
		</div>
	</div>
	
	<div id="board">
		<table>
			<tr>
				<th id="t1">No</th>
				<th id="t2">Title</th>
				<th id="t3">Nickname</th>
				<th id="t3">Date</th>
				<th id="t1">Count</th>
			</tr>
			<c:forEach items="${board }" var="i">
				<tr onclick="location.href='qnaDetail.do?board_no=${i.board_no }'">
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
	<div class=pagingbox>
	<%@include file="../paging.jsp" %>
		<!-- 이전페이지 이동  -->
		<c:if test="${page gt 5 }">
			<button onclick="location.href='qnaBoard.do?page=${page - 5 }'">이전</button>
		</c:if>
		<c:if test="${page gt 1 }">
			<button onclick="location.href='qnaBoard.do?page=${page - 1 }'"> ◀ </button>
		</c:if>
		
		<!-- 페이지 -->
		<c:forEach var="i" begin="${startPage + 1}" end="${endPage }">
			<c:choose>
				<c:when test="${page == i }">
					<button onclick="location.href='qnaBoard.do?page=${i }'"
						style="background-color: red; font-weight: bold; color: white;">${i }</button>
				</c:when>
				<c:otherwise>
					<button onclick="location.href='qnaBoard.do?page=${i }'">${i }</button>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 다음페이지 이동 -->
		<c:if test="${page lt totalPage }">
			<button onclick="location.href='qnaBoard.do?page=${page + 1 }'"> ▶ </button>
		</c:if>
		<c:if test="${page lt totalPage - 5}">
			<button onclick="location.href='qnaBoard.do?page=${page + 5 }'">다음</button>
		</c:if>
	</div>
	
	<!-- 검색바 -->
	<div id="search">
		<div id="underBar">
		<select name="search1">
			<option value="s1">제목</option>
			<option value="s2">내용</option>
			<option value="s3">아이디</option>
		</select>&nbsp;&nbsp;
		<input type="text" >&nbsp;&nbsp;
		<button type="submit">검색</button>&nbsp;
		<button type="submit" onclick="location.href='qnaWrite.do'">글쓰기</button>
		</div>
	</div>


	<jsp:include page="../include/footer.jsp"></jsp:include>



</body>
</html>