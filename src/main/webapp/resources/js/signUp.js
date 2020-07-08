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
					
					let b= new Date(byear, bmonth-1, bday );
					console.log(b);
					
					let formatted_date = b.getFullYear() + "/" + (b.getMonth() + 1) + "/" + b.getDate() ;
					console.log(formatted_date);
					
					$("input[id='birthday']").val(formatted_date);
				//	$("input[id='uPhone']").val("821067409811");
					
					
				 	formObj.attr("action", "/register/register");
					formObj.submit();
					}
					//비밀번호 정규식 불통했으면 
					else{
						document.getElementById("msg2").innerHTML="비밀번호 조건(특수문자/숫자/문자 포함 8-20자)미충족";
						console.log("비번 정규식 불통");
					}
				}
				
			});

		});