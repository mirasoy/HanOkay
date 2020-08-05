<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="com.ana.domain.UserVO"%>
<!-- 세션에 user라는 키로 저장된 userVO 인스턴스를 가져온다 -->
<%
   UserVO user = (UserVO) session.getAttribute("user");
String userLastName = "";
String userFstName = "";
String userPwd = "";
String userEmail="";
String userNum = "";
String userPriv ="";
String userStatusCode="";


//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
if (user != null) {
   userLastName = user.getUserLastName();
   userFstName = user.getUserFstName();
   userPwd = user.getUserPwd();
   userEmail = user.getUserEmail();
   userNum = user.getUserNum();
   userPriv=user.getUserPriv();
   userStatusCode=user.getUserStatusCode();
   
   
}
%>





<html lang="en">
<head>
	<!-- 구글 소셜 로그인 시작 -->
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="942421543250-i3vvb6s828smd122lqcdr0buvjg2p6ui.apps.googleusercontent.com">
 	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script> 
	<!-- 구글 소셜 로그인 끝 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="0;">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<title>HanOkay 한오케이 -Make yourself At home in Korea!</title>



<!-- load stylesheets -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Google web font "동해독도(로고)" -->
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<!-- Bootstrap style -->
<link rel="stylesheet" type="text/css"
   href="${request.contextPath}/resources/css/datepicker.css" >
<link rel="stylesheet" type="text/css"
   href="${request.contextPath}/resources/slick/slick.css">
<link rel="stylesheet" type="text/css"
   href="${request.contextPath}/resources/slick/slick-theme.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/templatemo-style.css">

<link rel="stylesheet" type="text/css" href="../resources/css/review.css">

<!-- 메인 CSS style -->

