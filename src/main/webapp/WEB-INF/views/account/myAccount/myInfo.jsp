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

*, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -ms-flex: 0 1 auto;
}

form {
    display: block;
    margin-top: 0em;
}
button {
    appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(buttontext, rgb(170, 170, 170));
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: -internal-light-dark(rgb(239, 239, 239), rgb(74, 74, 74));
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(195, 195, 195));
    border-image: initial;
}
.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}

._14i3z6h {
    color: inherit !important;
    font-size: 1em !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    margin: 0px !important;
    padding: 0px !important;
}

._1yrl4d7p {
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 32px !important;
    font-weight: 800 !important;
    line-height: 1.125em !important;
    color: #484848 !important;
}

._2h22gn {
    margin-left: -8px !important;
    margin-right: -8px !important;
}

._2h22gn::before {
    content: " " !important;
    display: table !important;
}

._s50zru {
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

._edoeiqi {
    border-bottom: 0px !important;
    padding-top: 16px !important;
    padding-bottom: 0px !important;
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
    font-size: 27px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}

._uhll0py {
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
    color: #008489 !important;
}
._1asnseo {
    --color-text-muted: #EBEBEB !important;
}


._zj5bk76 {
    font-family: var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    color: var(--color-text-muted, #767676) !important;
}

._b0ybw8s {
	font-size: 22px;
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
    color: var(--color-text-link, #007bff) !important;
    font-family: var(--font-font_family, Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif) !important;
    text-decoration: var(--font-link-text-decoration, none) !important;
}

._en5l15m {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
}

._kf28kaj {
    padding-top: 16px !important;
    padding-bottom: 16px !important;
    border-bottom: 0px !important;
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
._1iti0ju {
    display: inline-block !important;
    vertical-align: middle !important;
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
    width: 100% !important;
    border-width: 0px !important;
    border-style: initial !important;
    border-color: initial !important;
    border-image: initial !important;
    margin: 0px !important;
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
display: block !important;
    width: 100% !important;
    border-width: 1px !important;
    border-style: solid !important;
    border-color: rgb(235, 235, 235) !important;
    border-radius: 4px !important;
        position: relative !important;
    
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
    color: #007bff !important;
    padding-top: var(--spacing-form-element-vertical, 11px) !important;
    padding-bottom: var(--spacing-form-element-vertical, 11px) !important;
    font-weight: var(--font-light-font-weight, normal) !important;
    background-color: transparent !important;
    padding-left: var(--spacing-form-element-horizontal, 11px) !important;
    padding-right: var(--spacing-select-arrow, 40px) !important;
        appearance: none !important;
	    text-indent: 0px !important;
	    height: unset !important;
	    display: block !important;
	    width: 100% !important;
	    border-width: initial !important;
	    border-style: none !important;
	    border-color: initial !important;
	    border-image: initial !important;
	    border-radius: 0px !important;
	    margin: 0px !important;
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
        position: absolute !important;
    	line-height: 0 !important;
    	pointer-events: none !important;
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
    background: var(--color-buttons-default-color, #007bff) !important;
    border-color: var(--color-buttons-default-border, transparent) !important;
    color: var(--color-buttons-default-text, #ffffff) !important;
}

._kt3i5a4 {
    display: inline-block !important;
    position: relative !important;
    text-align: center !important;
    transition-property: background, border-color, color !important;
    transition-duration: 0.2s !important;
    transition-timing-function: ease-out !important;
    width: auto !important;
    cursor: pointer !important;
    font-size: 16px !important;
    line-height: 24px !important;
    letter-spacing: normal !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    padding-top: 10px !important;
    padding-bottom: 10px !important;
    font-weight: 800 !important;
    padding-left: 22px !important;
    padding-right: 22px !important;
    min-width: 71.1935px !important;
    box-shadow: none !important;
    color: rgb(255, 255, 255) !important;
    margin: 0px !important;
    text-decoration: none !important;
    border-radius: 4px !important;
    border-width: 2px !important;
    border-style: solid !important;
    background: #007bff !important;
    border-color: transparent !important;
}

span[Attributes Style] {
    direction: ltr;
    unicode-bidi: isolate;
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
._1hvy1uuv {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
    width: 33.3333% !important;
    float: left !important;
}
._czm8crp {
    margin: 0px !important;
    word-wrap: break-word !important;
    font-family: Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;
    font-size: 20px !important;
    font-weight: 400 !important;
    line-height: 1.375em !important;
    color: #484848 !important;
}
</style>

<%@include file="../../includes/header2.jspf"%> 
<%@include file="../../includes/header3.jspf"%>

<div class="container">
<section>
	<!-- 타이틀 -->
  <div style="margin-top:40px;margin-bottom:40px"> <!-- _2h22gn -->
      <div style="
          position: absolute;
          margin-top: 64px;
          margin-bottom: 56px;
          margin-left: 16px;
        ">
        <h1 tabindex="-1" class="_14i3z6h">
          <div class="_1yrl4d7p">개인정보</div>
        </h1>
      </div>
  </div>

<!-- 타이틀 아래 내용물 -->
  <div class="_2h22gn" style="padding-top: 16%; padding-left: 3%;"> 
    <div class="_169grxv2"> 
    
      <!-- 하나의 정보칸 -->
      <div class="_s50zru"> <!-- _s50zru -->
        <div style="margin-top: 24px;">
          <div class="_hgs47m">
            <div class="_n5lh69r">
              <div class="_1p3joamp">실명</div>
              <div id="showName" style="margin-top: 8px; margin-bottom: 24px;" >
                  <div class="_czm8crp" id="userName"><!-- 여기 이름 --></div>
              </div>
            </div>

            <div class="_1rtgmd8y">
              <div class="_1p3joamp">
                <div class="_1asnseo">
                  <button type="button" class="_b0ybw8s" aria-busy="false" onclick="changeTextAndShowOrHide(this,0);">
                    수정
                  </button>
                </div>
              </div>
            </div>
            
          </div>
         
          <!-- 여기에 붙어야해 -->
              <!--수정 눌렸을 때 새로 생성되어야함-->
                  
                  
                  <div id="hideNShow0" style="display:none;">
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
      </div> 
	</div> 
	
      <!-- 하나의 정보칸 -->
      <div class="_s50zru">
        <div style="margin-top: 24px;">
          <div class="_hgs47m"> 
            <div class="_n5lh69r"> 
              <div class="_1p3joamp">생년월일</div> 
              
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="_czm8crp"> 
                	<!-- 생년월일 쓰기 -->
                </div>
              </div>
            </div>

            <div class="_1rtgmd8y"> <!-- _1rtgmd8y -->
              <div class="_1p3joamp"> <!-- _1p3joamp -->
                <div class="_1asnseo"> <!-- _1asnseo -->
                  <button type="button" class="_b0ybw8s" aria-busy="false" onclick="changeTextAndShowOrHide(this,1);">
                    수정
                  </button> <!-- _b0ybw8s -->
                </div>
              </div>
            </div>
            
            
          </div> <!-- hgs47m 끝 -->
          
          
            <!-- 유저 생년월일 -->
            <div id="hideNShow1"  style=" display: none;">
                  <div style="margin-top: 8px; margin-bottom:24px;">
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
	                  	 							<div class="_y9ev9r ">
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
	                  	 							
	                  	 						</div> <!-- _wlf6154  -->
                  	 						</div> <!-- _9hxttoo  -->
                  	 					</div> <!--_1q8ezn3a  -->
                  	 					
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
                  	 					</div> <!-- _1idvclr -->
                  	 					
                  	 					
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
                  	 								
                  	 								<span class="_1idvclr">
                  	 									<svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 16px; width: 16px; display: block; fill: rgb(72, 72, 72);">
                  	 										<path d="m16.29 4.3a1 1 0 1 1 1.41 1.42l-8 8a1 1 0 0 1 -1.41 0l-8-8a1 1 0 1 1 1.41-1.42l7.29 7.29z" fill-rule="evenodd">
                  	 										</path>
                  	 									</svg>
                  	 								</span>
                  	 								
                  	 							</div>
                  	 						</div>
                  	 					</div>
                  	 					
                  	 			</div>
                  	 		</div>
                  	 	</div>
                  	 </div>
                  	 
                  	 <div class="airlock-inline-container"></div>
                  	 
                  	 <button type="button" class="_kt3i5a4" aira-busy="false">
                  	 	<span class="_ftj2sg4 ">저장</span>
                  	 </button>  
                  	                	
                  	</form>
                  </div>
                  </div>
                  	<!-- 생기는거 끝 -->
                 
                 	
           </div>        
        </div> <!-- _s50zru -->
    
      
      
      
      
      <!-- 하나의 정보칸 -->
      <div class="_s50zru" >
        <div style="margin-top: 24px;">
          <div class="_hgs47m">
            <div class="_n5lh69r">
              <div class="_1p3joamp">이메일 주소</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="_czm8crp" id="userEmail">
                 	 <!-- 여기 이메일 주소 -->
                </div>
              </div>
            </div>

            <div class="_1rtgmd8y">
              <div class="_1p3joamp">
                <div class="_1asnseo">
                  <button type="button" class="_b0ybw8s" aria-busy="false" onclick="changeTextAndShowOrHide(this,2);">
                    수정
                  </button>
                </div>
              </div>
            </div>
            
            
            
            
          </div> <!-- -_hgs47m -->
          
          
          <!-- 새로 생기는 이메일 인풋 -->
          <div id="hideNShow2" style="display: none; margin-top: 8px; margin-bottom: 24px;">
          	<form>
          		<div style="margin-top: 8px; margin-bottom: 24px;">
          			<div class="_czm8crp">
          				언제든지 확인하실 수 있는 주소를 사용하세요
          			</div>
          		</div>
          		
          		<div style="margin-bottom: 24px;">
          			<div class="_9hxttoo">
          				<label class="_krjbj">
          					이메일
          				</label>
          				
          				<div>
          					<div class="_1wcr140x">
          					 <div class="_178faes">
          					 	<input class="_14fdu48d" id="userEmail" name="userEmail" type="text" />
          					 </div> <!-- _178faes -->
          					</div> <!-- _1wcr140x -->
          				</div>
          				
          			</div>
          		</div>
          		 
          		 
          		 <div id="airlock-inline-container"></div>
          		 
          		 <button type="button" class="_kt3i5a4" aria-busy="false">
          		 	<span class="_ftj2sg4">
          		 		저장
          		 	</span>	 
          		 </button>
          	</form>
          </div> <!-- 새로 생기는 이메일 인풋  끝-->
          
          
        </div>
      </div> <!-- _s50zru -->
      
      
      <!--하나의 정보칸  -->
      <div class="_s50zru"> <!-- _s50zru -->
        <div style="margin-top: 24px;">
          <div class="_hgs47m">
            <div class="_n5lh69r">
              <div class="_1p3joamp">연락처</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div style="margin-top:-16px">
                
                <div class="_edoeiqi">
                 <div class="_12d0llg5">
                  <div class="_qo24lwc">
                   <span class="_czm8crp" id="userPhone">
                   	<!-- <span dir="ltr">
                   	연락처~~
                   	</span> -->
                   </span>
                  </div> <!-- _qo24lwc -->
               
                 </div> <!-- _12d0llg5 -->
                </div> <!-- _edoeiqi -->
                
              </div>
              </div>
              
            </div> <!-- _n5lh69r -->
            
            
            <div class="_1rtgmd8y">
              <div class="_1p3joamp">
                <div class="_1asnseo">
                  <button type="button" class="_b0ybw8s" aria-busy="false" onclick="changeTextAndShowOrHide(this,3);">
                    수정
                  </button>
                </div>
              </div>
            </div>
            
          </div> <!-- _hgs47m -->
          
          
          
          <!-- 사라지고 생기고 -->
          <div id="hideNShow3" style="display: none; margin-top: 8px; margin-bottom: 24px;">
          	<form>
          		<div style="margin-bottom: 8px;">
          			<div class="_czm8crp">
          			 알림, 미리 알림 및 로그인에 도움이 됩니다.
          			</div>
          		</div>
          		
          		<div class="_kf28kaj">
          			<div class="_12d0llg5">
          				<div class="_qo24lwc">
          					<span class="_czm8crp">
          						<span dir="ltr">
          						<!-- 여기 연락처~! -->
          						</span>
          					</span>
          				</div> <!-- _qo24lwc -->
          			
          			</div> <!-- _12d0llg5 -->
          		
          		</div> <!--_kf28kaj -->
          		
          		
          		<div>
          			<div style="margin-top: 24px; margin-bottom: 24px;">
          				<div class="_1p3joamp">
          					전화번호를 새로 입력해주세요.
          				</div>
          			</div>
          		<!--<div style="margin-top: 16px; margin-bottom: 16px;">
          				<div class="_9hxttoo">
          					<label class="_krjbj">
          					Phone Country Select
          					</label>
          					<div class="_wlf6154">
          						<div class="_y9ev9r">
          							<select id="phone-country-select" class="_bwyiq2l">
          							
          							</select>
          						</div>
          					</div>
          				</div>
          			</div>  -->
          			<div style="margin-top: 16px; margin-bottom: 16px;">
          				<div class="_9hxttoo">
          					<label class="_krjbj">
          						Phone Number Input
          					</label>
          					<div dir="ltr">
          						<div class="_1wcr140x">
          							<div class="_ncmdki">
          								<div class="_55316h" style="visibility: visible; height: 46px;">
          									<div class="_nncr1bm">
          										<div class="_ni9axhe">
          											<div class="_1y2zxv">
          											 <div class="_czm8crp">
          											 <span class="_10k87om">
          											 	<!-- 국가번호 -->
          											 </span>
          											 </div>
          											</div>
          										</div>
          									</div>
          								</div>
          							</div>
          						</div>
          					</div>
          				</div>
          			</div>
          			
          			<button type="button" class="_kt3i5a4" aria-busy="false" >
          				<span class="_ftj2sg4">
          					저장
          				</span>
          			</button>
          			
          		</div>
          		
          		<div id="airlock-inline-container">
          		</div>
          		
          		
          	</form>          
          </div>
          <!-- 사라지고 생기고 끝 -->
          
          
        </div>
      </div>  <!-- _s50zru -->
      
      
      	
      </div> <!-- _169grxv2 -->
      </div> <!-- _2h22gn -->
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
     $("#userName").text('<%=userFstName %> <%= userLastName%>');
     $("#userEmail").text('<%=userEmail%>');
     $("#userPhone").text('<%=userPhone%>');
     
	 
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


 	//수정 버튼 클릭 시
	function changeTextAndShowOrHide(btn, btnValue){
	   	
		switch(btnValue){
		
		case 0:
		    if(btn.innerText=="수정"){	  
			  	btn.innerText='취소';
			  	 $("#hideNShow0").show();
			    } 
			    
			    else if(btn.innerHTML=="취소"){ 
			    btn.innerText='수정';
			  	 $("#hideNShow0").hide();
			    }
			
			break;
		
		case 1:
			if(btn.innerText=="수정"){	  
			  	btn.innerText='취소';
			  	 $("#hideNShow1").show();
			    } 
			    
			    else if(btn.innerHTML=="취소"){ 
			    btn.innerText='수정';
			  	 $("#hideNShow1").hide();
			    }
			
			break;
		
		case 2:
			if(btn.innerText=="수정"){	  
			  	btn.innerText='취소';
			  	 $("#hideNShow2").show();
			    } 
			    
			    else if(btn.innerHTML=="취소"){ 
			    btn.innerText='수정';
			  	 $("#hideNShow2").hide();
			    }
			break;
			
		case 3:
			if(btn.innerText=="수정"){	  
			  	btn.innerText='취소';
			  	 $("#hideNShow3").show();
			    } 
			    
			    else if(btn.innerHTML=="취소"){ 
			    btn.innerText='수정';
			  	 $("#hideNShow3").hide();
			    }
			break;
		}
}
</script>

<%@include file="../../includes/footer.jsp" %>
