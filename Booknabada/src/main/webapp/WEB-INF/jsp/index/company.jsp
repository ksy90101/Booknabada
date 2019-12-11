<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company</title>
<link rel="stylesheet" href="../css/company.css" type="text/css" />
</head>
<body>

<jsp:include page="../include/header.jsp"></jsp:include>


<div id="container" class="cf">
	<section id="content">
		<div class="inner-wrap">
			<p> 북나바라 사람들은 평범합니다. 우리는 커피 한잔과 이메일 체크로 하루를 시작합니다. 그리고는 함께 모여 세상에 없던 아이디어와 디자인을 만드는 일에 몰두합니다. 다들 그렇지 않나요?</p>
			<ul class="member">
				<li class="cf">
					<div class="pic">
						<img src="../images/mypage.png" />
					</div>
					<div class="txt">
						<h5>김세윤 <span>CEO / Director</span></h5>
						<div class="tech"><img src="../images/tech.png" alt="보유기술"></div>
						<p>저희는 언제나 고객 입장을 생각하며 하루 일과에 임합니다.
						개개인의 자유를 생각하기보다 언제나 고객 입장을 생각하고
						또 생각하고 계속 생각학고 또 생각합니다.
						그냥 생각만 합니다.</p>					
					</div>
				</li>
				<li class="cf">
					<div class="pic">
						<img src="../images/mypage.png" />
					</div>
					<div class="txt">
						<h5>김희진 <span>Developer Director</span></h5>
						<div class="tech"><img src="../images/tech.png" alt="보유기술"></div>
						<p>저희는 언제나 고객 입장을 생각하며 하루 일과에 임합니다.
						개개인의 자유를 생각하기보다 언제나 고객 입장을 생각하고
						또 생각하고 계속 생각학고 또 생각합니다.
						그냥 생각만 합니다.</p>					
					</div>
				</li>
				<li class="cf">
					<div class="pic">
						<img src="../images/mypage.png" />
					</div>
					<div class="txt">
						<h5>이건영 <span>Art / Director</span></h5>
						<div class="tech"><img src="../images/tech.png" alt="보유기술"></div>
						<p>저희는 언제나 고객 입장을 생각하며 하루 일과에 임합니다.
						개개인의 자유를 생각하기보다 언제나 고객 입장을 생각하고
						또 생각하고 계속 생각학고 또 생각합니다.
						그냥 생각만 합니다.</p>					
					</div>
				</li>
				<li class="cf">
					<div class="pic">
						<img src="../images/mypage.png" />
					</div>
					<div class="txt">
						<h5>신예희 <span>Strawberry Milk</span></h5>
						<div class="tech"><img src="../images/tech.png" alt="보유기술"></div>
						<p>저희는 언제나 고객 입장을 생각하며 하루 일과에 임합니다.
						개개인의 자유를 생각하기보다 언제나 고객 입장을 생각하고
						또 생각하고 계속 생각학고 또 생각합니다.
						그냥 생각만 합니다.</p>					
					</div>
				</li>
				<li class="cf">
					<div class="pic">
						<img src="../images/mypage.png" />
					</div>
					<div class="txt">
						<h5>정아름 <span>Taiwan Namba 1</span></h5>
						<div class="tech"><img src="../images/tech.png" alt="보유기술"></div>
						<p>저희는 언제나 고객 입장을 생각하며 하루 일과에 임합니다.
						개개인의 자유를 생각하기보다 언제나 고객 입장을 생각하고
						또 생각하고 계속 생각학고 또 생각합니다.
						그냥 생각만 합니다.</p>					
					</div>
				</li>
			
			
			</ul>
			
			<h1 class="logo">
				<img src="../images/logo.png" alt="BOOKNABADA">
			</h1>
		</div>	
	</section>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>


<script>

/* function scrollEvent() {
    var hT = $('.member li').offset().top,
        hH = $('.member li').outerHeight(),
        wH = $(window).height(),
        wS = $(this).scrollTop();
	console.log(wS);
    if (wS > (hT+hH-wH)){
        console.log('tlt on the view!');
        $("#content .member li").addClass("on");
        window.removeEventListener("scroll", scrollEvent);
    }
  }
  window.addEventListener("scroll", scrollEvent);
   */

	$(document).ready(function () {
	    $(window).on('scroll.myEvent', function() {
	    	var liTop0 = $(".member li").eq(0).offset().top;
	    	var liTop1 = $(".member li").eq(1).offset().top;
	    	var liTop2 = $(".member li").eq(2).offset().top;
	    	var liTop3 = $(".member li").eq(3).offset().top;
	    	var liTop4 = $(".member li").eq(4).offset().top;
	    	var tt = $(this).scrollTop();
	
	    	if(tt+550>=liTop0){
		        $("#content .member li").eq(0).addClass("on");	
	    	}
	    	if(tt+550>=liTop1){
	    		$("#content .member li").eq(1).addClass("on");	
	    	}
	    	if(tt+550>=liTop2){
	    		$("#content .member li").eq(2).addClass("on");	
	    	}
	    	if(tt+550>=liTop3){
	    		$("#content .member li").eq(3).addClass("on");	
	    	}
	    	if(tt+550>=liTop4){
	    		$("#content .member li").eq(4).addClass("on");	
	    	}
	        //$(window).off('scroll.myEvent');
	    });
	});

</script>

</body>
</html>