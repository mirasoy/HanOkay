<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<% session.setAttribute("loginUserNum", "U1"); 
String name = (String)session.getAttribute("loginUserNum");
%>
<%@include file="../includes/header.jsp"%>
<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >






<div class="container">


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">나의 투숙완료</h1>
			<p><%=userFstName %>님 여행은 즐거우셨나요? 후기를 남겨주세요</p>
		</div>
	</div>


<%@include file="../includes/sidebar.jsp"%>
	

	<section class="contents">
		
		<section class="contents-2">
	
<c:forEach items="${checkout}" var="board">
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
	                        <li class="booking-id" data-selenium="booking-id">예약 번호: <span class="booking-id-value"><c:out value="${board.bookNum}" /></span></li>
	                        <li>
		                        <div class="booking-status-panel" data-selenium="booking-status-label">
			                        <i class="ficon ficon-16 ficon-check-circle mmb-booking-status-icon-green"></i>
			                     
		                        </div>
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
	               
	                 
	               <%--      <a class="button-txt button-txt-1" href="/review/register?bookNum=${board.bookNum}">이용후기 작성하기</a> --%>
	                    <a class="button-txt button-txt-1" href="/review/list">이용후기 작성하기</a>
	                    <!-- <a class="button-txt" href="">다시 예약하기</a> -->
	                    <a href="/acm/detail?pageNum=2&amount=10&type=A&keyword=&person=1&in=2020-08-10&out=2020-08-11&acmOpt=0&minPrice=0&maxPrice=9999999&acmNum=${board.acmNum}">다시예약하기</a>
	                    
	          <!--           <a class="button-txt" href="">다시 예약하기</a> -->
	                    
	                </div>
	
	                <div class="button-item-2">
	                   	<span class="button-item-2" id="<c:out value="${board.bookNum}" />"></span>
	               		<button><a href="/mypage/info3?bookNum=${board.bookNum}">정보보기</a></button>
	                </div>
	            </div>
	    </div>
	    </c:forEach>
	       
		</section>
	</section>

</div>




<%@include file="../includes/footer.jsp"%>
