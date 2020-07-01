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

<title>호텔 상세페이지</title>

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
		<div>
			<c:out value="${acm.acmName}" /></br>
			<c:out value="${acm.acmCity}" /><c:out value="${acm.acmDistr}" /><c:out value="${acm.acmDetailaddr}" /></br>
			<c:out value="${acm.acmDesc}" /></br>
			
			<table>
				<tr>
				  	<td rowspan="3"><img alt="대표사진" src="<c:out value="${acm.acmPurl}" />"></td>
				  	<td><img alt="사진1" src="<c:out value="${acm.acmPurl1}" />"></td>
				    <td><img alt="사진2" src="<c:out value="${acm.acmPurl2}" />"></td>
				  	<td><img alt="사진3" src="<c:out value="${acm.acmPurl3}" />"></td>
				</tr>
				<tr>
				    <td><img alt="사진4" src="<c:out value="${acm.acmPurl4}" />"></td>
				  	<td><img alt="사진5" src="<c:out value="${acm.acmPurl5}" />"></td>
				    <td><img alt="사진6" src="<c:out value="${acm.acmPurl6}" />"></td>
				</tr>
			</table>
					
				<%--<c:out value="${acm.repPhone}" /></br>
					<c:out value="${acm.acmPhone2}" /></br>
					<c:out value="${acm.acmFax}" /></br>
					<c:out value="${acm.acmEmail}" /></br>
					<c:out value="${acm.checkinTime}" /></br>
					<c:out value="${acm.checkoutTime}" /></br> --%>
		</div>

</br>
</br>
</br>
		
		<div>
			<table>
				<thead>
					<tr>
						<th>리뷰</th>
						<th>만족도</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
							
				<c:forEach items="${rev }" var="rev">
					<tr>
						<td><c:out value="${rev.title}" /></td>
						<td><c:out value="${rev.revDetail.stisf}" /></td>
						<td><c:out value="${rev.userNum}" /></td>
						<td><c:out value="${rev.regDate}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
</br>
</br>
</br>
		
		<div>
			<table>
				<thead>
					<tr>
						<th>편의시설</th>
					</tr>
				</thead>
							
				<c:forEach items="${opt }" var="opt">
					<td><c:out value="${opt.acmOptcode}" /></td>
				</c:forEach>
			</table>		
			
		</div>
		
</br>
</br>
</br>
		
		<div>
			<table>
				<thead>
					<tr>
						<th>방이름</th>
						<th>인원</th>
						<th>침대타입</th>
						<th>침대개수</th>
						<th>방크기</th>
						<th>가격</th>
						<th>사진</th>
					</tr>
				</thead>
							
				<c:forEach items="${rom }" var="rom">
					<tr>
						<td><c:out value="${rom.roomName}" /></td>
						<td><c:out value="${rom.capacity}" /></td>
						<td><c:out value="${rom.bedType}" /></td>
						<td><c:out value="${rom.bedCnt}" /></td>
						<td><c:out value="${rom.romSize}" /></td>
						<td><c:out value="${rom.price}" /></td>
						<td><img alt="객실 사진" src="<c:out value="${rom.romPurl}" />"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>