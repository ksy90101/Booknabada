<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<!-- <p><a href="#">프로필 사진 변경</a></p>
					<p><a href="#">회원정보변경 바로가기 →</a></p> -->
				</div>
				<ul class="my-info">
					<li><a href="#">내정보</a></li>
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
			</div><!-- //side-menu -->
			<div class="content">
				<ul class="content-wrap cf">
					<li>
						<div class="my-point icon">
							<img src="../images/point.png" alt="나의 포인트">
						</div>
						<p>나의 포인트는 <span>${point }</span>점 입니다</p>
					</li>
					<li>
						<div class="cart-icon icon">
							<img src="../images/cart.png" alt="나의 장바구니">
						</div>
						<p><a href="#">장바구니 바로가기 →</a></p>
					</li>
					<li>
						<div class="order-list icon">
							<img src="../images/order-list.png" alt="나의 주문내역">
						</div>
						<a href="#">주문내역</a></li>
					<li>
						<div class="book-list icon">
							<img src="../images/booklist.png" alt="나의 책 리스트">
						</div>
						<a href="#">내 책 리스트</a>
					</li>
					<li>
						<div class="pabook-list icon">
							<img src="../images/pabook.png" alt="나의 책 리스트">
						</div>
						<a href="#">즐겨찾는 파북이</a>
					</li>
					<li>
						<a href="../book/bookadd.do">
						<div class="bookplus-icon">
							<img src="../images/bookadd.png" alt="책 등록하기">
						</div>
						<p>책 등록하기</p>
						</a>
					</li>
				</ul>


			</div><!-- //content -->
		</div>
	</div><!-- //container -->
	
	
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