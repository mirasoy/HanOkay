<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="../includes/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증</title>
</head>
<body>
		<h1>가입한 이메일로 인증코드가 발송되었습니다</h1>
		<input id="enterAuthNum">
		<input type="button" id="checkAuthNum" value="인증코드 확인">
		<br>
		<span id="msg"><c:out value="${msg}" /></span>
		<input type="button" id="register" value="버튼을 누르고 가입완료">
	<script> 
	$(document).ready(function() {
		$("#checkAuthNum").click(function(){
			alert("dd");
		})
	});
	</script>
</body>
<%@include file="../includes/footer.jsp"%>
</html>