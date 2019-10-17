<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>책 상세보기 - ${bookdetail.book_title }</title> <!-- 책 상세보기 브라우저 제목 : 상세보기 하고 있는 책 제목 나오기 -->
<link rel="stylesheet" href="../css/bookdetail.css">
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="bookdetail">
		<p>책 카테고리 경로</p>
		<div class="booktop_left">
			<div class="bookimage">
				<img alt="이미지를 올려주세요" src="../upimg/${bookdetail.book_title }">
			</div>
			<div class="bookinfo">
				<ul class="book_info">
					<li><h1>${bookdetail.book_title }</h1></li>
					<li>${bookdetail.book_author }</li>
					<li class="star">${bookdetail.book_recommend }</li>
					<li class="count">${bookdetail.book_count }</li>
				</ul>
			</div>
		</div>
		<div class="booktop_right">
			<p class="pabook">파북이</p>
			<img alt="파북이 이미지" class="pabongimage"><span class="pabookname"> ${bookdetail.user_name }</span>
			<div class="price">
				<p class="price_info">가격정보<p>
					<p>
					<input type="radio" name="priceSelect" id="priceSelect" value="sell">
					<label for ="priceSelect" class="lb"><span></span>판매가</label> 
					<input type="radio" name="priceSelect" id="priceSelect2" value="rent">
					<label for="priceSelect2" class="lb"><span></span>대여가</label>
				<p class="pricetext">
				<fmt:formatNumber value="${bookdetail.book_price }" groupingUsed="true"></fmt:formatNumber>원
				</p>
			</div>
			<div class="orderbnt">
				<button class="bnt1">장바구니</button>
				<button class="bnt2" onclick="location.href='../order/order.do?book_no=${bookdetail.book_no}'">바로구매</button>
			</div>
		</div>
		<h3></h3>
		<div class="book_info2">
			<table border="1">
				<tr>
					<td class="name">출간일</td>
					<td>${bookdetail.book_pubdate }</td>
				</tr>
				<tr>
					<td class="name">쪽수</td>
					<td>${bookdetail.book_page }</td>
				</tr>
				<tr>
					<td class="name">출판사</td>
					<td>${bookdetail.book_publisher }</td>
				</tr>
				<tr>
					<td class="name">카테고리</td>
					<td>${bookdetail.book_cate }</td>
				</tr>
			</table>
		</div>
		<div class="bookintro">
			<h4>책 소개</h4>
			<p>${bookdetail.book_content }</p>
		</div>
		<hr>
		<div>
			<h2>이 책과 연관된 책</h2>
			<div>연관된 책 집어 넣어보자</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>