<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@include file="../includes/header1.jspf"%>
<title>Han:Ok - 회원가입</title>
<style>
#sendAgainBtn:hover{
	cursor:pointer;
}
</style>
<%@include file="../includes/header2.jspf"%>
<%@include file="../includes/header3.jspf"%>

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
						
			<form method="post" class="Emailform">
				<span id="msg"><c:out value="${msg}" /></span><br>
				<input id="enteredAuthCode" name="enteredAuthCode" placeholder="인증코드를 입력하세요">
				<br>
				<button type="button" id="registerBtn" class="btn btn-sumbit">가입하기</button>
			<br>
			<div>
				<span>인증번호가 도착하지 않았나요? </span>
				<a style="color:#007bff;" id="sendAgainBtn">인증번호 재발송</a>
				<br>
			</div>
				<input type="hidden" name="email" id= "email" value="${email }"><br>
				<input type="hidden" id="msgAboutEmail"name="msgAboutEmail" value="${msgAboutEmail }" >
			</form>
			
			
		</div>
	</section>

</div>

		
	<script> 
	//가입하기 버튼
	$('#registerBtn').on("click", function(){
		
		let email= $("#email").val();
		let enteredAuthCode= $("#enteredAuthCode").val();
		
		$.ajax({
	            type: "POST",
	            url: "/register/submitAuth",
	            dataType: "json",
	            data: {
	              email: email,
	              enteredAuthCode: enteredAuthCode
	            },
	            
	            success: function (data) {
	              console.log("data: "+ data);
	              console.log("data.msg: "+ data.msg);
	             
	       
	              if(data.msg ==='success'){
	            	  alert("축하합니다! Han:Ok 회원이 되었습니다!");
	            	  window.location.href="../acm/list";
	            } 
	              else if (data.msg === 'fail'){
	            	alert("인증번호가 틀렸습니다! 인증번호를 다시 입력하세요. 인증번호를 재발급 받고싶다면 인증번호 재발급 버튼을 누르세요");
	            }
	           },
	          error: function (data) {
	              window.location.href = "../error/404error";
	            }, 
		});
	 });
	
	//인증번호 재발송 버튼 
	$('#sendAgainBtn').on("click", function(){
		let email= $("#email").val();
		alert("email: "+ email);
		
		$.ajax({
            type: "POST",
            url: "/register/sendAgain",
            dataType: "json",
            data: {
              email: email,
            },
            
            success: function (data) {
              console.log("data: "+ data);
              console.log("data.msg: "+ data.msg);
             
       
              if(data.msg ==='success'){
            	  alert("인증번호가 재발송되었습니다!현재페이지에서 다시 인증번호를 입력하세요");
            	 
              }
              else if (data.msg === 'fail'){
            	alert("인증번호 재발송에 실패했습니다! 다른 이메일 주소로 다시 가입하세요");
            }
           },
          error: function (data) {
              window.location.href = "../error/404error";
            }, 
		});
		
	});
	</script>

<%@include file="../includes/footer.jsp"%>