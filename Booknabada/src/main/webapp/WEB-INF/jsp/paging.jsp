<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 페이징 -->
<fmt:parseNumber integerOnly="true" value="${totalCount / 20 }" var="totalPage" />
<c:if test="${(totalCount % 10) > 0 }">
<c:set value="${totalPage + 1 }" var="totalPage" />
</c:if>

<!-- 시작 페이지 -->
<fmt:parseNumber integerOnly="true" value="${page / 10 }" var="startPage" />

<!-- 마지막 페이지 -->
<c:set var="endPage" value="${startPage + 10 }" />

<!-- 마지막 게시판에서 멈추기 -->
<c:if test="${startPage + 20 gt totalPage}">
<c:set var="endPage" value="${totalPage }" />
</c:if>

