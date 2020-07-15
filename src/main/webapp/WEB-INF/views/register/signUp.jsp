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
            <td>Email(*): <input type="text" size="40" name="email" id="email" class="inputField"
            placeholder="서비스 이용을 위한 이메일을 입력하세요" value="${email }" ><br> 
            	
               <span style="color: black;" id="msg1"><c:out value="${msg1 }" /></span><br>
               <button data-oper='checkEmail' class="btn btn-default">이메일 중복체크</button>
            </td>
         </tr>
         <div id="personalInfo">
         <tr>
            <td>비밀번호(*): 
            <input type="password" class="inputField" size="50" name="pwd" id="pwd" placeholder="영 대,소문자,숫자,특수기호가 포함된 8~20자" value="${pwd }" > <br> 
          	  비밀번호 확인(*):
            <input type="password" class="inputField" size="50" name="pwd2" id="repeatedPwd" placeholder="비밀번호를 한번 더 입력하세요" > <br> 
              
               <span style="color: black;" id="msg2"><c:out value="${msg2 }" /></span><br>
               <span style="color: black;" id="msg3"><c:out value="${msg3 }" /></span><br>
                성(*): <input type="text" size=10 id="lastname" name="lastname" value="${lastname }" ><br>
               이름(*): <input type="text" size=20 id="fstname" name="fstname" value="${fstname }" >
            </td>
         </tr>
   
         <tr>
         <!-- 동적으로 생월 생일 생년 옵션 뿌려주기 -->
            <td><p>생년월일(*)</p>
            <select class="inputField" name="selectBirthMonth" id="selectBirthMonth" onchange="call()" >
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
            </select> 
            <select class="inputField" name="selectBirthday" id="selectBirthday" >
                  <option value="">--생일--</option>
            </select> 
            <select class="inputField" name="selectBirthYear" id="selectBirthYear" >
                  <option value="">--생년--</option>
            </select>
            <br>
            <input type="checkbox" id="checkbox" name="checkbox">
               <a href="/policies/terms" target="_blank">이용약관보기</a>
               <br>
               <p>(*)표시된 항목은 반드시 입력해주십시오</p>
               <button data-oper='register' class="btn btn-default">가입하기</button>
               <button data-oper='sendEmailAuth' class="btn btn-default" id="sendEmailAuth">인증메일 발송</button> 
            </td>
            
         </tr>
      </div>
      </table>
      <input type="hidden" id="birthday" name="birthday" value="">
      <input type="hidden" id="assureEmailCheck" name="assureEmailCheck" value="${assureEmailCheck}">
   </form>
  
   <script>
   //동적으로 생월 생일 생년 옵션을 그려주는 메서드
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
   
   //빈값체크
   function isEmpty(target) {
       if(target === null || target==null || target === undefined || target === '' || target =='' ) {
           return true;
       }

       return false;
   }

   // 이메일 유효성
   function checkEmail(str) {
      let email = str;
      let regExp = /^\s*(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$/;
//    /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;
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
   
   //중복확인을 했는지 확인하는 메서드
   function assureEmailCheck(str){
	   if(str =="pass"){
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
      
      let formObj = $("form");
      //버튼을 눌렀을 때 발생하는 일들
      $('button').on("click", function(e) {
      let operation= $(this).data("oper");
    	   
       e.preventDefault();

      //   let operation = $(this).data("oper");
         var email= $("input[id='email']").val();
         var pwd= $("input[id='pwd']").val();
         var repeatedPwd=  $("input[id='repeatedPwd']").val();
         var fstname=$("input[id='fstname']").val();
         var lastname=$("input[id='lastname']").val();
         var assureEmailCheck= document.getElementById("msg1").innerHTML;
      	
         //중복체크 버튼을 눌렀을 경우
          if (operation === 'checkEmail') {
            //먼저 정규식으로 이메일 형식 체크 
            //이메일 형식 통과 시 액션값을 주고
            if (checkEmail(email)) {
            	
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
            	   },
            	   error: function(data){
            		  window.location.href ="../error/error";
            	   }
            	 });
               return result;
               
              }
            
            //이메일 정규식 불통시
            else {
            	$('span#msg1').text("올바르지 않은 이메일 형식입니다!");
            }
         }

         //가입하기 버튼을 눌렀을 경우 
          if (operation === 'register') {
            
            //빈항목이 있는지 확인
        	console.log("email: "+ email);
        	console.log("pwd: "+ pwd);
        	console.log("fstname: "+ fstname);
        	console.log("lastname: "+ lastname);
            
            //이메일과 비밀번호 유효성 확인
            if(checkEmail(email) && checkPwd(pwd, repeatedPwd)) {
            
            let bmonth=document.getElementById("selectBirthMonth").value;
            let byear=document.getElementById("selectBirthYear").value;
            let bday=document.getElementById("selectBirthday").value;
            
            console.log("bmonth: "+bmonth);
            console.log("byear: "+ byear);
            console.log("bday: "+ bday);
            
            console.log($('#checkbox').is(':checked')); 
            
            //select 의 옵션들을 date형식으로 바꿔주기 (userVO를 만들기 위함)
            let b= new Date(byear, bmonth-1, bday);
            
            let formatted_date = b.getFullYear() + "/" + (b.getMonth() + 1) + "/" + b.getDate() ;
            console.log("formatted birthday: "+ formatted_date);
            
            $("input[id='birthday']").val(formatted_date);
            
            
            }
            //생년 생월 생일을 선택하였는지 확인
          	 if($("input[id='birthday']").val() =='1899/11/30'){
        	   window.alert("생년월일을 제대로 선택해주세요!");
        	   return;
         	  }
            
            //성과 이름 빈 값이 아닌지 확인
            if(isEmpty(fstname) || isEmpty(lastname)){
                window.alert("성과 이름을 반드시 입력해주세요!");
                return;
             }
            
            //이용약관 체크박스 선택했는지 확인
            if(!($('#checkbox').is(':checked'))){
            	window.alert("이용약관을 반드시 확인해주세요");
            	return;
            }
            
            if(assureEmailCheck !=='pass'){
            	window.alert("중복검사는 반드시 통과하여야합니다");
            	return;
            }
            formObj.attr("action", "/register/register");
            formObj.submit(); 
         }
         
         //sendEmailAuth메일 보내기
          if( operator === 'sendEmailAuth'){
        	  //form의 내용을 쿠키에 저장
        	  //controller로 전송
        	  formObj.attr("action", "/register/register");
              formObj.submit(); 
         } 
        
      });
      });
   </script>