<!-- load JS files -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jQuery (https://jquery.com/download/) -->
<script src="${request.contextPath}/resources/js/popper.min.js"></script>
<!-- https://popper.js.org/ -->
<script src="${request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="${request.contextPath}/resources/js/datepicker.min.js"></script>
<!-- https://github.com/qodesmith/datepicker -->
<script src="${request.contextPath}/resources/js/jquery.singlePageNav.min.js"></script>
<!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
<script src="${request.contextPath}/resources/slick/slick.min.js"></script>
<!-- http://kenwheeler.github.io/slick/ -->
<script src="${request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
<!-- https://github.com/flesler/jquery.scrollTo -->

<script src="${request.contextPath}/resources/js/index.js"></script>

<!-- iMask -->
<script src="https://unpkg.com/imask"></script>
<!-- 달력 변경 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="${request.contextPath}/resources/js/select2.js"></script>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/select2.css" >


<script type="text/javascript">
   $(document)
         .ready(
               function() {
                  //만약 user에 해당하는 세션이 없으면 

                  var priv;
                  var userStatusCode;
                //세션에 유저가 없으면
                $('#myMenuIcon').on("click", function(){
                	
               if (<%=user == null %>) {
                    
                     //알림 드랍 다운 내부 텍스트를 모두 지우고
                     $('#myMenuIcon').removeAttr("data-toggle");
                     $('#notification').empty();
                     //회원 가입하라고 메세지 주기
                     //드랍 다운 상자를 responsive로 변경하면 좋겠다
                     $('#notification')
                           .append(
                                 "<li><a href='#'>ana의 회원이 되셔서 <br>더 많은 혜택을 누려보세요!</a></li>");
                     //내 메뉴 드랍다운 상자는 없애버리고 클릭하면 로그인 사이트로 이동하게 하자
                     $('#myMenuIcon').attr("href", "/user/login");
                     

                  } else {
                     priv ='<%=userPriv%>';
                     userStatusCode='<%=userStatusCode%>';
                     if(priv== "ADMIN"){
                        $('#mode').html("<a href='/admin/adminindex'   style='cursor: pointer'>관리자 모드</a>");
                        
                     }else if(priv=="HOST"){
                        $('#mode').html("<a href='/hosting/hostindex'   style='cursor: pointer'>호스트 모드</a>");
                     }else if(priv=="GUEST"){
                    	 if(userStatusCode=="ACTIVE")
                        $('#mode').html("<a href='/hosting/become-host'   style='cursor: pointer'>호스트 되기</a>");
                    	 else $('#mode').html("<a href='/hosting/listings' style='cursor: pointer'>호스트 등록중</a>");	  
                     }
                    
                  };    
                });
               
               });

    	 
       
      function signOut() {
       	 //google 로그아웃   	 
           var auth2 = window.gapi.auth2.getAuthInstance();
           auth2.signOut().then(function () {
             console.log('User signed out.');         
           });
           
           auth2.disconnect();
           
           //fb로그아웃
           /* FB.logout(function(response) {
   		}); */
           
           $.ajax({
   			type:'GET',
   			url: '${pageContext.request.contextPath}/user/logout',
   			success: function(data){
   				window.location.href='${pageContext.request.contextPath}/acm/list';
   				//alert(data);
   				},		
   			}); 	
         }
            
   	 function onLoad() {
   	      gapi.load('auth2', function() {
   	        gapi.auth2.init({
   	        	 clientId: '942421543250-i3vvb6s828smd122lqcdr0buvjg2p6ui.apps.googleusercontent.com',
   	        	 scope: 'profile email'
   	        });
   	      });
   	    }  
   	 
	 
	
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

	//FB 로그인
	      function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
	        console.log('statusChangeCallback');
	        console.log(response);                   // The current login status of the person.
	       console.log("Token:"+response.authResponse.accessToken);
	        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
	          testAPI();  
	        } else {                                 // Not logged into your webpage or we are unable to tell.
	          document.getElementById('status').innerHTML = 'Please log ' +
	            'into this webpage.';
	        }
	      }

	      function checkLoginState() {               // Called when a person is finished with the Login Button.
	        FB.getLoginStatus(function(response) {   // See the onlogin handler
	          statusChangeCallback(response);
	        });
	      }


	      window.fbAsyncInit = function() {
	        FB.init({
	          appId      : '600224137301572',
	          cookie     : true,                     // Enable cookies to allow the server to access the session.
	          xfbml      : true,                     // Parse social plugins on this webpage.
	          version    : 'v7.0'          			 // Use this Graph API version for this call.
	        });


	        FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
	          statusChangeCallback(response);        // Returns the login status.
	        });
	      };
	     
	      function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
	        console.log('Welcome!  Fetching your information.... ');
	      
	       
	         FB.api('/me', function(response) {
	        	 var name=response.name;
	          console.log('Successful login for: ' + response.name);
	          
	          document.getElementById('status').innerHTML =
	            'Thanks for logging in, ' + response.name + '!';
	          });
	         
	        /*   FB.api('/me', {fields: 'name'}, function(response) { 
	        	 
	   	      	console.log("response.id: "+response.id);
	   	      	console.log("response.name: "+response.name);
	         }); */
	   	    
	   		/* FB.api('/me/picture?type=small',function(response){
	  			console.log(response.data.url);
	  		}); */
	  		
	   		FB.api('/me', {fields: 'email'}, function(response) {
	   			var email= response.email;
	   	      	console.log("response.email: "+response.email);
	   	    });
	   		
	   		FB.api('/me', {fields: 'birthday'}, function(response) {
	   			var birthday= response.birthday;
	   	      	console.log("response.birthday: "+ response.birthday);
	   	    }); 
	   		
	   		
	   		  $.ajax({
					type:'POST',
					url: '${pageContext.request.contextPath}/user/login/executeFBLogin',
					dataType: 'json',
					data: {
						'email':email,
						'name': name,
						'birthday': birthday
					},
					success: function(data){
						
						if (data.msg==0){ //로그인 실패
							
							$('#msg').text('로그인 정보가 불일치합니다. 다시 시도해주세요');
						}
						
						else if(data.msg==1){ //로그인 성공 시
							
							window.location.href='${pageContext.request.contextPath}/user/welcome';
							} 
						},		
					}); 	
	   			    
	        
	      }
	        
