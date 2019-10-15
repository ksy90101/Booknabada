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
<title>Document</title>
<link rel="stylesheet" href="../css/bookdetail.css">

</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="bookdetail">
		<p>책 카테고리 경로</p>
		<div class="booktop_left">
			<div class="bookimage">
				<img alt="이미지를 올려주세요">
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
			<h2>파북이</h2>
			<img alt="파북이 이미지" class="pabongimage"> ${bookdetail.user_name }
			<div class="price">
				<h4>가격정보</h4>
				<p>
					<label>판매가 <input type="radio" name="priceSelect"
						id="priceSelect" value="sell"></label> <label>대여가 <input
						type="radio" name="priceSelect" id="priceSelect" value="rent"></label>
				<p class="pricetext">${bookdetail.book_price }</p>
			</div>
			<form action="">
				<button class="bnt1">장바구니</button>
				<button class="bnt2">바로구매</button>
			</form>
		</div>
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