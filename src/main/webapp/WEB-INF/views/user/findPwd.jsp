<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="../includes/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<form name="loginForm" method="post">
		<table border="1" width="500px">
			<tr><label>본인 확인을 위한 이메일 전송을 위해 이메일을 입력하세요 </label>
				<label style="color: red;" id="msg"><c:out value="${msg}" /></label>
				<br>
				<td>Email: <input type="text" size="40" name="email" id="email" placeholder="회원가입을 진행했던 이메일을 입력하세요" value="${email }">
					<button name="sendEmail" id="sendEmail" type="button">발송하기</button>
				</td>
			</tr>
		</table>		
	</form>
	
	<script>
	$(document).ready(function(){
		
	//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
	if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
	});
	</script>
</body>
<%@include file="../includes/footer.jsp"%>
</html>