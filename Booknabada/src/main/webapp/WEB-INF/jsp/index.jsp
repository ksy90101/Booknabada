<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>sample</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="./ckeditor/ckeditor.js"></script>
</head>
<body>
<a href="./free/freeBoard.do">free</a>
<a href="login/login.do">login</a>
<a href="newuser.do">newuser</a>
<a href="findid.do">findid</a>
<a href="findpw.do">findpw</a>
<<<<<<< HEAD
<button onclick="location.href='login/logout.do'">로그아웃</button>
<script>CKEDIT	OR.replace('editor', {height:800});</script>
=======
<textarea name="editor"></textarea>
<script>CKEDITOR.replace('editor', {height:800});</script>
>>>>>>> branch 'Seyun' of https://github.com/ksy90101/Booknabada.git

</body>
</html>