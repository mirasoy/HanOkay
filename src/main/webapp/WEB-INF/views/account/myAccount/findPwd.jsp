<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="../../includes/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<form name="form" method="post">
		<table border="1" width="500px">
			<tr>
			<label>본인 확인을 위한 이메일 전송을 위해 이메일을 입력하세요 </label>
				<label style="color: red;" id="msg"><c:out value="${msg}" /></label>
				<br>
				<td>Email: <input type="text" size="40" name="email" id="email" placeholder="회원가입을 진행했던 이메일을 입력하세요" value="${email }">
					<button name="sendEmail" id="sendEmail" type="button">발송하기</button>
				</td>
			</tr>
		</table>		
	</form>
	
	<script>
	
	function checkEmail(str){
		let email = str;
		let regExp = /^\s*(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$/;
//		/(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;
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
		if(checkEmail(email)){

            $.ajax({
         	   type: 'POST',
         	   url: '/account/myAccount/sendEmail',
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
		} else{
			$('#msg').text("유효하지않은 이메일 형식입니다");
		}
	})
	
	
	});
	</script>
</body>
<%@include file="../../includes/footer.jsp"%>
</html>