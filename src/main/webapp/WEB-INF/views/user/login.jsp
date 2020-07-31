<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../includes/header1.jspf"%>
<%@include file="../includes/header2.jspf"%>
<%@include file="../includes/header3.jspf"%>

<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
	<c:if test="${not empty cookie.user_check}">
		<c:set value="checked" var="checked"/>
	</c:if>
	
	<form name="loginForm" method="post">
		<table border="1" width="500px">
			<tr>
			
				<span style="color: red;" id="msg"><c:out value="${msg}" /></span>
				<td>Email: <input type="text" size="40" name="email" id="email"
					value="${cookie.user_check.value }" placeholder="서비스 이용을 위해 이메일을 입력해주세요" >
					
					<input type="checkbox" id="rememberEmail" ${checked } >Email 기억하기
				</td>
			</tr>
			<tr>
				<p>
				<td>비밀번호: <input type="password" size="50" name="pwd" id="pwd" value="${pwd }" placeholder="비밀번호를 입력해주세요" autocomplete="on"><br>
				</p>
					<button id="loginButton" type="button" class="btn btn-default">로그인</button>
					<button id="findPwdBtton" type="button" class="btn btn-default" onclick= "location.href='/account/myAccount/findPwd'">비밀번호 찾기</button>
					<br>
					<a href="../register/signUp" >회원가입하기</a>
					<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
					
				</td>
			</tr>
		</table>
	</form>

	<script>
	//구글 로그인
	 function onSignIn(googleUser) {
		
	        // Useful data for your client-side scripts:
	        var profile = googleUser.getBasicProfile();
	        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
	        console.log('Full Name: ' + profile.getName());
	        console.log('Given Name: ' + profile.getGivenName());
	        console.log('Family Name: ' + profile.getFamilyName());
	        console.log("Image URL: " + profile.getImageUrl());
	        console.log("Email: " + profile.getEmail());

	        // The ID token you need to pass to your backend:
	        var id_token = googleUser.getAuthResponse().id_token;
	        console.log("ID Token: " + id_token);
	 	
	        $.ajax({
				type:'POST',
				url: '${pageContext.request.contextPath}/user/login/tokenSignIn',
				headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				data: {
					'idToken': id_token
					
					
				},
				success: function(data){ 
						//window.alert("data~~"+data);
						//window.alert("msg~~"+data.result);
						var parsedData = JSON.parse(data);
						//window.alert("parsed data: "+parsedData.result);
						
					if (parsedData.result==0){ //로그인 실패
						//window.alert("msg=2:"+parsedData.result);
						$('#msg').text('로그인 정보가 불일치합니다. 다시 시도해주세요');
					}
					
					else if(parsedData.result==1){ //로그인 성공 시
						//window.alert("msg=1:"+parsedData.result);
					
						window.location.href='${pageContext.request.contextPath}/user/welcome';
					} 
				
				},
				
		});	 
	}
	      /*   var xhr = new XMLHttpRequest();
	        xhr.open('POST', 'http://localhost/user/login/tokenSignIn');
	        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	        xhr.onload = function() {
	          console.log('Signed in as: ' + xhr.responseText);
	        };
	        xhr.send('idtoken=' + id_token); 
	      }  */

	 //로그아웃 펑션

	//이메일 정규식 체크
	function checkEmail(str) {
		let emailRegex=/^\s*(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$/;
		if (emailRegex.test(str)) {
			console.log("이메일 정규식 통과");
			return true;
		} 
		return false;
	}

	$(document).ready(function() {
		let formObj = $("form");
		
		//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
		if ( window.history.replaceState ) {
	        window.history.replaceState( null, null, window.location.href );
	    }


		//로그인 버튼을 누르면
		$('#loginButton').click(function(){
			
			
			let email= document.getElementById('email').value;
			let pwd= $("input[id='pwd']").val();
			let remember_email= $('#rememberEmail').is(':checked');
		
			
			var result;
			$.ajax({
						type:'POST',
						url: '${pageContext.request.contextPath}/user/executeLogin',
						dataType: 'json',
						data: {
							'email': email,
							'pwd' : pwd,
							'remember_email': remember_email
						},
						success: function(data){
							
							if (data.msg==0){ //로그인 실패
								
								$('#msg').text('로그인 정보가 불일치합니다. 다시 시도해주세요');
							}
							
							else if(data.msg==1){ //로그인 성공 시
								
								window.location.href='${pageContext.request.contextPath}/user/welcome';
							} 
						
						},
						/* error: function(error){
							location.href='/register/registerFail';
						} */
				});	
			return result;		
		});
		
	
	});
	</script>

<%@include file="../includes/footer.jsp" %>