<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>자주하는질문</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="../css/faq.css">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<jsp:include page="../include/boardMenu.jsp"></jsp:include>
	<div class="faq">
		<div class="faq_wrap">
			<div class="faq_menu">
				<div class="faqtext"><a href="FAQ_all.do">전체보기</a></div>
			</div>
			<div class="faq_menu">
				<div class="faqtext_click faqtext"><a href="FAQ_best.do">베스트</a></div>
			</div>
			<div class="faq_menu">
				<div class="faqtext"><a href="FAQ_order.do">주문/결제</a></div>
			</div>
			<div class="faq_menu">
				<div class="faqtext"><a href="FAQ_delivery.do">배송/반품</a></div>
			</div>
			<div class="faq_menu">
				<div class="faqtext"><a href="FAQ_homepage.do">홈페이지이용</a></div>
			</div>
		</div>
		<h1 style="margin-bottom: 50px;">
			<br>주문 / 결제
		</h1>
		<div class="dl_wrap">
			<c:forEach items="${faq_best }" var="i">
			<dl>
				<dt class="question">${i.faq_qustion }</dt> 
				<dd class="answer">${i.faq_answer }</dd>
			</dl>
			</c:forEach>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	$(".question").on("click", function() {
		if ($(this).hasClass("on")) {
			$(this).removeClass("on").next().slideUp();
			$(".answer").css("clear", "both")
		} else {
			$(this).addClass("on").next().slideDown();
		}
	})
</script>
</html>