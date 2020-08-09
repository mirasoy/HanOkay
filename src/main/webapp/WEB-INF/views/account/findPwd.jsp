<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../includes/header1.jspf"%>
<title>HanOkay - 비밀번호 찾기</title>
<style>
main{
	display: block;
}

body{
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, sans-serif;
    font-size: 14px;
    line-height: 1.43;
    color: #484848;
    background-color: #fff;
    margin: 0;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

*, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -ms-flex: 0 1 auto;
}


.container {
    margin-left: auto !important;
    margin-right: auto !important;
    width: auto !important;
    padding-right: 24px !important;
    padding-left: 24px !important;
}

@media (min-width: 744px){
.container {
    max-width: 696px !important;
	}
}

.header1_SR{
    color: inherit !important;
    font-size: 1em !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    margin: 0px !important;
    padding: 0px !important;
}

.titleOfHeader1_SR{
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 32px !important;
    font-weight: 800 !important;
    line-height: 1.125em !important;
    color: #484848 !important;
}

.content_SR{
    margin-left: -8px !important;
    margin-right: -8px !important;
    position: absolute;
    top: 168px;
}

.content2_SR{
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

.container3_SR {
    padding-left: 24px !important;
    padding-right: 24px !important;
    margin: 5px auto!important;
    border: 1px solid #dadfe6;
    border-radius: 16px;
    background-color: #ffffff !important;
    height: 346px;
    width: 591px;
}

.titleOfOneInfo_SR {
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 24px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}

</style>
<%@include file="../includes/header2.jspf"%>
<%@include file="../includes/header3.jspf"%>


<main>
 	<div class="container">
 		<div style="position:absolute; margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">
 			<section>
 				<div style="margin-top:64px;margin-bottom:56px;margin-left:16px">
					<h1 class="header1_SR">
						<div class="titleOfHeader1_SR">
							비밀번호 찾기
						</div>
					</h1>
 				</div>
 			</section>
 		
 		<div class="content_SR">
 			<div class="content2_SR">
 				<div class="container3_SR">
 					<div style="margin: 30px auto;">
 					
					<form name="form" method="post">
						<div style="font-size: 20px;">
							<span style="font-weight: 400">본인 확인을 위해 회원가입을 진행했던 이메일을 입력하세요 </span>
							
							<label style="color: red; font-weigth: 300" id="msg">
							<c:out value="${msg}" />
							</label>
						
							<div style="margin-top:40px;">
								<div style="margin-top: 48px;">
								
									<div class="titleOfOneInfo_SR">
									Email: 
									</div>
								
									<div style="margin-top: 16px;">
										<input type="text" size="51" name="email" id="email" 
										placeholder="회원가입을 진행했던 이메일을 입력하세요" value="${email }">
									</div>
								</div>
								
								<div style="margin-top: 66px;">
									<button class="btn btn-default" type="button" id="sendEmailBtn" style="width: 541px;">
										발송하기
									</button>
								</div>
			
								<input  type="hidden" id="msg2" value="${msg2 }">	
						
							</div>
						</div>
					</form> 	
					</div>
				</div>
			</div>	
		</div>
		
		</div>
	</div>
	
	<div style="display: none;">
		<form id="hiddenForm" method="post">
			<input type="text" id="hiddenEmail" name="hiddenEmail" value="${hiddenEmail }" >
		</form>
	</div>
	
</main>
	
	
	<script>
	
	//이메일 정규식 확인
	
	$(document).ready(function(){
		
	//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
	if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    } 
	
	});
	
	//인증메일 발송하기 버튼을 누르면
	$("#sendEmailBtn").on("click", function(){
		
		let email= $("#email").val();
		let hiddenEmail = $("#hiddenEmail");
		let hiddenForm= $("#hiddenForm");
		
           $.ajax({
         	   type: 'POST',
         	   url: '/account/accountRecovery',
         	   dataType: 'json',
         	   data: {
         		   'email': email
         	   },
         	   
         	   success: function(data){
         		   
         		   if(data.msg==='fail'){
         			  $('.container3_SR').css("height","376px");
         			  $('#msg').text("입력한 이메일은 등록되어있지 않습니다!");
         		   }
         		   else if(data.msg ==='success'){
         			  
         			  hiddenEmail.val(data.hiddenEmail);
         			  hiddenForm.attr("action","/account/emailAuth"); 
         			  hiddenForm.submit();
         		   }
         		  
         	   },
         	   error: function(data){
         		  window.location.href ="../error/error";
         	   }
         	 });
		 
		
	
	});

	</script>

<%@include file="../includes/footer.jsp"%>