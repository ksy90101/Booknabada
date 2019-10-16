<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>index</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>

<jsp:include page="../include/header.jsp"></jsp:include>


<div id="container" class="main">
		<section id="visualWrap">
			<h3>가장 사랑받는 책</h3>
			<div class="v-mask">
				<ul class="v-banner cf" id="mainBook">
					<li class="one">
						<div class="pic"></div>
						<div class="txt">
							<h5>이곳은 책의 제목을 작성하는 영역</h5>
							<p class="book_author">작가이름 작성영역</p>
							<p class="star">★★★☆☆</p>
							<p class="read"><span id="cnt">10,000</span>명이 읽었음</p>
						</div>
					</li>
					<li class="two">
						<div class="pic"></div>
						<div class="txt">
							<h5>이곳은 책의 제목을 작성하는 영역이곳은 책의 제목을 작성하는 영역이곳은 책의 제목을 작성하는 영역</h5>
							<p class="book_author">작가이름 작성영역</p>
							<p class="star">★★★☆☆</p>
							<p class="read"><span id="cnt">10,000</span>명이 읽었음</p>
						</div>
					</li>
					<li class="three">
						<div class="pic"></div>
						<div class="txt">
							<h5>이곳은 책의 제목을 작성하는 영역</h5>
							<p class="book_author">작가이름 작성영역</p>
							<p class="star">★★★☆☆</p>
							<p class="read"><span id="cnt">10,000</span>명이 읽었음</p>
						</div>
					</li>
					<li class="four">
						<div class="pic"></div>
						<div class="txt">
							<h5>이곳은 책의 제목을 작성하는 영역</h5>
							<p class="book_author">작가이름 작성영역</p>
							<p class="star">★★★☆☆</p>
							<p class="read"><span id="cnt">10,000</span>명이 읽었음</p>
						</div>
					</li>
					<li class="five">
						<div class="pic"></div>
						<div class="txt">
							<h5>이곳은 책의 제목을 작성하는 영역</h5>
							<p class="book_author">작가이름 작성영역</p>
							<p class="star">★★★☆☆</p>
							<p class="read"><span id="cnt">10,000</span>명이 읽었음</p>
						</div>
					</li>
				</ul>
			</div>
			<ul class="v-arrow">
				<li class="prev"><img src="../images/arrow_before.png" alt="prev"></li>
				<li class="next"><img src="../images/arrow_next.png" alt="next"></li>
			</ul>
			
		</section> <!-- //visualWrap -->

		<div class="inner-wrap cf">
			<section id="bookList">
				<h3>최근 등록된 책</h3>
				<ul class="list cf">
					<li></li>
					<li></li>
					<li></li>

				</ul>
				<a href="#"> 전체 책 둘러보기</a>
			</section> <!-- //bookList -->
			<aside id="loveBook">
				<article class="pabook">
					<h3>사랑받는 파북이</h3>
					<ul class="list">
						<li></li>
					</ul>
				</article>				
			</aside><!-- //loveBook -->
		</div>
	</div><!-- //container -->



<jsp:include page="../include/footer.jsp"></jsp:include>
<script>

/*visual banner*/
$(function(){
	var width=$(window).width();
	$("#visualWrap .v-mask").css("width",width).css("margin-left",-(width/2));


	var first = "", last = "", cnt = 0, timer =0, delay=3000;

	timer = setInterval(make, delay);

	function make(){
		next();
	}


	last = $(".v-banner li").last();
	$(".v-banner").prepend(last).css("margin-left","-=760px")

	$(".prev").click(function(){
		if(!$(".v-banner").is(":animated")){	
			$(".v-banner").stop().animate({marginLeft:"+=760px"},1000,function(){
			last = $(".v-banner li").last();
			$(".v-banner").prepend(last).css("margin-left","-=760px");
			clearInterval(timer);
			timer = setInterval(make,delay)
		})
		}
	})


	$(".next").click(function(){
		if(!$(".v-banner").is(":animated")){	
			next();
			clearInterval(timer);
			timer = setInterval(make,delay)
		}
	})


	function next(){
		$(".v-banner").stop().animate({marginLeft:"-=760px"},1000,function(){
			first = $(".v-banner li").first();
			$(".v-banner").append(first).css("margin-left","+=760px");
		})
	}
})


</script>

</body>
</html>