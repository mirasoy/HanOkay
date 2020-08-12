<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../../includes/header1.jspf"%>
<title>Han:Ok - 로그인 및 보안</title>
<style type="text/css">

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

.container{
    margin-left: auto !important;
    margin-right: auto !important;
    width: auto !important;
    padding-right: 24px !important;
    padding-left: 24px !important;
}

.container1_SR{
	margin-left: auto !important;
    margin-right: auto !important;
    width: auto !important;
    padding-right: 24px !important;
    padding-left: 24px !important;
}

@media (min-width: 1128px){
.container1_SR {
    max-width: 1080px !important;
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

.contents_SR {
    margin-left: -8px !important;
    margin-right: -8px !important;
}

.content_SR{
	padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

.leftContent_SR{
	padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

@media (min-width: 744px){
.content_SR {
    width: 58.3333% !important;
    float: left !important;
	}
}


.headerOfContent_SR{
	padding-top: 32px !important;
    padding-bottom: 24px !important;
    border-bottom: 0px !important;
}

.header2OfContent_SR{
	color: inherit !important;
    font-size: 1em !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    margin: 0px !important;
    padding: 0px !important;
}

.header3OfContent_SR{
	overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-size: 24px !important;
    font-weight: 800 !important;
    line-height: 1.25em !important;
    color: rgb(72, 72, 72) !important;
    padding-top: 2px !important;
    padding-bottom: 2px !important;
    margin: 0px !important;
}

.contentOfContents_SR{
    border-bottom: 1px solid rgb(235, 235, 235) !important;
}

.content2OfContents_SR{
	display: table !important;
    width: 100% !important;
    border-spacing: 0px !important;
}

.leftOfContent2_SR{
	display: table-cell !important;
    width: 100% !important;
    vertical-align: top !important;
}

.titleOfLeftContent_SR{
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}


.rightOfContent2_SR{
	display: table-cell !important;
    vertical-align: top !important;
    white-space: nowrap !important;
}

.right2OfContent2_SR{
	margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}

 .right3OfContent2_SR{
--color-text-muted: #EBEBEB !important;
} 

.updateBtn_SR{
	color: rgb(0, 132, 137) !important;
    appearance: none !important;
    cursor: pointer !important;
    user-select: auto !important;
    text-align: left !important;
    font: inherit inherit inherit inherit inherit inherit inherit inherit inherit !important;
    text-decoration: none !important;
    background: transparent !important;
    border-width: 0px !important;
    border-style: initial !important;
    border-color: initial !important;
    border-image: initial !important;
    margin: 0px !important;
    padding: 0px !important;
}

.dateOfLastModified_SR{
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}

._17pxz94u {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

@media (min-width: 744px){
._17pxz94u {
    width: 33.3333% !important;
    float: left !important;
    margin-left: 8.33333% !important;
	}
}

._16tcko6 {
    padding-left: 24px !important;
    padding-right: 24px !important;
    background-color: rgb(255, 255, 255) !important;
    margin: 0px !important;
    border-width: 1px !important;
    border-style: solid !important;
    border-color: rgb(228, 228, 228) !important;
    border-image: initial !important;
}

._14i3z6h {
    color: inherit !important;
    font-size: 1em !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    margin: 0px !important;
    padding: 0px !important;
}

._1p0spma2 {
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 18px !important;
    font-weight: 800 !important;
    line-height: 1.4444444444444444em !important;
    color: #484848 !important;
}

._czm8crp {
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}

._9hxttoo {
    display: block !important;
    width: 100% !important;
}

._rin72m {
    cursor: pointer !important;
    display: block !important;
    background: transparent !important;
    border-width: 0px !important;
    border-style: initial !important;
    border-color: initial !important;
    border-image: initial !important;
    padding: 0px !important;
}

div[Attributes Style] {
    direction: ltr;
    unicode-bidi: isolate;
}

._1wcr140x {
    font-size: var(--font-form-element-font-size, 16px) !important;
    line-height: var(--font-form-element-line-height, 24px) !important;
    letter-spacing: var(--font-form-element-letter-spacing, normal) !important;
    font-family: var(--font-form-element-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    text-transform: var(--font-form-element-text-transform, undefined) !important;
    color: #484848 !important;
    padding-top: var(--font-form-element-padding-top, undefined) !important;
    padding-bottom: var(--font-form-element-padding-bottom, undefined) !important;
    background-color: #ffffff !important;
    margin-bottom: var(--unit, 8px) !important;
}

._178faes {
    position: relative !important;
    overflow: hidden !important;
}

._14fdu48d {
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
}

._kt3i5a4 {
    font-size: var(--font-button-font-size, 16px) !important;
    line-height: var(--font-button-line-height, 24px) !important;
    letter-spacing: var(--font-button-letter-spacing, normal) !important;
    font-family: var(--font-button-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    text-transform: var(--font-button-text-transform, undefined) !important;
    padding-top: var(--spacing-button-vertical, 10px) !important;
    padding-bottom: var(--spacing-button-vertical, 10px) !important;
    font-weight: var(--font-bold-font-weight, 800) !important;
    padding-left: var(--spacing-button-horizontal, 22px) !important;
    padding-right: var(--spacing-button-horizontal, 22px) !important;
    box-shadow: var(--shadow-button-level0-box-shadow, none) !important;
    color: #007bff !important;
}

._ftj2sg4 {
    font-size: var(--font-button-font-size, 16px) !important;
    line-height: var(--font-button-line-height, 24px) !important;
    letter-spacing: var(--font-button-letter-spacing, normal) !important;
    font-family: var(--font-button-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    text-transform: var(--font-button-text-transform, undefined) !important;
    padding-top: var(--font-button-padding-top, undefined) !important;
    padding-bottom: var(--font-button-padding-bottom, undefined) !important;
}

</style>
<%@include file="../../includes/header2.jspf"%>
<%@include file="../../includes/header3.jspf"%>

	<div class='container'>
	 <div class='container1_SR'>
	  <div style="margin:0px;">
	   <div style="margin-bottom:48px;">
	   <section>
	   
	   	<div style="margin-top: 40px; margin-bottom: 40px;">
	   	 <div style="margin-top: 12px;">   
	      <h1 tabindex="-1" class="header1_SR">
	       <div class="titleOfHeader1_SR">
	                로그인 및 보안
	       </div>
	      </h1>
	     
	     
	     </div>
	    </div>
	    
	    <div class="contents_SR">
	     <div class="content_SR">
	    	<section>
	    		<div class="headerOfContent_SR">
	    			<h2 class="header2OfContent_SR">
		    			<div class="header3OfContent_SR">
		    			로그인    			
		    			</div>    			
	    			</h2>
	    		</div>
	    	
	    	
		    	<div class="contentOfContents_SR">
		    		<div style="margin-top: 24px;">
		    		
		    			<div class="content2OfContents_SR">
		    			
		    				<div class="leftOfContent2_SR">
		    					<div class="titleOfLeftContent_SR">
		    						비밀번호
		    					</div>
		    				
		    				<!-- 사라졌다 생겼다 해야해 시작 -->
		    					<div style="margin-top: 8px; margin-bottom: 24px;">
		    						<div class="dateOfLastModified_SR">
		    						 최종수정일: 2020
		    						</div>
		    					</div>
		    				<!-- 사라졌다 생겼다 해야해 끝 -->
		    					
		    				</div>
		    			
		    				<div class="rightOfContent2_SR">
		    					<div class="right2OfContent2_SR">
		    						<div class="right3OfContent2_SR">
		    							<button type="button" class="updateBtn_SR" aria-busy="false" onclick="changeInnerText(this);">
		    								업데이트
		    								<!--  클릭하면 취소로 바뀌어야함 -->
		    							</button>
		    						</div>
		    					</div>
		    				</div>
		    			
		    			</div>
		    			
		    			<div id="msgSite" style="display:none;">
		    			<span id="msg" name="msg">하이루</span>
		    			</div>
		    			
		    			<!-- 업데이트 누르면 생기고 -->
		    			<div style="display:none; margin-top: 8px; margin-bottom: 24px;" id="modifyContent">
		    				<form>
		    					<div style="margin-bottom: 16px;">
		    						<div class="_9hxttoo">
		    							<div style="margin-bottom: 8px;">
		    								<label class="_rin72m">
		    									<div class="_czm8crp">
		    										현재 비밀번호
		    									</div>
		    								</label>
		    							</div>
		    							
		    							<div dir="ltr">
		    								<div class="_1wcr140x ">
		    									<div class="_178faes">
		    										<input class="_14fdu48d" id="old_password" name="old_password" type="text">
		    									</div>
		    								</div>
		    							</div>
		    						</div>
		    						<div class="_9hxttoo">
		    						<div style="margin-bottom: 8px;">
		    								<label class="_rin72m">
		    									<div class="_czm8crp">
		    										새 비밀번호
		    									</div>
		    								</label>
		    							</div>
		    							
		    							<div dir="ltr">
		    								<div class="_1wcr140x ">
		    									<div class="_178faes">
		    										<input class="_14fdu48d" id="user_password" name="user_password" type="text">
		    									</div>
		    								</div>
		    							</div>
		    						</div>
		    						<div class="_9hxttoo">
		    						<div style="margin-bottom: 8px;">
		    								<label class="_rin72m">
		    									<div class="_czm8crp">
		    										비밀번호 확인
		    									</div>
		    								</label>
		    							</div>
		    							
		    							<div dir="ltr">
		    								<div class="_1wcr140x ">
		    									<div class="_178faes">
		    										<input class="_14fdu48d" id="user_passwordConfirm" name="user_passwordConfirm" type="text">
		    									</div>
		    								</div>
		    							</div>
		    						</div>
		    					</div>
		    					
		    					<div id="airlock-inline-container">
		    					</div>
		    					<button type="button" id="changePasswordSubmitBtn" class="_kt3i5a4" aria-busy="false" >
		    						<span class="_ftj2sg4">
		    							비밀번호 변경
		    						</span>
		    					</button>
		    				</form>
		    			</div>
		    			<!-- 취소 누르면 사라지고 -->
		    		</div>
		    	</div>
	    	</section>
	      
	     </div>	     
	    <div class="_17pxz94u ">
	    	<div class="_16tcko6">
	    		<section>
	    			<div style="margin-top: 32px; margin-bottom: 32px;">
	    				<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"
	    				style="height: 40px; width: 40px; display: block; fill: rgb(255, 180, 0);" >
	    					<path d="m5 20.5a.5.5 0 0 1 -.5.5h-.5v.5a.5.5 0 0 1 -1 0v-.5h-.5a.5.5 0 0 1 0-1h .5v-.5a.5.5 0 0 1 1 0v .5h.5a.5.5 0 0 1 .5.5zm1.5 1.5a.5.5 0 1 0 .5.5.5.5 0 0 0 -.5-.5zm16-20h-.5v-.5a.5.5 0 0 0 -1 0v .5h-.5a.5.5 0 0 0 0 1h .5v.5a.5.5 0 0 0 1 0v-.5h.5a.5.5 0 0 0 0-1zm-2.58 4.87a13.41 13.41 0 0 1 -6.76-3.2.37.37 0 0 0 -.63.26l.08 16.22a.38.38 0 0 0 .55.32 11.98 11.98 0 0 0 7.07-13.31.37.37 0 0 0 -.31-.3z">
	    					</path>
	    					<path d="m14.39 8.32a1.93 1.93 0 0 0 -3.66 0l-2.42 4.85a3.09 3.09 0 0 0 -.4 1.61 2.36 2.36 0 0 0 2.23 2.23 3.95 3.95 0 0 0 2.42-1.06 3.95 3.95 0 0 0 2.42 1.06 2.36 2.36 0 0 0 2.23-2.23 3.09 3.09 0 0 0 -.4-1.61zm-2.72 4.38c0-.05.01-1.23.89-1.23s.88 1.18.88 1.23a3.25 3.25 0 0 1 -.88 1.83 3.25 3.25 0 0 1 -.89-1.83zm3.31 3.31a2.92 2.92 0 0 1 -1.71-.77 4.3 4.3 0 0 0 1.17-2.54 2.02 2.02 0 0 0 -1.8-2.22l-.08-.01a2.02 2.02 0 0 0 -1.89 2.15l.01.08a4.29 4.29 0 0 0 1.17 2.54 2.92 2.92 0 0 1 -1.71.77 1.36 1.36 0 0 1 -1.23-1.23 2.13 2.13 0 0 1 .29-1.16l2.42-4.85c.33-.65.55-.76.94-.76s.61.11.94.76l2.42 4.85a2.13 2.13 0 0 1 .29 1.16 1.36 1.36 0 0 1 -1.23 1.23zm7.01-10.35a.5.5 0 0 0 -.43-.4 13.03 13.03 0 0 1 -8.68-4.57.52.52 0 0 0 -.77 0 13.03 13.03 0 0 1 -8.68 4.57.5.5 0 0 0 -.43.4c-1.58 8.19 1.55 14.02 9.3 17.31a.5.5 0 0 0 .39 0c7.75-3.29 10.87-9.11 9.3-17.31zm-9.49 16.3c-7.1-3.09-9.91-8.25-8.57-15.76a13.98 13.98 0 0 0 8.57-4.43 13.98 13.98 0 0 0 8.57 4.43c1.33 7.51-1.48 12.67-8.57 15.76z">
	    					</path>
	    				</svg>
	    				<div style="margin-top: 16px; margin-bottom: 16px;">
	    					<h2 tabindex="-1" class="_14i3z6h">
	    						<div class="_1p0spma2">
	    							계정 보안 유지
	    						</div>
	    					</h2>
	    				</div>
	    				
	    				<div class="_czm8crp">
	    					한오케이는 최고의 보안을 위해 계정을 정기적으로 검토합니다. 계정 보안을 강화할 수 있는 조치가 더 있다면 알려드리겠습니다.
	    				</div>
	    			</div>
	    		</section>
	    	</div>
	    </div>
	    </div>
	    
	    
	   </section>
	   </div>
	   
	   
	  </div>
	 </div>
	</div>
	

	<script>
	$(document).ready(function(){
		
	//페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
	if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
	});
	
	
	//버튼의 innerText를 변경해주고 인풋을 보여주고 안보여주고를 조작하는 기능
	function changeInnerText(btnVal){
		
		if(btnVal.innerText==='업데이트'){
			$("#msgSite").show();
			$("#modifyContent").show();
			btnVal.innerText='취소';
			
		}
		else{
			$("#msgSite").hide();
			$("#modifyContent").hide();
			btnVal.innerText='업데이트';
		}
	}
	
	$("#changePasswordSubmitBtn").on("click", function(){
		
		let currentPassword=$("#old_password").val();
		let newPassword=$("#user_password").val();
		let newPasswordConfirm= $("user_passwordConfirm").val();
		let userNum=<%=userNum %>;
		
           $.ajax({
         	   type: 'POST',
         	   url: '/account/myAccount/security',
         	   dataType: 'json',
         	   data: {
         		   'userNum': userNum,
         		   'currentPassword': currentPassword,
         		   'newPassword': newPassword,
         		   'newPasswordConfirm': newPasswordConfirm,
         	   },
         	   
         	   success: function(data){
         		   
         		   /* if(data.msg==='fail'){
         			  $('.container3_SR').css("height","376px");
         			  $('#msg').text("입력한 이메일은 등록되어있지 않습니다!");
         		   }
         		   else if(data.msg ==='success'){
         			 
         		   } */
         		  
         	   },
         	   error: function(data){
         		  window.location.href ="../error/error";
         	   }
         	 });
		
	});
	</script>

<%@include file="../../includes/footer.jsp"%>