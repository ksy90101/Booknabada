<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<fmt:parseNumber integerOnly="true" value="${totalCount/6 }"
	var="totalPage" />

<c:if test="${(totalCount%6) > 0 }">
	<c:set value="${totalPage+1 }" var="totalPage" />
</c:if>

<c:if test="${page%10 !=0 }">
	<fmt:parseNumber integerOnly="true" value="${(page/10) }"
		var="startPage" />
	<c:set var="startPage" value="${startPage*10+1 }" />
</c:if>
<c:if test="${page%10 ==0 }">
	<c:set var="startPage" value="${page-9 }" />
</c:if>
<c:set var="endPage" value="${startPage +9 }" />
<c:if test="${startPage +10 gt totalPage }">
	<c:set var="endPage" value="${totalPage }" />
</c:if>
