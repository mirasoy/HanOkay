<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page import="com.ana.domain.UserVO"%>
<% UserVO user= (UserVO)session.getAttribute("user"); 
String userLastName="";
String userFstName="";
String userPwd="";
if(user != null){
userLastName= user.getLastname();
userFstName=user.getFstname();
userPwd= user.getPwd();
} 

%> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="../includes/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환영합니다</title>
</head>
<body>
		<table border="1" width="500px">
		<tr>
		<td>
			<label>	<%=userLastName %><%=userFstName %>님 환영합니다. </label>
			<label style="color: red;" id="msg"><c:out value="" /></label>
				<br>
				<a href="logout">로그아웃하기</a>
				</td>
			</tr>
		</table>
	
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<!--script type="text/javascript">
	$(document).ready(function() {
		let formObj = $("form");

		//버튼에 따라 컨트롤러에서 다른 서비스를 부르게함
		$('button').on("click", function(e) {
			e.preventDefault();

			let operation = $(this).data("oper");

			//중복체크 버튼을 눌렀을 경우
			if (operation === 'loginOrOut') {
				formObj.attr("action", "user/logout");
				formObj.submit();
			}
		});
	}
	</script-->
</body>
<%@include file="../includes/footer.jsp"%>
</html>