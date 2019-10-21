<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>결제정보</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/orderPay.css" rel="stylesheet">
<script type="text/javascript">
function check(){
	
	if (document.frm.what.value == 'card') {
		if (document.frm.cardNo.value == "") {
			alert("카드번호를 입력하세요");
			document.frm.cardNo.focus();
			return false;
		}
		if (document.frm.cardMonth.value == "") {
			alert("유효날짜를 입력하세요");
			document.frm.cardMonth.focus();
			return false;
		}
		if (document.frm.cardYear.value == "") {
			alert("유효날짜를 입력하세요");
			document.frm.cardYear.focus();
			return false;
		}
		
		if (document.frm.cardUser.value == "") {
			alert("카드 성명을 입력하세요");
			document.frm.cardUser.focus();
			return false;
		}
		if (document.frm.cardCvv.value == "") {
			alert("cvv을 입력하세요");
			document.frm.cardCvv.focus();
			return false;
		}
	}
	
	if (document.frm.what.value == 'bank') {
		if (document.frm.bankUser.value == "") {
			alert("예금주명을 입력하세요")
			document.frm.bankUser.focus();
			return false;
		}
		if (document.frm.bankName.value == "선택") {
			alert("은행을 선택하세요")
			document.frm.bankName.focus();
			return false;
		}
		if (document.frm.bankNo.value == "") {
			alert("계좌번호를 입력하세요")
			document.frm.bankNo.focus();
			return false;
		}
	}
	if (document.frm.what.value == 'phone') {
		if (document.frm.phoneUser.value == "") {
			alert("성명을 입력하세요")
			document.frm.phoneUser.focus();
			return false;
		}
		if (document.frm.payPhoneA.value == "") {
			alert("번호를 입력하세요")
			document.frm.payPhoneA.focus();
			return false;
		}
		if (document.frm.payPhoneB.value == "") {
			alert("번호를 입력하세요")
			document.frm.payPhoneB.focus();
			return false;
		}
		if (document.frm.payPhoneC.value == "") {
			alert("번호를 입력하세요")
			document.frm.payPhoneC.focus();
			return false;
		}
		
	}
	
	if (document.frm.checkagree.checked == false) {
		alert("약관에 동의해주세요");
		return false;
	}
}

function showSection(section){
	
	//결제선택버튼값을 hidden으로 보내기
	frm.what.value = (section);
	
	if ((section) == 'card') {
		$(".section").hide();
		$("#card").show();
		$(".choice").removeClass("on");
		$(".card").addClass("on");
		
	}
	
	if ((section) == 'bank') {
		$(".section").hide();
		$("#bank").show();
		$(".choice").removeClass("on");
		$(".bank").addClass("on");
	}
	
	if ((section) == 'phone') {
		$(".section").hide();
		$("#phone").show();
		$(".choice").removeClass("on");
		$(".phone").addClass("on");
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
						<p id=pointTxt style="width: 120px; text-align: right;">199000</p>
						<p id=pointTxt style="width: 40px; margin-left:14px">P</p>
						<!-- <button id=pointButton>충전하기</button> -->
					</div>
					<div style="float: left; width: 100%; height: 40px; margin-top:10px; margin-left:20px">
						<p id=pointTxt style="width: 106px">사용 포인트</p>
						<input id=pointInput name="usePoint" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
						<p id=pointTxt style="width: 40px; margin-left:12px">P</p>
						<button type="button" id=pointButton>모두사용</button>
					</div>
				
				</div>
				<div class=pay style="height: 75%">
					<div id=payselect>
						<button class="choice card on" value="card" type="button" onclick="showSection(this.value)"></button>
						<div id=bin style="width:15px"></div>
						<button class="choice bank" value="bank" type="button" onclick="showSection(this.value)"></button>
						<div id=bin style="width:15px"></div>
						<button class="choice phone" value="phone" type="button" onclick="showSection(this.value)"></button>
					</div>
					
					<!-- 결제선택값 -->
					<input type='hidden' name='what' value="card"/> 
					
					<div class="section" id=card style="display:block">
					<p style="color:#917EFD">카드결제 정보입력</p>
					<div id=inputBox>
					<p style="margin-bottom:5px;">카드번호</p>
					<input id=cardInput name="cardNo" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></input></div>
					<div id=bin style="width:15px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">카드 유효날짜</p>
					<input id=cardInput name="cardYear" style="width:80px; float:left;"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></input>
					<div id=bin style="width:10px; height: 10px; padding:10px 10px; font-size: 18px;">/</div>
					<input id=cardInput name="cardMonth" style="width:80px; float:left;"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></input>
					</div>
					
					<div id=bin style="width:100%; height: 10px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">카드 성명</p>
					<input id=cardInput name="cardUser"></input></div>
					<div id=bin style="width:15px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">CVV</p>
					<input id=cardInput name="cardCvv" style="width:130px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></input></div>
					</div>
					
					
					<div class="section" id=bank>
					<p style="color:#917EFD">계좌이체 정보입력</p>
					<div id=inputBox>
					<p style="margin-bottom:5px;">예금주 성명</p>
					<input id=cardInput name="bankUser" style="width:200px"/></div>
					<div id=bin style="width:15px"></div>
					
					<div id=bin style="width:100%; height: 10px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">계좌정보 입력</p>
					<select id="select" name="bankName">
						<option selected="">선택</option>
						<option>국민은행</option>
						<option>신한은행</option>
						<option>우리은행</option>
						<option>하나은행</option>
						<option>카카오뱅크</option>
					</select>
					</div>
					<div id=bin style="width:15px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">&nbsp;</p>
					<input id=cardInput name="bankNo" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></input></div>
					</div>
					
					
					<div class="section" id=phone>
					<p style="color:#917EFD">핸드폰결제 정보입력</p>
					<div id=inputBox>
					<p style="margin-bottom:5px;">성명</p>
					<input id=cardInput name="phoneUser" style="width:200px"/></div>
					<div id=bin style="width:15px"></div>
					
					
					<div id=bin style="width:100%; height: 10px"></div>
					
					<div id=inputBox>
					<p style="margin-bottom:5px;">핸드폰 번호</p>
					<input id=cardInput name="payPhoneA" style="width:100px;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					&nbsp;&nbsp;-&nbsp;&nbsp;
					<input id=cardInput name="payPhoneB" style="width:100px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					&nbsp;&nbsp;-&nbsp;&nbsp;
					<input id=cardInput name="payPhoneC" style="width:100px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					</div>
					
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
							<input type="hidden" name="totalBook_point" value="${totalBook_point }">
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
		
		<!-- order.do 유저데이터 넘기기 -->
		<input name="name" type="hidden" value="${orderData.name}">
		<input name="loca_check" type="hidden" value="${orderData.loca_check}">
		<input name="locaA" type="hidden" value="${orderData.locaA}">
		<input name="locaB" type="hidden" value="${orderData.locaB}">
		<input name="locaC" type="hidden" value="${orderData.locaC}">
		<input name="phone" type="hidden" value="${orderData.phone}">
		<input name="store" type="hidden" value="${orderData.store}">
		<input name="note" type="hidden" value="${orderData.note}">
		
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