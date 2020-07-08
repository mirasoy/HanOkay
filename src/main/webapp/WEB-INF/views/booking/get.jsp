<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>예약 완료 페이지</title>

<link href="https://fonts.googleapis.com/css?family=Alegreya:700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="../resources/css/bootstrap.min.css" />

<link type="text/css" rel="stylesheet" href="../resources/css/style.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
					<td rowspan="8"><c:out value="${acm.acmPurl}" /></td>
				</tr>
				<tr><td>예약번호&emsp;</td><td><c:out value="${book.bookNum}"/></td></tr>
				<tr><td>체크인&emsp;</td><td><c:out value="${book.checkinDate}"/></td></tr>
				<tr><td>체크아웃&emsp;</td><td><c:out value="${book.checkoutDate}"/></td></tr>
				<tr><td>예약자&emsp;</td><td><c:out value="${book.lastName}${book.firstName}"/></td></tr>
				<tr><td>예약 객실&emsp;</td><td><c:out value="${book.roomName}"/></td></tr>
				<tr><td>예약 인원&emsp;</td><td><c:out value="${book.guest}"/></td></tr>
				<tr><td>결제 금액&emsp;</td><td><c:out value="${book.bookPrice}"/></td></tr>
		</table>			
	</div>
</body>

</html>