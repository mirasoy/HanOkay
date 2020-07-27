<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@include file="../includes/header.jsp"%>

		<h2>가입한 이메일로 인증코드가 발송되었습니다</h2>
		
		<form method="post" action="/register/submitAuth">
		<span id="msg"><c:out value="${msg}" /></span><br>
		<input id="enteredAuthCode" name="enteredAuthCode" placeholder="인증코드를 입력하세요"><br>
		<button type="submit" id="register" class="btn btn-default">인증번호 확인하고 가입하기</button>
		<br>
		<span>인증번호가 도착하지 않았나요? </span><br>
		<button type="button" id="sendAgain" class="btn btn-default" onclick="location.href='/register/sendAgain'">인증번호 재발송</button>
		<br>
		
		<input name="email" value="${email }"><br>
		<input id="msgAboutEmail"name="msgAboutEmail" value="${msgAboutEmail }">
		</form>
		
	<script> 
		$(document).ready(function(){
			
			
		});
		let msgAboutEmail= document.getElementById('msgAboutEmail').val();
		if(msgAboutEmail ==='emailSent'){
			window.alert("인증코드가 재발송 되었습니다!");
		}
	</script>

<%@include file="../includes/footer.jsp"%>