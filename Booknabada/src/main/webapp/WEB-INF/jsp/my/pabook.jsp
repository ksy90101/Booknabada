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
	파북넘버 : ${pabook_no }
	<br>
	${pabookInfo.user_name } 
	<c:if test="${likeChk eq 0 }">
		<span onclick="like_off(${pabookInfo.user_no})">
			<img src="../images/like_off.png" alt="좋아요" >
		</span>
	</c:if>
	<c:if test="${likeChk eq 1 }">
		<span onclick="like_on(${pabookInfo.user_no })">
			<img src="../images/like_on.png" alt="좋아요" >
		</span>
	</c:if>
		
	
	<br><br>
	<c:forEach items="${bookInfo }" var="b">
		${b.book_title }
		${b.book_author }
		<br>
	</c:forEach>
	
	
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