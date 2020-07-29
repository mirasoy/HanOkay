<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../../includes/header.jsp"%>

	<form name="form" method="post">
		<table border="1" width="500px">
			<tr>
			<span>본인 확인을 위한 이메일 전송을 위해 이메일을 입력하세요 </span>
				<label style="color: red;" id="msg"><c:out value="${msg}" /></label>
				<br>
				<td>Email: 
				<input type="text" size="40" name="email" id="email" 
				placeholder="회원가입을 진행했던 이메일을 입력하세요" value="${email }">
				<button name="sendEmail" id="sendEmail" type="button">발송하기</button>
				</td>
			</tr>
		</table>		
	</form>
	
	<script>
	
	//이메일 정규식 확인
	function checkEmail(str){
		let email = str;
		let regExp = /^\s*(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$/;
		return regExp.test(email);
	} 
	
	$(document).ready(function(){
		let formObj = $("form");
	//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
	if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
	
	//인증메일 발송하기 버튼을 누르면
	$("sendEmail").on("click", function(){
		//이메일 정규식 검사를 통과하면
		if(checkEmail(email)){

            $.ajax({
         	   type: 'POST',
         	   url: '/account/myAccount/accountRecovery',
         	   dataType: 'json',
         	   data: {
         		   'email': email
         	   },
         	   //async: false,
         	   success: function(data){
         		   console.log(data);
         		   $('#msg').text(data.msg);
         	   },
         	   error: function(data){
         		  window.location.href ="../../error/error";
         	   }
         	 });
		} 
		
		//이메일 정규식 불일치 시
		else{
			$('#msg').text("유효하지않은 이메일 형식입니다");
		}
	});
	
	
	});
	</script>

<%@include file="../../includes/footer.jsp"%>