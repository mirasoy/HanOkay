<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%  UserVO loggedInUser= (UserVO)session.getAttribute("user");
String loggedInUserLastname="";
String loggedInUserFstname="";
if(loggedInUser != null){
	loggedInUserLastname=loggedInUser.getLastname();
	loggedInUserFstname=loggedInUser.getFstname();
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="../includes/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 완료</title>
</head>
<body>

		<h1>회원 가입 완료 되었습니다!</h1>
		<span id="name"></span>
	<h2>ana의 다양한 서비스를 알아보세요!</h2>
	<script> 
	$(document).ready(function() {
	
	});
	</script>
</body>
<%@include file="../includes/footer.jsp"%>
</html>