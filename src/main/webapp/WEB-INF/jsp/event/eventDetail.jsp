<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" /> 
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>이벤트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="../css/reset.css" type="text/css"/>
  <link rel="stylesheet" href="../css/style.css" type="text/css"/>
  <link href="../css/boardDetail.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
</head>
<script>
function modify(num){
	if(confirm("이 글을 수정하시겠습니까?")){
		location.href='eventModify.do?bno='+num;
	}else{
		return false;
	}
}

function del(num){
	if(confirm("이 글을 삭제하시겠습니까?")){
		location.href='eventDelete.do?bno='+num;
	}else{
		return false;
	}
}

</script>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<jsp:include page="../include/boardMenu.jsp"></jsp:include>



	<div class="boardDetailPart">
		<div id="list" class="cf" style="height: 60px;">
			<div id="listbox" style="width: 10%;">${detail.event_no }</div>
			<div id="listbox" style="width: 50%;">${detail.user_name }</div>
			<div id="listbox" style="width: 30%;">${detail.event_date }</div>
			<div id="listbox" style="width: 10%;">${detail.event_count }</div>

		</div>

		<div id="list" class="cf" style="height: 90px;">
			<div id="title" style="">제목</div>
			<div id="listbox" style="width: 100%">${detail.event_title }</div>
		</div>
		
		<c:if test="${detail.event_picture ne null }">	
		<div id="list" class="cf">
			<div id="title" style="">사진</div>
			<div id="listbox" style="width: 100%"><img src="../upimg/${detail.event_picture }"></div>
		</div>
								
		</c:if>
		<div id="list" class="cf">
			<div id="title" style="">내용</div>
			<div id="listbox" class="contentbox" style="width: 100%; height: 500px;"><pre>${detail.event_content }</pre></div>
		</div>
	</div>
	
	<div class="eventbuttonPart">
		<c:if test="${sessionScope.id eq detail.user_id }">		
			<button id="eventbutton" style="background-color: #E8E8E8;" onclick="modify(${detail.event_no })">수정</button>
			<div id="bin2"></div>
			<button id="eventbutton" style="background-color: #E8E8E8;" onclick="del(${detail.event_no })">삭제</button>
			<div id="bin2"></div>
		</c:if>
		<button id="eventbutton" style="background-color: #BCB0FE; color: white" onclick="location.href='event.do'">목록</button>
	</div>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
</body>
</html>