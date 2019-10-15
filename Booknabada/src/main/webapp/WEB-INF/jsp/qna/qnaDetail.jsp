<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>게시판 디테일</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/boardDetail.css" rel="stylesheet">
<script type="text/javascript">
	function modify(num){
		//alert("수정하기 숫자: " + num);
		var check = confirm("수정하시겠습니까?");
		
		if (check) {
			location.href= 'qnaModify.do?board_no='+num;
		}
	}
	
	function del(num){
		//alert("삭제하기 숫자: " + num);
		if({fn:length(coment) > 0 }){
			alert("댓글이 있는 게시물은 삭제할 수 없습니다")
			return;
		}
		if (confirm("삭제하시겠습니까?")) {
			location.href= 'qnaDelete.do?board_no='+num; 
		}
	}
	function comentDel(num, bno){
		//alert("삭제하기 숫자: " + num + bno);
		//location.href='comentDelete.do?coment_no=${c.coment_no}&board3_no=${c.board3_no }'	
		var check = confirm("삭제하시겠습니까?");
		if (check) {
			location.href= 'comentDelete.do?coment_no='+num+'&board_no='+bno;
		} 	
	}
			
	
</script>
</head>
<body>
	
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<!-- 카테고리 -->
	<div class="top_navi">
		<div class="top_content">
			<div id="box01" style="color: #BCB0FE;" onclick="location.href='../notice/noticeBoard.do'">공지사항</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;" onclick="location.href='../event/event.do'">이벤트</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;" onclick="location.href='../fqa.do'">FAQ</div>
			<div id="bin"></div>
			<div id="box01" style="background: #BCB0FE; color: white;">QNA</div>
			<div id="bin"></div>
			<div id="box01" style="color: #BCB0FE;" onclick="location.href='../free/freeBoard.do'">자유게시판</div>
		</div>
	</div>

	<!-- 글박스 -->
	<div class="boardDetailPart">
		<div id="list" style="height: 60px;">
			<div id="listbox" style="width: 10%; font-weight: bold">글번호 : ${qnaDetail.board_no }</div>
			<div id="listbox" style="width: 40%; font-weight: bold">글쓴이 : ${qnaDetail.user_name }</div>
			<div id="listbox" style="width: 30%; font-weight: bold">날짜 : ${qnaDetail.board_date }</div>
			<div id="listbox" style="width: 20%; font-weight: bold">카운트 : ${qnaDetail.board_count }</div>

		</div>

		<div id="list" style="height: 90px;">
			<div id="title">제목</div>
			<div id="listbox" style="width: 100%; height: 60px; font-weight: bold; text-align: left;">
			<p style="padding:0 20px;">${qnaDetail.board_title }</p>
			</div>
		</div>
		<div id="list" style="height: 420px;">
			<div id="title">내용</div>
			<div id="listbox" style="width: 100%; height: 400px; text-align: left; line-height: 20px;">
			<div style="padding: 20px 20px;">
			<c:if test="${qnaDetail.board_picture ne null}">
			<img alt="" src="../upimg/${qnaDetail.board_picture }"><br>
			</c:if>
			<p style="padding:0 20px;">${qnaDetail.board_content }</p>
			</div>
			</div>
		</div>
	</div>
	
	<!-- 버튼박스 -->
	<div class="BoardbuttonPart">
		<c:if test="${sessionScope.name eq qnaDetail.user_name }">
		<button id="Boardbutton" style="background-color: #E8E8E8;" onclick="modify(${qnaDetail.board_no})">수정</button>
		<div id="bin2"></div>
		<button id="Boardbutton" style="background-color: #E8E8E8;" onclick="del(${qnaDetail.board_no})">삭제</button>
		<div id="bin2"></div>
		</c:if>
		<button id="Boardbutton" style="background-color: #BCB0FE; color: white" onclick="location.href='qnaBoard.do'">목록</button>
	</div>
	
	<!-- 댓글박스 -->
	<div class="commentPart">
	<!-- 작성박스 -->
	<c:if test="${sessionScope.id != null }">
	<form action="comentAction.do" method="post">
		<div id="commentWriteFill">
			<div id="commentWritebox">
			<textarea name="coment_content" style="width: 800px; height: auto; border:1px solid #D0C8FF; box-sizing: border-box;"></textarea>
			</div>
			<button id="commentWritebutton">작성</button>
			<input type="hidden" name="board_no" value="${qnaDetail.board_no }">
		</div>
	</form>
	</c:if>		
		<!-- 댓글리스트 -->
		<c:choose>
		<c:when test="${fn:length(coment) > 0 }">
		<c:forEach items="${coment }" var="c">
		<div id="commentBox" style="border: 1px solid #E7E2FF; box-sizing: border-box;">
			<div style="height: 35px; border-bottom: 2px solid #E7E2FF; margin-bottom:10px">
				<div style="width: 190px; height: 30px; float:left;">
				<p id="commentTitle">글번호</p> <p id="commentConent">${c.coment_no }</p></div>
				<div style="width: 480px; height: 30px; float:left;">
				<p id="commentTitle">글쓴이</p> <p id="commentConent">${c.user_name }</p></div>
				<div style="width: 288px; height: 30px; float:left;">
				<p id="commentTitle">날짜</p><p id="commentConent">${c.coment_date }</p></div>
			</div>
				<p style="auto; height: 30px; float: left;">${c.coment_content }</p>
				<c:if test="${sessionScope.name eq c.user_name }">
				<img alt="삭제" src="../images/coment_delete.png" name="delete" style="float: right; margin-right:20px;" onclick="comentDel(${c.coment_no}, ${c.board_no })"></img>
				</c:if>
		</div>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<div id="commentBox" style="border: 1px solid #E7E2FF; box-sizing: border-box;">
		<p style="line-height: 80px;">댓글이 1개도 없습니다</p></div></c:otherwise>
		</c:choose>
	</div>
	
		<jsp:include page="../include/footer.jsp"></jsp:include>
	
</body>
</html>