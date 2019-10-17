<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	setTimeout(function(){
		opener.location.reload(); // 부모창 리프레쉬
		self.close(); // 현재 창 닫기
	}, 500); //0.5초후 실행
</script>