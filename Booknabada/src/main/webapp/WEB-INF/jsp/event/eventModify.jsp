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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="../css/reset.css" type="text/css" />
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<link rel="stylesheet" href="../css/boardDetail.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean"
	rel="stylesheet">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</head>
<script>
	function cancel() {
		if (confirm("목록으로 돌아가시겠습니까?")) {
			location.href = 'event/event.do';
		} else {
			return false;
		}
	}
</script>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<jsp:include page="../include/boardMenu.jsp"></jsp:include>


	<form action="eventModifyAction.do" method="post"
		enctype="multipart/form-data">

		<div class="boardDetailPart">
			<div id="list" class="cf" style="height: 60px;">
				<div id="listbox" style="width: 10%;">${detail.event_no }</div>
				<input type="hidden" name="bno" value="${detail.event_no }" />
				<div id="listbox" style="width: 50%;">${detail.user_name }</div>
				<div id="listbox" style="width: 30%;">${detail.event_date }</div>
				<div id="listbox" style="width: 10%;">${detail.event_count }</div>
			</div>


			<div id="list" class="cf" style="height: 90px;">
				<div id="title" style="">제목</div>
				<div id="listbox" style="width: 100%">
					<input type="text" name="title" value="${detail.event_title }" />
				</div>
			</div>

			<c:if test="${detail.event_picture ne null }">
				<div id="list" class="cf">
					<div id="title" style="">사진</div>
					<div id="listbox" style="width: 100%">
						<img src="../upimg/${detail.event_picture }"> <input
							type="hidden" name="bFile" value="${detail.event_picture }">
						<input type="file" name="file" accept="image/*"
							value="./upimg/${detail.event_picture }" />
					</div>
				</div>

			</c:if>
			<div id="list" class="cf">
				<div id="title" style="">내용</div>
				<div id="listbox" style="width: 100%; height: 500px;">
					<textarea name="content">${detail.event_content }</textarea>
					<script type="text/javascript">
						CKEDITOR.replace('content', {
							width : 940,
							height : 390
						});
					</script>
				</div>
			</div>

		</div>

		<div class="eventbuttonPart">
			<button id="eventbutton" type="button" style="background-color: #E8E8E8;"
				onclick="return cancel()">취소</button>
			<button id="eventbutton" type="submit"
				style="background-color: #BCB0FE; color: white">완료</button>
		</div>
	</form>

	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>