<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
String name = (String) session.getAttribute("loginUserNum");
%>

<%@include file="../includes/header.jsp"%>

<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >


<div class="container-1">

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">나의 예약</h1>
			<p><%=userFstName %>의 투숙 예정 목록입니다.</p>
		</div>
	</div>
	
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■사이드바■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->	
	
<section class="sidebar">
	    <div class="sidebar_detail">
	
	        <div class="sidebar-header">
	            <div class="user-pic"> <img src="${request.contextPath}/resources/img/user.jpg" alt="유저이미지"></div>
	            <div class="user-info">
	                <span class="user-name">	               
	             		<strong><%=userFstName%></strong>님
	                </span>
	                <span class="user-role">Administrator</span>
	                <span class="user-status">
	                    <i class="fa fa-circle"></i>
	                    <span>Online</span>
	                </span>
	            </div>
	        </div>
	        <button class="mypage_btn nav_btn">마이페이지</button>
	        

	        <button class="noaccordion nav_btn">프로필</button>
	        
	        <button class="accordion nav_btn">나의 예약</button>
	        <div class="side-panel">
	          <ul>	       	              
				<li class="item1"><a href="/mypage/bookListAll">전체목록</a></li>
				<li class="item2"><a href="/mypage/bookList">투숙예정</a></li>
				<li class="item3"><a href="/mypage/checkout">투숙완료</a></li>
				<li class="item4"><a href="/mypage/cancelled">취소된 예약</a></li>	              	              
	          </ul>
	        </div>
	        
	        <button class="accordion nav_btn">나의 리뷰</button>
	        <div class="side-panel">
	          <ul>	       	              
				<li class="item1"><a href="/review/list">전체목록</a></li>
				<li class="item2"><a href="/review/writtenReviewlist">작성한 리뷰</a></li>
				<li class="item3"><a href="/review/unwrittenReviewlist">미작성 리뷰</a></li>             	              
	          </ul>
	        </div>
	           

	            
	         <button class="noaccordion nav_btn nav_btn_last" onclick="location.href='/chat/chatList'">나의 채팅</button>
	           
	
	    </div>
	
	</section>
	
<section class="contents">
	<section class="contents-2">
		
   <c:forEach items="${bookList}" var="board">
	    <div class="card">
	        <div class="item">
	            <div class="clickable-card">
	                <div class="hotel-picture">
	                    <figure>
	                        <img src="${request.contextPath}/resources/img/room.jpg" alt="호텔사진">
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
			                        <span class="button-item-2" id="<c:out value="${board.bookNum}" />"></span>
		                        </div>
	                        </li>
	                    </ul>
	            
	                    <div class="booking-info-bottom">
	                        <div class="price m150-price">
	                            <div class="price-currency" data-selenium="payment-currency">KRW</div>
	                            <div class="price-ammount" data-selenium="payment-ammount">640,349</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	            <div class="button-item">
	                <div class="button-item-1">
	                	<a href="/mypage/info?bookNum=${board.bookNum}">예약관리하기</a>
	                    <a class="button-txt button-txt-1" data-oper='myBtn' id="myBtn" class="myBtn">예약 확정서 받기</a>
	                    <a class="button-txt" id="myMap">숙소 위치 확인</a>
	                    
	                </div>
	
	                <div class="button-item-2">
	                    <button>정보보기</button>
	                </div>
	            </div>
	            </div>
	</c:forEach>

	</section>
</section>


				<!-- The Modal (메일) -->
				<div id="myModal" class="modal">
					<!-- Modal content -->
					<div class="modal-content">
					
					
						<span id="close" class="close">&times;</span>
						<h1>메일 보내기</h1>						
						<form id="actionForm" method="post" action="${path}/email/send.do">
							<!-- post방식으로 자료를 컨트롤러로 보냄 -->
					
							<label>발신자 이름 : </label>
							<input name="senderName"><br> 
							<label class="sr-only">보낸 사람 이메일 : </label>
							<input class="sr-only" name="senderMail" value="tmpProjAna@gmail.com"><br> 
							<label>받는 사람 이메일 : </label>
							<input name="receiveMail"><br> 
							
							<label>[HanOkay 한:옥케이] 예약정보 안내 드립니다. </label>
							<input class="sr-only" value="[HanOkay 한:옥케이] 예약정보 안내 드립니다." name="subject"><br>
						<c:forEach items="${bookList}" var="board">
							<input id="acmName" value='<c:out value="${board.acmName}"/>'>
							</c:forEach> 
					
							<label class="sr-only">내용 : </label>
							<textarea id="txt" rows="5" cols="80" name="message"></textarea><br> 
		
							
							<input type="submit" value="전송">
						</form>
						<span style="color: red;">${message}</span>
					
						
					</div>
				
				</div>
				<!-- end of myModal -->

				<!-- The Modal (맵) -->
				<div id="myModal2" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<span id="close" class="close2">&times;</span>
						<h1>지도 확인하기</h1>
						<h1>미구현 (2차 개발 예정 사항입니다.)</h1>
						<div id="map"></div>
						<!-- 지도가 붙을 위치 -->
					</div>
					<!-- end of myModal -->


				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->


	<script>
	
	
	var acc = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("side-active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  });
	}
	
	
	

	//클릭 된것의 value를 가져온다.
		
		
	
		// 모달창 가져오기
		var modal = document.getElementById("myModal");
		var modal2 = document.getElementById("myModal2");

		// 버튼을 누르면 모달창이 열려야하니까, 변수로 선언
		var btn = document.getElementsByClassName("myBtn");
		var btn2 = document.getElementById("myMap");


		// span태그에 close의 이름을 주자
		var span = document.getElementsByClassName("close")[0];
		var span2 = document.getElementsByClassName("close2")[0];
		
		
		
		var txt = document.getElementById("txt");
		
		var acmName = document.getElementById("acmName").value;
		
		console.log(acmName);
		
	/* 	txt.innerHTML = acmName;  */
		
		
		//모달 창 가져오기
		
		
		var formObj = $("#actionForm");
		
		for(
				var i=0 ; i<btn.length ; i++
				){
			btn[i].onclick = function(e){
				console.log(e);
				modal.style.display = "block";
				
				/* var operation=$(this).data("oper");
				console.log(operation); */
			
			};	
		}
		
		
	
		
		
		
		
/* 		

		// 사용자가 버튼을 클릭하면 모달을 연다
		btn.onclick = function() {
			modal.style.display = "block";
			
			console.log("여기는 가능");
			
		
			
			

		} */

		btn2.onclick = function() {
			modal2.style.display = "block";
			

		}

		// 사용자가 <span> (x)를 클릭하면 모달(모달)을 닫는다.
		span.onclick = function() {
			modal.style.display = "none";

		}

		span2.onclick = function() {
			modal2.style.display = "none";
		}

	
	</script>


	<%@include file="../includes/footer.jsp"%>