<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@include file="../../includes/header1.jspf"%>
<title>HanOkay 한오케이- 개인정보</title>

<style type="text/css">
main,
section,
header {
    display: block;
}

form {
    display: block;
    margin-top: 0em;
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

.content_SR::before {
    content: " " !important;
    display: table !important;
}

@media (min-width: 744px) {
    .contentOfInfo_SR {
      width: 58.3333% !important;
      float: left !important;
  }
}

.contentOfInfo_SR {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

.oneInfo_SR {
    border-bottom: 1px solid rgb(235, 235, 235) !important;
}

._hgs47m {
    display: table !important;
    width: 100% !important;
    border-spacing: 0px !important;
}

._n5lh69r {
    display: table-cell !important;
    width: 100% !important;
    vertical-align: top !important;
}

._1p3joamp {
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

.realInfo_SR {
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

._1rtgmd8y {
    display: table-cell !important;
    vertical-align: top !important;
    white-space: nowrap !important;
}
._1p3joamp {
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}
._1asnseo {
    --color-text-muted: #EBEBEB !important;
}


._zj5bk76 {
    font-family: var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    color: var(--color-text-muted, #767676) !important;
}

.btn_box2 {
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

.btn_box3 {
    --color-text-muted: #ebebeb !important;
}

.btn_modify {
    color: #008489 !important;
    font-family: var(
      --font-font_family,
      Circular,
      -apple-system,
      BlinkMacSystemFont,
      Roboto,
      Helvetica Neue,
      sans-serif
    ) !important;
    text-decoration: var(--font-link-text-decoration, none) !important;
}

._b0ybw8s {
    color: var(--color-text-link, #008489) !important;
    font-family: var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    text-decoration: var(--font-link-text-decoration, none) !important;
}

.saveBtn_SR {
    border-radius: var(--border-button-border-radius, 4px) !important;
    font-size: var(--font-button-font-size, 16px) !important;
    line-height: var(--font-button-line-height, 24px) !important;
    letter-spacing: var(--font-button-letter-spacing, normal) !important;
    font-family: var(
      --font-button-font-family,
      Circular,
      -apple-system,
      BlinkMacSystemFont,
      Roboto,
      Helvetica Neue,
      sans-serif
    ) !important;
    text-transform: var(--font-button-text-transform, undefined) !important;
    padding-top: var(--spacing-button-vertical, 10px) !important;
    padding-bottom: var(--spacing-button-vertical, 10px) !important;
    font-weight: var(--font-bold-font-weight, 800) !important;
    border-width: var(--border-button-border-width, 2px) !important;
    padding-left: var(--spacing-button-horizontal, 22px) !important;
    padding-right: var(--spacing-button-horizontal, 22px) !important;
    box-shadow: var(--shadow-button-level0-box-shadow, none) !important;
    background: var(--color-buttons-default-color, #008489) !important;
    border-color: var(--color-buttons-default-border, transparent) !important;
    color: var(--color-buttons-default-text, #ffffff) !important;
}

.saveBtn_SR {
    display: inline-block !important;
    margin: 0px !important;
    position: relative !important;
    text-align: center !important;
    text-decoration: none !important;
    -webkit-transition-property: background, border-color, color !important;
    -moz-transition-property: background, border-color, color !important;
    transition-property: background, border-color, color !important;
    -webkit-transition-duration: 0.2s !important;
    transition-duration: 0.2s !important;
    -webkit-transition-timing-function: ease-out !important;
    transition-timing-function: ease-out !important;
    width: auto !important;
    cursor: pointer !important;
    border-radius: 4px !important;
    font-size: 16px !important;
    line-height: 24px !important;
    letter-spacing: normal !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      Helvetica Neue, sans-serif !important;
    text-transform: undefined !important;
    padding-top: 10px !important;
    padding-bottom: 10px !important;
    font-weight: 800 !important;
    border-width: 2px !important;
    border-style: solid !important;
    padding-left: 22px !important;
    padding-right: 22px !important;
    min-width: 71.19349550499538px !important;
    box-shadow: none !important;
    background: #008489 !important;
    border-color: transparent !important;
    color: #ffffff !important;
}

@media (min-width: 744px) {
    .inputName_SR {
      width: 50% !important;
      float: left !important;
  }
}

._en5l15m {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

.inputNameDetail_SR {
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

  .divBeforeLabelVal_SR {
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
      Helvetica Neue, sans-serif !important;
    font-size: 16px !important;
    font-weight: 400 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}

._1wcr140x {
    font-size: var(--font-form-element-font-size, 16px) !important;
    line-height: var(--font-form-element-line-height, 24px) !important;
    letter-spacing: var(--font-form-element-letter-spacing, normal) !important;
    font-family: var(
      --font-form-element-font-family,
      Circular,
      -apple-system,
      BlinkMacSystemFont,
      Roboto,
      Helvetica Neue,
      sans-serif
    ) !important;
    text-transform: var(
      --font-form-element-text-transform,
      undefined
    ) !important;
    color: #484848 !important;
    padding-top: var(--font-form-element-padding-top, undefined) !important;
    padding-bottom: var(
      --font-form-element-padding-bottom,
      undefined
    ) !important;
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
    font-family: var(
      --font-form-element-font-family,
      Circular,
      -apple-system,
      BlinkMacSystemFont,
      Roboto,
      Helvetica Neue,
      sans-serif
    ) !important;
    text-transform: var(
      --font-form-element-text-transform,
      undefined
    ) !important;
    color: #484848 !important;
    padding-top: var(--spacing-form-element-vertical, 11px) !important;
    padding-bottom: var(--spacing-form-element-vertical, 11px) !important;
    font-weight: var(--font-light-font-weight, normal) !important;
    background-color: transparent !important;
    padding-left: var(--spacing-form-element-horizontal, 11px) !important;
    padding-right: var(--spacing-form-element-horizontal, 11px) !important;
}
  
._9hxttoo {
    display: block !important;
    width: 100% !important;
}

._krjbj {
    border: 0px !important;
    clip: rect(0 0 0 0) !important;
    -webkit-clip-path: inset(100%) !important;
    clip-path: inset(100%) !important;
    height: 1px !important;
    overflow: hidden !important;
    padding: 0px !important;
    position: absolute !important;
    white-space: nowrap !important;
    width: 1px !important;
}

._2h22gn {
    margin-left: -8px !important;
    margin-right: -8px !important;
}

._1q8ezn3a {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
    width: 33.3333% !important;
    float: left !important;
}

@media (min-width: 744px){
._1q8ezn3a {
    width: 41.6667% !important;
    float: left !important;
	}
}

._wlf6154 {
    font-size: var(--font-form-element-font-size, 16px) !important;
    line-height: var(--font-form-element-line-height, 24px) !important;
    letter-spacing: var(--font-form-element-letter-spacing, normal) !important;
    font-family: var(--font-form-element-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    text-transform: var(--font-form-element-text-transform, undefined) !important;
    color: #484848 !important;
    padding-top: var(--font-form-element-padding-top, undefined) !important;
    padding-bottom: var(--font-form-element-padding-bottom, undefined) !important;
    background-color: #ffffff !important;
    margin-bottom: var(--spacing-form-element-margin-bottom, 8px) !important;
}

._y9ev9r {
    overflow: hidden !important;
}

._bwyiq2l {
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
    padding-right: var(--spacing-select-arrow, 40px) !important;
}

option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}

._1idvclr {
    top: var(--spacing-select-arrow-margin-top, 16px) !important;
    right: var(--spacing-select-arrow-margin-outside, 16px) !important;
}

._170x3337 {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
    width: 33.3333% !important;
    float: left !important;
}

._kt3i5a4 {
    border-radius: var(--border-button-border-radius, 4px) !important;
    font-size: var(--font-button-font-size, 16px) !important;
    line-height: var(--font-button-line-height, 24px) !important;
    letter-spacing: var(--font-button-letter-spacing, normal) !important;
    font-family: var(--font-button-font-family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    text-transform: var(--font-button-text-transform, undefined) !important;
    padding-top: var(--spacing-button-vertical, 10px) !important;
    padding-bottom: var(--spacing-button-vertical, 10px) !important;
    font-weight: var(--font-bold-font-weight, 800) !important;
    border-width: var(--border-button-border-width, 2px) !important;
    padding-left: var(--spacing-button-horizontal, 22px) !important;
    padding-right: var(--spacing-button-horizontal, 22px) !important;
    box-shadow: var(--shadow-button-level0-box-shadow, none) !important;
    background: var(--color-buttons-default-color, #008489) !important;
    border-color: var(--color-buttons-default-border, transparent) !important;
    color: var(--color-buttons-default-text, #ffffff) !important;
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

<div class="container">
<section>
	<!-- 타이틀 -->
  <div class="out_SR"> <!-- _2h22gn -->
      <div style="
          position: relative;
          margin-top: 64px;
          margin-bottom: 56px;
          margin-left: 16px;
        ">
        <h1 tabindex="-1" class="header1_SR">
          <div class="header2_SR">개인정보</div>
        </h1>
      </div>
  </div>

<!-- 타이틀 아래 내용물 -->
  <div class="content_SR"> <!-- _2h22gn -->
    <div class="contentOfInfo_SR"> <!-- _169grxv2 -->
    
      <!-- 하나의 정보칸 -->
      <div class="oneInfo_SR"> <!-- _s50zru -->
        <div style="margin-top: 24px;">
          <div class="_hgs47m">
            <div class="_n5lh69r">
              <div class="_1p3joamp">실명</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                  <div class="_czm8crp">  <!-- 세션에서 이름 --></div>
              </div>
            </div>

            <div class="_1rtgmd8y">
              <div class="_1p3joamp">
                <div class="_1asnseo">
                  <button type="button" class="_b0ybw8s" aria-busy="false" onclick='showAndHideInputSection(this);'>
                    수정
                  </button>
                </div>
              </div>
            </div>
            
          </div>
          
          <!-- 여기에 붙어야해 -->
                    <!--수정 눌렸을 때 새로 생성되어야함-->
                  
                  
                  <div id="showAndHide" style="display:none;">
                  <div
                    style="margin-top: 8px; margin-bottom: 24px;"
                    id="inputBeforeForm_SR"
                  >
                    <form method="post">
                      <div style="margin-top: 8px; margin-bottom: 24px;">
                      	<div class="_czm8crp">
                      	허가증이나 여권 등 여행 서류에 기재되어 있는 이름을 말합니다.
                      	</div>
                      </div>	
                    
                      <div style="margin-bottom: 16px;">
                        <div class="_2h22gn">
                          <div class="_en5l15m">
                          <div class="_9hxttoo">
                         
                            <div style="margin-bottom: 8px;">
                              <label class="_rin72m">
                                <div class="_czm8crp">
                                  	이름
                                </div>
                              </label>
                            </div>

                            <div>
                              <div class="_1wcr140x">
                                <div class="_178faes">
                                  <input
                                    class="_14fdu48d"
                                    id="first_name"
                                    name="first_name"
                                    type="text"
                                  />
                                </div> <!-- _178faes -->
                              </div> <!-- _1wcr140x -->
                            </div>
                            
                          </div> <!--_9hxttoo -->
                         </div>
                          
                          <div class="_en5l15m">
                           <div class="_9hxttoo">
                            <div style="margin-bottom: 8px;">
                              <label class="_rin72m">
                                <div class="_czm8crp">
                                  성
                                </div>
                              </label>
                            </div>

                            <div>
                              <div class="_1wcr140x">
                                <div class="_178faes">
                                  <input
                                    class="_14fdu48d"
                                    id="last_name"
                                    name="last_name"
                                    type="text"
                                  />
                                </div>
                              </div>
                             </div>
                             
                             
                            </div> <!-- _9hxttoo -->
                          </div> <!-- _en5l15m  -->

						</div>
						</div>
						
						<div id="airlock-inline-container">
						</div>
						
                          <button
                            type="button"
                            class="_kt3i5a4"
                            aria-busy="false"
                          	onclick="submitChangedName();"
                          >
                            <span class="_ftj2sg4">
                              저장
                            </span>
                          </button>
                        
                    </form>
                 
                  
                  </div>
                  <!--수정 눌렀을 때 끝-->
          
        </div>
      </div> <!-- _s50zru 끝-->

      <!-- 하나의 정보칸 -->
      <div class="oneInfo_SR"> <!-- _s50zru -->
        <div style="margin-top: 24px;">
          <div class="_hgs47m"> <!-- _hgs47m -->
            <div class="_n5lh69r"> <!-- _n5lh69r -->
              <div class="_1p3joamp">생년월일</div> <!-- _1p3joamp -->
              
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="realInfo_SR"> <!-- _czm8crp -->
                	<!-- 생년월일 쓰기 -->
                </div>
              </div>
            </div>

            <div class="btn_box"> <!-- _1rtgmd8y -->
              <div class="btn_box2"> <!-- _1p3joamp -->
                <div class="btn_box3"> <!-- _1asnseo -->
                  <button type="button" class="btn_modify" aria-busy="false" onclick="showAndHideBirthdaySelection(this);">
                    수정
                  </button> <!-- _b0ybw8s -->
                </div>
              </div>
            </div>
            
            
          </div> <!-- hsg47m 끝 -->
          
          
            <!-- 유저 생년월일 -->
                  <div id="showAndHideBday" style=" margin-top: 8px; margin-bottom:24px;">
                  	<form>
                  	 <div style="margin-top: 8px; margin-bottom: 16px;">
                  	 	<div class="_9hxttoo">
                  	 		<label class="_krjbj" for="birthday">
                  	 		생년월일
                  	 		</label>
                  	 			<div role="group" aria-label="생년월일">
                  	 				<div class="_2h22gn">
                  	 				
                  	 					<div class="_1q8ezn3a">
                  	 						<div class="_9hxttoo ">
	                  	 						<label class="_krjbj" >
	                  	 						생년월일
	                  	 						</label>
	                  	 						<div class="_wlf6154">
	                  	 							<div class="._y9ev9r ">
	                  	 								<select class="_bwyiq2l" id ="userBirthMonth" 
	                  	 								name="userBirthdayMonth">
	                  	 									<option>선택하세요</option>
	                  	 								</select>
	                  	 							</div>
	                  	 							<span class="_1idvclr">
	                  	 								<svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 16px; width: 16px; display: block; fill: rgb(72, 72, 72);">
	                  	 								<path d="m16.29 4.3a1 1 0 1 1 1.41 1.42l-8 8a1 1 0 0 1 -1.41 0l-8-8a1 1 0 1 1 1.41-1.42l7.29 7.29z" fill-rule="evenodd">
	                  	 								</path>
	                  	 								</svg>
	                  	 							</span>
	                  	 							
	                  	 						</div>
                  	 						</div>
                  	 					</div>
                  	 					
                  	 					<div class="_1hvy1uuv">
                  	 						<div class="_9hxttoo">
                  	 							<label class="_krjbj" >일</label>
                  	 							<div class="_wlf6154">
                  	 								<div class="_y9ev9r">
                  	 									<select id="userBirthDate" class="_bwyiq2l">
                  	 										<option>선택하세요</option>
                  	 									</select>
                  	 								</div>
                  	 								
                  	 								<span class="_1idvclr">
                  	 									<svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 16px; width: 16px; display: block; fill: rgb(72, 72, 72);">
                  	 										<path d="m16.29 4.3a1 1 0 1 1 1.41 1.42l-8 8a1 1 0 0 1 -1.41 0l-8-8a1 1 0 1 1 1.41-1.42l7.29 7.29z" fill-rule="evenodd">
                  	 										</path>
                  	 									</svg>
                  	 								</span>
                  	 							</div>
                  	 						</div>
                  	 					</div>
                  	 					
                  	 					
                  	 					<div class="_170x3337">
                  	 						<div class="_9hxttoo">
                  	 							<label class="_krjbj">
                  	 								년
                  	 							</label>
                  	 							<div class="_wlf6154">
                  	 								<div class="_y9ev9r">
                  	 									<select id="userBirthYear" class="_bwyiq2l">
                  	 										<option>선택하세요</option>
                  	 									</select>
                  	 								</div>
                  	 							</div>
                  	 						</div>
                  	 					</div>
                  	 					
                  	 					
                  	 					
                  	 			</div>
                  	 		</div>
                  	 	</div>
                  	 </div>
                  	 
                  	 <div class="airlock-inline-container"></div>
                  	 <button type="button" class="_kt3i5a4" aira-busy="false">
                  	 	<span class="._ftj2sg4 ">저장</span>
                  	 </button>                 	
                  	</form>
                  </div>
                  	<!-- 생기는거 끝 -->
                  	
                  </div>        
              
        </div> <!-- _s50zru -->
    
      
      
      
      
      <!-- 하나의 정보칸 -->
      <div class="oneInfo_SR" > <!-- _s50zru -->
        <div style="margin-top: 24px;">
          <div class="_hgs47m">
            <div class="tableCell_SR">
              <div class="titleOfOneInfo_SR">이메일 주소</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="realInfo_SR">
                 	 <!-- 여기에 세션의 이메일 들어가게 -->
                    <!--  <form>
                  <input type="text">
                    </form> -->
                </div>
              </div>
            </div>

            <div class="btn_box">
              <div class="btn_box2">
                <div class="btn_box3">
                  <button type="button" class="btn_modify" aria-busy="false">
                    수정
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- _s50zru -->
      
      
      <!--하나의 정보칸  -->
      <div class="oneInfo_SR"> <!-- _s50zru -->
        <div style="margin-top: 24px;">
          <div class="_hgs47m">
            <div class="tableCell_SR">
              <div class="titleOfOneInfo_SR">연락처</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="realInfo_SR">
                 	<!-- 여기에 유저의 연락처 들어가게  -->
                   <!--  <form >
                    	<input type="text">
                    </form> -->
                </div>
              </div>
            </div>
            <div class="btn_box">
              <div class="btn_box2">
                <div class="btn_box3">
                  <button type="button" class="btn_modify" aria-busy="false">
                    수정
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>  <!-- _s50zru -->
      
      
      	</div> <!-- contentOfInfo_SR -->
      </div>
   </section>
</div>

<script>



   //DOM이 만들어지면
   $(document).ready(function () {
     //페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
     if (window.history.replaceState) {
       window.history.replaceState(null, null, window.location.href);
     }

     //실명에 세션에 있는 정보들을을 넣어주자
     let userNameValue = document.getElementsByClassName("realInfo_SR")[0];
     let userBdayValue = document.getElementsByClassName("realInfo_SR")[1];
     let userEmailValue = document.getElementsByClassName("realInfo_SR")[2];
     let userPhoneNumberValue = document.getElementsByClassName("realInfo_SR")[3];
	
	 let btnModifyArr= document.getElementsByClassName("btn_modify");
	 let nameModifyDiv=document.getElementById("inputBeforeForm_SR");
	 let showHide= document.getElementById("showAndHide");
	 let nameFromS=document.getElementsByClassName("nameFromSession")[0];
	  
	  	//날짜
	  	function appendYear(){

	  		var date = new Date();

	  		var year = date.getFullYear();

	  		var selectValue = document.getElementById("userBirthYear");

	  		var optionIndex = 0;



	  		for(var i=year-100;i<=year;i++){

	  				selectValue.add(new Option(i+"년",i),optionIndex++);                        

	  		}

	  	}





	  	function appendMonth(){

	  		var selectValue = document.getElementById("userBirthMonth"); 

	  		var optionIndex = 0;



	  		for(var i=1;i<=12;i++){

	  				selectValue.add(new Option(i+"월",i),optionIndex++);

	  		}

	  	}





	  	function appendDay(){

	  		var selectValue = document.getElementById("userBirthDate");
	  		var optionIndex = 0;



	  		for(var i=1;i<=31;i++){
	  				selectValue.add(new Option(i+"일",i),optionIndex++);
	  		}

	  	} 
   });


  	function showAndHideInputSection(btnVal){
  	  let nameFromS=document.getElementsByClassName("nameFromSession")[0];

  	if(btnVal.innerText === '수정'){
  		$("#showAndHide").show();
  	  	nameFromS.innerHTML="세린";
  		btnVal.innerText='취소';
  	} else{
  		$("#showAndHide").hide();
    	nameFromS.innerHTML='세린';
  		btnVal.innerText='수정';
  	}
  }
  	
  	function showAndHideBirthdaySelection(btnVal){
  		
  		if(btnVal.innerText === '수정'){
  			$("#showAndHideBday").show();
  			btnVal.innerText='취소';
  		} 
  		else
  		{
  			$("#showAndHideBday").hide();
  			btnVal.innerText='수정';
  		}
  	}
  	
  	function submitChangedName(){
  		let changedLastName=$("#last_name").val();
  		let changedFstName=$("#first_name").val();
  		
  		
  	}
  	
  	



</script>

<%@include file="../../includes/footer.jsp" %>