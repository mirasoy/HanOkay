<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/suhee.css">

<div class = "page-wrapper page-get">
	<div class = "page-contnets" style="width: 720px;">
	
		<div class = "container-bkAcm box" >
			<table>
				<tr><td class="acm-pic" rowspan="4"><img alt='숙소사진' src='/display?fileName=<c:out value="${book.acmPurl}" /><c:out value="${book.acmPname}" />' /></td>
					<td class="title"><c:out value="${book.acmName}"/></td></tr>
				<tr><td><a href="/acm/detail?pageNum=2&amount=10&type=A&keyword=&person=1&in=2020-08-10&out=2020-08-11&acmOpt=0&minPrice=0&maxPrice=9999999&acmNum=${book.acmNum}"><i class="fa fa-external-link" aria-hidden="true"></i> 숙소 상세페이지</a></td>
				<tr><td><span class="phone"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;전화하기: <a href="tel:${book.repPhone}"><c:out value="${book.repPhone}"/></a></span></td></tr>
				<tr><td><span class="email"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;메일보내기: <a href="mailto:${book.acmEmail}"><c:out value="${book.acmEmail}"/></a></span>&nbsp;&nbsp;<span class="copy">주소복사</span><i class="fa fa-clipboard" aria-hidden="true"></i></td></tr>
			</table>
		</div>
		
		<div class = "container-bkInfo box" >
			<table>
				<tr><td class="bk-title"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></td>
					<td class="bk-title">예약정보</td></tr>
				<tr><td style="height: 15px;"></td></tr>
				<tr><td class="td-title6">예약날짜</td><td><fmt:formatDate value="${book.checkinDate}" pattern="yyyy년 M월 d일"/> <c:out value="${book.checkinTime }"/></td><td class="td-days"><c:out value="${book.staydays }박"/></td><td><fmt:formatDate value="${book.checkoutDate}" pattern="yyyy년 M월 d일"/> <c:out value="${book.checkoutTime }"/></td></tr>
				<tr><td class="td-title6">예약번호</td><td colspan="3"><c:out value="${book.bookNum }"/></td></tr>
				<tr><td class="td-title6">예약객실</td><td colspan="3"><c:out value="${book.romName}"/>(<c:out value="${book.romType}"/>)</td></tr>
				<tr><td class="td-title6">예약자</td><td colspan="3"><c:out value="${book.bookerLastname}"/> <c:out value="${book.bookerFirstname}"/>, <c:out value="${book.guest }명"/></td></tr>
			</table>
			
		</div>
	</div>
	
	<div class = "page-sidebar" style="width: 380px;">
		<div class = "container-bkNavi box" onclick="location.href='../../mypage/info?bookNum=${book.bookNum }'">
			<table>
				<tr><td class="bk-title" rowspan="2"><i class="fa fa-pencil" aria-hidden="true"></i></td>
					<td class="bk-title">예약 관리</td>
					<td rowspan="2"><i class="fa fa-caret-right" aria-hidden="true"></i></td></tr>
				<tr><td style="color: gray">(변경 및 취소하기)</td></tr>
			</table>
		</div>
		
		<div class = "container-bkPrice box" style="height: 40%;">
			<table>
				<tr><td class="bk-title"><i class="fa fa-credit-card" aria-hidden="true"></i></td>
					<td class="bk-title">결제내역</td></tr>
				<tr class="tr-line "><td colspan="3" class="td-title5"><c:choose>
							<c:when test="${book.payMethod eq 'PY_METHOD_LATER'}">나중에 결제</c:when>
							<c:when test="${book.payMethod eq 'PY_METHOD_CARD'}">카드 결제</c:when>
							<c:when test="${book.payMethod eq 'PY_METHOD_PAYPAL'}">페이팔 결제</c:when>
						</c:choose></td></tr>
				<tr><td colspan="2" class = "td-title2">객실 요금(${book.staydays}박 x <i class="fa fa-krw" aria-hidden="true"></i><fmt:formatNumber value="${book.price}" pattern="###,###,###" />)</td><td class="right"><i class="fa fa-krw" aria-hidden="true"></i><fmt:formatNumber value="${book.staydays * book.price}" pattern="###,###,###" /></td></tr>
				<tr><td colspan="2" class = "td-title2">세금 </td><td class="right"><i class="fa fa-krw" aria-hidden="true"></i><fmt:formatNumber value="${book.vat}" pattern="###,###,###" /></td></tr>
				<tr class="tr-line"><td colspan="2" class = "td-title3">총액</td><td class="right"><i class="fa fa-krw" aria-hidden="true"></i><fmt:formatNumber value="${book.subtotal}" pattern="###,###,###" /></td></tr>
				<tr><td></td></tr>
				<tr><td colspan="2" class = "td-title2">쿠폰</td><td class="right"><i class="fa fa-krw" aria-hidden="true"></i><fmt:formatNumber value="${book.coupon}" pattern="###,###,###" /></td></tr>
				<tr><td colspan="2" class = "td-title2">마일리지</td><td class="right"><i class="fa fa-krw" aria-hidden="true"></i><fmt:formatNumber value="${book.mileage}" pattern="###,###,###" /></td></tr>
				<tr class="tr-line"><td colspan="2" class = "td-title3">할인액</td><td class="right"><i class="fa fa-krw" aria-hidden="true"></i><fmt:formatNumber value="${book.discount}" pattern="###,###,###" /></td></tr>
				<tr><td></td></tr>
				<tr><td colspan="2" class = "td-title4">결제금액</td><td class="right"><i class="fa fa-krw" aria-hidden="true"></i><fmt:formatNumber value="${book.total}" pattern="###,###,###" /></td></tr>
			</table>
		</div>

	</div>
	
<!-- 	<div class = "page-bottom">
		<div class="container-bkMap box"> -->
			<img class = "page-bottom container-bkMap box" style="height: auto;" src="${request.contextPath}/resources/img/wecomebanner.jpg">
<!-- 		</div>
	</div> -->
</div>
<script type="text/javascript">
	//뒤로가기 방지
	history.pushState(null, null, location.href);
	window.onpopstate = function () {
	    history.go(1);
	};
</script>
<%@include file="../includes/footer.jsp"%>