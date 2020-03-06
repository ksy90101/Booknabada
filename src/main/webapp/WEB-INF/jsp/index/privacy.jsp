<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보취급방침</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/privacy.css">
<link rel="stylesheet" href="../css/footer.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(".cate > ul > li > a").click(function() {
	toggleClass(".active-color");
});

</script>

</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="container" class="page_bg">
		<div class="terms_box">
			<h2>개인정보취급방침</h2>
			<p>BOOKNABADA 주식회사(이하 BOOKNABADA)는 모든 회원들의 개인정보 보호를 최우선시하며, 개인정보에
				관한 법률 및 내부 기준을 준수하고 있습니다. BOOKNABADA는 본 개인정보취급방침을 통하여 회원이 제공하는 개인정보가
				어떠한 용도와 방식으로 이용되고 있으며, BOOKNABADA가 개인정보보호를 위해 어떠한 조치를 취하고 있는지
				알려드립니다.</p>
			<h3>1. 수집하는 개인정보의 항목, 수집 및 이용 목적, 보유 및 이용 기간</h3>
			<p>BOOKNABADA는 회원가입 시 아래와 같은 최소한의 개인정보를 수집하고 있습니다.</p>

			<h4>1. 개인정보 수집 항목</h4>
			<ol>
				<li>1. 이름, 연락처, 이메일, 국적, 성별, 연령 또는 생년월일, 접속로그, 쿠키</li>
			</ol>
			<h4>2. 개인정보의 수집 및 이용목적</h4>
			<h5>서비스 제공</h5>
			<ol>
				<li>서비스 제공 및 개선</li>
			</ol>
			<h5>2. 회원 관리</h5>
			<ol>
			<li>가입의사 확인 및 회원 서비스 이용에 따른 본인확인 및 개인 식별</li>
			<li>부정 사용자 방지</li>
			<li>문의사항 또는 불만 처리, 공지사항 전달</li>
			</ol>
			<h5>3. 통계 및 마케팅, 광고에의 활용</h5>
			<ol>
			<li>행사 시 정보 전달, 마케팅 및 광고 등에 활용</li>
			<li>서비스 이용에 대한 통계</li>
			</ol>
			<h4>3. 수집한 개인정보의 보유 및 이용기간</h4>
			<ol>
			<li>가입일로부터 3년이나, 회원탈퇴를 요청하는 경우 즉시 파기</li>
			</ol>
			<h3>2. 동의 거부권 및 거부 시 불이익</h3>
			<p>모든 회원가입 신청자는 위 개인정보의 수집, 이용과 관련하여 개인정보 제공 및 보관 동의를 거부할 수 있습니다.
				그러나, 상기와 같이 해당 정보의 제공 및 보관은 당사의 업무 진행에 필수불가결한 사항이므로 본 동의를 거부하실 경우
				회원가입이 불가함을 알려드립니다.</p>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>