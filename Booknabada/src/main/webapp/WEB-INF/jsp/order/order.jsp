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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function locaCheck(){
	
new daum.Postcode({
    oncomplete: function(data) {
    	
    	var zonecode = data.zonecode
    	var roadAddress = data.roadAddress
    	
    	document.getElementById('locaA').value = zonecode;
    	document.getElementById('locaB').value = roadAddress;
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
    }
}).open();
}

function check(){
	//alert("작동합니다");
	if (document.frm.name.value == "") {
		alert("이름을 입력하세요");
		document.frm.name.focus();
		return false;
	}	
	if (document.frm.locaA.value == "") {
		alert("주소를 입력하세요");
		document.frm.locaA.focus();
		return false;
	}
	if (document.frm.locaB.value == "") {
		alert("주소를 입력하세요");
		document.frm.locaB.focus();
		return false;
	}
	if (document.frm.locaC.value == "") {
		alert("상세주소를 입력하세요");
		document.frm.locaC.focus();
		return false;
	}
	if (document.frm.phoneA.value == "") {
		alert("핸드폰 번호를 정확히 입력하세요1");
		document.frm.phoneA.focus();
		return false;
	}
	if (document.frm.phoneB.value == "") {
		alert("핸드폰 번호를 정확히 입력하세요");
		document.frm.phoneB.focus();
		return false;
	}
	if (document.frm.phoneC.value == "") {
		alert("핸드폰 번호를 정확히 입력하세요");
		document.frm.phoneC.focus();
		return false;
	}
	//console.log(document.frm.checkagree.value);
	
	if (document.frm.checkagree.checked == false) {
		alert("약관에 동의해주세요");
		return false;
	} else{
		//alert("약관");
	} 
	
	if (document.frm.store.option == "선택") {
		alert("1에 동의해주세요");
		return false;
	} else{
	} 
	
}
</script>

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
		<div class="list">
		<c:forEach items="${orderBook }" var="i">
		<div id="list">
			<div id="list_book" style="width: 60%;">
				<div style="width: auto; height: 120px; margin-top: 20px;">
					<div id="list_book_img"></div>
					<div id="list_book_txt" style="padding-top: 30px;">
						<p id="book_txt_n" style="font-size: 23px;">${i.book_title }</p>
						<p id="book_txt_n" style="font-size: 15px;">${i.book_author }</p>
					</div>
				</div>
			</div>
			<div id="list_book" style="width: 25%;">
				<div style="height: 120px; margin-top: 20px;">
					<div id="user_img"></div>
					<p id="user_txt_n">${i.user_name }</p>
				</div>
			</div>
			<div id="list_book" style="width: 15%">
				<div style="height: 120px; margin: 20px 40px 20px auto; line-height: 100px; float: right;">
					<p id="price" style="font-size: 30px;">
					<fmt:formatNumber value="${i.book_price }" groupingUsed="true" />
					</p>
					<p id="price" style="font-size: 20px;">원</p>
				</div>
			</div>
		</div>
		</c:forEach>
		</div>
	</div>
	
	<!-- 입력창전체 -->
		<form action="orderPay.do" method="post" name="frm">
	<div class="location">
		<div id="title">
			<span>배송지정보</span>
		</div>
		<div style="display: table">
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
			<!-- 정보입력 -->
			<div class=locationInfo>
				<!-- 배송,지점찾기 -->
				<div id="loc_box2"
					style="height: 75px; line-height: 75px; border-bottom: 1px solid #BCB0FE; box-sizing: border-box;">
					<input type="radio" name="loc_check" value="0" checked>일반택배 
					<input type="radio" name="loc_check" value="1"> 북나바다 제휴 서점픽업 
					<select id="select" style="margin-left: 5px" name="store">
						<option selected="">선택</option>
						<c:forEach items="${storelist }" var="i">
						<option>${i.store_name }</option>
						</c:forEach>
					</select>
				</div>

				<!-- 이름입력 -->
				<div id="loc_box2" style="height: 70px; line-height: 40px;">
					<input type="text" name="name"
						style="width: 200px; height: 25px; transform: translate(0, 14px);">
				</div>
				<!-- 주소입력 -->
				<div id="loc_box2" style="height: 230px;">
					<div style="width: 100%; height: 50px;">
					
						<input type="text" id="locaA" name="locaA" style="width: 200px; height: 25px; float: left">
						<input type="button" id=searchButton name="locaS" value="주소찾기" onclick="locaCheck();">
					</div>

					<div>
						<div style="height: 50px;">
							<div style="width: 80px; height: 50px; line-height: 50px; float: left;">
								<span id=post>주소</span>
							</div>
							<input type="text" id="locaB" name="locaB"
								style="width: 420px; height: 25px; transform: translate(0, 20%);">
						</div>
						<div style="height: 50px;">
							<div style="width: 80px; height: 50px; line-height: 50px; float: left;">
								<span id=post>상세주소</span>
							</div>
							<input type="text" name="locaC"
								style="width: 420px; height: 25px; transform: translate(0, 20%);">
						</div>
					</div>

					<div style="height: 50px;">
						<p style="width: 25px; height: 50px; font-size: 22px; font-weight: bold; color: #876efd; text-align: center; line-height: 55px; float: left;">!</p>
						<p style="font-size: 12px; color: #876efd; float: left; line-height: 20px; margin-top: 7px">
							주소/우편번호 체계가 새롭게 변경되었습니다.<br> 정확하고 빠른 배송을 위해 입력된 주소를 확인하시고
							업데이트 해주시기 바랍니다. </p>
					</div>
				</div>
				<!-- 폰번호 입력 -->
				<div id="loc_box2" style="height: 60px; line-height: 60px">
					<input type="text" name="phoneA" style="width: 80px; height: 25px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					&nbsp;&nbsp;-&nbsp;&nbsp; <input type="text" name="phoneB" style="width: 80px; height: 25px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					&nbsp;&nbsp;-&nbsp;&nbsp; <input type="text" name="phoneC" style="width: 80px; height: 25px" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				</div>
				<div id="loc_box2" style="height: 80px; line-height: 60px">
					<input type="text" name="note" style="width: 500px; height: 25px" placeholder="아무도 모르게 가져다 주세요">
				</div>
			</div>

			<!-- 사용자정보 -->
			<div class=userInfo>
				<div id=loc_user>
					<p style="font-size: 18px; font-weight: bold; margin: 20px 0 0 20px;">주문자 정보</p>
					<div>
						<div id="user_img"></div>
						<div id="list_book_txt"> <p id="user_txt_n">사랑받는 파북이</p>
						</div>
					</div>
				</div>
				<div id=loc_info>
					<div id="loc_box3" style="height: 100px; padding-top: 20px">
						<p style="font-size: 18px; font-weight: bold; margin-left: 20px">총 수량</p>
						<div style="width: auto; height: auto;">
							<!-- 총 책수 -->
							<input id="totalBook" readonly="readonly" name="totalBook" value="${fn:length(orderBook) } 권">
							<input type="hidden" name="totalBook1" value="${fn:length(orderBook) }">
							
						</div>
					</div>
					<div id="loc_box3" style="height: 100px">
						<p style="font-size: 18px; font-weight: bold; margin-left: 20px;">결제금액</p>
						<!-- 총 결제금액 -->
						<c:set var = "totalPrice" value = "0" />
						<c:forEach items="${orderBook }" var="i" >     
						<c:set var= "totalPrice" value="${totalPrice + i.book_price}"/>
						</c:forEach>

						<input id="totalPrice" style="font-size: 40px; margin-left: 20px;" 
						readonly="readonly" name="totalPrice" value="<fmt:formatNumber value="${totalPrice}" groupingUsed="true" /> 원">
						
					</div>
					<!-- 동의 체크박스 -->
					<div id="loc_box3" style="height: 100px; margin-top: 18px">
						<div style="width: auto; height: 50px;">
							<p style="font-size: 22px; font-weight: bold; color: #876efd; float: left; margin: 0 10px 0 20px;">!</p>
							<p style="font-size: 12px; color: #876efd;">
								주문하실 상품, 가격, 배송정보, 할인정보 등을<br> 확인하였으며, 구매에 동의하시겠습니까? </p>
							<div style="margin: 20px 15px; float: left; width: 260px; line-height: 20px;">
								<input type="checkbox" name="checkagree" style="float: left; margin-right: 10px"/>
								<p style="font-size: 20px; font-weight: bold; color: #876efd; float: left;">동의합니다.</p>
								<p style="font-size: 10px; padding-left: 125px">(전자상거래법 제 8조 제2항)</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
	<!-- 버튼박스 -->
	<div class=buttonBox>
		<button class=button type="button" onclick="location.href='../index/index.do'"
			style="background-color: rgba(232, 232, 232, 1);">취소</button>
		<div style="width: 15px; height: 30px; float: left;"></div>
		<button class=button type="submit" onclick="return check();"
			style="background-color: #876EFD; color: white;">다음</button>
	</div>
	</div>
		</form>


	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	<script>
	
	$(document).ready(function(){
		$("#select").hide();
	})
	
	$("input:radio[name=loc_check]").on("change", function(){
	        if($("input:radio[name=loc_check]:checked").val() == "0"){
	            $("#select").hide();
	            $("input:submit[name=locaS]").show();
	            $("input:text[name=locaA]").attr("disabled",false);
	            $("input:text[name=locaB]").attr("disabled",false);
	            $("input:text[name=locaC]").attr("disabled",false);
	            $("input:text[name=locaA]").css("color","black");
	            $("input:text[name=locaB]").css("color","black");
	            $("input:text[name=locaC]").css("color","black");
	            // radio 버튼의 value 값이 1이라면 활성화
	            
	 
	        }else {
	            $("#select").show();
	            $("input:submit[name=locaS]").hide();
	            $("input:text[name=locaA]").attr("disabled",true);
	            $("input:text[name=locaB]").attr("disabled",true);
	            $("input:text[name=locaC]").attr("disabled",true);
	            $("input:text[name=locaA]").css("color","#b5b5b5");
	            $("input:text[name=locaB]").css("color","#b5b5b5");
	            $("input:text[name=locaC]").css("color","#b5b5b5");
	            // radio 버튼의 value 값이 0이라면 비활성화
	        }
	    })
	
	</script>

</body>

</html>