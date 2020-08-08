<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@include file="../includes/header.jsp"%>


<!-- Register CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/register.css" >


<div class="container">

	<section class="contents">

			<div class="contents_out">
				 <h1>회원가입</h1>
			</div>
	
		<div class="container2_SR">

			
			<div class= "contents_img">
			<i class="fa fa-envelope fa-5x"></i>
			</div>
		
			<div class="contents_txt">
				<h2>메일 발송 완료!</h2>
				<p>입력하신 이메일 주소로 인증 링크를 발송했습니다. <br> <span class="red">링크를 클릭</span>하여 가입을 진행해주세요.</p>
			</div>
						
			<form method="post" action="/register/submitAuth" class="Emailform">
				<span id="msg"><c:out value="${msg}" /></span><br>
				<input id="enteredAuthCode" name="enteredAuthCode" placeholder="인증코드를 입력하세요">
				<br>
				<button type="submit" id="register" class="btn btn-sumbit">가입하기</button>
			<br>
				<span>인증번호가 도착하지 않았나요? </span>
				<button type="button" id="sendAgain"  onclick="location.href='/register/sendAgain'">인증번호 재발송</button>
				<br>
				
				<input name="email" value="${email }" hidden><br>
				<input id="msgAboutEmail"name="msgAboutEmail" value="${msgAboutEmail }" hidden>
			</form>
			
			
		</div>
	</section>

</div>

		
	<script> 

		$(document).ready(function(){
			
			
		});
		let msgAboutEmail= document.getElementById('msgAboutEmail').val();
		if(msgAboutEmail ==='emailSent'){
			window.alert("인증코드가 재발송 되었습니다!");
		}
	</script>

<%@include file="../includes/footer.jsp"%>