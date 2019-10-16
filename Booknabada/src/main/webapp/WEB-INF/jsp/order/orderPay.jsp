<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>결제정보</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/orderPay.css" rel="stylesheet">
<script type="text/javascript">
function check(){
	
	if (document.frm.checkagree.checked == false) {
		alert("약관에 동의해주세요");
		return false;
	} else{
		//alert("약관");
	} 
}
</script>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>

	<!-- 상단네비게이션 -->
		<div class="top_navi">
		<div class="top_content">
			<div id="box01" style="background: white; color: #BCB0FE;">주문/배송확인</div>
			<div id="bin">
			<div style="width: 100%; height: 2px; background-color: #BCB0FE; margin-top: 32px"></div>
			</div>
			<div id="box01" style="background: #BCB0FE; color: white;">결제정보</div>
			<div id="bin">
			<div style="width: 100%; height: 2px; background-color: #BCB0FE; margin-top: 32px"></div>
			</div>
			<div id="box01" style="color: #BCB0FE;">주문완료</div>
		</div>
	</div>

	<!-- 장바구니목록 -->
	<form action="orderFinish.do" method="post" name="frm">
	<div class="order">
		<div id="title">
			<span>주문확인</span>
		</div>
		<div class="payBox">
			<div id="cate">
				<div id=loc_cate style="height: 25%; padding-top:8px">북나바다 포인트</div>
				<div id=loc_cate style="height: 75%; margin-top:10px;">결제 수단</div>
			</div>
			<div id="content">
				<div class=point style="height: 25%;">
					<div style="float: left; width: 100%; height: 40px; margin-left:20px">
						<p id=pointTxt style="width: 106px;">보유 포인트</p>
						<p id=pointTxt style="width: 120px; text-align: right;">199,000</p>
						<p id=pointTxt style="width: 40px; margin-left:14px">P</p>
						<button id=pointButton>충전하기</button>
					</div>
					<div style="float: left; width: 100%; height: 40px; margin-top:10px; margin-left:20px">
						<p id=pointTxt style="width: 106px">사용 포인트</p>
						<input id=pointInput>
						<p id=pointTxt style="width: 40px; margin-left:12px">P</p>
						<button id=pointButton>모두사용</button>
					</div>
				
				</div>
				<div class=pay style="height: 75%">
					<div id=payselect>
						<button id="choice"><img src="../images/card_true.png"/></button>
						<div id=bin style="width:15px"></div>
						<button id="choice" style="border:1px solid #e5e5e5; background-color:#f6f6f6;"><img src="../images/bank_false.png"/></button>
						<div id=bin style="width:15px"></div>
						<button id="choice" style="border:1px solid #e5e5e5; background-color:#f6f6f6;"><img src="../images/phone_false.png"/></button>
					</div>
					<div id=card>
					<p style="color:#917EFD">카드정보입력</p>
					<div id=inputBox>
					<p style="margin-bottom:5px;">카드번호</p>
					<input id=cardInput></input></div>
					<div id=bin style="width:15px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">카드 유효날짜</p>
					<input id=cardInput style="width:80px; float:left;"></input>
					<div id=bin style="width:10px; height: 10px; padding:10px 10px; font-size: 18px;">/</div>
					<input id=cardInput style="width:80px; float:left;"></input>
					</div>
					
					<div id=bin style="width:100%; height: 10px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">카드 성명</p>
					<input id=cardInput></input></div>
					<div id=bin style="width:15px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">CVV</p>
					<input id=cardInput style="width:130px;"></input></div>
					
					</div>
				</div>
			
		</div>
	
	<!-- 정보입력 -->
	<div class=userInfo>
		<div id=loc_user>
			<p id=user_title style="margin: 20px 0 0 20px;">주문자 정보</p>
					<div>
						<div id="user_img"></div>
						<div id="list_book_txt">
							<p id="user_txt_n">사랑받는 파북이</p>
						</div>
					</div>
				</div>
				<div id=loc_info>
					<div id="loc_box3" style="height: 100px; padding-top: 20px">
						<p id=user_title style="margin-left: 20px">
							총 수량</p>
						<div style="width: auto; height: auto;">
							<input id="totalBook" readonly="readonly" name="totalBook" value="${totalBook }">
						</div>
					</div>
					<div id="loc_box3" style="height: 100px">

						<p id=user_title style="margin-left: 20px;">결제금액</p>
						<input id="totalPrice" style="font-size: 40px; margin-left: 20px;" 
						readonly="readonly" name="totalPrice" value="${totalPrice}">

					</div>
					<div id="loc_box3" style="height: 100px; margin-top: 18px">
						<div style="width: auto; height: 50px;">
							<p style="font-size: 22px; font-weight: bold; color: #876efd; float: left; margin: 0 10px 0 20px;">!</p>
							<p style="font-size: 12px; color: #876efd;">
							주문하실 상품, 가격, 배송정보, 할인정보 등을<br> 확인하였으며, 구매에 동의하시겠습니까?
							</p>

							<div style="margin: 20px 15px; float: left; width: 260px; line-height: 20px;">
								<input type="checkbox" name="checkagree" style="float: left; margin-right: 10px">
								<p style="font-size: 20px; font-weight: bold; color: #876efd; float: left;">동의합니다.</p>
								<p style="font-size: 10px; padding-left: 125px">(전자상거래법 제 8조 제2항)</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	
	
	<!-- 버튼박스 -->
	<div class=buttonBox>
		<button class=button type="button" onclick="history.back(-1);"
			style="background-color: rgba(232, 232, 232, 1);">뒤로</button>
		<div style="width: 15px; height: 30px; float: left;"></div>
		<button class=button type="submit" onclick="return check();"
			style="background-color: #876EFD; color: white;">결제</button>
	</div>
	</form>

	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>