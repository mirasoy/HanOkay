<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="../includes/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

	<h1>회원가입</h1>

	<form name="form" method="post">
		<table border="1" width="500px">
			<tr>
				<td>Email: <input type="text" size="40" name="email" id="email"
					value="${email }"><br> <label style="color: red;"
					id="msg1"><c:out value="${msg1}" /></label><br>
					<button data-oper='checkEmail' class="btn btn-default">이메일 중복체크</button>
				</td>
			</tr>
			<div id="personalInfo">
			<tr>
				<td>비밀번호: 
				<input type="password" size="50" name="pwd" id="pwd" value="${pwd }"> <br> 
					<label style="color: red;" id="msg2"><c:out value="${msg2}" /></label><br>
					 성: <input type="text" size=10 name="fstname" value="${fstname }"><br>
					이름: <input type="text" size=20 name="lastname" value="${lastname }">
				</td>
			</tr>
	
			<tr>
			<!-- 동적으로 생월 생일 생년 옵션 뿌려주기 -->
				<td><select name="selectBirthMonth" id="selectBirthMonth" onchange="call()">
						<option value="">--생월--</option>
						<option value="1">Jan</option>
						<option value="2">Feb</option>
						<option value="3">Mar</option>
						<option value="4">Apr</option>
						<option value="5">May</option>
						<option value="6">Jun</option>
						<option value="7">Jul</option>
						<option value="8">Aug</option>
						<option value="9">Sep</option>
						<option value="10">Oct</option>
						<option value="11">Nov</option>
						<option value="12">Dec</option>
				</select> <select name="selectBirthday" id="selectBirthday">
						<option value="">--생일--</option>
				</select> <select name="selectBirthYear" id="selectBirthYear">
						<option value="">--생년--</option>
				</select><br>
					<a href="/policies/terms" target="_blank">약관보기</a>
					<!-- <button data-oper='register' class="btn btn-default">가입하기</button> -->
					<button data-oper='sendEmailAuth' class="btn btn-default" id="sendEmailAuth">인증메일 발송</button>

				</td>
				
			</tr>
		</div>
		</table>
		<input type="hidden" id="birthday" name="birthday" value="">
	</form>
	
	<script>
	function call() {
		var kcyear = document.getElementsByName("selectBirthYear")[0], 
		   kcmonth = document.getElementsByName("selectBirthMonth")[0], 
		   kcday = document.getElementsByName("selectBirthday")[0];

		var d = new Date();
		var n = d.getFullYear();
		for (var i = n; i >= 1920; i--) {
			var opt = new Option();
			opt.value = opt.text = i;
			kcyear.add(opt);
		}
		kcyear.addEventListener("change", validate_date);
		kcmonth.addEventListener("change", validate_date);

		function validate_date() {
			var y = +kcyear.value, m = kcmonth.value, d = kcday.value;
			if (m === "2")
				var mlength = 28 + (!(y & 3) && ((y % 100) !== 0 || !(y & 15)));
			else
				var mlength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30,
						31 ][m - 1];
			kcday.length = 0;
			for (var i = 1; i <= mlength; i++) {
				var opt = new Option();
				opt.value = opt.text = i;
				if (i == d)
					opt.selected = true;
				kcday.add(opt);
			}
		}
		validate_date();
	}

	//이메일 형식 정규식 메서드
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

			//중복체크 버튼을 눌렀을 경우
			if (operation === 'checkEmail') {
				//먼저 정규식으로 이메일 형식 체크 
				//이메일 형식 통과 시 액션값을 주고
				if (checkEmail($("input[id='email']").val())) {
					formObj.attr("action", "/register/checkEmail");
					formObj.submit();
				}
				else {
				//통과 못하면 페이지 이동 없고 메세지 던져주기
					console.log($("input[id='email']").val());
					document.getElementById("msg1").innerHTML="유효하지 않은 이메일 형식입니다!";
					console.log("이멜 형식 불통");
				}

			}

			//가입하기 버튼을 눌렀을 경우 
			else if (operation === 'register') {
				//비밀번호 정규식을 통과했으면 
				//액션으로 submit할 때 날짜 정보를 합쳐서 넘겨줄 것 
				if(checkPassword($("input[name='pwd']").val())){
				console.log("비번 정규식 통과");
				
				//생년월일 정해주기
				let bmonth=document.getElementById("selectBirthMonth").value;
				console.log(bmonth);
				let byear=document.getElementById("selectBirthYear").value;
				console.log(byear);
				let bday=document.getElementById("selectBirthday").value;
				console.log(bday);
				
				let b= new Date(byear, bmonth-1, bday);
				
				let formatted_date = b.getFullYear() + "/" + (b.getMonth() + 1) + "/" + b.getDate() ;
				console.log("formatted birthday: "+ formatted_date);
				
				$("input[id='birthday']").val(formatted_date);
				
			 	formObj.attr("action", "/register/register");
				formObj.submit();
				} 
				
				//비밀번호 정규식 불통했으면 
				else{
					document.getElementById("msg2").innerHTML="비밀번호 조건(특수문자/숫자/문자 포함 8-20자)미충족";
					console.log("비번 정규식 불통");
				}
			} 
			//sendEmailAuth메일 
			else if( operator === 'sendEmailAuth'){
			
				
				
			
			}
			
		});
	});
	</script>

	
	