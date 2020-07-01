<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>

	<h1>회원가입</h1>

	<form name="form" method="post">
		<label style="color: red;"><c:out value="${msg1}" /></label><br>
		Email: <input type="text" size="40" name="email" value="${email }">
		<button data-oper='checkEmail' class="btn btn-default">이메일 중복체크</button><br> 
		비밀번호: <input type="password" size="50" value="${pwd }"><br>
		<label style="color: red;"><c:out value="${msg2}" /></label><br>
		성:<input type="text" size=10 name= "uFstname" value="${uFstname }"><br> 
		이름:<input type="text" size=20 name= "uLastname" value="${uLastname }"><br> 
		<br>
		<select name="birthMonth" onchange="call()">
			<option value="">--생월--</option>
			<option value="1">Jen</option>
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
		</select> 
		<select name="birthday">
			<option value="">--생일--</option>
		</select> 
		<select name="birthYear">
			<option value="">--생년--</option>
		</select>

		
		<br>
		<button data-oper='register' class="btn btn-default">가입하기</button>

	</form>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	
	//생년월일 콤보박스를 동적으로 뿌려주는 함수
	  function call(){
		  var kcyear = document.getElementsByName("birthYear")[0],
		   kcmonth = document.getElementsByName("birthMonth")[0],
		   kcday = document.getElementsByName("birthday")[0];
		        
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
		  else var mlength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m - 1];
		  kcday.length = 0;
		  for (var i = 1; i <= mlength; i++) {
		      var opt = new Option();
		      opt.value = opt.text = i;
		      if (i == d) opt.selected = true;
		      kcday.add(opt);
		  }
		      }
		     validate_date();
		   }
	  
	  
	  
		$(document).ready(function() {
			let formObj = $("form");

			//버튼에 따라 컨트롤러에서 다른 서비스를 부르게함
			$('button').on("click", function(e) {
				e.preventDefault();

				let operation = $(this).data("oper");

				console.log(operation);

				if (operation === 'checkEmail') {
					formObj.attr("action", "/register/checkEmail");
				} else if (operation === 'register') {
					formObj.attr("action", "/register/register")
				}

				formObj.submit();
			});
		});
	</script>
</body>
</html>