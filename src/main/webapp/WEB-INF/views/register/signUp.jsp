<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file="../includes/header.jsp"%>
<title>HanOkay-회원가입</title>
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
    width: 600px;
    border: 1px solid #dadfe6;
    border-radius: 16px;
    z-index: 1;
    margin: auto;
    background: #fff;
    overflow-x: hidden;
    padding: 8px 0;
  }
  
  @media (min-width: 744px){
.container2_SR {
    width: 100% !important;
    max-width: 568px !important;
    border-radius: 12px !important;
}
}

  .out_SR {
    margin-left: -8px !important;
    margin-right: -8px !important;
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
    overflow-y: auto !important;
    padding: 24px !important;
    padding-top: 24px !important;
    padding-right: 24px !important;
    padding-bottom: 24px !important;
    padding-left: 24px !important;
    flex: 1 1 auto !important;
    outline: none !important;
  }
  .shapeOfForm{
    width: 600px;
    height: 500px;
    border: 1px solid #dadfe6;
    border-radius: 16px;
    z-index: 1;
    margin: 0 auto;
    background: #fff;
    overflow-x: hidden;
    padding: 8px 0;
    text-align: center;
    max-width: 1140px;
  }

  .shapeOfForm2{
    margin: 30px auto;
  }  

  .contentOfInfo_SR {
    padding-left: 8px !important;
    padding-right: 8px !important;
    min-height: 1px !important;
    position: relative !important;
  }

.inputBox_SR{
  display: block !important;
    width: 100% !important;
}

