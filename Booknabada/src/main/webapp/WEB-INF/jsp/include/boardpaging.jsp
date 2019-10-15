<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
	
<!-- 페이징 -->
=======

<!— 페이징 —>
>>>>>>> refs/heads/yehee
<fmt:parseNumber integerOnly="true" value="${totalCount / 10 }" var="totalPage" />
<c:if test="${(totalCount % 10) > 0 }">
<c:set value="${totalPage + 1 }" var="totalPage" />
</c:if>

<<<<<<< HEAD
<!-- 시작 페이지 -->
=======
<!— 시작 페이지 —>
>>>>>>> refs/heads/yehee
<fmt:parseNumber integerOnly="true" value="${page / 10 + 1 }" var="startPage" />

<!— 마지막 페이지 —>
<c:set var="endPage" value="${startPage + 10 }" />

<<<<<<< HEAD
<!-- 마지막 게시판에서 멈추기 -->
=======
<!— 마지막 게시판에서 멈추기 —>
>>>>>>> refs/heads/yehee
<c:if test="${startPage + 10 gt totalPage}">
<c:set var="endPage" value="${totalPage }" />
</c:if>
