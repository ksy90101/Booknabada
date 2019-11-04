<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="../css/reset.css" type="text/css" />
<link rel="stylesheet" href="../css/my.css" type="text/css" />
<script type="text/javascript">
function bookDel(num){
	alert("삭제하기 숫자: " + num);
	//location.href='comentDelete.do?coment_no=${c.coment_no}&board3_no=${c.board3_no }'	
	var check = confirm("삭제하시겠습니까?");
	if (check) {
		location.href= '../wishbookDelete.do?book_no=' + num;
	} else{
		return;
		
	}
}
</script>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	
	
	<div id="container" class="myhome2">
		<div class="inner-wrap cf">
			<div class="side-menu">
				<div class="top">
					<div class="profile-icon">
						<img src="../images/profile.png" alt="프로필 사진">
					</div>
				</div>
				<ul class="my-info">
					<li><a href="../my/myhome.do">내정보</a></li>
					<li><a href="modifyuser.do">회원정보변경</a></li>
				</ul>
				<ul class="my-pay">
					<li><a href="#">포인트</a></li>
					<li><a href="#">장바구니</a></li>
					<li><a href="#">주문내역</a></li>
				</ul>
				<ul class="my-book">
					<li><a href="#">내 책 리스트</a></li>
					<li><a href="#">내 책 등록하기</a></li>
					<li><a href="#">즐겨찾는 파북이</a></li>
				</ul>
			</div>
			
			<!-- 장바구니 목록 -->
			<div class="content">
				<div class="booklist_box">
				<ul class="booklist_wrap">
				<c:forEach items="${wishlistBook }" var="i">
				<li class="book">
				<a href="../book/bookDetail.do?book_no=${i.book_no }">
						<div class="bookimg">
							<img src="../upimg/${i.book_picture }" class="bookimage">
						</div>
						<ul class="bookinfo">
							<li class="booktitle">${i.book_title }</li>
							<li class="bookwriter">${i.book_author } / ${i.book_publisher }</li>
							<li>좋아요 : ${i.book_recommend }</li>
							<li>조회수: ${i.book_count }</li>
							<li>가격 : <fmt:formatNumber value="${i.book_price }" groupingUsed="true" />원</li>
							<li>파북이 : ${i.user_name }</li>
							<div><img alt="삭제" src="../images/coment_delete.png" name="delete" style="width:20px; height:20px; float: right; 
							margin:10px;" onclick="bookDel(${i.book_no })"/></div>
						</ul>
				</a></li>
			</c:forEach>
			</ul>
			</div>
			<button class="button" onclick="location.href='../order/order.do'" style="background-color: #876EFD; color: white;">주문하기</button>

			</div>
		</div>
	</div>
	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
<!-- 회원정보 변경을 위한 유저 번호 가져오기 -->
<script type="text/javascript">
function modifyuser(){
	var user_no = '<%session.getAttribute("user_no");%>'
	location.href="modifyuser.do?user_no="+user_no;
}
</script>
</html>