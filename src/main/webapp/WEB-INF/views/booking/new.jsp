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
UserVO user = new UserVO("U1", "test@ana.com", "", "성", "냄쿵", "112", birthday, "E", "GU");
session.setAttribute("user", user);

// 세션 로그인값 불러오기
user = (UserVO)session.getAttribute("user");

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
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>예약 페이지</title>

<link href="https://fonts.googleapis.com/css?family=Alegreya:700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="../resources/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="../resources/css/style.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

		[숙소정보]</br>
		<c:out value="${rom.romPurl}" /></br>
		<c:out value="${acm.acmName}" /></br>
		<%=checkin%> ~ <%=checkout%></br>
		<c:out value="${rom.romName}" />
		(<c:out value="${rom.romType}" />)</br>
		<%=person%>명 (최대 <c:out value="${rom.romCapa}" />명)</br> 
		
		</br></br></br>
		[회원정보]</br>
	 <form name="form" method="post">
		<input type="checkbox" id="cb" checked="checked" onclick="setInfo()">예약자 == 회원</br>
	
		이름*<input type="text" id="u1" name='bookerFirstname' value='<%=user.getFstname() %>' readonly="readonly"> 
		성*<input type="text" id="u2"  name='bookerLastname' value='<%=user.getLastname()%>' readonly="readonly"></br>
		이메일*<input type="text" id="u3"  name='bookerEmail' value='<%=user.getEmail()%>' readonly="readonly"></br> 
		전화번호<input type="text" id="u4" name='bookerPhone' value='<%=user.getUserPhone()%>' readonly="readonly">
		
		<input type="hidden" name='userNum' value='<%=user.getUserNum() %>'> 
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
		특별 요청사항: <input type="text" size="100" name="request" value=""></br> 
			<input type="hidden" name="bookStatus" value="RS_STT_BK"> 
			
		</br></br></br>	
		[요금정보]</br>
		<label ></label>
		₩<c:out value="${rom.romPrice}" /> X <%=staydays%>박 &emsp;&emsp;₩<%=bookPrice%></br> 
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
		// 체크박스를 눌렀을 때 실행되는 메서드
		function setInfo() {
			if(document.getElementById("cb").checked){
				// 예약자 정보가 리셋된다
				document.getElementById("u1").value='<%=user.getFstname() %>';
				document.getElementById("u2").value='<%=user.getLastname()%>';
				document.getElementById("u3").value='<%=user.getEmail()%>';
				document.getElementById("u4").value='<%=user.getUserPhone()%>';
			}else{
				for(let i = 1; i <= 4; i++){
					document.getElementById("u"+i).value="";
					document.getElementById("u"+1).readonly="";
				}	
			}
		}
	</script>
</body>

</html>