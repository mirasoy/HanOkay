<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HanOkay-ERROR!</title>
</head>
<body>
	<h1>${exception.getMessage() }</h1>
	
	<ul>
	<c:forEach items="${exception.getStackTrace()}" var="stack">
	</c:forEach>
	</ul>
	
	<button id="sendMain" onclick="window.location.href='${request.contextPath}/acm/list'">홈으로</button>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@include file="../includes/footer.jsp"%>
