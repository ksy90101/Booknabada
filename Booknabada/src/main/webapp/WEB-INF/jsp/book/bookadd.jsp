<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" /> 
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>책등록페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/reset.css" type="text/css"/>
  <link rel="stylesheet" href="../css/style.css" type="text/css"/>
</head>
<script type="text/javascript">
function bookPic(){
	document.all.book_picture.click();
}
function cancel(){
	if(confirm("책 등록을 취소하시겠습니까?")){
		window.history.back();
	}else{
		return false;
	}
}



</script>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div id="container" class="bookadd">
		<div class="inner-wrap cf">
			<form action="bookAddAction.do" name="frm" method="post" enctype="multipart/form-data">
				<div class="top">
					<div class="picture-wrap" onclick="bookPic()">
						<img src="../images/bookadd_pic.png" alt="책 사진 추가">
						<p>사진을 올려주세요</p>
						<input type="file" name="book_picture" id="book_picture" style="display:none" />
					</div>
					<div class="info-wrap">
						<input type="text" name="book_title" placeholder="제목을 입력하세요" id="book_name"><br>		
						<input type="text" name="book_author" placeholder="작가이름을 입력하세요" id="book_author">

						<p>책정보</p>
						<table>
							<tr>
								<th>출간일</th>
								<td><input type="date" name="book_date" placeholder="2019-10-15"></td>
							</tr>
							<tr>
								<th>쪽수</th>
								<td><input type="text" name="book_page" placeholder="쪽수를 입력해주세요"></td>
							</tr>
							<tr>
								<th>출판사</th>
								<td><input type="text" name="book_publisher" placeholder="출판사를 입력해주세요"></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td><input type="text" name="book_cate" placeholder="카테고리를 선택해주세요"></td>
							</tr>
						</table>
						<div class="price">
							<h4>가격정보</h4>
							<p class="select">
								판매가
									<span class="btn sell"></span>
									<input type="radio" name="price_select" id="sell" value="sell">
								
								대여가
									<span class="btn rent"></span>
									<input type="radio" name="price_select" id="rent" value="rent">
								
							</p>
							<p>
								<input type="text" name="book_price" placeholder="9,900">
								<span>원</span>
							</p>
						</div>

					</div>
				</div> <!-- //top -->
				<div class="bottom">
					<h3>책소개</h3>
					<textarea name="book_content" id="" cols="30" rows="10">이 책에 대한 리뷰를 작성해주세요</textarea>
					<div class="btn-box">
							<button type="button" onclick="cancel()">취소</button>
							<button type="submit">등록</button>			
					</div>
				</div><!-- //bottom -->
			</form>
		</div>
	</div><!-- //container -->
	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>



	<script type="text/javascript">
	
	$(".btn").on("click",function(){
		var isBtn = $(this).hasClass("on");
		if(isBtn){
			$(this).removeClass("on");
			$(this).next().prop("checked", false);
		}else{
			$(".btn").removeClass("on");
			$(this).addClass("on");
			$(this).next().prop("checked", true);
			var chkValue= $(this).next().val();
			console.log(chkValue);
		}		
	})
	
/* 	function sub(){
		 alert($("input[name=price_select]:checked").val());
		 document.frm.submit();			
	} */
	
	</script>



</body>
</html>