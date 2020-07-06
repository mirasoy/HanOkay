	function checkEmail(str) {
		let emailRegex=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (emailRegex.test(str)) {
			console.log("이메일 정규식 통과");
			return true;
		} else {
			console.log("이메일 정규식  미통과");
			return false;
		}
	}

	//비밀번호 형식 정규식 메서드
	function checkPassword(str){
		//특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
		let passwordRegex=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		if(passwordRegex.test(str)){
			console.log("비밀번호 정규식 통과");
			return true;
		} else {
			console.log("비밀번호 정규식  미통과");
			return false;
		}
	}
	$(document).ready(function() {
		let formObj = $("form");

		//버튼에 따라 컨트롤러에서 다른 서비스를 부르게함
		$('button').on("click", function(e) {
			e.preventDefault();

			let operation = $(this).data("oper");
			
			//로그인 버튼을 눌렀을 때
			if(operation ==='signIn'){
				// js로 이메일과 비밀번호 정규식이 일치하는지 확인
				if (checkEmail($("input[id='email']").val()) && checkPassword($("input[id='pwd']").val())) {
					//controller에서 service.login()을 시킴
					formObj.attr("action", "/user/executeLogin");
					formObj.submit();
				}
				else {
				//정규식 테스트 통과 못하면 페이지 이동 없고 메세지 던져주기
					console.log($("input[id='email']").val());
					document.getElementById("msg").innerHTML="유효하지 않은 이메일/비밀번호 형식입니다!";
					console.log("이멜/비번 정규식 불통");
				}
			}
			
			//비번찾기를 누르면
			//controller에서 service.findPwd()를 시킴
			else if(operation ==='findPwd'){
				formObj.attr("action", "/user/findPwd");
				formObj.submit();
			}
			
		});
	});