<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.ana.domain.UserVO"%>
<%

String romNum = request.getParameter("romNum");
String checkin = request.getParameter("in");
String checkout = request.getParameter("out");
String person = request.getParameter("person");
String price = request.getParameter("price");

// 세션 로그인값 저장하기(테스트용)
Date birthday = new Date(2020/12/12);
UserVO userTmp = new UserVO("U1", "test@ana.com", "", "성", "냄쿵", "112", birthday, "E", "GU");
session.setAttribute("userTmp", userTmp);

// 세션 로그인값 불러오기
userTmp = (UserVO)session.getAttribute("userTmp"); 


// 숙박일 계산: get방식으로 가져온 날짜 String을 Date로 변환하여 계산
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Date firstDate = format.parse(checkin);
Date lastDate = format.parse(checkout);
long calDate = firstDate.getTime() - lastDate.getTime();
int staydays = (int) (Math.abs(calDate / (24 * 60 * 60 * 1000)));

// 쿼리에 넣기 위해 날짜 패턴 변경
String inDate = checkin.replace('-', '/');
String outDate = checkout.replace('-', '/');

// 예약금액 = 방가격 x 숙박일
int bookPrice = (int) (Integer.parseInt(price) * staydays);
%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약 페이지</title>
</head>

<body>
		[숙소정보]</br>
		<c:out value="${rom.romPurl}" /></br>
		<c:out value="${acm.acmName}" /></br>
		<%=checkin%> ~ <%=checkout%> (<%=staydays%>박)</br>
		<c:out value="${rom.romName}" />
		(<c:out value="${rom.romType}" />)</br>
		<%=person%>명 (최대 <c:out value="${rom.romCapa}" />명)</br> 
		
		</br></br></br>
		[예약자 정보]</br>
		*필수 입력사항</br>
	 	<form name="form" method="post" onsubmit="return checkValidation()">
		<input type="checkbox" id="cb" checked="checked" onclick="setInfo()">회원정보와 동일</br>
	
		이름*<input type="text" id="userInfo1" name='bookerFirstname' value='<%=userTmp.getFstname() %>' readonly="readonly" style="background-color:#eee; opacity: 0.5;"> 
		성*<input type="text" id="userInfo2"  name='bookerLastname' value='<%=userTmp.getLastname()%>' readonly="readonly" style="background-color:#eee; opacity: 0.5;"></br>
		<label id="nameMsg" >&nbsp</label></br>
		이메일*<input type="text" id="userInfo3"  name='bookerEmail' value='<%=userTmp.getEmail()%>' readonly="readonly" style="background-color:#eee; opacity: 0.5;"></br> 
		<label id="emailMsg" >&nbsp</label></br>
		전화번호<input type="text" id="userInfo4" name='bookerPhone' value='<%=userTmp.getUserPhone()%>' readonly="readonly" style="background-color:#eee; opacity: 0.5;"></br>
		<label id="phoneMsg" >&nbsp</label></br>
		
		<input type="hidden" name='userNum' value='<%=userTmp.getUserNum() %>'> 
		<input type="hidden" name='checkinDate' value='<%=inDate%>'> 
		<input type="hidden" name='checkoutDate' value='<%=outDate%>'> 
		<input type="hidden" name='staydays' value='<%=staydays%>'> 
		<input type="hidden" name='guest' value='<%=person%>'> 
		<input type="hidden" name='bookPrice' value='<%=bookPrice%>'> 
		
		</br></br></br>
		[요청사항]</br>
		도착 예정시간: <select name="expectedArr">
			<option value="">-----</option>
			<option value="PM02">PM02</option>
			<option value="PM03">PM03</option>
			<option value="PM04">PM04</option>
			<option value="PM05">PM05</option>
			<option value="PM06">PM06</option>
			<option value="PM07">PM07</option>
			<option value="PM08">PM08</option>
			<option value="PM09">PM09</option>
			<option value="PM10">PM10</option>
			<option value="PM11">PM11</option>
			<option value="PM12">PM12</option>
			<option value="AM01">AM01</option>
			<option value="AM02">AM02</option>
			<option value="AM03">AM03</option>
			<option value="AM04">AM04</option>
			<option value="AM05">AM05</option>
			<option value="AM06">AM06</option>
			<option value="AM07">AM07</option>
			<option value="AM08">AM08</option>
			<option value="AM09">AM09</option>
			<option value="AM10">AM10</option>
			<option value="AM11">AM11</option>
			<option value="AM12">AM12</option>
		</select></br> 
		흡연여부: 금연객실<input type="radio" name="smoking" value="0" checked="checked">
			흡연객실<input type="radio" name="smoking" value="1"></br> 
		특별 요청사항: <input type="text" size="100" id="request" name="request" value=""></br> 
			<input type="hidden" name="bookStatus" value="RS_STT_BK"> 
					
		</br></br></br>	
		[요금정보]</br>
		<table>
			<tr><td>₩<c:out value="${rom.romPrice}" /> X <%=staydays%>박</td><td id="total"></td></tr>
			
		</table>
		세금 및 봉사료 &emsp;&emsp;₩<%=bookPrice / 10%></br> 
		총 할인 금액 &emsp;&emsp;₩0</br> 
		회원 등급 할인 &emsp;&emsp;₩0</br> 
		보유쿠폰 할인 &emsp;&emsp;₩0</br> 
		적립금 사용 &emsp;&emsp;₩0</br> 
		</br>
		합계&emsp;&emsp;₩</br> 
		(1박 평균) &emsp;&emsp;₩</br> 
		</br></br></br>
		<button data-oper='booking'>예약하기</button>
	</form>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	
		const regFirstnameKo = /^[가-힣]{1,20}$/; //   "U_FSTNAME" Varchar2(60 ) NOT NULL,
		const regFirstnameEn = /^[a-zA-Z]{1,60}$/; //   "U_FSTNAME" Varchar2(60 ) NOT NULL,
		const regLastnameKo = /^[가-힣]{1,13}$/; //  "U_LASTNAME" Varchar2(40 ) NOT NULL,
		const regLastnameEn = /^[a-zA-Z]{1,40}$/; //  "U_LASTNAME" Varchar2(40 ) NOT NULL,
		const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;   // "EMAIL" Varchar2(800 ) NOT NULL,
		const regPhone = /^[0-9]{0,15}$/; //  "U_PHONE" Number(15,0),
	
		const firstname = document.getElementById("userInfo1");
		const lastname = document.getElementById("userInfo2");
		const email = document.getElementById("userInfo3");
		const phone = document.getElementById("userInfo4");
		const request = document.getElementById("request");
		
		function firstnameValid() {
			if (!firstname.value) {
				firstname.placeholder = "이름을 입력하지 않았습니다.";
				return false;
			} else if ((!regFirstnameKo.test(firstname.value)&&(!regFirstnameEn.test(firstname.value))) ) {
				document.getElementById("nameMsg").innerText = "이름은 1~60자의 영문 또는 1~20자의 한글만 사용 가능합니다.";
				return false;
			}else{
				document.getElementById("nameMsg").innerHTML = '&nbsp';
				return true;
			}
		}
		
		function lastnameValid() {
			if (!lastname.value) {
				lastname.placeholder = "성을 입력하지 않았습니다.";
				return false;
			} else if ((!regLastnameKo.test(lastname.value)&&(!regLastnameEn.test(lastname.value))) ) {
				document.getElementById("nameMsg").innerText = "성은 1~40자의 영문 또는 1~13자의 한글만 사용 가능합니다.";
				return false; 
			}else{
				document.getElementById("nameMsg").innerHTML = '&nbsp';
				return true;
			}
		}
		
		function emailValid() {
			if (!email.value) {
				email.placeholder = "이메일을 입력하지 않았습니다.";
				return false;
			} else if (!regEmail.test(email.value) ) {
				document.getElementById("emailMsg").innerText = "올바른 이메일 형식이 아닙니다.";
				return false;
			}else{
				document.getElementById("emailMsg").innerHTML = '&nbsp';
				return true;
			}
		}
		
		function phoneValid() {
			if (!regPhone.test(phone.value) ) {
				document.getElementById("phoneMsg").innerText = "연락처는 1~15자의 숫자만 가능합니다.";
				return false;
			}else{
				document.getElementById("phoneMsg").innerHTML = '&nbsp';
				return true;
			}
		}
		
		function checkValidation() {
			return firstnameValid()&&lastnameValid()&&emailValid()&&phoneValid();
		}
		
		// 체크박스를 눌렀을 때 실행되는 메서드
		function setInfo() {
			if(document.getElementById("cb").checked){
				
				// 예약자 정보를 로드하고 입력이 불가능한 상태가 된다
				document.getElementById("userInfo1").value='<%=userTmp.getFstname() %>';
				document.getElementById("userInfo2").value='<%=userTmp.getLastname()%>';
				document.getElementById("userInfo3").value='<%=userTmp.getEmail()%>';
				document.getElementById("userInfo4").value='<%=userTmp.getUserPhone()%>';
				
				for(let i = 1; i <= 4; i++){
					document.getElementById("userInfo"+i).setAttribute('readonly', 'readonly');
					document.getElementById("userInfo"+i).style.opacity=0.5;
				}	
			}else{
				
				// 예약자 정보를 입력 가능한 상태가 된다
				for(let i = 1; i <= 4; i++){
					document.getElementById("userInfo"+i).removeAttribute('readonly');
					document.getElementById("userInfo"+i).style.opacity=1;
					document.getElementById("userInfo"+i).style.backgroundColor="";
				}	
			}
		}
		
		
	</script>
<%@include file="../includes/footer.jsp"%>
</body>
</html>