<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송확인</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/order.css" rel="stylesheet">
</head>
<body>
	
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<!-- 상단 네비게이션 -->
	<div class="top_navi">
		<div class="top_content">
			<div id="box01" style="background: #BCB0FE; color: white;">주문/배송확인</div>
			<div id="bin">
			<div style="width: 100%; height: 2px; background-color: #BCB0FE; margin-top: 32px"></div>
			</div>
			<div id="box01" style="color: #BCB0FE;">결제정보</div>
			<div id="bin">
			<div style="width: 100%; height: 2px; background-color: #BCB0FE; margin-top: 32px"></div>
			</div>
			<div id="box01" style="color: #BCB0FE;">주문완료</div>
		</div>
	</div>
	
	<!-- 장바구니 목록 -->
	<div class="order">
		<div id="title">
			<span>주문확인</span>
		</div>
		<div id="list">
			<div id="list_head" style="width: 59%">상품명</div>
			<div id="list_head" style="width: 24%">파북이명</div>
			<div id="list_head" style="width: 17%">가격</div>
		</div>
		<div id="list">
			<div id="list_book" style="width: 60%;">
				<div style="width: auto; height: 120px; margin-top: 20px;">
					<div id="list_book_img"></div>
					<div id="list_book_txt" style="padding-top: 30px;">
						<p id="book_txt_n" style="font-size: 23px;">책제목 :</p>
						<p id="book_txt_n" style="font-size: 15px;">작가 이름 작성영역</p>
					</div>
				</div>
			</div>
			<div id="list_book" style="width: 25%;">
				<div style="height: 120px; margin-top: 20px;">
					<div id="user_img"></div>
					<p id="user_txt_n">사랑받는 파북이</p>
				</div>
			</div>
			<div id="list_book" style="width: 15%">
				<div style="height: 120px; margin: 20px; line-height: 100px">
					<p id="price" style="font-size: 30px;">99,000</p>
					<p id="price" style="font-size: 20px;">원</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 배송지입력 -->
	<div class="location">
		<div id="title">
			<span>배송지정보</span>
		</div>

		<div id=cate>
			<div id="loc_cate" style="height: 75px; line-height: 75px;">
				<p>배송방법</p>
			</div>
			<div id="loc_cate" style="height: 70px; line-height: 70px;">
				<p>이름</p>
			</div>
			<div id="loc_cate" style="height: 230px; line-height: 40px;">
				<p>배송주소</p>
			</div>
			<div id="loc_cate" style="height: 60px; line-height: 62px;">
				<p>연락처</p>
			</div>
			<div id="loc_cate" style="height: 85px; line-height: 60px;">
				<p>요구사항</p>
			</div>
		</div>

		<form>
			<div class=locationInfo>

				<div id="loc_box2"
					style="height: 75px; line-height: 75px; border-bottom: 1px solid #BCB0FE; box-sizing: border-box;">
					<input type="radio">일반택배 <input type="radio"> 북나바다
					제휴 서점픽업 <select style="margin-left: 5px">
						<option selected="">선택</option>
						<option>교보문고 강남점</option>
						<option>알라딘 강북점</option>
						<option>예스24 홍대점</option>
						<option>알라딘 대전사거리점</option>
						<option>교보문고 부산해운대점</option>
					</select>
				</div>


				<div id="loc_box2" style="height: 70px; line-height: 40px;">
					<input type="text"
						style="width: 200px; height: 25px; transform: translate(0, 14px);">
				</div>

				<div id="loc_box2" style="height: 230px;">
					<div style="width: 100%; height: 50px;">
						<input type="text" style="width: 200px; height: 25px; float: left">
						<button id=searchButton onclick="location.href='pay.jsp'">주소찾기</button>
					</div>

					<div>
						<div style="height: 50px;">
							<div
								style="width: 80px; height: 50px; line-height: 50px; float: left;">
								<span id=post>주소</span>
							</div>
							<input type="text"
								style="width: 420px; height: 25px; transform: translate(0, 20%);">
						</div>
						<div style="height: 50px;">
							<div
								style="width: 80px; height: 50px; line-height: 50px; float: left;">
								<span id=post>상세주소</span>
							</div>
							<input type="text"
								style="width: 420px; height: 25px; transform: translate(0, 20%);">
						</div>
					</div>

					<div style="height: 50px;">
						<p
							style="width: 25px; height: 50px; font-size: 22px; font-weight: bold; color: #876efd; text-align: center; line-height: 55px; float: left;">!</p>
						<p
							style="font-size: 12px; color: #876efd; float: left; line-height: 20px; margin-top: 7px">
							주소/우편번호 체계가 새롭게 변경되었습니다.<br> 정확하고 빠른 배송을 위해 입력된 주소를 확인하시고
							업데이트 해주시기 바랍니다.
						</p>

					</div>
				</div>
				<div id="loc_box2" style="height: 60px; line-height: 60px">
					<input type="text" style="width: 80px; height: 25px">
					&nbsp;&nbsp;-&nbsp;&nbsp; <input type="text"
						style="width: 80px; height: 25px">
					&nbsp;&nbsp;-&nbsp;&nbsp; <input type="text"
						style="width: 80px; height: 25px">
				</div>
				<div id="loc_box2" style="height: 80px; line-height: 60px">
					<input type="text" style="width: 500px; height: 25px">
				</div>
			</div>

			<div class=userInfo>
				<div id=loc_user>

					<p
						style="font-size: 18px; font-weight: bold; margin: 20px 0 0 20px;">주문자
						정보</p>
					<div>
						<div id="user_img"></div>
						<div id="list_book_txt">
							<p id="user_txt_n">사랑받는 파북이</p>
						</div>
					</div>
				</div>
				<div id=loc_info>
					<div id="loc_box3" style="height: 100px; padding-top: 20px">
						<p style="font-size: 18px; font-weight: bold; margin-left: 20px">
							총 수량</p>
						<div style="width: auto; height: auto;">
							<p id="book_count1">12 권</p>


						</div>
					</div>
					<div id="loc_box3" style="height: 100px">

						<p style="font-size: 18px; font-weight: bold; margin-left: 20px;">결제금액</p>
						<p id="price" style="font-size: 40px; margin-left: 20px;">99,000</p>
						<p id="price" style="font-size: 30px; line-height: 2.2">원</p>

					</div>
					<div id="loc_box3" style="height: 100px; margin-top: 18px">
						<div style="width: auto; height: 50px;">
							<p
								style="font-size: 22px; font-weight: bold; color: #876efd; float: left; margin: 0 10px 0 20px;">!</p>
							<p style="font-size: 12px; color: #876efd;">
								주문하실 상품, 가격, 배송정보, 할인정보 등을<br> 확인하였으며, 구매에 동의하시겠습니까?
							</p>

							<div
								style="margin: 20px 15px; float: left; width: 260px; line-height: 20px;">
								<input type="checkbox" style="float: left; margin-right: 10px">
								<p
									style="font-size: 20px; font-weight: bold; color: #876efd; float: left;">동의합니다.</p>
								<p style="font-size: 10px; padding-left: 125px">(전자상거래법 제 8조
									제2항)</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- 버튼박스 -->
	<div class=buttonBox>
		<button class=button onclick="location.href='../index.do'"
			style="background-color: rgba(232, 232, 232, 1);">취소</button>
		<div style="width: 15px; height: 30px; float: left;"></div>
		<button class=button onclick="location.href='orderPay.do'"
			style="background-color: #876EFD; color: white;">다음</button>
	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>