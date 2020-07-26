<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@include file="../includes/header.jsp"%>

		<h2>가입한 이메일로 인증코드가 발송되었습니다</h2>
		
		<form method="post" action="/register/submitAuth">
		<input id="enteredAuthCode" name="enteredAuthCode" value="${enteredAuthCode}">
		<br>
		<span id="msg"><c:out value="${msg}" /></span>
		<button type="submit" id="register">인증번호 확인하고 가입하기</button>
		
		<span>인증번호가 도착하지 않았나요? 인증번호 재발송하기를 누르세요</span>
		<button type="button" id="sendAgain" onclick="location.href='/register/sendAgain'">인증번호 재발송</button>
		
		<input name="email" value="${email }">
		<input id="msgAboutEmail"name="msgAboutEmail" value="${msgAboutEmail }">
		</form>
		
	<script> 
		let msgAboutEmail= document.getElementById('msgAboutEmail').val();
		if(msgAboutEmail ==='emailSent'){
			window.alert("인증코드가 재발송 되었습니다!");
		}
	</script>

<%@include file="../includes/footer.jsp"%>