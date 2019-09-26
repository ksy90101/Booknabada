<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문확인</title>
<link href="order.css" rel="stylesheet">

</head>
<body>
	<div class="header"></div>
	<div class="top_navi">
		<div class="top_navi_inner">
			<div class="top_content">
				<div id="box01">주문/배송확인</div>
				<div id="box02">결제정보</div>
				<div id="box03">주문완료</div>
			</div>
		</div>
	</div>

	<div class="order">
		<div id="title">
			<span>주문확인</span>
		</div>
		<table id="list">
			<tr>
				<td id="list_head" style="width: 50%">상품명</td>
				<td id="list_head" style="width: 25%">파북이명</td>
				<td id="list_head" style="width: 15%">가격</td>
			</tr>
		</table>
		<table id="list">
			<tr>
				<td id="list_book" style="width: 50%">
					<div id="list_book_img"></div>
					<div id="list_book_txt">
						<span id="book_txt_n">책 제목을 입력하세요</span><br> <span
							id="book_txt_s">작가 이름 작성영역</span><br>
					</div>
				</td>
				<td id="list_book" style="width: 25%">
					<div id="user_img"></div>
					<div id="list_book_txt">
						<span id="user_txt_n">사랑받는 파북이</span>
					</div>
				</td>
				<td id="list_book" style="width: 15%"><span id="price"
					style="font-size: 30px;">99,000 <span
						style="font-size: 20px;">원 </span>
				</span></td>
			</tr>
		</table>
	</div>

	<div class="location">
		<div id="title">
			<span>배송지정보</span>
		</div>
		<form>
			<table style="border: none">
				<tr>
					<td id=loc_box style="height: 20px"><span>배송방법</span></td>
					<td id=loc_box2><input type="radio">일반택배</input> <input
						type="radio">북나바다 제휴 서점픽업</input> <select>
							<option selected>선택</option>
							<option>교보문고 강남점</option>
							<option>알라딘 강북점</option>
							<option>예스24 홍대점</option>
							<option>알라딘 대전사거리점</option>
							<option>교보문고 부산해운대점</option>
					</select></td>
					<td rowspan=2 id=loc_box3 style="height: 100px"><span
						style="font-size: 18px; font-weight: bold; margin: 20px">주문자
							정보</span>
						<div>
							<div id="user_img"></div>
							<div id="list_book_txt">
								<span id="user_txt_n">사랑받는 파북이</span>
							</div>
						</div></td>
				</tr>
				<tr>
					<td id=loc_box style="height: 20px"><span>이름</span></td>
					<td id=loc_box2><input type="text"
						style="width: 200px; height: 25px"></input></td>
				</tr>
				<tr>
					<td id=loc_box style="height: 240px"><span>배송주소</span></td>
					<td id=loc_box2><input type="text"
						style="width: 200px; height: 25px; margin-bottom: 5px"></input>
						<button
							style="width: 100px; height: 40px; background-color: #BCB0FE; font-size: 12px; color: white"
							onclick="location.href='pay.jsp'">주소찾기</button> <br>
						<div
							style="width: 100px; height: 100px; line-height: 40px; float: left;">
							<span style="margin-left: 10px">도로명주소</span><br> <span
								style="margin-left: 10px">지번주소</span>
						</div>
						<div>
							<input type="text"
								style="width: 400px; height: 25px; margin-bottom: 5px"></input><br>
							<input type="text"
								style="width: 400px; height: 25px; margin-bottom: 5px"></input>
						</div>
						<div style="width: 20px; height: 50px;">
							<span style="font-size: 22px; font-weight: bold; color: #876efd;">!</span>
						</div>
						<div style="width: auto; height: auto; margin-left: 20px">
							<span style="font-size: 12px; color: #876efd;"> 주소/우편번호
								체계가 새롭게 변경되었습니다.<br> 정확하고 빠른 배송을 위해 입력된 주소를 확인하시고 업데이트 해주시기
								바랍니다.
							</span>
						</div></td>
					<td rowspan=3 id=loc_box3 style="height: 100px"><span
						style="font-size: 18px; font-weight: bold; margin-left: 20px">주문자
							정보</span>
						<div style="width: auto; height: auto; margin-bottom: 20px">
							<span id="book_count1">12 <span id="book_count2">권
							</span>
							</span>
						</div> <span
						style="font-size: 18px; font-weight: bold; margin-left: 20px">결제금액</span>
						<div style="width: auto; height: auto;">
							<span id="price" style="font-size: 30px;">99,000 <span
								style="font-size: 20px;">원 </span>
							</span>
						</div>
						<div style="width: 20px; height: 50px;">
							<span style="font-size: 22px; font-weight: bold; color: #876efd;">!</span>
						</div>
						<div style="width: auto; height: auto; margin-left: 20px">
							<span style="font-size: 12px; color: #876efd;"> 주문하실 상품,
								가격, 배송정보, 할인정보 등을<br> 확인하였으며, 구매에 동의하시겠습니까?
							</span>
						</div> <input type="checkbox"><span
						style="font-size: 20px; font-weight: bold; color: #876efd;">동의합니다.</span></input>
					</td>
				</tr>
				<tr>
					<td id=loc_box style="height: 20px"><span>연락처</span></td>
					<td id=loc_box2><select style="width: 80px; height: 25px">
							<option selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>02</option>
					</select> &nbsp;&nbsp;-&nbsp;&nbsp; <input type="text"
						style="width: 80px; height: 25px"></input>
						&nbsp;&nbsp;-&nbsp;&nbsp; <input type="text"
						style="width: 80px; height: 25px"></input></td>
				</tr>
				<tr>
					<td id=loc_box style="height: 20px"><span>요청사항</span></td>
					<td id=loc_box2><input type="text"
						style="width: 500px; height: 25px"></input></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="width: 1200px; height: 200px; margin: 50px;">
		<button onclick="location.href='main.jsp'" id=button
			style="background-color: rgba(232, 232, 232, 1);">취소</button>
		<button onclick="location.href='next.jsp'" id=button
			style="background-color: #BCB0FE; color: white;">다음</button>
	</div>
</body>
</html>