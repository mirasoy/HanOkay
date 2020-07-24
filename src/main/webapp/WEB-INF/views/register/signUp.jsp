<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<%@include file="../includes/header.jsp"%>

   <h1>회원가입</h1>
	<!--  action= "/register/emailAuth" -->
   <form method="post" id="form">
      <table border="1" width="500px">
         <tr>
            <td>Email(*):
            <input type="text" size="40" name="userEmail" id="userEmail" class="inputField"
            placeholder="서비스 이용을 위한 이메일을 입력하세요" value="${userEmail }" ><br> 
            	
               <span style="color: black;" id="msg1"><c:out value="${msg1 }" /></span><br>
               <button data-oper='checkEmail' class="btn btn-default">이메일 중복체크</button>
            </td>
         </tr>
         <div id="personalInfo">
         <tr>
            <td>비밀번호(*): 
            <input type="password" class="inputField" size="50" name="userPwd" id="pwd" placeholder="영 대,소문자,숫자,특수기호가 포함된 8~20자" > <br> 
          	  비밀번호 확인(*):
            <input type="password" class="inputField" size="50" name="pwd2" id="repeatedPwd" placeholder="비밀번호를 한번 더 입력하세요" > <br> 
              
               <span style="color: black;" id="msg2"><c:out value="${msg2 }" /></span><br>
               <span style="color: black;" id="msg3"><c:out value="${msg3 }" /></span><br>
                성(*): <input type="text" size=10 id="lastName" name="userLastName" value="${lastName }" ><br>
               이름(*): <input type="text" size=20 id="fstName" name="userFstName" value="${fstName }" >
            </td>
         </tr>
   
         <tr>
         <!-- 동적으로 생월 생일 생년 옵션 뿌려주기 -->
            <td><p>생년월일(*)</p>
       <input type="text" id="date">
            <br>
            <input type="checkbox" id="checkbox" name="checkbox">
               <a href="/policies/terms" target="_blank">이용약관보기</a>
               <br>
               <p>(*)표시된 항목은 반드시 입력해주십시오</p>
              <!--  <button data-oper='register' class="btn btn-default">가입하기</button> -->                        
             <button data-oper='sendEmail' class="btn btn-default" id="sendEmail">인증메일 발송</button> 
            </td>
         </tr>
      </div>
      </table>
      <!-- userVO에 생년월일부분 -->
      <input id="birthday" name="userBirthday" >
      
      <input id="assureEmailResult" name="assureEmailResult" value="${assureEmailResult}">
      <input id="assureEmail" name="assureEmail" value="${assureEmail}">
   </form>
  	<a href="../user/login">로그인으로 돌아가기</a>
  	
  	
   <script>
   
   //빈값체크
   function isEmpty(target) {
       if(target === null || target==null || target === undefined || target === '' || target =='' ) {
           return true;
       }
       return false;
   }
   
   // 이메일 유효성
   function checkEmail() {
      var email = document.getElementById("userEmail").value;
      var regExp = /^\s*(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$/;
       return regExp.test(email);
   }
   
   // 유저명 유효성
   function checkUsername(str){
       let username = str;
       let num = username.search(/[0-9]/g);
       let eng = username.search(/[a-z]/ig);
       let spe = username.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
       //매개변수가 빈값인지 확인
       if(isEmpty(username)){
    	   document.getElementById("msg3").innerHTML="성/이름을 입력해주세요";
           return false;
       }
       
       
       //매개변수 길이가 적절한지 확인
       if(str.length<10){
    	   document.getElementById("msg3").innerHTML="이름의 글자수는 10자 이하로 해주세요";
    	   return false;
       }
       //매개변수에 공백이 있는지 확인
       if(username.search(/\s/) != -1){
    	   document.getElementById("msg3").innerHTML="공백 없이 입력해주세요";
         return false;
       }
       
     return true;
   }
   // 비밀번호 유효성
   function checkPwd(str, repeatedStr){
       var pw = str;
       var repeatedPw = repeatedStr;
       var num = pw.search(/[0-9]/g);
       var eng = pw.search(/[a-z]/ig);
       var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
       //비밀번호 글자수 8~20자로 제한
       if(pw.length<8 || pw.length>20){
    	   document.getElementById("msg2").innerHTML="8자리 ~ 20자리 이내로 영문 대소문자,숫자,특수문자를 혼합하여 입력해주세요.";
           return false;
       }
		//비밀번호 공백제한
       if(pw.search(/\s/) != -1){
    	   document.getElementById("msg2").innerHTML="공백 없이 입력해주세요.";
           return false;
       }
		//영문 숫자 특수문자 확인
       if(num < 0 || eng < 0 || spe < 0 ){
    	   document.getElementById("msg2").innerHTML="영문 대소문자,숫자,특수문자를 혼합하여 입력해주세요.";
           return false;
       }
		//비밀번호와 비밀번호 재확인의 값이 동일한지 확인
       if(pw !== repeatedPw) {
    	   document.getElementById("msg2").innerHTML="비밀번호와 비밀번호 확인이 다릅니다.";
           return false;
       }
       return true;
   }
   
   //이메일 중복확인을 했는지 확인하는 메서드
   function assureEmailCheck(assuredMsg, assuredEmail , inputEmail){
	   if((assuredMsg == "pass") && (assuredEmail === inputEmail)){
		   return true;
	   }
	   return false;
   }
   
   
   //html이 그려지면 실행되는 메서드
   $(document).ready(function() {

      
      //페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
      if ( window.history.replaceState) {
           window.history.replaceState( null, null, window.location.href );
       }
      
      $(function() {
			//모든 datepicker에 대한 공통 옵션 설정
			 $('#date').datepicker({
						dateFormat : 'yy-MM-dd' //Input Display Format 변경
						,onSelect : function(date) { //날짜가 선택되면
							
							document.getElementById("birthday").value =new Date(date);
						}
						,showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						,showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
						,changeYear : true //콤보박스에서 년 선택 가능
						,changeMonth : true //콤보박스에서 월 선택 가능                
						,showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
						,buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
						,buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함        
						,yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
						,monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7',
								'8', '9', '10', '11', '12' ] //달력의 월 부분 텍스트
						,monthNames : [ '1', '2', '3', '4', '5', '6',
								'7', '8', '9', '10', '11', '12' ] //달력의 월 부분 Tooltip 텍스트
						,dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
						,dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
								'토요일' ] //달력의 요일 부분 Tooltip 텍스트
						,yearRange : "-100:+0"
						,minDate : "-90Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						,maxDate : "+0D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)   
						,setDate : "today"
					});
      });

      let formObj = $('form');
      //버튼을 눌렀을 때 발생하는 일들
      $('button').on("click", function(e) {
      let operation= $(this).data("oper");
    	   
       e.preventDefault();
      
         var email= $("input[id='userEmail']").val();
         var pwd= $("input[id='pwd']").val();
         var repeatedPwd=  $("input[id='repeatedPwd']").val();
         var fstName=$("input[id='fstName']").val();
         var lastName=$("input[id='lastName']").val();
         
         var assureEmail= document.getElementById("assureEmail").value;
         var assureEmailCheckResult= document.getElementById("assureEmailResult").value;
      	
         //중복체크 버튼을 눌렀을 경우
          if (operation === 'checkEmail') {
            //먼저 정규식으로 이메일 형식 체크 
            if (checkEmail()) {
            	
             var result;
             
               $.ajax({
            	   type: 'POST',
            	   url: '/register/checkEmail',
            	   dataType: 'json',
            	   data: {
            		   'email': email
            	   },
            	   //async: false,
            	   success: function(data){
            		   console.log(data);
            		   $('span#msg1').text(data.msg);
            		   $('#assureEmailResult').val(data.assureMsg);
            		   $('#assureEmail').val(data.assuredEmail);
            	   },
            	   error: function(data){
            		  window.location.href ="../error/404error";
            	   }
            	 });
               return result;
               
              }
            
            //이메일 정규식 불통시
            else {
            	$('span#msg1').text("올바르지 않은 이메일 형식입니다!");
            }
         }
         
         
         //인증메일 발송 버튼을 눌렀을 경우 
          if (operation === 'sendEmail') {
            
            //빈항목이 있는지 확인
        	console.log("email: "+ email);
        	console.log("pwd: "+ pwd);
        	console.log("fst Name: "+ fstName);
        	console.log("last Name: "+ lastName);
            
            //이메일과 비밀번호 유효성 확인
            if(!(checkEmail(email) && checkPwd(pwd, repeatedPwd))) {
          	 	return;        
            }
           
            
            //성과 이름 빈 값이 아닌지 확인
            if(isEmpty(fstName) || isEmpty(lastName)){
                window.alert("성과 이름을 반드시 입력해주세요!");
                return;
             }
            
            //이용약관 체크박스 선택했는지 확인
            if(!($('#checkbox').is(':checked'))){
            	window.alert("이용약관을 반드시 확인해주세요");
            	return;
            }
            
            if(!(assureEmailCheck(assureEmailCheckResult, assureEmail, email ))){
            	window.alert("중복검사는 반드시 통과하여야합니다");
            	return;
            }
            
          	 formObj.attr("action", "/register/emailAuth");
           	 formObj.submit();
         }    
      });
      });
 </script>