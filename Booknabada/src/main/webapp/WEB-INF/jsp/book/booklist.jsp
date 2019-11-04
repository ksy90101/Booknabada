<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../js/jquery-ui-1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>책 목록</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="styleshhet" href="../css/boardDetail">
<link rel="stylesheet" href="../css/booklist.css">
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="booklist_wrap">
		<ul class="booklist">
			<c:forEach items="${booklist }" var="i">
				<li class="book"><a href="bookDetail.do?book_no=${i.book_no }">
						<div class="bookimg">
							<img src="../upimg/${i.book_picture }" class="bookimage">
						</div>
						<ul class="bookinfo">
							<li class="scrolling" data-bno="${i.book_no}"></li>
							<!-- data-bno => 나중에 해당 글 bno값을 읽어올 필요가 있어서 추가 -->
							<li class="booktitle">${i.book_title }</li>
							<li class="bookwriter">${i.book_author }/${i.book_publisher }</li>
							<li>${i.book_recommend }</li>
							<li>조회수: ${i.book_count }</li>
							<li><fmt:formatNumber value="${i.book_price }"
									groupingUsed="true" /></li>
							<li>${i.user_name }</li>
						</ul>
				</a></li>
			</c:forEach>
		</ul>
		<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
<script>
var lastScrollTop = 0; // 이전 스크롤 좌표
var easeEffect = 'easeInQuint';

//1. 스크롤 이벤트 발생
		var page = 1;
	$(window).scroll(function(){ // 스크롤 이벤트 최초 발생
		
		var currentScrollTop = $(window).scrollTop(); // 현재 스크롤 좌표
		//============== 다운 스크롤인 상태 ========================
		if(currentScrollTop - lastScrollTop > 0) {
			console.log("down-scroll"); // 현재 게시글 다음의 글을 불러온다.
			lastScrollTop = currentScrollTop; // 현재 스크롤 좌표를 이전 스크롤 좌표로 할당
		//2. 현재스크롤의 top좌표가 > (게시글을 불러온 화면 height-윈도우창의 height) 되는 순간
		if (Math.ceil($(window).scrollTop()) >= $(document).height()- $(window).height()){ // 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
			page++;
			console.log(page);
		// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-bno속성 값을 받아옴. 즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것
		var lastbno = $(".scrolling:last").attr("data-bno");
			// 4. ajax로 서버에 게시물 데이터 요청
			$.ajax({
				type:'post', // 요청 method 방식
				url : 'infiniteScrollDown.do', // 요청할 서버의 url
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json', // 서버로부터 되돌려받는 데이터 타입 명시
				data : JSON.stringify({ // 서버로 보낼 데이터 명시(stringify() : 문자열로 보내기)
					page : page
				}),
				
				success : function(data){ // ajax가 성공했을시에 수행될 function으로 파라미터는 서버로 부터 return받은 데이터
					var str = "";
				
					if(data != ""){ // 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
						$(data).each( // 6. 서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
							// 7. 새로운 데이터를 갖고 html코드형태의 문자열로 만들어준다.
							function(){
								if(this.bookprice )
								console.log(this);
								str += "<li class=" + "'book'" + ">"
								+ "<a href=" + "'bookDetail.do?book_no='" + this.book_no + ">"
								+ "<div class=" + "'bookimg'" + ">"
								+ "<img src=" + "'../upimg/" + this.book_picture + "class=" + "'bookimage'" + ">"
								+ "</div>"
								+ "<ul class=" + "'bookinfo'" + ">"
								+ "<li class=" + "'scrolling'" + "data-bno='" + this.book_no + "'>"
								+ "</li>"
								+ "<li class=" + "'booktitle'" + ">"
								+ this.book_title + "</li>"
								+ "<li class=" + "'bookwriter'" + ">" + this.book_author + "/" + this.book_publisher + "</li>"
								+ "<li>" + this.book_recommend + "</li>"
								+ "<li>" + "조회수: " + this.book_count + "</li>"
								+ "<li>" + this.book_price + "</li>"
								+ "<li>" + this.user_name + "</li>"
								+ "</ul>"
								+ "</a></li>" 
							}); // each끝
							// 8. 이전까지 뿌려졌던 데이터를 비워주고, str을 뿌려줌
							//$(".booklist").empty(); // 셀렉터 태그 안의 모든 텍스트를 지운다.
							$(".booklist").append(str);
					} else{ // 9. 만약 서버로 부터 받아온 데이터가 없으면
						alert("더 불러올 데이터가 없습니다.")	
					}
				} // success 끝
			}); // ajax 끝
			
			// 여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동하자.
			var position = $(".booklist:first").offset(); // 위치값
			
			// 이동 위로 부터 position.top px 위추로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐
			//$('html,body').stop().animate({scrollTop : position}, 600, easeEffect); // 이동할 위치, 애니메이션 지속 시간, ease 효과이름
		
		} // if : 현재 스크롤의 좌표가 <= 0 ehlsms tnsrks
		
			lastScrollTop = currentScrollTop; // 현재 스크롤 좌표를 이전 스크롤 좌표로 할당		
		
		} // else : 업 스크롤인 상태
	}); // scroll event
</script>

</html>