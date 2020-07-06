<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

	<h1>회원가입</h1>

	<form name="form" method="post">
		<table border="1" width="500px">
			<tr>
				<td>Email: <input type="text" size="40" name="email" id="email"
					value="${email }"><br> <label style="color: red;"
					id="msg1"><c:out value="${msg1}" /></label><br>
					<button data-oper='checkEmail' class="btn btn-default">이메일
						중복체크</button>
				</td>
			</tr>
			<tr>
				<td>비밀번호: <input type="password" size="50" name="pwd" id="pwd"
					value="${pwd }"> <br> <label style="color: red;"
					id="msg2"><c:out value="${msg2}" /></label><br> 성: <input
					type="text" size=10 name="uFstname" value="${uFstname }"> <br>
					이름: <input type="text" size=20 name="uLastname"
					value="${uLastname }">
				</td>
			</tr>
			<tr>
				<td><select name="birthMonth" id="birthMonth" onchange="call()">
						<option value="">--생월--</option>
						<option value="1">Jan</option>
						<option value="2">Feb</option>
						<option value="3">Mar</option>
						<option value="4">Apr</option>
						<option value="5">May</option>
						<option value="6">Jun</option>
						<option value="7">Jul</option>
						<option value="8">Aug</option>
						<option value="9">Sep</option>
						<option value="10">Oct</option>
						<option value="11">Nov</option>
						<option value="12">Dec</option>
				</select> <select name="birthday" id="birthday">
						<option value="">--생일--</option>
				</select> <select name="birthYear" id="birthYear">
						<option value="">--생년--</option>
				</select>

					<button data-oper='register' class="btn btn-default">가입하기</button>

				</td>
			</tr>

		</table>
		<input type="hidden" id="uBirthday" name="uBirthday" value="">
	</form>

	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="../../../resources/js/signUp.js"></script>
</body>
</html>