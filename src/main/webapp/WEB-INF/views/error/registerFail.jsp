<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Han:ok-인증실패</title>
</head>
<body>
	<h1>죄송합니다! </h1>
	<h2>불확실한 오류로 인해 회원가입 인증 확인을 마치치 못했습니다. 인증 코드를 재발급받아 다시  진행해주세요</h2>
	<button id="sendMain" onclick="window.location.href='${request.contextPath}/acm/list'">홈으로</button>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
	</script>
</body>
<%@include file="../includes/footer.jsp"%>
</html>