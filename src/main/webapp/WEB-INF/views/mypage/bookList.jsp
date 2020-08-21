<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
String name = (String) session.getAttribute("loginUserNum");
%>

<%@include file="../includes/header.jsp"%>



<style>
.booking-info-bottom {
   padding-top: 86px !important;
}

</style>


<!-- 사이트바 CSS -->
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/sidebar.css" >
<link rel="stylesheet" type="text/css" href="${request.contextPath}/resources/css/booklist.css" >



<div class="container">

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■대제목■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

	<div class="page-header-content">
		<div class="page-header-top">
			<h1 class="page-header">나의 투숙예정</h1>
			<p><%=userFstName %>님! 곧 떠날 여행의 설레임을 함께해요!</p>
		</div>
	</div>

<%@include file="../includes/sidebar.jsp"%>
	
<section class="contents">
	<section class="contents-2">
		
   <c:forEach items="${bookList}" var="board">
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
	            <!--    <div class="button-item-1">
	                	
	                    <a class="button-txt button-txt-1" data-oper='myBtn' id="myBtn" class="myBtn">예약 확정서 받기</a>
	                    <a class="button-txt" id="myMap">숙소 위치 확인</a>
	                    
	                </div> -->
	
	                <div class="button-item-2">
	                    <button><a href="/mypage/info?bookNum=${board.bookNum}">예약관리하기</a></button>
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
						<h1>미구현</h1>
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


<!-------------------------------------------- 사이드 메뉴에 대한 JS ---------------------------------------------->
	<script>	

	// 예약상태를 확인 하기 위해, 값을 불러오는 반복문을 여기에 둔다.

	<c:forEach items="${bookList}" var="board">

	var payMethod = '<c:out value="${board.payMethod} "/>'
	
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
	
	

			

	</c:forEach>	
	
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
				
				var operation=$(this).data("oper");
				console.log(operation); 
			
			};	
		}
		
		
	
		
		
		
		
	

		// 사용자가 버튼을 클릭하면 모달을 연다
		btn.onclick = function() {
			modal.style.display = "block";
			
			alert("여기는 가능");
	

		} 

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