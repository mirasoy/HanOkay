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
					<td rowspan="16"><img alt="숙소사진" src="<c:out value="${acm.acmPurl}" />"></td>
				</tr>
				<tr><td>예약번호&emsp;</td><td><c:out value="${book.bookNum}"/></td></tr>
				<tr><td>예약일&emsp;</td><td><c:out value="${book.bookDate}"/></td></tr>
				<tr><td>체크인 날짜&emsp;</td><td><c:out value="${book.checkinDate}"/></td></tr>
				<tr><td>체크아웃 날짜&emsp;</td><td><c:out value="${book.checkoutDate}"/></td></tr>
				<tr><td>숙박일&emsp;</td><td><c:out value="${book.staydays}"/> 박</td></tr>
				<tr><td>예약 인원&emsp;</td><td><c:out value="${book.guest}"/> 명</td></tr>
				<tr><td>예약 금액&emsp;</td><td>₩ <c:out value="${book.bookPrice}"/></td></tr>
				<tr><td>예약 객실&emsp;</td><td><c:out value="${book.romName}"/></td></tr>
				<tr><td>도착 예상시간&emsp;</td><td id="expectedArr"><c:out value="${book.expectedArr}"/></td></tr>
				<tr><td>흡연여부&emsp;</td><td id="smoking"><c:out value="${book.smoking}"/></td></tr>
				<tr><td>특별 요청사항&emsp;</td><td id="request"><c:out value="${book.request}"/></td></tr>
				<tr><td>예약자&emsp;</td><td><c:out value="${book.bookerLastname}		${book.bookerFirstname}"/></td></tr>
				<tr><td>예약자 이메일&emsp;</td><td><c:out value="${book.bookerEmail}"/></td></tr>
				<tr><td>예약자 연락처&emsp;</td><td><c:out value="${book.bookerPhone}"/></td></tr>
				
		</table>	
		<button><a href="../../acm/get?pageNum=&amount=&type=&keyword=&person=&in=&out=&acmNum=${acm.acmNum}">숙소 상세페이지</a></button>	
		<button><a href="../../MyPage/bookListAll">나의 예약</a></button>	
		<button><a href="../../acm/list">홈</a></button>	
	</div>
</body>
<script type="text/javascript">

	window.onload = function() {
		if(document.getElementById("expectedArr").innerHTML=="") 
			document.getElementById("expectedArr").innerHTML ="-";
		
		if(document.getElementById("smoking").innerHTML=="0"){
			document.getElementById("smoking").innerHTML ="금연객실 요청";
		}else{
			document.getElementById("smoking").innerHTML ="흡연객실 요청";
		}
		
		if(document.getElementById("request").innerHTML=="") 
			document.getElementById("request").innerHTML ="-";
		
	}
</script>
<%@include file="../includes/footer.jsp"%>
</html>