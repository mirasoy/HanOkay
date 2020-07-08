<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>

	<form name="loginForm" method="post">
		<table border="1" width="500px">
			<tr>
				<label style="color: red;" id="msg"><c:out value="${msg}" /></label>
				<br>
				<td>Email: <input type="text" size="40" name="email" id="email"
					value="${email }" ><br>
				</td>
			</tr>
			<tr>
				<td>비밀번호: <input type="password" size="50" name="pwd" id="pwd"
					value="${pwd }" placeholder="영문 대소문자/특수기호/숫자 반드시 포함 8자~20자" ><br>
					<button data-oper='signIn' class="btn btn-default">로그인</button>
					<button data-oper='findPwd' class="btn btn-default">비밀번호 찾기</button><br>
					<a href="../register/signUp" >회원가입하기</a>
				</td>
			</tr>
		</table>
	</form>

	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="../../../resources/js/login.js"></script>
</body>
</html>