<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@include file="../../includes/header1.jspf"%>
<title>Han:Ok - 개인정보</title>
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

  .in1_SR {
    display: table !important;
    width: 100% !important;
    border-spacing: 0px !important;
  }

  .tableCell_SR {
    display: table-cell !important;
    width: 100% !important;
    vertical-align: top !important;
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

  .btn_box {
    display: table-cell !important;
    vertical-align: top !important;
    white-space: nowrap !important;
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

  .inputName_SR {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
  }

  .inputNameDetail_SR {
    display: block !important;
    width: 100% !important;
  }

  .label_SR {
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

  .inputOuter1_SR {
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

  .inputOuter2_SR {
    position: relative !important;
    overflow: hidden !important;
  }

  .inputTag_SR {
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

  .SpanInsaveBtn {
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
    padding-top: var(--font-button-padding-top, undefined) !important;
    padding-bottom: var(--font-button-padding-bottom, undefined) !important;
  }
</style>

<%@include file="../../includes/header2.jspf"%> <%@include
file="../../includes/header3.jspf"%>

<div class="container">
  <div class="out_SR">
    <section>
      <div
        style="
          position: relative;
          margin-top: 64px;
          margin-bottom: 56px;
          margin-left: 16px;
        "
      >
        <h1 tabindex="-1" class="header1_SR">
          <div class="header2_SR">개인정보</div>
        </h1>
      </div>
    </section>
  </div>

  <div class="content_SR">
    <section class="contentOfInfo_SR">
      <!-- 하나의 정보칸 -->
      <div class="oneInfo_SR">
        <div style="margin-top: 24px;">
          <div class="in1_SR">
            <div class="tableCell_SR">
              <div class="titleOfOneInfo_SR">실명</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="realInfo_SR">
                  <!-- 세션에서 이름 -->
                  <div class="nameFromSession"></div>
                  <!--수정 눌렸을 때 새로 생성되어야함-->
                  <div id="showAndHide" style="display:none;">
                  <div
                    style="margin-top: 8px; margin-bottom: 24px;"
                    id="inputBeforeForm_SR"
                  >
                    <form method="post">
                      <div style="margin-bottom: 16px;">
                        <div class="inputName_SR">
                          <div class="inputNameDetail_SR">
                            <div style="margin-bottom: 8px;">
                              <label class="label_SR">
                                <div class="divBeforeLabelVal_SR">
                                  	이름
                                </div>
                              </label>
                            </div>

                            <div>
                              <div class="inputOuter1_SR">
                                <div class="inputOuter2_SR">
                                  <input
                                    class="inputTag_SR"
                                    id="first_name"
                                    name="first_name"
                                    type="text"
                                  />
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="inputNameDetail_SR">
                            <div style="margin-bottom: 8px;">
                              <label class="label_SR">
                                <div class="divBeforeLabelVal_SR">
                                  성
                                </div>
                              </label>
                            </div>

                            <div>
                              <div class="inputOuter1_SR">
                                <div class="inputOuter2_SR">
                                  <input
                                    class="inputTag_SR"
                                    id="first_name"
                                    name="first_name"
                                    type="text"
                                  />
                                </div>
                              </div>
                            </div>
                          </div>

                          <button
                            type="submit"
                            class="saveBtn_SR"
                            aria-busy="false"
                          >
                            <span class="SpanInsaveBtn">
                              수정
                            </span>
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                  </div>
                  <!--수정 눌렀을 때 끝-->
                </div>
              </div>
            </div>

            <div class="btn_box">
              <div class="btn_box2">
                <div class="btn_box3">
                  <button type="button" class="btn_modify" aria-busy="false" onclick='changeInnerText(this);'>
                    수정
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 하나의 정보칸 -->
      <div class="oneInfo_SR">
        <div style="margin-top: 24px;">
          <div class="in1_SR">
            <div class="tableCell_SR">
              <div class="titleOfOneInfo_SR">생년월일</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="realInfo_SR">
                  <!-- 유저 생년월일 -->
                  <!--                     <form >
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
      </div>
      <!-- 하나의 정보칸 -->

      <div class="oneInfo_SR">
        <div style="margin-top: 24px;">
          <div class="in1_SR">
            <div class="tableCell_SR">
              <div class="titleOfOneInfo_SR">이메일 주소</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="realInfo_SR">
                  <!-- 여기에 세션의 이메일 들어가게-->
                  <!--                     <form >
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
      </div>
      <!-- 하나의 정보칸 -->

      <div class="oneInfo_SR">
        <div style="margin-top: 24px;">
          <div class="in1_SR">
            <div class="tableCell_SR">
              <div class="titleOfOneInfo_SR">연락처</div>
              <div style="margin-top: 8px; margin-bottom: 24px;">
                <div class="realInfo_SR">
                  <!-- 여기에 유저의 연락처 들어가게-->
                  <!--                     <form >
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
      </div>
    </section>
  </div>
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
	  
  
   });


  	function changeInnerText(btnVal){
  	  let nameFromS=document.getElementsByClassName("nameFromSession")[0];

  	if(btnVal.innerText === '수정'){
  		$("#showAndHide").show();
  	  	nameFromS.innerHTML="";
  		btnVal.innerText='취소';
  	} else{
  		$("#showAndHide").hide();
    	nameFromS.innerHTML="세린";
  		btnVal.innerText='수정';
  	}
  }
  	
</script>

<%@include file="../../includes/footer.jsp"%>
