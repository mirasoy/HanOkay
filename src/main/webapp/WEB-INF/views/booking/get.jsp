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
					<a href="tel:${acm.repPhone}"><c:out value="${acm.repPhone}"/></a>&emsp;|&emsp;
					<a href="mailto:${acm.acmEmail}"><c:out value="${acm.acmEmail}"/></a><button class="copy">복사하기</button></td></tr>
					<input type="hidden" id="email" value="${acm.acmEmail}">
				<tr><td>(체크인 <fmt:formatDate value="${book.checkinDate}" pattern="yyyy-MM-dd"/> ~ 체크아웃 <fmt:formatDate value="${book.checkinDate}" pattern="yyyy-MM-dd"/>)</td></tr>
				
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td rowspan="16"><img alt="숙소사진" src="<c:out value="${acm.acmPurl}" />"></td>
				</tr>
				<tr><td>예약번호&emsp;</td><td><c:out value="${book.bookNum}"/></td></tr>
				<tr><td>예약일&emsp;</td><td><fmt:formatDate value="${book.bookDate}" pattern="yyyy-MM-dd"/></td></tr>
				<tr><td>체크인 날짜&emsp;</td><td><fmt:formatDate value="${book.checkinDate}" pattern="yyyy-MM-dd"/></td></tr>
				<tr><td>체크아웃 날짜&emsp;</td><td><fmt:formatDate value="${book.checkoutDate}" pattern="yyyy-MM-dd"/></td></tr>
				<tr><td>숙박일&emsp;</td><td><c:out value="${book.staydays}"/> 박</td></tr>
				
				<tr><td>예약 인원&emsp;</td><td><c:out value="${book.guest}"/> 명</td></tr>
				<tr><td>예약 금액&emsp;</td><td>₩ <fmt:formatNumber value="${book.bookPrice}" type="number" /></td></tr>
				<tr><td>예약 객실&emsp;</td><td><c:out value="${book.romName}"/></td></tr>
				
				<tr><td>도착 예상시간&emsp;</td><td><c:out value="${book.expectedArr}"/><c:if test="${empty book.expectedArr}"> - </c:if></td></tr>
				<tr><td>흡연여부&emsp;</td><td><c:choose><c:when test="${book.smoking eq '0'}">금연객실 선택</c:when><c:when test="${book.smoking eq '1'}">흡연객실 선택 </c:when></c:choose></td></tr>
				<tr><td>특별 요청사항&emsp;</td><td><c:out value="${book.request}"/><c:if test="${empty book.expectedArr}"> - </c:if></td></tr>
				
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
	
	/* 메일 복사하기 */
	document.querySelector(".copy").addEventListener("click", function(){
		var temp = document.createElement('textarea'); 
		temp.value = document.getElementById("email").value; 
		document.body.appendChild(temp);
		temp.select();//select()는 textarea, input 같은 form요소에서만 사용 가능
		document.execCommand("copy");
		document.body.removeChild(temp);
		alert("메일이 복사되었습니다!");
	});
	
</script>
<%@include file="../includes/footer.jsp"%>
</html>