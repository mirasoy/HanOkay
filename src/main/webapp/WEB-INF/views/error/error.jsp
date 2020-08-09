<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Han:OK - ERROR!</title>
<style type="text/css">
.btn {
    cursor: pointer;
    display: inline-block;
    font-size: 0.85rem;
    font-weight: 400;  
    padding: 12px 20px;
}
</style>
</head>

<body style="background-image: url(../resources/img/error.jpg);  background-size: 80%; background-repeat: no-repeat;">
<div>
	<div>
	예상치 못한 에러가 발생하였습니다.
	</div>
	<button id="sendMain" class = 'btn' onclick="window.location.href='${request.contextPath}/acm/list'">홈으로</button>
	</div>
	<ul>
	<c:forEach items="${exception.getStackTrace()}" var="stack">
	</c:forEach>
	</ul>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@include file="../includes/footer.jsp"%>
