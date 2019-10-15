<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="top_navi">
		<ul class="top_content cf">
			<li class="box01"><a href="#">공지사항</a></li>
			<li class="box01"><a href="../event/event.do">이벤트</a></li>
			<li class="box01"><a href="../FAQ/FAQ_all.do">FAQ</a></li>
			<li class="box01"><a href="../qna/qnaBoard.do">QNA</a></li>
			<li class="box01"><a href="../free/freeBoard.do">자유게시판</a></li>
		</ul>
	</div>
	
	<c:if test="${whatBoard eq 'event' }">
	<script>
	console.log("나오나?");
		$(".top_content li").removeClass("on");
		$(".top_content li").eq(1).addClass("on");
	</script>
	</c:if>
	<c:if test="${whatBoard eq 'faq' }">
	<script>
		$(".top_content li").removeClass("on");
		$(".top_content li").eq(2).addClass("on");
	</script>
	</c:if>
	<c:if test="${whatBoard eq 'qna' }">
	<script>
		$(".top_content li").removeClass("on");
		$(".top_content li").eq(3).addClass("on");
	</script>
	</c:if>
	<c:if test="${whatBoard eq 'free' }">
	<script>
		$(".top_content li").removeClass("on");
		$(".top_content li").eq(4).addClass("on");
	</script>
	</c:if>