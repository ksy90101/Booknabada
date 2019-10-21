<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파북이 개인 페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="../css/reset.css" type="text/css" />
<link rel="stylesheet" href="../css/my.css" type="text/css" />
</head>

<body>

<jsp:include page="../include/header.jsp"></jsp:include>


<div id="container" class="pabook">
	<div class="inner-wrap cf">
		<div class="top cf">
			<div class="profile">
				<img src="../images/profile.png" alt="프로필 사진">			
			</div>
			<p>${pabookInfo.user_name } </p>
			<c:if test="${likeChk eq 0 }">
				<span onclick="like_off(${pabookInfo.user_no })">
					<img src="../images/like_off.png" alt="좋아요" >
				</span>
			</c:if>
			<c:if test="${likeChk eq 1 }">
				<span onclick="like_on(${pabookInfo.user_no })">
					<img src="../images/like_on.png" alt="좋아요" >
				</span>
			</c:if>
			<span id="likeCnt">${likeCnt }</span>
		</div>
		<div class="bottom">
			<h4>등록된 책 둘러보기</h4>
			<ul class="cf">
			<c:forEach items="${bookInfo }" var="b">
				<li class="cf">
					<div class="bookimg">
						<img alt="파북이가 등록한 책" src="../upimg/${b.book_picture }">
					</div>
					<a href="../book/bookDetail.do?book_no=${b.book_no }">	
					<div class="booktxt">
						<h5>${b.book_title }</h5>
						<p class="book_author">${b.book_author } / ${b.book_publisher }</p>
						<p class="star">${b.book_recommend }</p>
						<p class="read"><span id="cnt">
						<fmt:formatNumber value="${b.book_count }" groupingUsed="true"/>
						</span>명이 읽었음</p>
					</div>
					</a>
				</li>
			</c:forEach>
			</ul>
		</div>
<%-- 	파북넘버 : ${pabook_no } --%>
	</div>
</div><!-- //container -->



<jsp:include page="../include/footer.jsp"></jsp:include>
<script>
function like_off(no){
	location.href="likeAction.do?pabook_no="+no;	
}

function like_on(no){
	alert("이미 좋아요를 누르셨습니다~!")

	if(confirm("좋아요를 취소하시겠습니까?")){
		location.href="likeAction.do?pabook_no="+no+"&likeCancel=true"
	}else{
		return false;	
	}
	
}


</script>
</body>
</html>