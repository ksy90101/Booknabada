<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 페이징 -->
<fmt:parseNumber integerOnly="true" value="${totalCount/15 }"
	var="totalPage" />
	
<c:if test="${(totalCount % 15) > 0 }">
	<c:set value="${totalPage+1 }" var="totalPage" />
</c:if>



<!-- 시작 페이지 -->
<c:if test="${page%15 != 0 }">
<fmt:parseNumber integerOnly="true" value="${page / 15 + 1 }" var="startPage" />
<c:set var ="startPage" value="${startPage * 10 + 1 }"/>
</c:if>
<c:if test="${page%10 == 0 }">
	<c:set var="startPage" value="${page-9 }"/>
</c:if>


<!-- 마지막 페이지 -->
<c:set var="endPage" value="${startPage + 15 }" />
<!-- 마지막 게시판에서 멈추기 -->
<!-- booklist는 15개씩 나타낼 꺼라 시작페이지에서 15개 나온다면 그게 마지막 페이지 -->
<c:if test="${startPage + 15 gt totalPage}">
<c:set var="endPage" value="${totalPage }" />
</c:if>