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
<link href="../css/header.css" rel="stylesheet">
<link href="../css/orderFinish.css" rel="stylesheet">
</head>
<body>
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


	<div id="title">
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
				<p>20191025101058</p>
			</div>
			<div id=box style="height: 15%;">
				<div style="width: 180px; float: left; font-weight: bold; line-height: 25px;">북나바다 제휴 서점픽업</div>
				<div style="width: auto; float: left; color: #7C64fd; font-weight: bold; font-size: 16px;">영풍문고
					홍대</div>
				<div style="width: 20px; float: left; font-weight: bold; line-height: 25px; margin: 0 10px 0 10px;">점
				</div>
				<p style="font-size: 14px; font-weight: inherit; float: left; line-height: 25px;">(담당자 02-385-2304)</p>
			</div>
			<div id=box style="height: 30%;">
				<p>카드 결제</p>
				<br>
				<p style="float: left;">3개월 할부 국민(4687-28**-****-****)</p>
				<p style="margin: 0 10px; float: left; font-weight: inherit;">승인일시:2019.10.20 17:20</p>
			</div>
			<div id=box style="height: 25%;">
				<div style="float: left; font-size: 32px; font-weight: bold; line-height: 2.0; color: #7c64fd; margin-right: 50px;">
				12 권</div>
				<div style="line-height: 2.0; font-size: 32px; font-weight: bold; float: left; color: #F1B40B;">
					29,900 원</div>
			</div>
			<div id=box style="height: 15%; font-weight: bold; color: #7c64fd; font-size: 18px; line-height: 1.5;">
				250 &nbsp; p</div>
		</div>
	</div>
	
	<div style="display: table; margin:0 auto;">
	<button id="button" onclick="location.href='../index.do'">마이 페이지</button>
	</div>
	
</body>
</html>