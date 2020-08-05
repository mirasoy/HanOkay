<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@page import="javax.mail.Session"%> 
<%@include file="../includes/header1.jspf"%>
<title>HanOkay-로그인</title>
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

  .header1_SR {
    position: relative;
    margin-top: 64px;
    margin-bottom: 56px;
    margin-left: 16px;
  }

  .h1Tag_SR {
    color: inherit !important;
    font-size: 1em !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    margin: 0px !important;
    padding: 0px !important;
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

  .content_SR {
    margin-left: -8px !important;
    margin-right: -8px !important;
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
.contentsSec{
    margin-left: 220px;
    padding: 0px 10px;
}

.shapeOfForm{
    width: 600px;
    height: 433px;
    border: 1px solid #dadfe6;
    border-radius: 16px;
    position: fixed;
    z-index: 1;
    margin: auto;
    background: #fff;
    overflow-x: hidden;
    padding: 8px 0;
    text-align: center;
}

  .oneInfo_SR {
    border-bottom: 1px solid rgb(235, 235, 235) !important;
  }

  .in1_SR {
    display: table !important;
    width: 100% !important;
    border-spacing: 0px !important;
  }

  .titleOfOneInfo_SR {
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
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
  
  .g-signin2 > div {
    margin: 0 auto;
  }
</style>

<%@include file="../includes/header2.jspf"%> <%@include
file="../includes/header3.jspf"%>
<div class="container">
  <!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
  <c:if test="${not empty cookie.user_check}">
    <c:set value="checked" var="checked" />
  </c:if>

  <div class="out_SR">
    <section>
      <div class="header1_SR">
        <h1 tabindex="-1" class="h1Tag_SR">
          <div class="header2_SR">
          <div style="margin-top: 20px;">
           로그인
          </div>
          </div>
        </h1>
      </div>
    </section>
  </div>

  <div class="content_SR">
  <section class="contentsSec">
      <div class="shapeOfForm">
          <div class="contentOfInfo_SR">
    <form name="loginForm" method="post" style="margin: 58px auto;">
          <div class="oneInfo_SR">
            <div class="in1_SR">
              <span style="color: red;" id="msg"><c:out value="${msg}" /></span>
              <div class="titleOfOneInfo_SR">
                Email
              </div>
              <input
                type="text"
                size="40"
                name="email"
                id="email"
                value="${cookie.user_check.value }"
                placeholder="서비스 이용을 위해 이메일을 입력해주세요"
              />

              <div class="titleOfCheckBox_SR">
                Email 기억하기
                <input type="checkbox" id="rememberEmail" ${checked } />
              </div>
            </div>
          </div>

          <div class="oneInfo_SR">
            <div class="in1_SR">
              <div class="titleOfOneInfo_SR">
                비밀번호
              </div>
              <input
                type="password"
                size="40"
                name="pwd"
                id="pwd"
                value="${pwd }"
                placeholder="비밀번호를 입력해주세요"
                autocomplete="on"
              />
              <div style="margin-top: 10px;">
                <button id="loginButton" type="button" class="btn btn-default">
                  로그인
                </button>
                <button
                  id="findPwdBtton"
                  type="button"
                  class="btn btn-default"
                  onclick="location.href='/account/myAccount/findPwd'"
                >
                  비밀번호 찾기
                </button>
              </div>
            </div>
          </div>


          <div class="oneInfo_SR">
            <div class="in1_SR">
            <div 
              class="g-signin2"
              data-onsuccess="onSignIn"
              data-theme="dark"
            ></div>
            
            <%--
            <a href="${facebook_url}"
              ><button class="btn btn-primary btn-round" style="width: 100%;">
                <i class="fa fa-facebook" aria-hidden="true"></i>Facebook Login
              </button></a
            >
            --%>
            <a
              href="https://www.facebook.com/v7.0/dialog/oauth?
        client_id=323895235315656
        &redirect_uri=https%3A%2F%2Flocalhost%3A8443%2Fuser%2Flogin%2Faouth2
        &state={state-param}
        &resource_type=token"
              >Login with Facebook</a
            >
            <!-- <fb:login-button scope="public_profile,email,user_birthday"
					onlogin="checkLoginState();" onclick="FB.login();">
				</fb:login-button>

				<div id="status"></div> Load the JS SDK asynchronously 
				<script	async defer crossorigin="anonymous"
					src="https://connect.facebook.net/en_US/sdk.js"></script> -->
          
          </div>
        <input type="text" name="requestFrom" value="${requestFrom}" />
      </div>
      <div style="margin-top:20px;">
        <div style="margin-left:310px;  display:inline">
            <a href="../register/signUp">회원가입하기</a>
        </div>
        
        
    </form>
    </div>
</div>
    </section>
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
