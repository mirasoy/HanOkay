<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 

<%@include file="../../includes/header1.jspf"%>
<title>HanOkay-프로필</title>
<style type="text/css">

*, ::after, ::before {
    box-sizing: border-box;
}

body {
    font-family: 'Open Sans', Helvetica, Arial, sans-serif;
    font-size: 13px;
    font-weight: 300;
}

body {
    background: #f8f9fa;
    margin-top: 120px;
}

section, nav, main, header, div{
 	display: block;
  }
  

  @media (min-width: 1200px) {
    .container-1 {
      max-width: 1140px;
      margin: 0 auto;
    }
  }

  .container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
  }
  
  .out_SR {
    margin-left: -8px !important;
    margin-right: -8px !important;
  }

  .out_SR:before {
    content: " " !important;
    display: table !important;
  }

  .header1_SR {
    color: inherit !important;
    font-size: 1em !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    margin-left: 14px !important;
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
    margin: 0px !important;
  }

  .nameInHeader_SR {
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
  }

  .emailInHeader_SR {
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
  }
  
  
  .sidebar{
  	width: 200px;
    border: 1px solid #dadfe6;
    border-radius: 16px;
    position: fixed;
    z-index: 1;
    top: 310px;
    background: #fff;
    overflow-x: hidden;
    padding: 8px 0;
  }
  
  .sidebar_detail{
    box-sizing: border-box;
  }
  
  .sidebar_header{
    height: 90px;
   	padding: 11px;
  }
  
  .user_pic{
    float: left;
    width: 60px;
    border-radius: 50px;
    margin-right: 15px;
    overflow: hidden;
  }
  
  .user_info{
    padding-top: 7px;
  }
  
 .nav_{
 	background-color: #fff;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 200px;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
    border-bottom: 1px solid #dadfe6;
 }
 
 .nav_last{
	 border-bottom: none;
 }
 .mypage_btn{
 	background-color: #F5F7FF;
    text-align: center;
 }
 
 
 
 .side-panel{
 	padding: 0 18px;
    background-color: white;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
 }
 
 .contents {
    margin-left: 220px;
    padding: 0px 10px;
}

.contents-2 {
    margin-left: 45px;
    box-shadow: 0 4px 10px 0 #bec2c9;
    transition: box-shadow .3s ease;
    margin-top: 93px;
    height: 274px;
}

 
</style>

<%@include file="../../includes/header2.jspf"%> 
<%@include file="../../includes/header3.jspf"%>
<div class="container-1">
<div class="container">

  <div class="out_SR">
    <section style="display: block;">
      <div style="position: relative; margin-top: 64px; margin-bottom: 56px; margin-left: 16px;">
        <h1 tabindex="-1" class="header1_SR">
          <div class="header2_SR">
            내 프로필
          </div>
        </h1>

        <div style="margin-top: 8px; margin-bottom: 16px;">
          <span class="nameInHeader_SR">
            <!-- 이름  -->
          </span>
          <span class="emailInHeader_SR">
            <!-- 이메일  -->
          </span>
        </div>
      </div>
    </section>
  </div>
  
  
  <section class="sidebar">
  	<div class="sidebar_detail">
  	
  		<div class="sidebar_header">
  			<div class="user_pic">
  			</div>
  	
  			<div class="user_info">
  			</div>
  		</div>
  	
  	<div class="mypage_btn nav_" >
  	마이 페이지
  	</div>
  	
  	<div class="acordian nav_" style="text-align:center;">
  	나의 예약
  	</div>
  	<div class="side-panel"></div>
  	
  	<div class="nonaccordian nav_" style="text-align:center;">
  	받은 편지함
  	</div>
  	<div class="nonaccordian nav_" style="text-align:center;">
  	찜목록
  	</div>
  	<div class="nonaccordian nav_" style="text-align:center;">
  	리뷰
  	</div>
  	<div class="nonaccordian nav_ nav_last" style="text-align:center;">
  	회원정보
  	</div>
  	</div>
  </section>
  
  
  <section class="contents">
  <section class="contents-2">
  </section>
  </section>
  
  
</div>
</div>

<script>
  $(document).ready(function () {
    //페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
    if (window.history.replaceState) {
      window.history.replaceState(null, null, window.location.href);
    }
  });
</script>

<%@include file="../../includes/footer.jsp"%>
