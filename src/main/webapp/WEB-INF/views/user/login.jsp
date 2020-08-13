<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@page import="javax.mail.Session"%> 

<%@include file="../includes/header1.jspf"%>
<title>HanOkay 한오케이 - 로그인</title>

<style>
body {
    font-family: "Open Sans", Helvetica, Arial, sans-serif;
    font-size: 13px;
    font-weight: 300;
  }
main,
section,
header,
div {
    display: block;
  }

form {
    display: block;
    margin-top: 0em;
  }

*,
  ::after,
  ::before {
    box-sizing: border-box;
  }

.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
  }
@media (min-width: 992px) {
    .container {
      max-width: 960px;
    }
  }
.container2_SR{
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
    top: 155px;
  }

  @media (min-width: 1128px){  
.container2_SR {
    width: 33.33333333333333% !important;
    float: left !important;
    margin-left: 33.33333333333333% !important;
}
}

.container3_SR{
    padding-left: 24px !important;
    padding-right: 24px !important;
    margin: 5px auto!important;
    border: 1px solid #dadfe6;
    border-radius: 16px;
    background-color: #ffffff !important;
    height: 480px;
    width: 446px;
}

.header1_SR {
    position: relative;
    margin-top: 64px;
    margin-bottom: 56px;
    margin-left: 16px;
}

.header2_SR {
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      "Helvetica Neue", sans-serif !important;
    font-size: 32px !important;
    font-weight: 800 !important;
    line-height: 1.125em !important;
    color: rgb(72, 72, 72) !important;
    margin-left: 4px !important;
}

