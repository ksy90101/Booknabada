<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
	<meta charset="utf-8" /> 
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>이벤트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="./css/reset.css" type="text/css"/>
  <link rel="stylesheet" href="./css/style.css" type="text/css"/>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
</head>
<body>
	<jsp:include page="./include/header.jsp"></jsp:include>

	<div id="container" class="event">
		<div class="inner-wrap cf">
			<section id="eventWrap">
				<ul class="event-board cf">
				<c:forEach items="${eboard }" var="i">
					<li>
						<div class="img-wrap">
						<c:if test="${i.event_picture ne null }">	
								<img src="./upimg/${i.event_picture }">
						</c:if>
						</div>
						<dl>
							<dt><a href="eventDetail.do?bno=${i.event_no }">${i.event_title }</a></dt>
							<dd>${i.event_content }</dd>
						</dl>						
					</li>
				</c:forEach>
				</ul>
				<button onclick="location.href='eventWrite.do'">글쓰기</button>
			</section><!-- //eventWrap -->			
		</div>
	</div><!-- //container -->
	
	
	<jsp:include page="./include/footer.jsp"></jsp:include>


</body>
</html>