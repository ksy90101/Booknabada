<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/reset.css">
<header id="header">
		<div class="inner-wrap">
			<ul class="left cf">
				<li class="hamberger_btn">
					<img src="../images/hamburger-menu.png" alt="menu">
				</li>
				<li class="search_box">
					<img src="../images/search.png" alt ="search">
					<input type="text" name="search" placeholder="필요하신 책을 검색해보세요">
				</li>
			</ul>
			<h1 class="logo">
				<a href="../index.do">
					<img src="../images/logo.png" alt="BOOKNABADA">
				</a>
			</h1>
			<ul class="right cf">
				<li class="alert">
					<img src="../images/alert.png"	alt="알림">			
				</li>
				<li class="mypage">
					<a href="myhome.jsp">
						<img src="../images/mypage.png" alt="마이페이지">	
					</a>
				</li>
				<c:choose>
					<c:when test="${sessionScope.id eq null }">
						<li class="login">
							<a href="../login/login.do">
							<img src="../images/login.png" alt="로그인">
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class= "logout">
							<a href="../login/logout.do">
								<img src="../images/logout.png" alt="로그아웃">
							</a>
					</c:otherwise>
				</c:choose>
			</ul>
		</div><!-- inner-wrap -->
	</header>

	<nav id="nav">
		<ul id="gnb">
			<li>국내도서</li>
			<li>외국도서</li>
			<li>마이페이지</li>
			<li>고객센터</li>
			<li>회사소개</li>
		</ul>
	</nav>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		var isMenu = false;
		$(".hamberger_btn").on("click",function(){
			if(isMenu){
				$("#nav").stop().animate({left:"-100%"},400);	
			}else{
				$("#nav").stop().animate({left:0},400);	
			}
			isMenu = !isMenu;
		})

	</script>