<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

	<form name="loginForm" method="post">
		<table border="1" width="500px">
			<tr>
			
				<span style="color: red;" id="msg"><c:out value="${msg}" /></span>
				<td>Email: <input type="text" size="40" name="email" id="email"
					value="${cookie.user_check.value }" placeholder="서비스 이용을 위해 이메일을 입력해주세요" >
					<input type="checkbox" id="rememberEmail" ${checked }>Email 기억하기
				</td>
			</tr>
			<tr>
				<p>
				<td>비밀번호: <input type="password" size="50" name="pwd" id="pwd" value="${pwd }" placeholder="비밀번호를 입력해주세요" ><br>
				</p>
					<button id="loginButton" type="button" class="btn btn-default">로그인</button>
					<button id="findPwdBtton" type="button" class="btn btn-default" onclick= "location.href='/account/myAccount/findPwd'">비밀번호 찾기</button>
					<br>
					<a href="../register/signUp" >회원가입하기</a>
				</td>
			</tr>
		</table>
	</form>

	<script>
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
		
		//비밀번호 찾기 버튼을 누르면
		$("#findPwdButton").on("click", function(e){
			e.preventDefault();
			window.alert("자 이제 너의 비밀번호를 찾아주지");
		});
		
	});
	</script>

<%@include file="../includes/footer.jsp"%>