</script>

</head>

<!-- 뒤로가기 방지 -->
<!-- 
<script type="text/javascript">
   window.history.forward();
   function noBack() {
      window.history.forward();
   }
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack(); onunload="">"
 -->

<body>
   <!-- main-content -->
   <div class="main-content" id="top">
      <div class="top-bar-bg"></div>
      <!-- Start : top-bar - 메인 네비게이션 바 : 동적 active 적용 -->
      <div class="top-bar" id="top-bar">
         <!-- Start : container-->
         <div class="container">
            <div class="row">
               <nav class="navbar navbar-expand-lg">
                  <!-- Start : Main Logo : ana의 로고 삽입-->
                  <a class="navbar-brand mr-auto #top" 
                     onclick="location.href='${request.contextPath}/acm/list'" style="cursor: pointer">
                     <img src="${request.contextPath}/resources/img/logo.png" alt="Site logo"></a>
                  <!-- End : Main Logo -->

                  <!-- Start : hidden button-->
                  <button type="button" id="nav-toggle"
                     class="navbar-toggler collapsed" data-toggle="collapse"
                     data-target="#mainNav" aria-expanded="false"
                     aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                  </button>
                  <!-- End : hidden button-->

                  <!-- Start : mainNav : ana 메뉴-->
                  <div id="mainNav" class="collapse navbar-collapse tm-bg-white">
                     <ul class="navbar-nav ml-auto">



                        <!-- Start : mainNav1 - 글러벌-->
                        <li class="nav-item dropdown"><a
                           class="nav-link dropdown-toggle" data-toggle="dropdown"
                           href="#"> <i class="fa fa-globe fa-2x"></i></a>
                           <ul class="dropdown-menu">
                              <li><a href="#">ENGLISH(미구현)</a></li>
                              <li><a href="#">KOREAN</a></li>
                           </ul></li>

                        <!-- Start : mainNav2 - 알림-->
                        <li class="nav-item dropdown"><a
                           class="nav-link dropdown-toggle" data-toggle="dropdown"
                           href="#"> <i class="fa fa-bell fa-2x"></i></a>
                           <ul class="dropdown-menu" id="notification">
                              <li><a href="#">예약이 완료되었습니다</a></li>
                              <li><a href="#">ana의 회원가입을 환영합니다!</a></li>

                           </ul></li>

                        <!-- Start : mainNav3 - 마이페이지-->
                        <li class="nav-item dropdown"><a
                           class="nav-link dropdown-toggle" id="myMenuIcon"
                           data-toggle="dropdown" href="#"> <i
                              class="fa fa-user fa-2x"></i></a>
                           <ul class="dropdown-menu">
                              <span class="header-menu">메뉴를 선택하세요</span>
                           
                              <li><a onclick="location.href='/account/myAccount/myProfile'" style="cursor: pointer">마이페이지</a></li>
                              <li><a onclick="location.href='/wishlist/list'" style="cursor: pointer"> 관심목록</a></li>
                              <li><a onclick="location.href='/qna/list'" style="cursor: pointer">게시판</a></li>
                          
                              <li><a onclick="location.href='/account/myAccount/'" style="cursor: pointer">설정</a></li>                                                   
                              <li id='mode'></li>
                              <li id="header-menu">
                              <a onclick="javascript:signOut();" style="cursor: pointer"
                                 id="sign-out-btn" data-selenium="sign-out"
                                 data-element-name="sign-out-btn" color="primary">
                                   		 로그아웃
                              </a></li>
                              <div style="display: none;" class=" g-signin2"></div>
                           </ul></li>
                     </ul>
                  </div>
                  <!-- End : mainNavr -->
               </nav>
               <!-- End : GNB -->
            </div>
            <!-- row -->
         </div>
         <!-- End :  container -->
      </div>
      <!-- End : top-bar - 메인 네비게이션 바 -->
   </div>