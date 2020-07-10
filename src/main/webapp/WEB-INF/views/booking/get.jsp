<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약 완료 페이지</title>
<style>
#map {
	width: 33%;
	height: 600px;
	background-color: grey;
	display: inline-block;
}
</style>
</head>

<body>
	<div>
		[예약정보]</br>
		<table>
				<tr><td><c:out value="${acm.acmName}" /></td></tr>
				<tr><td><c:out value="${acm.acmCity}" /><c:out value="${acm.acmDistr}" />
					<c:out value="${acm.acmDetailaddr}" />&emsp;|&emsp;
					<c:out value="${acm.repPhone}"/>&emsp;|&emsp;
					<c:out value="${acm.acmEmail}"/></td></tr>
				<tr><td>(<c:out value="${book.checkinDate}"/>&nbsp;-&nbsp;<c:out value="${book.checkoutDate}"/>)</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td rowspan="16"><c:out value="${acm.acmPurl}" /></td>
				</tr>
				<tr><td>예약번호&emsp;</td><td><c:out value="${book.bookNum}"/></td></tr>
				<tr><td>예약일&emsp;</td><td><c:out value="${book.bookDate}"/></td></tr>
				<tr><td>체크인 날짜&emsp;</td><td><c:out value="${book.checkinDate}"/></td></tr>
				<tr><td>체크아웃 날짜&emsp;</td><td><c:out value="${book.checkoutDate}"/></td></tr>
				<tr><td>숙박일&emsp;</td><td><c:out value="${book.staydays}"/></td></tr>
				<tr><td>예약 인원&emsp;</td><td><c:out value="${book.guest}"/></td></tr>
				<tr><td>예약 금액&emsp;</td><td><c:out value="${book.bookPrice}"/></td></tr>
				<tr><td>예약 객실&emsp;</td><td><c:out value="${book.romName}"/></td></tr>
				<tr><td>도착 예상시간&emsp;</td><td><c:out value="${book.expectedArr}"/></td></tr>
				<tr><td>흡연여부&emsp;</td><td><c:out value="${book.smoking}"/></td></tr>
				<tr><td>특별 요청사항&emsp;</td><td><c:out value="${book.request}"/></td></tr>
				<tr><td>객실 이름&emsp;</td><td><c:out value="${book.romName}"/></td></tr>
				<tr><td>예약자&emsp;</td><td><c:out value="${book.bookerFirstname}		${book.bookerLastname}"/></td></tr>
				<tr><td>예약자 이메일&emsp;</td><td><c:out value="${book.bookerEmail}"/></td></tr>
				<tr><td>예약자 연락처&emsp;</td><td><c:out value="${book.bookerPhone}"/></td></tr>
		</table>	
		<%-- <button><a href="../../acm/get?acmNum=${acm.acmNum}">숙소 상세페이지</a></button> --%>	
		<button><a href="../../MyPage/bookListAll">나의 예약</a></button>	
		<button><a href="../../home">홈</a></button>	
	</div>
</body>
<%@include file="../includes/footer.jsp"%>
</html>