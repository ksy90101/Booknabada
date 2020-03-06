<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>책 추가 페이지</title>
</head>
<body>
<jsp:include page="./include/header.jsp"></jsp:include>

<div id="container" class="bookadd">
		<div class="inner-wrap cf">
			<form action="bookAddAction.jsp" method="post">
				<div class="top">
					<div class="picture-wrap">
						<img src="images/bookadd_pic.png" alt="책 사진 추가">
						<p>사진을 올려주세요</p>
					</div>
					<div class="info-wrap">
						<input type="text" name="bookTitle" placeholder="제목을 입력하세요" id="bookTitle"><br>		
						<input type="text" name="bookWriter" placeholder="작가이름을 입력하세요" id="bookWriter">

						<p>책정보</p>
						<table>
							<tr>
								<th>출간일</th>
								<td><input type="date" name="publishDate" placeholder="2019"></td>
							</tr>
							<tr>
								<th>쪽수</th>
								<td><input type="text" name="bookPage" placeholder="쪽수를 입력해주세요"></td>
							</tr>
							<tr>
								<th>출판사</th>
								<td><input type="text" name="bookCompany" placeholder="출판사를 입력해주세요"></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td><input type="text" name="bookCategory" placeholder="카테고리를 선택해주세요"></td>
							</tr>
						</table>
						<div class="price">
							<h4>가격정보</h4>
							<p>
								<label id="">판매가
									<input type="radio" name="priceSelect" value="sell"></label>
								<label>대여가
									<input type="radio" name="priceSelect" value="rent"></label>
							</p>
							<p>
								<input type="text" placeholder="9,900">
								<span>원</span>
							</p>
						</div>

					</div>
				</div> <!-- //top -->
				<div class="bottom">
					<h3>책소개</h3>
					<textarea name="bookIntro" id="" cols="30" rows="10">이 책에 대한 리뷰를 작성해주세요</textarea>
					<div class="btn-box">
							<button type="button" onclick="window.history.back()">뒤로</button>
							<button type="submit">등록</button>			
					</div>
				</div><!-- //bottom -->
			</form>
		</div>
	</div><!-- //container -->

<jsp:include page="./include/footer.jsp"></jsp:include>

</body>
</html>