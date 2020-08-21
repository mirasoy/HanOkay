<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
String name = (String) session.getAttribute("loginUserNum");
int i = 0;
%>
<%@include file="../includes/header.jsp"%>


<style>
.booking-info-bottom {
    padding-top: 65px !important;
}

</style>

<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >

<div class="container">


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">나의 예약</h1>
			<p><%=userFstName %>의 모든 예약 목록입니다.</p>
		</div>
	</div>


<%@include file="../includes/sidebar.jsp"%>
	

	<section class="contents">
		
		<section class="contents-2">
	
	    <c:forEach items="${bookListAll}" var="board">
	    <div class="card">
	        <div class="item">
	            <div class="clickable-card">
	                <div class="hotel-picture">
	                    <figure>
	                  <img alt='객실사진'	src='/display?fileName=<c:out value="${board.acmPurl}" />s/<c:out value="${board.acmPname}" />' /> 
	                    </figure>
	                </div>
	                <div class="info-container">
	                    <div class="checkin-checkout-info-panel">
	                        <div class="check-dates">
	                            <div class="check-info">
	                                <div class="check-title">체크인</div>
	                                <div class="check-date">
	                                    <p><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.checkinDate}" /></p>
	                                </div>
	                            </div>
	                            <div class="check-spacer"></div>
	                            <div class="check-info">
	                                <div class="check-title">체크아웃</div>
	                                <div class="check-date">
	                                    <p><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.checkoutDate}" /></p>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <ul class="hotel-info-top">
	                        <li class="hotel-title"><c:out value="${board.acmName}" /></li>
	                        
	                       
	                        <li class="booking-id" data-selenium="booking-id"> <i class="fa fa-arrow-circle-right"></i>  예약 번호: <span class="booking-id-value"><c:out value="${board.bookNum}" /></span></li>
	                       
	                      
	                       
	                       
	                     <li class="payMethod" data-selenium="booking-id" id="<c:out value="${board.bookNum}" />3">
	                        </li>
	                
	                
	                 	<li class="bookstatus" data-selenium="booking-id" id="<c:out value="${board.bookNum}" />">
	                      </li>
	                
	                
	                    </ul>
	            
	                    <div class="booking-info-bottom">
	                        <div class="price m150-price">
	                            <div class="price-currency" data-selenium="payment-currency">KRW</div>
	                            <div class="price-ammount" data-selenium="payment-ammount"><c:out value="${board.bookPrice}" /></div>
	                        </div>
	                    </div>
	                    
	              
	                    
	                                       	                    
	                </div>
	            </div>
	        </div>
	            <div class="button-item">
	                <div class="button-item-1">
	                
	                    <a class="button-txt button-txt-1 sr-only" href="">이용후기 작성하기</a>
	                    <a class="button-txt sr-only" href="">다시 예약하기</a>
	                    
	                </div>
	
	                <div class="button-item-2">
	                   <button class="button-item-2" id="<c:out value="${board.bookNum}" />2"></button>	                   
	                </div>
	            </div>
	    </div>
	    </c:forEach>
	       
		</section>
	</section>

</div>




<%@include file="../includes/footer.jsp"%>


<script>


	


	// 예약상태를 확인 하기 위해, 값을 불러오는 반복문을 여기에 둔다.

	<c:forEach items="${bookListAll}" var="board">

	var bookStatus = '<c:out value="${board.bookStatus} "/>'
	var payMethod = '<c:out value="${board.payMethod} "/>'
	

	console.log(bookStatus);
	
	console.log(payMethod);
	
	if (payMethod.trim() == 'PY_METHOD_PAYPAL') {
		$('#<c:out value="${board.bookNum}" />3')
		.append(
				"<input class='form-control' name='payMethod' value='결제 상태 : 페이팔로 결제하기' readonly='readonly'>");
	} else if (payMethod.trim() == 'PY_METHOD_LATER') {
		$('#<c:out value="${board.bookNum}" />3')
		.append(
				"<input class='form-control' name='payMethod' value='결제 상태 : 현장에서 결제하기' readonly='readonly'>");
	}else if (payMethod.trim() == 'PY_METHOD_CARD') {
		$('#<c:out value="${board.bookNum}" />3')
		.append(
				"<input class='form-control' name='payMethod' value='결제 상태 : 카드로 결제하기' readonly='readonly'>");
	}
	

	//만약에, 내 예약상태가 "RS_STT_BK" 이라면, "투숙예정"을 출력하게끔 + 페이지는 info로 이동한다.
	if (bookStatus.trim() == 'RS_STT_BK') {

		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<input class='form-control' name='bookStatus' value='예약 상태 : 투숙예정' readonly='readonly'>");
		$('#<c:out value="${board.bookNum}" />2')
				.append(
						"<a href='/mypage/info?bookNum=<c:out value="${board.bookNum}" />'>정보보기");

		//만약에, 내 예약상태가 "RS_STT_BC" 이라면, "예약취소"을 출력하게끔 + 페이지는 info3로 이동한다.		
	} else if (bookStatus.trim() == 'RS_STT_BC') {
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<input class='form-control' name='bookStatus' value='예약 상태 : 예약취소' readonly='readonly'>");
		$('#<c:out value="${board.bookNum}" />2')
				.append(
						"<a href='/mypage/info3?bookNum=<c:out value="${board.bookNum}" />'>정보보기");

		//만약에, 내 예약상태가 "RS_STT_AC" 이라면, "투숙완료"을 출력하게끔 + 페이지는 info2로 이동한다.		
	} else if (bookStatus.trim() == 'RS_STT_AC') {
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<input class='form-control' name='bookStatus' value='예약 상태 : 투숙완료' readonly='readonly'>");
		$('#<c:out value="${board.bookNum}" />2')
				.append(
						"<a href='/mypage/info2?bookNum=<c:out value="${board.bookNum}" />'>정보보기");

		//만약에, 내 예약상태가 "RS_STT_CI" 이라면, "체크아웃"을 출력하게끔 + 페이지는 info2로 이동한다.	
	} else if (bookStatus.trim() == 'RS_STT_CI') {
		$('#<c:out value="${board.bookNum}" />')
				.append(
						"<input class='form-control' name='bookStatus' value='예약 상태 : 체크아웃' readonly='readonly'>");
		$('#<c:out value="${board.bookNum}" />2')
				.append(
						"<a href='/mypage/info2?bookNum=<c:out value="${board.bookNum}" />'>정보보기");
	}

	</c:forEach>
</script>
