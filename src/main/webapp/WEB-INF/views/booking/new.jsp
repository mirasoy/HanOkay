<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	String checkin = request.getParameter("in");
String checkout = request.getParameter("out");
String person = request.getParameter("person");
String price = request.getParameter("price");

session.setAttribute("userNum", "U1"); //테스트용(로그인 구현 후 수정 예정)
String userNum = (String) session.getAttribute("userNum");

// 숙박일 계산: get방식으로 가져온 날짜 String을 Date로 변환하여 계산
SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
Date FirstDate = format.parse(checkin);
Date SecondDate = format.parse(checkout);
long calDate = FirstDate.getTime() - SecondDate.getTime();
int staydays = (int) (Math.abs(calDate / (24 * 60 * 60 * 1000)));

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
	<form name="booking" action="/booking/new" method="post">
		[숙소정보]</br>
		<c:out value="${rom.romPurl}" /></br>
		<c:out value="${acm.acmName}" /></br>
		<%=checkin%>~<%=checkout%></br>
		<c:out value="${rom.roomName}" /></br>
		<%=person%>명 / (최대 인원<c:out value="${rom.capacity}" />명)</br> [회원정보]</br>
		<%=userNum%>
		<input type="hidden" name='userNum' value='<%=userNum%>'> 
		<input type="hidden" name='checkinDate' value='<%=checkin%>'> 
		<input type="hidden" name='checkoutDate' value='<%=checkout%>'> 
		<input type="hidden" name='staydays' value='<%=staydays%>'> 
		<input type="hidden" name='guest' value='<%=person%>'> 
		<input type="hidden" name='bookPrice' value='<%=bookPrice%>'> 
		
		</br></br></br>
		[요청사항]</br>
		도착 예정시간: <select name="expectedArr">
			<option value="">-----</option>
			<option value="1">PM02</option>
			<option value="2">PM03</option>
			<option value="3">PM04</option>
			<option value="4">PM05</option>
			<option value="5">PM06</option>
			<option value="6">PM07</option>
			<option value="7">PM08</option>
			<option value="8">PM09</option>
			<option value="9">PM10</option>
			<option value="10">PM11</option>
			<option value="11">PM12</option>
			<option value="12">AM01</option>
			<option value="13">AM02</option>
			<option value="14">AM03</option>
			<option value="15">AM04</option>
			<option value="16">AM05</option>
			<option value="17">AM06</option>
			<option value="18">AM07</option>
			<option value="19">AM08</option>
			<option value="20">AM09</option>
			<option value="21">AM10</option>
			<option value="22">AM11</option>
			<option value="23">AM12</option>
		</select></br> 
		흡연여부: 금연객실<input type="radio" name="smoking" value="0">
			흡연객실<input type="radio" name="smoking" value="1"></br> 
		특별 요청사항: <input type="text" size="100" name="request" value=""></br> 
			<input type="hidden" name="bookStatus" value="RS_STT_BK"> 
		</br></br></br>	
		[요금정보]</br>
		<c:out value="${rom.price}" />원 X <%=staydays%>박 <%=bookPrice%></br> 
		세금 및 봉사료 <%=bookPrice / 10%></br> 
		총 할인 금액 </br> 
		회원 등급 할인 </br> 
		보유쿠폰 할인 </br> 
		적립금 사용 </br> 
		(1박 평균) </br> 
		합계
		</br></br></br>
		<button type="submit" data-oper='booking'>예약하기</button>
	</form>
</body>

</html>