<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드</title>
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
	height: 30px;
}

tr:hover {
	background-color: #D0C8FF;
}

#t1 {
	width: 12%;
	text-align: center;
}

#t2 {
	width: 50%;
}

#board {
	margin: 0 auto;
	width: 1000px;
	height: 650px;
	background-color: ;
	margin-top: 100px;
}

#search {
	margin: 0 auto;
	margin-top: 50px;
	background-color: #D1C9FE;
	width: 1000px;
	height: 60px;
}

select{
	margin-top:20px;
	margin-left: 50px;
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
</style>
</head>
<body>
	<%-- <jsp:include page=""></jsp:include>
 --%>
	<h1></h1>
	
	<div id="board">
		<table>
			<tr>
				<th>No</th>
				<th>Title</th>
				<th>Nickname</th>
				<th>Date</th>
				<th>Count</th>
			</tr>
			<c:forEach items="${board }" var="i">
				<tr>
					<td id="t1">${i.board3_no }</td>
					<td id="t2"><a href="detail.do?board3_no=${i.board3_no }">${i.board3_title }<c:if
								test="${i.commentcount > 0}">
								<small>(${i.commentcount })</small>
							</c:if></a></td>
					<td id="t1">${i.user_name }</td>
					<td id="t1">${i.board3_date }</td>
					<td id="t1">${i.board3_count }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div id="search">
		<select class="" name="search1">
			<option value="s1">제목</option>
			<option value="s2">내용</option>
			<option value="s3">아이디</option>
		</select>&nbsp;&nbsp;
		<input type="text" >&nbsp;&nbsp;
		<button type="submit">검색</button>&nbsp;
		<button type="submit">글쓰기</button>
	</div>






</body>
</html>