.inputBox2_SR{
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

.titleOfOneInfo_SR{
    overflow-wrap: break-word !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 1.375em !important;
    color: rgb(72, 72, 72) !important;
    margin: 0px !important;
}

.btn btn-sendEmail{
    cursor: pointer;
    display: inline-block;
    font-size: 0.85rem;
    font-weight: 400;
    padding: 12px 20px;
    width: 498px;
}
</style>

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
      <h1><div class="header2_SR">회원가입</div></h1>
    </div>
    <!--  action= "/register/emailAuth" -->
  </section>
</div>

<div class="container2_SR">
  <div class="content_SR">   
    <form class="contentOfInfo_SR" method="post" id="form">
      <div style="margin-bottom: 16px;">
        <div class="titleOfOneInfo_SR">
            Email(*)
      </div>
            <div class="inputBox_SR">   
            <div class="inputBox2_SR">
            
            <input
              type="text"
              size="57"
              name="userEmail"
              id="userEmail"
              class="inputField"
              placeholder="서비스 이용을 위한 이메일을 입력하세요"
              value="${userEmail }"
            />
            </div>  
            <button data-oper="checkEmail" class="btn btn-default"  style="width: 500px;">
              이메일 중복체크
            </button>
          </div>
      </div>

          
      <div>
        <span style="color: red;" id="msg1"
              ><c:out value="${msg1 }" /></span
            ><br />   
      </div>

      <div style="margin-bottom: 16px;">
        <div class="titleOfOneInfo_SR">
          비밀번호(*)
        </div>
        <div class="inputBox_SR">
          <div class="inputBox2_SR"> 
            <input
                type="password"
                class="inputField"
                size="57"
                name="userPwd"
                id="pwd"
                placeholder="영 대,소문자,숫자,특수기호가 포함된 8~20자"
            />
          </div>
        </div>
      </div>

    <div style="margin-bottom: 16px;">
      <div class="titleOfOneInfo_SR">
        비밀번호 확인(*)
      </div>
       <div class="inputBox_SR">
        <div class="inputBox2_SR"> 
         <input
          type="password"
          class="inputField"
          size="57"
          name="pwd2"
          id="repeatedPwd"
          placeholder="비밀번호를 한번 더 입력하세요"
        />
      </div>
     </div>
    </div>
       
    <div style="margin-bottom: 16px;">
      <span style="color: black;" id="msg2"
      ><c:out value="${msg2 }" /></span
    ><br />
    <span style="color: black;" id="msg3"
      ><c:out value="${msg3 }" /></span
    ><br />
      <div class="titleOfOneInfo_SR">
        성(*)
      </div>
        <div class="inputBox_SR">
      <div class="inputBox2_SR"> 
       <input
       type="text"
       size="57"
       id="lastName"
       name="userLastName"
       value="${lastName }"
       placeholder="성(예: 홍)"
      />
    </div>
   </div>
  </div>
          
  <div style="margin-bottom: 16px;">
    <div class="titleOfOneInfo_SR">
      이름(*)
    </div>
   <div class="inputBox_SR">
    <div class="inputBox2_SR"> 
     <input
     type="text"
     size="57"
     id="fstName"
     name="userFstName"
     value="${fstName }"
      placeholder="이름(예:길동)"
    />
  </div>
 </div>
</div>

<div style="margin-bottom: 16px;">
  <div class="titleOfOneInfo_SR">
    생년월일(*)
  </div>
<div class="inputBox_SR">
<div class="inputBox2_SR"> 
  <input type="text" size="57" id="date" placeholder="생년월일을 선택하세요"/>
</div>
</div>
</div>

<div style="margin-bottom: 16px;">
<div class="inputBox_SR">
<div class="inputBox2_SR"> 
  <input type="checkbox" id="checkbox" name="checkbox" />
  <a href="/policies/terms" target="_blank">이용약관보기</a>
</div>
</div>
</div>

<div style="margin-bottom: 16px;">
  <div class="inputBox_SR">
  <div class="inputBox2_SR"> 
    <p>(*)표시된 항목은 반드시 입력해주십시오</p>
    <!--  <button data-oper='register' class="btn btn-default">가입하기</button> -->
    <button
    data-oper="sendEmail"
      class="btn btn-default"
      id="sendEmail"
      style="width: 500px;"
    >
      인증메일 발송
    </button>
  </div>
  </div>
  </div>
 
        <!-- userVO에 생년월일부분 -->
      <input type="hidden" id="birthday" name="userBirthday" />

      <input
        type="hidden"
        id="assureEmailResult"
        name="assureEmailResult"
        value="${assureEmailResult}"
        />
        <input
        type="hidden"
        id="assureEmail"
        name="assureEmail"
        value="${assureEmail}"
        />
      </form>
      
      이미 HanOkay의 계정이 있나요? <a href="../user/login">로그인으로 돌아가기</a>
      
    </div>
  	</div>
    </div>
  </div>
 </div>
</div>
<script>
  //빈값체크
  function isEmpty(target) {
    if (
      target === null ||
      target == null ||
      target === undefined ||
      target === "" ||
      target == ""
    ) {
      return true;
    }
    return false;
  }

  // 이메일 유효성
  function checkEmail() {
    var email = document.getElementById("userEmail").value;
    var regExp = /^\s*(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\s*$/;
    return regExp.test(email);
  }

  // 유저명 유효성
  function checkUsername(str) {
    let username = str;
    let num = username.search(/[0-9]/g);
    let eng = username.search(/[a-z]/gi);
    let spe = username.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    //매개변수가 빈값인지 확인
    if (isEmpty(username)) {
      document.getElementById("msg3").innerHTML = "성/이름을 입력해주세요";
      return false;
    }

    //매개변수 길이가 적절한지 확인
    if (str.length < 10) {
      document.getElementById("msg3").innerHTML =
        "이름의 글자수는 10자 이하로 해주세요";
      return false;
    }
    //매개변수에 공백이 있는지 확인
    if (username.search(/\s/) != -1) {
      document.getElementById("msg3").innerHTML = "공백 없이 입력해주세요";
      return false;
    }

    return true;
  }
  // 비밀번호 유효성
  function checkPwd(str, repeatedStr) {
    var pw = str;
    var repeatedPw = repeatedStr;
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/gi);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    //비밀번호 글자수 8~20자로 제한
    if (pw.length < 8 || pw.length > 20) {
      document.getElementById("msg2").innerHTML =
        "8자리 ~ 20자리 이내로 영문 대소문자,숫자,특수문자를 혼합하여 입력해주세요.";
      return false;
    }
    //비밀번호 공백제한
    if (pw.search(/\s/) != -1) {
      document.getElementById("msg2").innerHTML = "공백 없이 입력해주세요.";
      return false;
    }
    //영문 숫자 특수문자 확인
    if (num < 0 || eng < 0 || spe < 0) {
      document.getElementById("msg2").innerHTML =
        "영문 대소문자,숫자,특수문자를 혼합하여 입력해주세요.";
      return false;
    }
    //비밀번호와 비밀번호 재확인의 값이 동일한지 확인
    if (pw !== repeatedPw) {
      document.getElementById("msg2").innerHTML =
        "비밀번호와 비밀번호 확인이 다릅니다.";
      return false;
    }
    return true;
  }

  //이메일 중복확인을 했는지 확인하는 메서드
  function assureEmailCheck(assuredMsg, assuredEmail, inputEmail) {
    if (assuredMsg == "pass" && assuredEmail === inputEmail) {
      return true;
    }
    return false;
  }

  //html이 그려지면 실행되는 메서드
  $(document).ready(function () {
    //페이지가 다시 그려졌을 때 두번 submit되는 것을 방지
    if (window.history.replaceState) {
      window.history.replaceState(null, null, window.location.href);
    }

    $(function () {
      //모든 datepicker에 대한 공통 옵션 설정
      $("#date").datepicker({
        dateFormat: "yy-MM-dd", //Input Display Format 변경
        onSelect: function (date) {
          //날짜가 선택되면

          document.getElementById("birthday").value = new Date(date);
        },
        showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear: true, //년도 먼저 나오고, 뒤에 월 표시
        changeYear: true, //콤보박스에서 년 선택 가능
        changeMonth: true, //콤보박스에서 월 선택 가능
        showOn: "both", //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        buttonImage:
          "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //버튼 이미지 경로
        buttonImageOnly: true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        yearSuffix: "년", //달력의 년도 부분 뒤에 붙는 텍스트
        monthNamesShort: [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
        ], //달력의 월 부분 텍스트
        monthNames: [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9",
          "10",
          "11",
          "12",
        ], //달력의 월 부분 Tooltip 텍스트
        dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"], //달력의 요일 부분 텍스트
        dayNames: [
          "일요일",
          "월요일",
          "화요일",
          "수요일",
          "목요일",
          "금요일",
          "토요일",
        ], //달력의 요일 부분 Tooltip 텍스트
        yearRange: "-100:+0",
        minDate: "-90Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        maxDate: "+0D", //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        setDate: "today",
      });
    });

    let formObj = $("form");
    //버튼을 눌렀을 때 발생하는 일들
    $("button").on("click", function (e) {
      let operation = $(this).data("oper");

      e.preventDefault();

      var email = $("input[id='userEmail']").val();
      var pwd = $("input[id='pwd']").val();
      var repeatedPwd = $("input[id='repeatedPwd']").val();
      var fstName = $("input[id='fstName']").val();
      var lastName = $("input[id='lastName']").val();

      var assureEmail = document.getElementById("assureEmail").value;
      var assureEmailCheckResult = document.getElementById("assureEmailResult")
        .value;

      //중복체크 버튼을 눌렀을 경우
      if (operation === "checkEmail") {
        //먼저 정규식으로 이메일 형식 체크
        if (checkEmail()) {
          var result;

          $.ajax({
            type: "POST",
            url: "/register/checkEmail",
            dataType: "json",
            data: {
              email: email,
            },
            //async: false,
            success: function (data) {
              console.log(data);
              $("span#msg1").text(data.msg);
              $("#assureEmailResult").val(data.assureMsg);
              $("#assureEmail").val(data.assuredEmail);
            },
            error: function (data) {
              window.location.href = "../error/404error";
            },
          });
          return result;
        }

        //이메일 정규식 불통시
        else {
          $("span#msg1").text("올바르지 않은 이메일 형식입니다!");
        }
      }

      //인증메일 발송 버튼을 눌렀을 경우
      if (operation === "sendEmail") {
        //빈항목이 있는지 확인
        console.log("email: " + email);
        console.log("pwd: " + pwd);
        console.log("fst Name: " + fstName);
        console.log("last Name: " + lastName);

        //이메일과 비밀번호 유효성 확인
        if (!(checkEmail(email) && checkPwd(pwd, repeatedPwd))) {
          return;
        }

        //성과 이름 빈 값이 아닌지 확인
        if (isEmpty(fstName) || isEmpty(lastName)) {
          window.alert("성과 이름을 반드시 입력해주세요!");
          return;
        }

        //이용약관 체크박스 선택했는지 확인
        if (!$("#checkbox").is(":checked")) {
          window.alert("이용약관을 반드시 확인해주세요");
          return;
        }

        if (!assureEmailCheck(assureEmailCheckResult, assureEmail, email)) {
          window.alert("중복검사는 반드시 통과하여야합니다");
          return;
        }

        formObj.attr("action", "/register/emailAuth");
        formObj.submit();
      }
    });
  });
</script>
