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
<!-- 헤더 -->
<jsp:include page="../include/header.jsp"></jsp:include>

<!-- 본문내용 -->
<div id="container" class="main">
		<section id="visualWrap">
			<h3>가장 사랑받는 책</h3>
			<div class="v-mask">
				<ul class="v-banner cf" id="mainBook">
				<c:set value="1" var="num"/>
					<c:forEach items="${lovebook }" var = "i" >\
					<li class="banner${num }"><c:set value="${num+1 }" var="num"/>
							<input type="hidden" name="book_no" value="${i.book_no }">
							<div class="pic">
							<a href="../book/bookDetail.do?book_no=${i.book_no }">	
							<img alt="책이미지" src="../upimg/${i.book_picture }">
							</a>
							</div>
							<a href="../book/bookDetail.do?book_no=${i.book_no }">	
							<div class="txt">
								<h5>${i.book_title }</h5>
								<p class="book_author">By ${i.book_author }</p>
								<p class="book_publisher">${i.book_publisher }</p>
								<p class="price"><fmt:formatNumber value="${i.book_price }" groupingUsed="true"></fmt:formatNumber>원</p>
								<!-- <p class="star">${i.book_recommend }</p> -->
								<p class="read"><span id="cnt">
								<fmt:formatNumber value="${i.book_count }" groupingUsed="true"/>
								</span>명이 읽음</p>
							</div>
							</a>
						</li>
					</c:forEach>
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
				<c:forEach items="${currentbook }" var="i">
				<li>
					<a href="../book/bookDetail.do?book_no=${i.book_no }">
					<div class="currentbookimg"><img alt="최근 등록한 책" src="../upimg/${i.book_picture }"></div>
					<p>${i.book_title }</p>
					<p>${i.book_author }</p>
					<p>${i.book_publisher }</p>
					<p><fmt:formatNumber value="${i.book_price }" groupingUsed="true"></fmt:formatNumber>원
					<p><fmt:formatNumber value="${i.book_count }" groupingUsed="true"></fmt:formatNumber>
					명이 읽음</p>
				</a>
				</li>
				</c:forEach>
				</ul>
				
			</section> <!-- //bookList -->
			<aside id="loveBook">
				<article class="pabook">
					<h3>사랑받는 파북이</h3>
					<ul class="list">
					<c:forEach items="${loveuser }" var="i">
						<li><a href="../my/pabook.do?pabook_no=${i.user_no }">
						<span>${i.ranknum}.</span> ${i.user_name }</a></li>
					</c:forEach>
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