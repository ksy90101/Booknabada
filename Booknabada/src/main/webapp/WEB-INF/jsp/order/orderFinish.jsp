<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/orderFinish.css" rel="stylesheet">


</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>

	<div class="top_navi">
		<div class="top_content">
			<div id="box01" style="color: #BCB0FE;">주문/배송확인</div>
			<div id="bin">
			<div style="width: 100%; height: 2px; background-color: #BCB0FE; margin-top: 32px"></div>
			</div>
			<div id="box01" style="color: #BCB0FE;">결제정보</div>
			<div id="bin">
			<div style="width: 100%; height: 2px; background-color: #BCB0FE; margin-top: 32px"></div>
			</div>
			<div id="box01" style="background: #BCB0FE; color: white;">주문완료</div>
		</div>
	</div>


	<div class="title">
		<p style="color: #7C64FD">감사합니다</p>
		<p style="color: #7C64FD; float:left">주문이 정상적으로 완료</p><p>되었습니다</p>
	</div>
	
	<div style="width: 740px; height: 350px; margin: 40px auto;">
		<div id="boxtitle">
			<div id=box style="height: 15%;">주문번호</div>
			<div id=box style="height: 15%;">배송지정보</div>
			<div id=box style="height: 30%;">결제정보</div>
			<div id=box style="height: 25%; line-height: 3.5">결제금액</div>
			<div id=box style="height: 15%;">포인트적립</div>
		</div>
		<div id="boxcontent">
			<div id=box style="height: 15%;">
				<p>${orderNo }</p>
			</div>
			<div id=box style="height: 15%;">
				
				<c:choose>
				<c:when test="${orderData.loca_check eq '1'}">
					<div style="width: 180px; float: left; font-weight: bold; line-height: 25px;">북나바다 제휴 서점픽업</div>
					<div style="width: 200px; float: left; color: #7C64fd; font-weight: bold; font-size: 16px;">${orderData.store }</div>
				</c:when>
				<c:otherwise>
					<p style="float: left; color: #7C64fd; font-weight: bold; font-size: 16px;">${orderData.locaA }</p>
					<p style="float: left; color: #7C64fd; font-weight: bold; font-size: 16px; margin:auto 10px;" >${orderData.locaB }</p>
					<p style="float: left; color: #7C64fd; font-weight: bold; font-size: 16px;">${orderData.locaC }</p>
				</c:otherwise>
				</c:choose>
				
				<div style="width: 200px; float: left; font-weight: bold; line-height: 25px; margin: 0 10px 0 10px;">
				</div>
			</div>
			
			<c:if test="${payData.payChoice eq 'card'}">
			<div id=box style="height: 30%;">
				<p>카드 결제</p>
				<br>
				<p style="float: left;">${payData.cardNo }</p>
				<p style="margin: 0 10px; float: left; font-weight: inherit;">승인일시:</p>
				<input type="text" id='date' name="orderTime"readonly style="border:none; background-color:transparent;">
			</div>
			</c:if>
			
			<c:if test="${payData.payChoice eq 'bank'}">
			<div id=box style="height: 30%;">
				<p>계좌이체</p>
				<br>
				<p style="float: left;">${payData.bankName }  ${payData.bankNo }</p>
				<p style="margin: 0 10px; float: left; font-weight: inherit;">승인일시:</p>
				<input type="text" id='date' name="orderTime"readonly style="border:none; background-color:transparent;">
			</div>
			</c:if>
			
			<c:if test="${payData.payChoice eq 'phone'}">
			<div id=box style="height: 30%;">
				<p>핸드폰 결제</p>
				<br>
				<p style="float: left;">${payData.phoneNo}</p>
				<p style="margin: 0 10px; float: left; font-weight: inherit;">승인일시:</p>
				<input type="text" id='date' name="orderTime"readonly style="border:none; background-color:transparent;">
			</div>
			</c:if>
			
			
			<div id=box style="height: 25%;">
				<div style="float: left; font-size: 32px; font-weight: bold; line-height: 2.0; color: #7c64fd; margin-right: 50px;">
				${totalBook }</div>
				<div style="line-height: 2.0; font-size: 32px; font-weight: bold; float: left; color: #F1B40B;">
					${totalPrice }</div>
			</div>
			<!-- 포인트적립 -->
			<div id=box style="height: 15%; font-weight: bold; color: #7c64fd; font-size: 18px; line-height: 1.5;">
				${totalBook_point } &nbsp; p</div>
				
		</div>
	</div>
	
	<div style="display: table; margin:0 auto 60px auto;">
	<button id="button" type="button" onclick="location.href='../my/myhome.do'">마이 페이지</button>
	</div>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	<script type="text/javascript">

	$(function() {
	    getTimeStamp();
	});

	function getTimeStamp() {
	    var d = new Date();

	    var date = leadingZeros(d.getFullYear(), 4) + '-' +
	        leadingZeros(d.getMonth() + 1, 2) + '-' +
	        leadingZeros(d.getDate(), 2) + ' ';
	    var time = leadingZeros(d.getHours(), 2) + ':' +
	        leadingZeros(d.getMinutes(), 2) + ':' +
	        leadingZeros(d.getSeconds(), 2);
	        
	    $('#date').val(date + time);
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();
			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
			}
			return zero + n;
		}
	</script>
	
</body>
</html>