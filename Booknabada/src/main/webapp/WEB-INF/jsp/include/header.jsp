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
					<form action="../book/searchbooklist.do" method="post">
					<img src="../images/search.png" alt ="search">
					<input type="text" name="search" placeholder="필요하신 책을 검색해보세요">
					</form>
				</li>
			</ul>
			<h1 class="logo">
				<a href="../index/index.do">
					<img src="../images/logo.png" alt="BOOKNABADA">
				</a>
			</h1>
			<ul class="right cf">
				<li class="alert">
					<img src="../images/alert.png"	alt="알림">			
				</li>
				<li class="mypage">
					<a href="../my/myhome.do">
						<img src="../images/mypage.png" alt="마이페이지">	
					</a>
				</li>
				<c:choose>
					<c:when test="${sessionScope.id eq null }">
						<li class="login">
							<a href="#" class="openMask"><img src="../images/login.png" alt="로그인"></a>
							<div id = "mask">
								<div class="window">
								<jsp:include page="../login/login.jsp"></jsp:include>
								<input type="button" class="close" value="닫기" />
								</div>
							</div>
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
			<li><a href="../book/booklist.do">도서목록</a></li>
			<li><a href="../my/myhome.do">마이페이지</a></li>
			<li><a href="../notice/noticeBoard.do">공지사항</a></li>
			<li><a href="../event/event.do">이벤트</a></li>
			<li><a href="../free/freeBoard.do">자유게시판</a></li>
			<li><a href="../faq/faqboardall.do">FAQ</a></li>
			<li><a href="../qna/qnaBoard.do">QNA</a></li>
			<li><a href="#">회사소개</a></li>
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
	
	<!-- 로그인 팝업창 -->
	<script>
    function wrapWindowByMask(){
        // 화면의 높이와 너비를 구한다.
        var maskHeight = '68%'; // 화면 높이
        var maskWidth = '54%'; // 화면 넓이

        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({'width':maskWidth}, {'height':maskHeight});

        // 애니메이션 효과
        $('#mask').fadeIn(1000); // 선택 요소를 서서히 나타나게 함, 1: 1000분의 1초 즉, 1000은 1초
        $('#mask').fadeTo("slow", 1); // 투명도를 지정, slow는 시간값, 0.8은 투명도 값

        //윈도우 같은 거 띄운다.
        $('.window').show(); // display속성을 block으로 바꾼다.
    }

    $(document).ready(function(){ // window.onload와 동일한 기능으로 body에 태그들이 출력된 다음 호출되는 코드
        //검은 막 띄우기
        $('.openMask').click(function(e){
            e.preventDefault(); // 현재 이벤트의 기본 동작을 중단한다.
            wrapWindowByMask();
        });

        //닫기 버튼을 눌렀을 떄
        $('.close').click(function(e){
        	//링크 기본동작은 작동하지 않도록 한다.
        	 e.preventDefault();
        	$('#mask').fadeOut(1000);
        	$('.window').fadeOut(1000);
        	// 숨기기
        });
        
        //검은 막을 눌렀을 때
        $('mask').click(function(){
        	$(this).hide();
        	$('.window').hide();
        });
    });
</script>