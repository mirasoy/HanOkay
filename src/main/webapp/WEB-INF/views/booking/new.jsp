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
SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
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
	<div>
		<table>
			<tr>
				<td>
					<table>
						<tr>
							[숙소정보]</br>
							<td><c:out value="${rom.romPurl}" /></br></td>
							<td><c:out value="${acm.acmName}" /></br> 
								<%=checkin%> ~ <%=checkout%></br>
								<c:out value="${rom.roomName}" /></br> 
								<%=person%>명 / (최대 인원 <c:out value="${rom.capacity}" />명)</br></td>
						</tr>
					</table>
				</td>

			</tr>

			<tr>
				<td>[회원정보]</br> 
					<%=userNum%></td>
			</tr>
			<tr>
				<td>
					<form name="booking" method="post">
						<input type="hidden" name='userNum' value='<%=userNum%>'>
						<input type="hidden" name='checkinDate' value='<%=checkin%>'> 
						<input type="hidden" name='checkoutDate' value='<%=checkout%>'>
						<input type="hidden" name='staydays' value='<%=staydays%>'>
						<input type="hidden" name='guest' value='<%=person%>'> 
						<input type="hidden" name='bookPrice' value='<%=bookPrice%>'>

						[요청사항]</br> 
							도착 예정시간: <select name="expectedArr">
								<option value="1">PM0200</option>
								<option value="2">PM0300</option>
								<option value="3">PM0400</option>
								<option value="4">PM0500</option>
								<option value="5">PM0600</option>
								<option value="6">PM0700</option>
								<option value="7">PM0800</option>
								<option value="8">PM0900</option>
								<option value="9">PM1000</option>
								<option value="10">PM1100</option>
								<option value="11">PM1200</option>
								<option value="12">AM0100</option>
								<option value="13">AM0200</option>
								<option value="14">AM0300</option>
								<option value="15">AM0400</option>
								<option value="16">AM0500</option>
								<option value="17">AM0600</option>
								<option value="18">AM0700</option>
								<option value="19">AM0800</option>
								<option value="20">AM0900</option>
								<option value="21">AM1000</option>
								<option value="22">AM1100</option>
								<option value="23">AM1200</option>
							</select></br> 
							흡연여부: 금연객실<input type="radio" name="smoking" value="0">흡연객실<input type="radio" name="smoking" value="1"></br> 
							특별 요청사항: <input type="text" size="100" name="request" value=""></br>
				</td>
			</tr>
		</table>
	</br></br></br>
		<div>
			[요금정보]</br> 
			<c:out value="${rom.price}" />원 X <%=staydays%>박
			<%=bookPrice%></br> 
			세금 및 봉사료 <%=bookPrice / 10%></br> 
			총 할인 금액 </br> 
			회원 등급 할인 </br> 
			보유쿠폰 할인 </br> 
			적립금 사용 </br> 
			(1박 평균) </br> 
			합계 
			</br></br></br>
			<button data-oper='booking'>예약하기</button>
			</form>
		</div>
	</div>
</body>

</html>