.contentOfInfo_SR {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

@media (min-width: 744px) {
.contentOfInfo_SR {
      width: 100% !important;
      float: left !important;
   }
}

.in1_SR {
    display: table !important;
    width: 100% !important;
    border-spacing: 0px !important;
}

.titleOfOneInfo_SR {
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}
  
.titleOfCheckBox_SR{
  	overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      "Helvetica Neue", sans-serif !important;
    font-size: 13px ;
    font-weight: normal;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

.oneInfo_SR{
  margin-bottom: 16px;
}

.g-signin2 > div {
    margin: 0 auto;
}

.oneInputBox_SR{
  display: block !important;
  width: 100% !important;
}

.input{
    font-size: var(--font-form-element-font-size, 16px) !important;
    line-height: var(--font-form-element-line-height, 24px) !important;
    letter-spacing: var(--font-form-element-letter-spacing, normal) !important;
    font-family: var(--font-form-element-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    text-transform: var(--font-form-element-text-transform, undefined) !important;
    color: #484848 !important;
    padding-top: var(--spacing-form-element-vertical, 11px) !important;
    padding-bottom: var(--spacing-form-element-vertical, 11px) !important;
    font-weight: var(--font-light-font-weight, normal) !important;
    background-color: transparent !important;
    padding-left: var(--spacing-form-element-horizontal, 11px) !important;
    padding-right: var(--spacing-form-element-horizontal, 11px) !important;
    width: 100%;
}
</style>

<%@include file="../includes/header2.jspf"%> 
<%@include file="../includes/header3.jspf"%>

<div class="container">
<div style="position:absolute; margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">
  <div class="out_SR">
    <section>
      <div
      style="
          position: relative;
          margin-top: 64px;
          margin-bottom: 56px;
          margin-left: 16px;
          postion: relative;
        ">
      <h1>
      <div class="header2_SR" >Han:Ok에서 그동안 몰랐던 국내여행지의 아름다움을 발견해보세요 </div>
      </h1>
    </div>
    <!--  action= "/register/emailAuth" -->
  </section>
</div>
</div>




    <!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
    <c:if test="${not empty cookie.user_check}">
    <c:set value="checked" var="checked" />
    </c:if>

<div class="container2_SR">
<div class="container3_SR">
  <div style="margin-top:35px;margin-bottom:auto">

  <section>
    <div>
      <div style="margin-bottom: 8px;">
	   <div class="g-signin2" data-onsuccess="onSignIn"  data-theme="dark"></div>
	 </div>
    </div>

    <div>
      <form name="loginForm" method="post">
        <div class="oneInfo_SR">
          <div style="margin-bottom: 16px;">
          <div>
            <div class="oneInputBox_SR">
            <span style="color: red;" id="msg"><c:out value="${msg}" /></span>
            <div class="titleOfOneInfo_SR">
              Email
            </div>
            <input
            class="input_SR"
              type="text"
              style="width:100%"
              name="email"
              id="email"
              value="${cookie.user_check.value }"
              placeholder="서비스 이용을 위해 이메일을 입력해주세요"
            />
          </div>
         </div>
        </div>

        <div class="oneInputBox_SR" style="margin: 3px;">
          <div class="titleOfCheckBox_SR">
            Email 기억하기
            <input type="checkbox" id="rememberEmail" ${checked } />
          </div>
        </div>
      </div>
       

      <div class="oneInfo_SR">
        <div class="oneInputBox_SR">
            <div class="titleOfOneInfo_SR">
              	비밀번호
            </div>
            <input
             class="input_SR"
              type="password"
              style="width:100%"
              name="pwd"
              id="pwd"
              value="${pwd }"
              placeholder="비밀번호를 입력해주세요"
              autocomplete="on"
            />
        </div>
      </div>

		<div style="margin-top: 25px;">
       		<div style="margin-top: 10px;">
           		<button id="loginButton" type="button" class="btn btn-default" style="width: 100%;">
               	로그인
         		</button>
       		</div>
       
       	  	<div style="margin-top: 10px;">
	           	 <button
	               style="width: 100%;"
	                id="findPwdBtton"                 
	                type="button"
	                class="btn btn-default"
	                onclick="location.href='/account/findPwd'"
	              >
              		  비밀번호 찾기
           		 </button>
         
         	 </div>
          </div>
          
        </form>
    </div>


    <div class="oneInfo_SR">
         
         
        
      <input type="hidden" name="requestFrom" value="${requestFrom}" />
    </div>

    <div style="margin-top:45px; font-weight: 500">
      	<div style="margin-left: 104px;">
          Han:Ok의 회원이 되어 더 많은 혜택을 누려보세요!
     	</div>
      <div style="margin-left:310px; font-size:14px;">
         <a href="../register/signUp" style="color:#007bff;">회원가입하기</a>
      </div>
    </div>
    
    </section>
    </div>
   </div>
 </div>
</div>


<script>
  //구글 로그인
  function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log("Full Name: " + profile.getName());
    console.log("Given Name: " + profile.getGivenName());
    console.log("Family Name: " + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail());

    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);

    $.ajax({
      type: "POST",
      url: "${pageContext.request.contextPath}/user/login/tokenSignIn",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      data: {
        idToken: id_token,
      },
      success: function (data) {
        //window.alert("data~~"+data);
        //window.alert("msg~~"+data.result);
        var parsedData = JSON.parse(data);
        //window.alert("parsed data: "+parsedData.result);

        if (parsedData.result == 0) {
          //로그인 실패
          //window.alert("msg=2:"+parsedData.result);
          $("#msg").text("로그인 정보가 불일치합니다. 다시 시도해주세요");
        } else if (parsedData.result == 1) {
          //로그인 성공 시
          //window.alert("msg=1:"+parsedData.result);
          window.location.href =
            "${pageContext.request.contextPath}/user/welcome";
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

  //FB 로그인
  function statusChangeCallback(response) {
    // Called with the results from FB.getLoginStatus().
    console.log("statusChangeCallback");
    console.log(response); // The current login status of the person.
    console.log("Token:" + response.authResponse.accessToken);
    if (response.status === "connected") {
      // Logged into your webpage and Facebook.
      testAPI();
    } else {
      // Not logged into your webpage or we are unable to tell.
      document.getElementById("status").innerHTML =
        "Please log " + "into this webpage.";
    }
  }

  function checkLoginState() {
    // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function (response) {
      // See the onlogin handler
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function () {
    FB.init({
      appId: "600224137301572",
      cookie: true, // Enable cookies to allow the server to access the session.
      xfbml: true, // Parse social plugins on this webpage.
      version: "v7.0", // Use this Graph API version for this call.
    });

    FB.getLoginStatus(function (response) {
      // Called after the JS SDK has been initialized.
      statusChangeCallback(response); // Returns the login status.
    });
  };

  function testAPI() {
    // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    console.log("Welcome!  Fetching your information.... ");

    FB.api("/me", function (response) {
      var name = response.name;
      console.log("Successful login for: " + response.name);

      document.getElementById("status").innerHTML =
        "Thanks for logging in, " + response.name + "!";
    });

    /*   FB.api('/me', {fields: 'name'}, function(response) { 
	        	 
	   	      	console.log("response.id: "+response.id);
	   	      	console.log("response.name: "+response.name);
	         }); */

    /* FB.api('/me/picture?type=small',function(response){
	  			console.log(response.data.url);
	  		}); */

    FB.api("/me", { fields: "email" }, function (response) {
      var email = response.email;
      console.log("response.email: " + response.email);
    });

    FB.api("/me", { fields: "birthday" }, function (response) {
      var birthday = response.birthday;
      console.log("response.birthday: " + response.birthday);
    });

    $.ajax({
      type: "POST",
      url: "${pageContext.request.contextPath}/user/login/executeFBLogin",
      dataType: "json",
      data: {
        email: email,
        name: name,
        birthday: birthday,
      },
      success: function (data) {
        if (data.msg == 0) {
          //로그인 실패

          $("#msg").text("로그인 정보가 불일치합니다. 다시 시도해주세요");
        } else if (data.msg == 1) {
          //로그인 성공 시

          window.location.href =
            "${pageContext.request.contextPath}/user/welcome";
        }
      },
    });
  }

  //이메일 정규식 체크
  function checkEmail(str) {
    let emailRegex = /^\s*(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$/;
    if (emailRegex.test(str)) {
      console.log("이메일 정규식 통과");
      return true;
    }
    return false;
  }

  $(document).ready(function () {
    let formObj = $("form");

    //페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
    if (window.history.replaceState) {
      window.history.replaceState(null, null, window.location.href);
    }

    //로그인 버튼을 누르면
    $("#loginButton").click(function () {
      let email = document.getElementById("email").value;
      let pwd = $("input[id='pwd']").val();
      let remember_email = $("#rememberEmail").is(":checked");

      var result;
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/user/executeLogin",
        dataType: "json",
        data: {
          email: email,
          pwd: pwd,
          remember_email: remember_email,
        },
        success: function (data) {
          if (data.msg == 0) {
            //로그인 실패

            $("#msg").text("로그인 정보가 불일치합니다. 다시 시도해주세요");
          } else if (data.msg == 1) {
            //로그인 성공 시

            window.location.href =
              "${pageContext.request.contextPath}/user/welcome";
          }
        },
      });
      return result;
    });
  });
</script>

<%@include file="../includes/footer.jsp"%>
